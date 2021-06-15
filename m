Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B633B3A75ED
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 06:25:56 +0200 (CEST)
Received: from localhost ([::1]:53894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt0eB-0000nO-Qe
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 00:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lt0dC-0008PG-Bv
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:24:54 -0400
Received: from pv34p98im-ztdg02172101.me.com ([17.143.234.142]:34092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lt0d8-0002eH-FT
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1623731089; bh=NlcMJ6jHhwwY3MdDqgIX2KJOBQqJgOLyPWbTX4zX8mE=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=1DKeuJS660xdL+QxKyOkKVmZqEr4iKCq3Dq7iERwMykLDF46YQz244WPYj1xJ7o6T
 e/vwEMmJSCRz1e/Zwp7yphjQPGlFvJGmsHq5c9nqTlKWqkpl4FlJ51qPdz6o2aOM4k
 70HivX/5bVxllzwt0iLnmz8hm9RhMV60t3tvP/jP1f/xrSDOiRkm/XO1xCSPPAJzyo
 BjoJUed/SZ5EcKl8djRiSHRKUUN8Wt2uwKUn7+f6izsl65oqUkv1anhFiH2Vh9rtsZ
 kfbqHrOYBSnnVZJe7MeRKFch4ofCAS+iwniCv6D7u5qHwldbkBrta512H0UtPbfmV2
 p75Cppb7zp2fw==
Received: from smtpclient.apple (unknown [17.11.64.34])
 by pv34p98im-ztdg02172101.me.com (Postfix) with ESMTPSA id 6FC5D540088;
 Tue, 15 Jun 2021 04:24:48 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3678.0.2\))
Subject: Re: [PATCH 3/4] alpha: Provide a PCI-ISA bridge device node for guest
 OS's that expect it
From: Jason Thorpe <thorpej@me.com>
In-Reply-To: <8346c497-f432-0d75-bc60-0fcceed3420f@linaro.org>
Date: Mon, 14 Jun 2021 21:24:46 -0700
Cc: qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8DF0550D-3F5C-45E3-A246-D51A527B93DC@me.com>
References: <20210613211549.18094-1-thorpej@me.com>
 <20210613211549.18094-4-thorpej@me.com>
 <8346c497-f432-0d75-bc60-0fcceed3420f@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3678.0.2)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_03:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2106150025
Received-SPF: pass client-ip=17.143.234.142; envelope-from=thorpej@me.com;
 helo=pv34p98im-ztdg02172101.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


> On Jun 14, 2021, at 9:20 PM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> On 6/13/21 2:15 PM, Jason Thorpe wrote:
>> +/* The following was copied from hw/isa/i82378.c and modified to =
provide
>> +   only the minimal PCI device node.  */
>> +
>> +/*
>> + * QEMU Intel i82378 emulation (PCI to ISA bridge)
>> + *
>=20
> Why can't we just use the existing device model?
> Certainly duplicating code like this isn't the best way.

Yah, I=E2=80=99m not super happy with that, either, tbh.  When I first =
started working on this several months ago, I it looked like it would be =
invasive to wire it up in the way the Alpha platform expects, but I =
can=E2=80=99t remember exactly what the issue was.

Anyways, I=E2=80=99ll look at it again.  Stay tuned.

-- thorpej


