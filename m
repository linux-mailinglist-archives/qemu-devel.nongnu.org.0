Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770573FE947
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 08:35:45 +0200 (CEST)
Received: from localhost ([::1]:53228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgK8-00063P-JK
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 02:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLgIj-0004rU-Ic
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 02:34:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLgIg-00021y-SJ
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 02:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630564453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z0VM2grTVVhZmbEEXidHTscewM16S5DpFj+E0QWA/Pc=;
 b=YQqTlA2EHgPE48hhY8rG/kmNNNvJvWArm1FVVycNyM5ajbLMI8eHcBGneME8dPmTNUHqLQ
 UWR8hTEPFyZdsKKKhvuHB2YZFRgVtncctEOAMkE6y38FkLTSmL4uEp1Pe5gyMC1/VyLbNU
 JCxnZ1Z0kqr9rHq3o/OAwYg668v4o+I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-7x6WJ6ABPf-SxMzOMUpuvQ-1; Thu, 02 Sep 2021 02:34:12 -0400
X-MC-Unique: 7x6WJ6ABPf-SxMzOMUpuvQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v6-20020adfe4c6000000b001574f9d8336so192699wrm.15
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 23:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z0VM2grTVVhZmbEEXidHTscewM16S5DpFj+E0QWA/Pc=;
 b=G+0jMWJogyjYuerJEHWj7ijAPep0ZORmZrSj80uqDgLtujdv+Na0IlrN2y6BtFrgsO
 YikC1sAzccZdsGirjhyHAA2wV6v6EOCfcLWWWwfjYNCqqHfgZIyWHSkttCsAwjXwwaR6
 3ikGzj1wNieWoHCCjm1qugvrZPKnJLxZ/VlVXjI82rq+T58IIXBQaY1cegL0R3jZGRAr
 W+I0MWsatknAM3AWk/AmSqpkv1PRjBpdMcFnDs2q4kr5WhsD3rYodFXxvYVwQKqxiiHV
 BlvGysjJHrU/MQ0vg64VKucVu9qfaDUbIFxJtN25v4/lC5aPPI6Bfz2tSiHGfw2nTBcG
 4oQQ==
X-Gm-Message-State: AOAM533sEkqXhS9OQrjgXbmkH3ZGlwd5cxj2dwF9nfypLu2iF3QAtMkz
 rg1lrOCR4Y6lMB/MeKayfcXhwRTYjTW3RTcXQI6G3jwWkqafYUdYmA/tiuLdAOiEQ/znhxBUuBk
 UUDlBUDXXHtmt9aU=
X-Received: by 2002:adf:dd11:: with SMTP id a17mr1713383wrm.132.1630564451481; 
 Wed, 01 Sep 2021 23:34:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEK5zia3ZCgpILXf4fdelSPRVrcfBRMexrzk3Howzeo/ysSJ7DEZAL00MjtE5YuHoRErF7zw==
X-Received: by 2002:adf:dd11:: with SMTP id a17mr1713345wrm.132.1630564451174; 
 Wed, 01 Sep 2021 23:34:11 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id k14sm858482wri.46.2021.09.01.23.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 23:34:10 -0700 (PDT)
Date: Thu, 2 Sep 2021 08:34:09 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v6 10/10] ACPI ERST: step 6 of bios-tables-test
Message-ID: <20210902083409.39f80d3b@redhat.com>
In-Reply-To: <3e25aaf1-6ce1-58d9-4095-8d684a29cfd4@oracle.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
 <1628202639-16361-11-git-send-email-eric.devolder@oracle.com>
 <ee0dd71d-1583-120c-b5cc-be209c01b47c@oracle.com>
 <3e25aaf1-6ce1-58d9-4095-8d684a29cfd4@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Aug 2021 16:45:15 -0500
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Igor,
> I'm not sure if I should post v7 with the correction to the tables,
> or await your guidance/feedback on v6.

Hopefully, I'll be back to reviewing patches (including yours) next week.

