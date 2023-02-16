Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A77699AD5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:12:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShmh-0007Rc-3o; Thu, 16 Feb 2023 12:11:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pShmf-0007RN-L3; Thu, 16 Feb 2023 12:11:01 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pShmd-0007j7-Tq; Thu, 16 Feb 2023 12:11:01 -0500
Received: by mail-ed1-x531.google.com with SMTP id d40so5417960eda.8;
 Thu, 16 Feb 2023 09:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vtv8FTcDNzPS9y5Z0E5BIM0lRmYWWNc2bz96oCjgvRM=;
 b=FS8gRkmWAZ/6L+EO8TMYjcZs4/Xo0a3H0TPs+0N5+prEtW7+n2pxKSuRbF6uZ3Fyl9
 Tl8dWA4FMHCvCw3eH+mHXZpw76dfy3B+IZSUPXLX3CmHyxRVcbyK+E2/ZYX6/p90sGKb
 DpRWT3+X1DGn1QZzX8q8TBRT4ntae7urS83a36Vf2Mxv/v8k2Oe5yoYFMaeRGgXFOM6L
 bulo8x3Efm3dsWRz3VpXwtF1dv/SYiV/Btna8UlSMFMx3+3TDNhYKXMXE/nFXtawj+nq
 k98y8xpTJ19Pt9I+2r389I++EF/APVX2XUkeeVzg3jEmdmuSm1S5QDp18ddakYdFTMtL
 a4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vtv8FTcDNzPS9y5Z0E5BIM0lRmYWWNc2bz96oCjgvRM=;
 b=bdAZWDf9TxeOyn1kkY8HMidXUDyHx1kbICt9gb27I3CND3ShIagnlddYaPNvy5FXqD
 g3sQImL1U9Yl4v9XCT9EkdB0FtEeAoGdUUOA0bCdx4kaS3O8bVY3+2OgGqGwTH2ISYgY
 a02Eo/8ZNuDbKDzCt9oS/d00vjDKvTDm18BGPnenn2UyONew4CG2wRfrYWYOBrkcsdB/
 jfO1qhVAJBSWQ5ktHghYdxwK4yxnDtAMIQOdXeysKyX4wrHgZKYk4cJHbHY+a64N3/yW
 XtPpAo5RNytskeT22XNCdQbK+fkdX1Ed81Y1UGD/nKbGxQrmr0KRnG1RqMWHRO9/pyKG
 7THQ==
X-Gm-Message-State: AO0yUKVdgZofNjjs80QS5HIGdxWhTQYu8auM7xyT2oj3AAAOqv01y+iy
 g/Zp+dvo2Xv4Uw6IZzt8RCU=
X-Google-Smtp-Source: AK7set+xNoaZvPCkMD/r0Xn/vKS7JIcjjYFmTGu09SYZuDtzuyhcz2aqdmUztrR0gTdACDnohkZpSw==
X-Received: by 2002:aa7:c2d3:0:b0:4ad:7bd3:bb44 with SMTP id
 m19-20020aa7c2d3000000b004ad7bd3bb44mr170314edp.35.1676567457458; 
 Thu, 16 Feb 2023 09:10:57 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-175-191.89.12.pool.telefonica.de.
 [89.12.175.191]) by smtp.gmail.com with ESMTPSA id
 t30-20020a50d71e000000b004873927780bsm1145196edi.20.2023.02.16.09.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 09:10:56 -0800 (PST)
Date: Thu, 16 Feb 2023 17:10:49 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
CC: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_07/18=5D_hw/ide/piix=3A_Ensure?=
 =?US-ASCII?Q?_IDE_output_IRQs_are_wired_at_realization?=
In-Reply-To: <0350214d-fd70-4d24-8db8-66185f5d6780@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
 <20230215161641.32663-8-philmd@linaro.org>
 <CAG4p6K6zMEMT07qDzPyEgc1F+FPp-AHyhgZWRhYAaJsfOUZD=g@mail.gmail.com>
 <0350214d-fd70-4d24-8db8-66185f5d6780@linaro.org>
