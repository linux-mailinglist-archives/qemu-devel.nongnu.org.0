Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32BA3ABAF4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:55:57 +0200 (CEST)
Received: from localhost ([::1]:39830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwFB-0005tO-08
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw6H-0003Jp-Hb
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:46:45 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw6G-0002rA-2v
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:46:45 -0400
Received: by mail-wm1-x32d.google.com with SMTP id l9so3981081wms.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3smcwuzSyCbPmC7mfgonm6k+LUdP18Ge4mtsj1HUfy0=;
 b=aZcRijtOmmYE0momLXTCFNdyKcACtyoPgRA17PwEwfhaUcuuNMlSbgj1ausVzW2SX0
 s8l3ppMZiSPfuihijITq6EvOKVYHE6CDDOPlPg5H9ewuv6gXIxzkyhRr441xsemRlbhA
 q91IaW231eneXuwEDjx5hP6703h5CTSy01ZEbuLJEb50hpEeygd5M00w6t0/xMapNwV2
 GkdvCMssW+PB+m3kRonMUJjTcVdNygOl+e6Nsy463UX45u1beUQE7MdSPsO6dlgsRiWC
 YvjuBdszqJareyqP/MNB0NY7OBRwIoHvH5e998VoCmeneDO2gCxGCcTZ8d2pnn3e/nAO
 ivtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3smcwuzSyCbPmC7mfgonm6k+LUdP18Ge4mtsj1HUfy0=;
 b=Ihyb0xN0HES55TsR5PGECsLPuD9P0VM89Ee/MKwrR9isweBhur8oZBtr1OMeA//fPe
 xZjPdpwqUiqBKi5p7k6DkKciqCUzJcw2aM9Had6OY+robeAyYgUwfa491zYhjRPua7K4
 k/8h/X2aambhCyiNOTeF0DywXvdcP2YnHorbDa9m7kERmCIMUN0qgN3RM78LEjTVHIFi
 UfRWJ3LaO1w39C8E/inxPuSukEFqoqTRFbhzuu2unmspBOnKvBV1VCWScqPmvVMNHqzT
 qIzWR534T/rnV7DTSAHtxzoyOdXToBWB1oQ4f16A0+hluChHiEoOPsEIZX/3wvhnNnbr
 cd0w==
X-Gm-Message-State: AOAM533iNxWALP6ZPAyPDKKeWQiVHNenZSkigbkokootygXWRTmmV05i
 LrA6pjKq6GXwfp5G1YrUt5vdrUtDJeU8eA==
X-Google-Smtp-Source: ABdhPJx2FXRv107QiANW8FXTsmfBjwH7hRK/wOdsKSkXC3yAmq1GF0rrGsDGgA+UDTNNtrExu6XPLA==
X-Received: by 2002:a05:600c:1d0a:: with SMTP id
 l10mr6543305wms.124.1623952002217; 
 Thu, 17 Jun 2021 10:46:42 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q11sm6075010wrx.80.2021.06.17.10.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:46:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/mips: Remove pointless gen_msa()
Date: Thu, 17 Jun 2021 19:46:35 +0200
Message-Id: <20210617174636.2902654-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617174636.2902654-1-f4bug@amsat.org>
References: <20210617174636.2902654-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only trans_MSA() calls gen_msa(), inline it to simplify.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index a2f7d6a1e08..429039cc7c9 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -2162,7 +2162,7 @@ static void gen_msa_vec(DisasContext *ctx)
     }
 }
 
-static void gen_msa(DisasContext *ctx)
+static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
 {
     uint32_t opcode = ctx->opcode;
 
@@ -2258,11 +2258,6 @@ static void gen_msa(DisasContext *ctx)
         gen_reserved_instruction(ctx);
         break;
     }
-}
-
-static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
-{
-    gen_msa(ctx);
 
     return true;
 }
-- 
2.31.1


