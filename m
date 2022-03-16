Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6414DB7DC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 19:21:16 +0100 (CET)
Received: from localhost ([::1]:58024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUYGn-0002cd-9U
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 14:21:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nUYCG-0007YS-U7
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 14:16:33 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:56587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nUYCD-0003XG-Jm
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 14:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=sMaIzyBMLwPgnNHpy35D7ZAzaw4tAkKF+/PcOewKejQ=; b=cF1G5RciyZCkvLXqtFs/whx4Jt
 a4v7clInmCJOajAABxOxF+9s4wxggG7NH43wXX48vOkYO0GA+HV5CE81Dp7uGHEHoqz9dEf2sS5dS
 v7zMLOPYBNno83MlbWdEPVRfOlD+UaHh3wwMS1oVLbwmk3idJ5z6QC1I5dzeAzAWpzo86Z4KhU2jk
 Zzi8uF0O6gbI2RIFJZ10M9zxx3AFn1MltvqUx7+QyP+HzKWB3rz/h1kVzfOdYqBNtJgEtDVQZMZmD
 eVcdXyrJA9q5CgyhJSpsZLNMQ7AjhS+J7rsd4p6p/chn0hYGkBDrf+BBrkLCGkvN9vBRLcbOxXpWR
 Gd2Q8qoHwdDht9OvAhUrVq+onQjO1tPncDE3jaU0nh6FVpBKw0QD6nrifrbDjxeMhPMNMB4YhvdLX
 DbK7E/XXQ/1/fhwQsIetVjax0Aayx9abupW4+8vmyHwtUmBYojd0vNsHavIohtJ1MtYl4VGbDMNQ2
 nwRiv41bLCggvwZcawmMrM33L8mDZzJRsxL4u33eYWeBqq8svkdKKAPuP4lttE0lGFqL/OLmqKmEL
 M0SlBy6wHm2ncrGM2rQeAeNvl4OCYvmE64ddbYUmWKi8zDIYl6GgDMY1J1zsUyeSihgPvMrxV18Bi
 90tmOK6LZO4n3UvTqE7+VW7gKSeD7kysWGAFAXsAM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] 9pfs: fix inode sequencing in 'synth' driver
Date: Wed, 16 Mar 2022 19:16:24 +0100
Message-ID: <5420581.RCpjWDn7hV@silver>
In-Reply-To: <20220316121043.1de4f0a1@bahia>
References: <E1nTpyU-0000yR-9o@lizzy.crudebyte.com>
 <20220316121043.1de4f0a1@bahia>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 16. M=E4rz 2022 12:10:43 CET Greg Kurz wrote:
> On Mon, 14 Mar 2022 19:58:11 +0100
>=20
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > The 'synth' driver's root node and the 'synth' driver's first
> > subdirectory node falsely share the same inode number (zero), which
> > makes it impossible for 9p clients (i.e. 9p test cases) to distinguish
> > root node and first subdirectory from each other by comparing their QIDs
> > (which are derived by 9p server from driver's inode numbers).
> >=20
> > Fix this issue by using prefix-increment instead of postfix-increment
> > operator while generating new inode numbers for subdirectories and file=
s.
> >=20
> > Link: https://lore.kernel.org/qemu-devel/3859307.hTDP4D0zbi@silver/
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
>=20
> Good catch !
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck



