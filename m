Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05756D30AC
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 14:11:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pia46-0005be-Dn; Sat, 01 Apr 2023 08:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+44237e5b011d1008388b+7160+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pia43-0005a0-Gq
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 08:10:35 -0400
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+44237e5b011d1008388b+7160+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pia40-0003yc-5u
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 08:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=rB62vmNlxCaw9s8lDut3OSK87BZGcIdpVFKeGI5gDvc=; b=JRgmHSY26g5jq/kg5i0MxMijDf
 pUFanAn9DTmDJxLbcdFmdaDixNOuvS02BnEkFaReuaOByUnSTZjfNXBmmYlo0h8pDeMPWL0nWkH2l
 GQ/LOpqGOVJxdopelumpcaJs9AToAT/ncWH7OgyrlXAQlLrUDwVqzU+p+xdPqSkX75Stpq1/baRYx
 Cc4pCwWp4CxkI5cEkHEr73bjW1OTbFfw5VlxoMApb3EeBfop76+KmHkS5X+1571cMkdFI5p710sL8
 5Bgd2Nv5KL/psPDmHYsX3FcM0YljEzFVguMdOPMa5hFIVI4T7BBZeFna09cG39DZw8ySz1OB41OMm
 Sh8olapg==;
Received: from [2a00:23ee:12b0:2144:8a73:5bd2:f6e6:ba9c] (helo=[IPv6:::1])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pia3m-00CPrp-4e; Sat, 01 Apr 2023 12:10:18 +0000
Date: Sat, 01 Apr 2023 13:10:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Michael Tokarev <mjt@tls.msk.ru>, Joao Martins <joao.m.martins@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>
CC: Paul Durrant <paul@xen.org>
Subject: Re: xen bits broke x32 build
User-Agent: K-9 Mail for Android
In-Reply-To: <9059b75a-07c2-d90b-83ae-6011b1c2c36a@msgid.tls.msk.ru>
References: <b7796732-6334-c68b-3baa-2354644152f8@msgid.tls.msk.ru>
 <8e00cd8d-1914-e9e5-e4c1-23be705399c1@oracle.com>
 <9059b75a-07c2-d90b-83ae-6011b1c2c36a@msgid.tls.msk.ru>
Message-ID: <D03542A7-2475-4BF3-8B32-CBA9447AD393@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+44237e5b011d1008388b+7160+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 1 April 2023 12:57:33 BST, Michael Tokarev <mjt@tls=2Emsk=2Eru> wrote:
>01=2E04=2E2023 14:45, Joao Martins =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 01/04/2023 09:40, Michael Tokarev wrote:
>>> After bringing in xen guest support, qemu fails to build on x32:
>>> Adding the folks who added the feature too
>>=20
>>> target/i386/kvm/xen-emu=2Ec:876:5: note: in expansion of macro =E2=80=
=98qemu_build_assert=E2=80=99
>>>  =C2=A0 876 |=C2=A0=C2=A0=C2=A0=C2=A0 qemu_build_assert(sizeof(struct =
vcpu_info) =3D=3D 64);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~=
~~~~~
>>>=20
>>> This one should be easy to fix, but I wonder if there are other issues
>>> with x32 exists=2E=2E
>>>=20
>> Not sure=2E
>>=20
>> struct vcpu_info is supposed to be 64bytes on both 32-bit and 64-bit bu=
ilds=2E
>>=20
>> If anything maybe arch_vcpu_info struct is different on 32-bit and 64-b=
it=2E=2E=2E
>> David, Paul, any ideas?
>
>Yes, it is arch_vcpu_info=2E I assumed it is a trivial thing, but let me =
explain
>if it's not the case=2E
>
>include/hw/xen/interface/arch-x86/xen=2Eh :
>
>#if defined(__i386__)
>#include "xen-x86_32=2Eh"
>#elif defined(__x86_64__)
>#include "xen-x86_64=2Eh"
>#endif
>
>(I wonder if it ever possible to have none of the two defined)=2E
>
>Now, xen-x86_32=2Eh has:
>
>struct arch_vcpu_info {
>    unsigned long cr2;
>    unsigned long pad[5]; /* sizeof(vcpu_info_t) =3D=3D 64 */
>};
>
>Assuming sizeof(long)=3D=3D32bits=2E But actually it is 64bits on x32=2E
>
>While xen-x86_64=2Eh has:
>
>struct arch_vcpu_info {
>    unsigned long cr2;
>    unsigned long pad; /* sizeof(vcpu_info_t) =3D=3D 64 */
>};
>
>
>It looks like for x32, the test in arch-x86/xen=2Eh should be:
>
>#if defined(__x86_64__)
>#include "xen-x86_64=2Eh"
>#else
>#include "xen-x86_32=2Eh"
>#endif
>
>since x32 is almost like x86_64=2E The only difference from x86_64
>is sizeof(pointer), which is 32bits=2E

Hm, doesn't x32 also align uint64_t to 64 bits (unlike i386 which only ali=
gns it to 32 bits)?

>Well=2E Maybe xen support should be disabled entirely on x32=2E
>Or maybe x32 should be declared as unsupported entirely=2E
>I dunno=2E

We rely heavily on the struct layouts being precisely the same, since thes=
e are ABI for the Xen guests=2E Wherever there was some 32/64 compatibility=
 issue =E2=80=94 and often where there wasn't =E2=80=94 that's why I litter=
ed it with those build assertions=2E=20

But while there are enough in there to sanity check the i386 vs=2E x86_64 =
ABI differences, I wouldn't swear that I've put in enough checks for x32=2E=
 So "it builds without hitting an assertion" does not necessarily mean it'l=
l be *correct*=2E Let's disable it on x32=2E

