Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8FF25AB79
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 14:53:34 +0200 (CEST)
Received: from localhost ([::1]:36866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDSGb-0001Ou-HV
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 08:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kDSFs-0000jc-3w
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:52:48 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:33045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kDSFp-0006DE-Tc
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=RPPEPvtuJ9MkTiZhhFBQTy9y1XIVEh36/sBniEul1MI=; b=RBSlV2uKh7lyIA9kFJbXCAV8Ar
 vl8CJQfNg+bVuB41ZIwXNBqcpq3z5T2OA1JttfjlzbNYTeGjjNkPKpxIZYgpxbsND83or9nzjP+4m
 oOmNNW/QAf+QTMzJpM0nQQFsr8/75gtKHSE/mg7njd8NmtMZ1IkPRCLO6ZS4rRl7ApWT7WvR7mxCe
 5zXWbyQobBQOVLtCRF7mcymztuQIURcWBTCasL2L9wiAV0sQyamU2vXmoxLMQliSon1Xr+/I0HN4G
 QjmpZXSzueatWCVD7SjTOQme2x6feLYIqe1UCi5dQKFnUv5+5K+QeIMjzRDzKA7TcJiRIZWS2pL0Z
 bDARBf1w==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] 9pfs: log warning if msize <= 8192
Date: Wed, 02 Sep 2020 14:52:33 +0200
Message-ID: <399764553.t4N7NBxW8t@silver>
In-Reply-To: <20200902122547.GH403297@redhat.com>
References: <E1kDR8W-0001s4-Sr@lizzy.crudebyte.com>
 <20200902122547.GH403297@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 07:41:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On Mittwoch, 2. September 2020 14:25:47 CEST Daniel P. Berrang=E9 wrote:
> On Wed, Sep 02, 2020 at 01:22:49PM +0200, Christian Schoenebeck wrote:
> > It is essential to choose a reasonable high value for 'msize' to avoid
> > severe degraded file I/O performance. This parameter has to be chosen
> > on client/guest side, and a Linux client defaults to an 'msize' of only
> > 8192 if the user did not explicitly specify a value for 'msize'.
> >=20
> > Unfortunately many users are not aware that they should specify an
> > appropriate value for 'msize' to avoid severe performance issues, so
> > log a performance warning on host side in that case to make it more
> > clear.
>=20
> What is a more reasonable "msize" value to pick instead of 8k ?
> ie at what msize is I/O not several degraded ?

A good value depends on the file I/O potential of the underlying storage on=
=20
host side, and then you still would need to trade off between performance=20
profit and additional RAM costs, i.e. with growing msize (RAM occupation),=
=20
performance still increases, but performance delta will shrink continuously.

So in practice you might e.g. choose anything between 10MiB ... >100MiB for=
 a=20
SATA spindle disk storage, and a much higher value for anything PCIe based=
=20
flash storage. So a user probably should benchmark and decide what's=20
reasonable for the intended use case.

> If there a reason that Linux can't pick a better default ?

I was not involved when that default value was picked on Linux side, so I=20
don't know why exactly this value (8192) had been chosen as default 'msize'=
=20
years ago.

It certainly (sh/c)ould be higher, as it is already close to the theoretica=
ly=20
minimum msize of 4096. However how should a Linux guest automatically pick =
a=20
reasonable msize if it does not have any knowlege of host's storage feature=
s?

But even if this will be addressed on Linux kernel side, I still think user=
s=20
of old kernels should be made aware of this issue, as it is not obvious to =
the=20
user.

Best regards,
Christian Schoenebeck



