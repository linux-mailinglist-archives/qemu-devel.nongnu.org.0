Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA502C99BA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 09:42:41 +0100 (CET)
Received: from localhost ([::1]:55848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk1FA-0005Pk-Mt
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 03:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk1Ci-0002tQ-3k
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:40:08 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk1Cg-0004xt-ON
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:40:07 -0500
Received: by mail-wm1-x341.google.com with SMTP id x22so1540677wmc.5
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 00:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rmi1ZzPQJ3zuo73bKbFd5CfI84E1Z93bNl3IwPsYcf4=;
 b=oE1WdSYPxZ2/fc28FgWVJvvu0ZEbCP+bwH8DRAtmlFn6iwPepwvlN6SPVBX+0jlnVl
 63nLmHLeJBouy4RH9o66XIHROZqR9Nr1Mypdch1Uz9z/+zvjziomX/IApmxrTMYaxMQ9
 grqSnFECgPH5ogrMhHm6rozwDuOGGafwPvZgG3CuYsz4q7TZalpaaj9ZA5Vtyy2NUffz
 AcyhwoePQNnEK5oiANOwqof4bBVWqBZ27IXoObVQ2pbcWRMq464m7bCAHRJ3W+y/Q6kY
 l624Qdmw9932du2CdgTgl7F4boWx5/+cftdg/V7/r3rsVSy1tWhv+7UvHSp813CTedvd
 MEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rmi1ZzPQJ3zuo73bKbFd5CfI84E1Z93bNl3IwPsYcf4=;
 b=eijbeJO/5flsMLGrkcW3GaH88SlQwK+SgTpRraU1iCnjbCOPKNU9sKpHbmcakE+afN
 Wsa1lQOZKCvIcovMPNyTssJuByncwmGjHG1u19cWXgNXqBhx81HDK3PAz3n7EsZj0xy3
 KGOJzAE84GQC/khyTyLUeV4yUBF+zQMKDhCXgSpaKlcfNNwFppheBaW6fjbUZDurym5g
 xLdFNQGCbwAsMPyQwIikMjduIkxA61H3GLHHgQSx57S26N5u9kXoB4i/CSfsKUKe3xhn
 dnhivKqERGpuHqOys185yVCuRiPtbs8gQOOkmEXCu+aRLmPW3q5iMeSsYbKUd1IXbIxM
 SpqQ==
X-Gm-Message-State: AOAM532miQrFV47HGTMm3sFmCXxySU9BsilPrqeHm7eMgNmNoAsy0if8
 ctEmj1tM3SQLr5G1kedbUFT9Syj68AM=
X-Google-Smtp-Source: ABdhPJyUA/bi0xQPdzi0NjpPwZ7JI1c6LvzTsAN2uSlQ/zzJpearTxDrJb0pGvy2XsE5BbVppLCGUw==
X-Received: by 2002:a7b:cf0a:: with SMTP id l10mr1552038wmg.103.1606812004571; 
 Tue, 01 Dec 2020 00:40:04 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id p3sm1729124wrs.50.2020.12.01.00.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 00:40:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Huacai Chen <chenhc@lemote.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/2] linux-user: Add support for MIPS Loongson 2F/3E
Date: Tue,  1 Dec 2020 09:39:51 +0100
Message-Id: <20201201083951.2745111-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201083951.2745111-1-f4bug@amsat.org>
References: <20201201083951.2745111-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Meng Zhuo <mengzhuo1203@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Userland EFL binaries using Longsoon SIMD instructions have the
HWCAP_LOONGSON_MMI bit set. Binaries compiled for Longsoon 3E
have the HWCAP_LOONGSON_EXT bit set for the LQ / SQ instructions.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 17371f8b8cd..be82fcb2c0a 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1012,6 +1012,8 @@ static uint32_t get_elf_hwcap(void)
 
     GET_FEATURE(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
     GET_FEATURE(ASE_MSA, HWCAP_MIPS_MSA);
+    GET_FEATURE(ASE_LMMI, HWCAP_LOONGSON_MMI);
+    GET_FEATURE(ASE_LEXT, HWCAP_LOONGSON_EXT);
 
 #undef GET_FEATURE
 
-- 
2.26.2


