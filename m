Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4B3479C61
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:45:54 +0100 (CET)
Received: from localhost ([::1]:45012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfeT-0003Vb-84
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:45:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbg-0000a9-06
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:00 -0500
Received: from [2607:f8b0:4864:20::1034] (port=39708
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbe-0003TG-IO
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:59 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 z9-20020a17090a7b8900b001b13558eadaso7243751pjc.4
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vEWXGgUUx2/oRlyxRim0WIyazrpg3deafsssX7vLivY=;
 b=ZHe1zXK5/M2k7fZndU+huY+SYIoY38jJcGNf8uOBcN5aU93dQH61PkWUPiBBsKJLFq
 dBWyor1FxvEcK4RZxkL8/9jr4xe8kW6Ye4fTMZC5DPyICii0UjHzCUp08HujvaCnLzG6
 lR65bOmkKZRbIE7JnZCjoxaSPa4bH405VumNKjth1tQkFX4S4pvE0W8Lhg3UTMxkvYFx
 WYl2GQsYd3mr1XZY7q2YKpcsjN0Wm0WTNHnbUX5EZHS01o0R53XxhYKRBsBVtCPwX9Va
 8ljnPFzQrXMI9YpgmETxfqWxUa4JEgtw8Z/xYMDB5/OTI8lfYLclDfKM9UNd9IoNhuuz
 LLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vEWXGgUUx2/oRlyxRim0WIyazrpg3deafsssX7vLivY=;
 b=K91Jc0d6YHTOE3GTd7jHkk8VWlfb0tdYXCIaJ3xIeFY88fqdzHZ5kEY5+J2O67/sxt
 wT0CPJ0G7Ubvo5Ts435I/9m3IUYHL5HGaXNqjMYV+3bWmh6TXxBP69xyIX364gukkNfz
 l1NZXTHUUMIJ81xiK50pi64bJCqtc2tIsuLClEg2nWkeQM2u667cNd4XkQjU0aukW03+
 JHTfu/4XLikCpFtvVQ89aiwlVBzyywVe4PhJhqnI1JNelrFD+uUsqkQmR7ckL3P9Sppv
 v9qXXiG78TzRCQITNe8HazuwZQohKQD+J1XuI/0XACGAZ2kBeEsr412U3JKhXRRXwyFz
 i3YA==
X-Gm-Message-State: AOAM530XmtfY5QtiEdzRRybiCCb4tlOKJ7M0ElmUSG3LnMaP/5XL/TmN
 rUJXfTds1hVkavG8RMG4ykXlq2RR7nj8yg==
X-Google-Smtp-Source: ABdhPJyYkj8GpdRDgSQ2E0+cMKFnNNmmSaClWQxKkRUUP1X/inIK70wj1hHa+wofaeiUsZZmSvnooQ==
X-Received: by 2002:a17:90a:c253:: with SMTP id
 d19mr4421587pjx.157.1639856577266; 
 Sat, 18 Dec 2021 11:42:57 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.42.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:42:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/20] tcg/i386: Implement avx512 scalar shift
Date: Sat, 18 Dec 2021 11:42:39 -0800
Message-Id: <20211218194250.247633-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

AVX512VL has VPSRAQ.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 7b9302fcc2..69481c188c 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -368,6 +368,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_PSLLQ       (0xf3 | P_EXT | P_DATA16)
 #define OPC_PSRAW       (0xe1 | P_EXT | P_DATA16)
 #define OPC_PSRAD       (0xe2 | P_EXT | P_DATA16)
+#define OPC_VPSRAQ      (0x72 | P_EXT | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_PSRLW       (0xd1 | P_EXT | P_DATA16)
 #define OPC_PSRLD       (0xd2 | P_EXT | P_DATA16)
 #define OPC_PSRLQ       (0xd3 | P_EXT | P_DATA16)
@@ -2761,7 +2762,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         OPC_UD2, OPC_PSRLW, OPC_PSRLD, OPC_PSRLQ
     };
     static int const sars_insn[4] = {
-        OPC_UD2, OPC_PSRAW, OPC_PSRAD, OPC_UD2
+        OPC_UD2, OPC_PSRAW, OPC_PSRAD, OPC_VPSRAQ
     };
     static int const abs_insn[4] = {
         /* TODO: AVX512 adds support for MO_64.  */
@@ -3237,7 +3238,14 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_shrs_vec:
         return vece >= MO_16;
     case INDEX_op_sars_vec:
-        return vece >= MO_16 && vece <= MO_32;
+        switch (vece) {
+        case MO_16:
+        case MO_32:
+            return 1;
+        case MO_64:
+            return have_avx512vl;
+        }
+        return 0;
     case INDEX_op_rotls_vec:
         return vece >= MO_16 ? -1 : 0;
 
-- 
2.25.1


