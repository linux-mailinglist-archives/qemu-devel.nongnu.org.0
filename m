Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6B864935D
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 10:46:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4ItG-0003bE-GW; Sun, 11 Dec 2022 04:44:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4ItE-0003as-GM
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 04:44:56 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4ItC-0007RX-UQ
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 04:44:56 -0500
Received: by mail-ej1-x631.google.com with SMTP id vv4so21201733ejc.2
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 01:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YRXWqDDPinPlkBaZUxp05Ejq9Z29bCl98FLwZOUyN3k=;
 b=K28BFt590V0IcVkzzNMve+TxmWLesEmk7MmrKoToqVhNyPUXyLBjCa9WBCh7jSIz+U
 +Sphf9CI0VQSnX5conOM9Nfjoh1w6sblDwzFfmB7ylXIyWXNlICpZp8irbkPYQ1Dnb0w
 aewxY7yifUg5r5A+gAPsBhxFEdSVGxhprUmbYTFDsktqDeiYu3ffoUMad0YT82lm4lBL
 CIb7fFWZ/jgpYeEIa68lwYtPpmlYjFHjK9W4Dko4hGjSzUfCeHHLk1jMxCCfq4Y9aKY/
 WRZ6VJf8TxT4hnjzHYD9+HZnj98bt/BmTP5UpbJ5T3xSmZoxj6nW943qjZBzuf1IKpic
 N0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YRXWqDDPinPlkBaZUxp05Ejq9Z29bCl98FLwZOUyN3k=;
 b=icl+tRJerCp49m8wfXEPb/pbI/6IPfwb0Y+xZBpv/nS/iVLJ+HXmjyWn4jUg3h+AX5
 Qq7EmOVIdZrRiB25v+g6+ZDCcWitH+lsuam3jeyREPtGlUZ4d4Xo+k1AglzuR5PaTEQJ
 5k9jgfU+XLxCMa4UgFW8Q+pEi8LGOTGQyDfcF65WrXMB6j9UJzeJfxv/W7Qggo+qhqHV
 RiiBHXV/4Bb9k1Mevau2HEU4vP0+RnbSZPwXjGrbicNCixCM1CuZVpUdgZp6YNgwzUOW
 O2riEXwkdEMH+dcprvy+j2ZStAf4IaqNE3TkzIJIsJyAhrkwj0hAF3Z6UktVoBm0nM+D
 l8Sw==
X-Gm-Message-State: ANoB5pk0P1hbgoIhNqnqEHv6Rvx2rIU7VkKCvKJKS3jKzbJs6UyHDGc5
 dpeoQIoupTm+QknW0EyQR48=
X-Google-Smtp-Source: AA0mqf7W8Wxr6x6VVr4TgP1xlIttuIEAJ4a80MwUhsRdjQI2GTelHaRLfy53Mq1gnXgqUU2UJKLAkA==
X-Received: by 2002:a17:906:30d3:b0:78d:f454:ba10 with SMTP id
 b19-20020a17090630d300b0078df454ba10mr11004895ejb.15.1670751892271; 
 Sun, 11 Dec 2022 01:44:52 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200150f11b7b1e9e208.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:150f:11b7:b1e9:e208])
 by smtp.gmail.com with ESMTPSA id
 fl16-20020a1709072a9000b007aef930360asm1927687ejc.59.2022.12.11.01.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 01:44:51 -0800 (PST)
Date: Sun, 11 Dec 2022 09:44:43 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH-for-8=2E0_5/7=5D_hw/mips/boot?=
 =?US-ASCII?Q?loader=3A_Implement_nanoMIPS_SW_opcode?=
In-Reply-To: <20221210155502.74609-6-philmd@linaro.org>
References: <20221210155502.74609-1-philmd@linaro.org>
 <20221210155502.74609-6-philmd@linaro.org>
Message-ID: <65608DF2-D03F-4862-B6EA-057C3B10065B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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



Am 10=2E Dezember 2022 15:55:00 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:

s/SW/ORI/ in the title?

Best regards,
Bernhard

>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> hw/mips/bootloader=2Ec | 24 +++++++++++++++++++++++-
> 1 file changed, 23 insertions(+), 1 deletion(-)
>
>diff --git a/hw/mips/bootloader=2Ec b/hw/mips/bootloader=2Ec
>index 997e74ee52=2E=2Ecc3df385df 100644
>--- a/hw/mips/bootloader=2Ec
>+++ b/hw/mips/bootloader=2Ec
>@@ -150,9 +150,31 @@ static void bl_gen_lui(void **p, bl_reg rt, uint32_t=
 imm32)
>     }
> }
>=20
>+static void bl_gen_ori_nm(void **ptr, bl_reg rt, bl_reg rs, uint16_t imm=
)
>+{
>+    uint16_t *p =3D (uint16_t *)*ptr;
>+    uint32_t insn =3D 0;
>+
>+    insn =3D deposit32(insn, 26, 6, 0b100000);
>+    insn =3D deposit32(insn, 21, 5, rt);
>+    insn =3D deposit32(insn, 16, 5, rs);
>+    insn =3D deposit32(insn, 0, 12, imm);
>+
>+    stw_p(p, insn >> 16);
>+    p++;
>+    stw_p(p, insn >> 0);
>+    p++;
>+
>+    *ptr =3D p;
>+}
>+
> static void bl_gen_ori(void **p, bl_reg rt, bl_reg rs, uint16_t imm)
> {
>-    bl_gen_i_type(p, 0x0d, rs, rt, imm);
>+    if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
>+        bl_gen_ori_nm(p, rt, rs, imm);
>+    } else {
>+        bl_gen_i_type(p, 0x0d, rs, rt, imm);
>+    }
> }
>=20
> static void bl_gen_sw(void **p, bl_reg rt, uint8_t base, uint16_t offset=
)

