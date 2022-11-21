Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD89632855
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 16:35:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox8oM-0001V7-UZ; Mon, 21 Nov 2022 10:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ox8oL-0001Uk-Nf
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:34:17 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ox8oJ-0007P1-27
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:34:16 -0500
Received: by mail-ej1-x633.google.com with SMTP id f18so29450769ejz.5
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 07:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wcN5KumSqkS1hutYP1yi4qSvTf05zKcPYDjnaq7dVwo=;
 b=QpyPabkWXP0AgdruOGbBksPyqRPC09AJfyHHxQFs5YeFwn/Q8CZdsuN2NxM48mm1IF
 2PWscReYR7ctQ2epKb6wTHRPPeo0QW6UFrlKKcbrvyyunh/D3lP6Zv6scw1AhmNhC3DR
 69fe00hDrwlqRpKzWCSHetoXG21yh6nHstx4yoQXSwsbIW18fe2c95MrVtkJsJ8a1lcx
 WmU/5KR1m3FdCafIKOkfIas8AlAvn5s+IpC3Q1t1XTCfChtKoWEXKNpNwbXSl0tIwfpJ
 emyxnm7Hm28muztSe9JTiCU+OhGrIG0V+JaqwZjzlV1+6iVgGnJz896Qokw5iWZZtoNf
 pBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wcN5KumSqkS1hutYP1yi4qSvTf05zKcPYDjnaq7dVwo=;
 b=wxtFkimjclzJ+oTB3VVTUwA6aPvb4OHzasgQRrnBR1BHekgHH4avIHpJyRtThyDTJn
 FHCJQ3PzFxZnWct1XJf+ZI0l4J01yl4bKAljSspEdEwWOy/DevL1bDDosypF9A5rmLXH
 4ZO/83q89M9/C87zzFJYh9ZMXvH5AXmFVUFP8dFjj1LZ5ldTAr6fFD/JLn97FB6eS+AF
 57Yp+6Pl8V7l7h48iAVuuq2mwpC1iBidb7WzOn7lJo7QcKA8raN03SMrtUhm1Ooifw1Q
 hxHfiqvifMwsEYtVJ0wZCy2T4gv6RiBsRElwsqh4DkEGHeXeZhJlYeO2z8GS60H+vFd2
 MAlg==
X-Gm-Message-State: ANoB5pkqXmXWIweY62qxF2ydV/E82fGJLQMR8LaMAEojaeqCcpE+b7wj
 QP87gHeWACitw8s614B2R90=
X-Google-Smtp-Source: AA0mqf6qn+A4hW6IEeI419cEYjuzzz3wosI/O5TuB9vazOgZqoNXCG14Qn7aKuoPZgV5VHT/LJRaFg==
X-Received: by 2002:a17:906:cd10:b0:7ad:c0e7:7a99 with SMTP id
 oz16-20020a170906cd1000b007adc0e77a99mr15221848ejb.689.1669044852887; 
 Mon, 21 Nov 2022 07:34:12 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-039-218.89.12.pool.telefonica.de.
 [89.12.39.218]) by smtp.gmail.com with ESMTPSA id
 b14-20020a17090636ce00b007a8de84ce36sm5106473ejc.206.2022.11.21.07.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 07:34:12 -0800 (PST)
Date: Mon, 21 Nov 2022 15:34:05 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_2/3=5D_hw/mips/malta=3A_Set_?=
 =?US-ASCII?Q?PIIX4_IRQ_routes_in_embedded_bootloader?=
In-Reply-To: <20221027204720.33611-3-philmd@linaro.org>
References: <20221027204720.33611-1-philmd@linaro.org>
 <20221027204720.33611-3-philmd@linaro.org>
Message-ID: <9F566248-59DA-46E2-BD56-5DB98E9DB446@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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



Am 27=2E Oktober 2022 20:47:19 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>Linux kernel expects the northbridge & southbridge chipsets
>configured by the BIOS firmware=2E We emulate that by writing
>a tiny bootloader code in write_bootloader()=2E
>
>Upon introduction in commit 5c2b87e34d ("PIIX4 support"),
>the PIIX4 configuration space included values specific to
>the Malta board=2E
>
>Set the Malta-specific IRQ routing values in the embedded
>bootloader, so the next commit can remove the Malta specific
>bits from the PIIX4 PCI-ISA bridge and make it generic
>(matching the real hardware)=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
>FIXME: Missing the nanoMIPS counter-part!

Who will be taking care of this? I have absolutely no clue how the write_b=
ootloader functions work, so I don't see how to fix it=2E

Couldn't we just do it like in pegasos2_init() where the registers are ini=
tialized by QEMU directly if there is no bootloader binary configured? I co=
uld do that=2E

Best regards,
Bernhard
>---
> hw/mips/malta=2Ec | 19 +++++++++++++++++++
> 1 file changed, 19 insertions(+)
>
>diff --git a/hw/mips/malta=2Ec b/hw/mips/malta=2Ec
>index df0f448b67=2E=2E4403028778 100644
>--- a/hw/mips/malta=2Ec
>+++ b/hw/mips/malta=2Ec
>@@ -804,6 +804,8 @@ static void write_bootloader_nanomips(uint8_t *base, =
uint64_t run_addr,
>     stw_p(p++, 0x8422); stw_p(p++, 0x9088);
>                                 /* sw t0, 0x88(t1)              */
>=20
>+    /* TODO set PIIX IRQC[A:D] routing values! */
>+
>     stw_p(p++, 0xe320 | NM_HI1(kernel_entry));
>=20
>     stw_p(p++, NM_HI2(kernel_entry));
>@@ -841,6 +843,9 @@ static void write_bootloader_nanomips(uint8_t *base, =
uint64_t run_addr,
> static void write_bootloader(uint8_t *base, uint64_t run_addr,
>                              uint64_t kernel_entry)
> {
>+    const char pci_pins_cfg[PCI_NUM_PINS] =3D {
>+        10, 10, 11, 11 /* PIIX IRQRC[A:D] */
>+    };
>     uint32_t *p;
>=20
>     /* Small bootloader */
>@@ -915,6 +920,20 @@ static void write_bootloader(uint8_t *base, uint64_t=
 run_addr,
>=20
> #undef cpu_to_gt32
>=20
>+    /*
>+     * The PIIX ISA bridge is on PCI bus 0 dev 10 func 0=2E
>+     * Load the PIIX IRQC[A:D] routing config address, then
>+     * write routing configuration to the config data register=2E
>+     */
>+    bl_gen_write_u32(&p, /* GT_PCI0_CFGADDR */
>+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0xcf8),
>+                     tswap32((1 << 31) /* ConfigEn */
>+                             | PCI_BUILD_BDF(0, PIIX4_PCI_DEVFN) << 8
>+                             | PIIX_PIRQCA));
>+    bl_gen_write_u32(&p, /* GT_PCI0_CFGDATA */
>+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0xcfc),
>+                     tswap32(ldl_be_p(pci_pins_cfg)));
>+
>     bl_gen_jump_kernel(&p,
>                        true, ENVP_VADDR - 64,
>                        /*