Message-ID: <3E0C5438-30E1-4D5B-BC6A-A5A333FD1F73@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 16=2E Februar 2023 15:33:47 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>On 16/2/23 15:43, Bernhard Beschow wrote:
>>=20
>>=20
>> On Wed, Feb 15, 2023 at 5:20 PM Philippe Mathieu-Daud=C3=A9 <philmd@lin=
aro=2Eorg <mailto:philmd@linaro=2Eorg>> wrote:
>>=20
>>     Ensure both IDE output IRQ lines are wired=2E
>>=20
>>     We can remove the last use of isa_get_irq(NULL)=2E
>>=20
>>     Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg
>>     <mailto:philmd@linaro=2Eorg>>
>>     ---
>>      =C2=A0hw/ide/piix=2Ec | 13 ++++++++-----
>>      =C2=A01 file changed, 8 insertions(+), 5 deletions(-)
>>=20
>>     diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>>     index 9d876dd4a7=2E=2Eb75a4ddcca 100644
>>     --- a/hw/ide/piix=2Ec
>>     +++ b/hw/ide/piix=2Ec
>>     @@ -133,14 +133,17 @@ static bool pci_piix_init_bus(PCIIDEState *d,
>>     unsigned i, Error **errp)
>>      =C2=A0 =C2=A0 =C2=A0static const struct {
>>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int iobase;
>>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int iobase2;
>>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 int isairq;
>>      =C2=A0 =C2=A0 =C2=A0} port_info[] =3D {
>>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 {0x1f0, 0x3f6, 14},
>>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 {0x170, 0x376, 15},
>>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {0x1f0, 0x3f6},
>>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {0x170, 0x376},
>>      =C2=A0 =C2=A0 =C2=A0};
>>      =C2=A0 =C2=A0 =C2=A0int ret;
>>=20
>>     -=C2=A0 =C2=A0 qemu_irq irq_out =3D d->irq[i] ? : isa_get_irq(NULL,
>>     port_info[i]=2Eisairq);
>>     +=C2=A0 =C2=A0 if (!d->irq[i]) {
>>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, "output IDE IRQ %u no=
t connected", i);
>>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;
>>     +=C2=A0 =C2=A0 }
>>     +
>>      =C2=A0 =C2=A0 =C2=A0ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DE=
VICE(d), i, 2);
>>      =C2=A0 =C2=A0 =C2=A0ret =3D ide_init_ioport(&d->bus[i], NULL, port=
_info[i]=2Eiobase,
>>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port_info[i]=2Eiobase2);
>>     @@ -149,7 +152,7 @@ static bool pci_piix_init_bus(PCIIDEState *d,
>>     unsigned i, Error **errp)
>>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 object_get_typename(OBJECT(d)), i);
>>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;
>>      =C2=A0 =C2=A0 =C2=A0}
>>     -=C2=A0 =C2=A0 ide_bus_init_output_irq(&d->bus[i], irq_out);
>>     +=C2=A0 =C2=A0 ide_bus_init_output_irq(&d->bus[i], d->irq[i]);
>>=20
>>      =C2=A0 =C2=A0 =C2=A0bmdma_init(&d->bus[i], &d->bmdma[i], d);
>>      =C2=A0 =C2=A0 =C2=A0d->bmdma[i]=2Ebus =3D &d->bus[i];
>>     --     2=2E38=2E1
>>=20
>>=20
>> This now breaks user-created =C2=A0piix3-ide:
>>=20
>>  =C2=A0 qemu-system-x86_64 -M q35 -device piix3-ide
>>=20
>> Results in:
>>=20
>>  =C2=A0 qemu-system-x86_64: -device piix3-ide: output IDE IRQ 0 not con=
nected
>
>Thank you for this real-life-impossible-but-exists-in-QEMU test-case!
>
>Should we cover it in qtests?

Yes, why not=2E Preferably along with the x-remote machine=2E