> Thanks,
> eric
>=20
>=20
> On 8/6/21 12:16 PM, Eric DeVolder wrote:
> > Well, I discovered today that running "make check" again resulted in
> > bios table mismatches. In looking into this further, I think I might
> > finally have an understanding as to how this is all to work. My
> > bios-tables-test-allowed-diff for step 1 now looks like:
> >=20
> > "tests/data/acpi/pc/DSDT.acpierst",
> > "tests/data/acpi/pc/ERST",
> > "tests/data/acpi/q35/DSDT.acpierst",
> > "tests/data/acpi/q35/ERST",
> > "tests/data/acpi/microvm/ERST.pcie",
> >=20
> > and with the corresponding empty files and by using the
> >  =C2=A0.variant =3D ".acpierst"
> > in bios-tables-test, I am able to run "make check" multiple times
> > now without failures.
> >=20
> > So, that means patch 01/10 and 10/10 are wrong. I'm assuming there
> > will be other items to address, so I'll plan for these fixes in
> > v7.
> >=20
> > My apologies,
> > eric
> >=20
> >=20
> > On 8/5/21 5:30 PM, Eric DeVolder wrote: =20
> >> Following the guidelines in tests/qtest/bios-tables-test.c, this
> >> is step 6, the re-generated ACPI tables binary blobs.
> >>
> >> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> >> ---
> >> =C2=A0 tests/data/acpi/microvm/ERST.pcie=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Bin 0 -> 912 bytes
> >> =C2=A0 tests/data/acpi/pc/DSDT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | Bin 6002 -> 6009 bytes
> >> =C2=A0 tests/data/acpi/pc/ERST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | Bin 0 -> 912 bytes
> >> =C2=A0 tests/data/acpi/q35/DSDT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | Bin 8289 -> 8306 bytes
> >> =C2=A0 tests/data/acpi/q35/ERST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | Bin 0 -> 912 bytes
> >> =C2=A0 tests/qtest/bios-tables-test-allowed-diff.h |=C2=A0=C2=A0 6 ---=
---
> >> =C2=A0 6 files changed, 6 deletions(-)
> >> =C2=A0 create mode 100644 tests/data/acpi/microvm/ERST.pcie
> >>
> >> diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/micro=
vm/ERST.pcie
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..d9a2b3211ab5893a50751a=
d52be3782579e367f2
> >> GIT binary patch
> >> literal 912
> >> zcmaKpO%8%E5QPUQ|KVrvh9h_c12J)@5f?5!k_Ygv*jGA8UW7?#`}+D#XXyDpKHiZ?
> >> z@anI_W$gOrZRl(SB7!yMqx}#E4EC&a5=3D}m^g_!0^0`kEl)DOuIXM6D@@*xq*8vyqH
> >> z)b0KTlmlgmH~xt7vG<k#Z1~z=3DOnyT76ZX;Ysy^;NC0^^$`kY?zKK;^vMtny1JAD$P
> >> zc^BR{l;i*H`IJAW`~~?1`_TXD_wQ2@UlL!DU$GCpQ-4i-O}x_^JdQTRH^e)=3D(_c$`
> >> LOT5z?_v4Aa+v(5&
> >>
> >> literal 0
> >> HcmV?d00001
> >>
> >> diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
> >> index cc1223773e9c459a8d2f20666c051a74338d40b7..bff625a25602fa954b5b39=
5fea53e3c7dfaca485 100644
> >> GIT binary patch
> >> delta 85
> >> zcmeyQ_fwC{CD<jTQk;Q-F=3DQiG057Ni!kGAAr+5MP$;rGe;+`zQh8FQ0@s2J*JPZuX =
=20
> >> l3>=3DQZp?+M<lN)&@ggD~CY!RV&S1$v`0B2XP&5C@1oB+Xc6m$Rp =20
> >>
> >> delta 65
> >> zcmeyV_eqb-CD<jTNSuLzao$F*0A5ayg)#BLPVoW`laqN{#GF`y4K3n1;)6r|xR^QO =20
> >> V9bJNW7#Nr*U*I#`Y|7`t2>@&@5ljF8 =20
> >>
> >> diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
> >> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..f24fadd345c798ee5c17cd=
b66e0e1703bd1b2f26 100644
> >> GIT binary patch
> >> literal 912 =20
> >> zcmaKpOAdlC6h#XZC=3Dfn#CoF*_7>J28jW}>wF2KFG3zs9lTPTnl;U#=3D7r>E_sr(1u2=
 =20
> >> z21<FK_R^jEx_w-`TFO&O;T_LLF4O@x8LMi!H}5Z^t6_Tah{H!Y?i2S%JoA7!BFgz1
> >> zf~;?N{b8^}H2K=3Dviyuzh`L7M``U{CiG=3DIb#4X^gc{m10T<lDURCp`CW$T#HMd{o-?
> >> zH~aE`PznCu9;f*enm;9;GDrTme_0zSBR|7ODR;g(@qEM!N8Z_gL4HBL%^N<3mgJY@
> >> R+q~0XMSexT%^U0Ee0~)`g#iEn
> >>
> >> literal 0
> >> HcmV?d00001
> >>
> >> diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
> >> index 842533f53e6db40935c3cdecd1d182edba6c17d4..950c286b4c751f3c116a11=
d8892779942375e16b 100644
> >> GIT binary patch
> >> delta 59
> >> zcmaFp@X3M8CD<jTNP&TYv2`OCrvjHhYfOBwQ@nsX>ttC4TZ!l<{$N9cc#e2SmmnSn
> >> O1||j(wg6|p5C#C(xDBxY
> >>
> >> delta 42
> >> xcmez5@X&$FCD<h-QGtPh@##h`P6aMMmYDcpr+5K3mdUaTw(KHo0nUCQ3;+kH3ZMW0
> >>
> >> diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
> >> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..f24fadd345c798ee5c17cd=
b66e0e1703bd1b2f26 100644
> >> GIT binary patch
> >> literal 912 =20
> >> zcmaKpOAdlC6h#XZC=3Dfn#CoF*_7>J28jW}>wF2KFG3zs9lTPTnl;U#=3D7r>E_sr(1u2=
 =20
> >> z21<FK_R^jEx_w-`TFO&O;T_LLF4O@x8LMi!H}5Z^t6_Tah{H!Y?i2S%JoA7!BFgz1
> >> zf~;?N{b8^}H2K=3Dviyuzh`L7M``U{CiG=3DIb#4X^gc{m10T<lDURCp`CW$T#HMd{o-?
> >> zH~aE`PznCu9;f*enm;9;GDrTme_0zSBR|7ODR;g(@qEM!N8Z_gL4HBL%^N<3mgJY@
> >> R+q~0XMSexT%^U0Ee0~)`g#iEn
> >>
> >> literal 0
> >> HcmV?d00001
> >>
> >> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h=20
> >> b/tests/qtest/bios-tables-test-allowed-diff.h
> >> index b3aaf76..dfb8523 100644
> >> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> >> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> >> @@ -1,7 +1 @@
> >> =C2=A0 /* List of comma-separated changed AML files to ignore */
> >> -"tests/data/acpi/pc/ERST",
> >> -"tests/data/acpi/q35/ERST",
> >> -"tests/data/acpi/microvm/ERST",
> >> -"tests/data/acpi/pc/DSDT",
> >> -"tests/data/acpi/q35/DSDT",
> >> -"tests/data/acpi/microvm/DSDT",
> >> =20
>=20


