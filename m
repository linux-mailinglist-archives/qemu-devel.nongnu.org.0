Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F07B479C75
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:55:53 +0100 (CET)
Received: from localhost ([::1]:43906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfo8-00051R-E5
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:55:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbn-00010f-3m
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:07 -0500
Received: from [2607:f8b0:4864:20::52b] (port=41764
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbl-0003Uh-BQ
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:06 -0500
Received: by mail-pg1-x52b.google.com with SMTP id k4so5458107pgb.8
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OBfcKB7ihQPhoD18jSdrZ0NowRt0i851gsuI5YBV/hQ=;
 b=aOlhLHBi0mQ9da8M12PIcdAtyNEqUofCnClQSZGjB6xWDizs1abXFkscIfCbbyHHHL
 7lxfCDVHnVciF+rFS/VaQhr8gKwca8Br79Uya/vyQyNEd6UhbccIdCzR1NLkPPU8+eE+
 vtj5Axhd/aODahL+hoGHQBWJmIUDR+bfoNZMNHVhjg1twDmT8l08L7Q/cXZiX/5uMQLB
 ed0kt1GU7/OKsAG6RbCNnjJH76y/cxGW4kbvvwg3GGQrMSHWg07KYphcz+/JaCfECMXh
 RXDXCvAxgaomyuQL9yz4xQ4pTl9S4z0BgQH6sBTNaY06NW+Ofuhjr4QhLYyHpnriRElu
 gWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OBfcKB7ihQPhoD18jSdrZ0NowRt0i851gsuI5YBV/hQ=;
 b=DRhJjdb3fgufUhMQ5ZxxdjrGGJsQ3C1L3lP2RT/ZzeF+iMma2j1F30RMPS0LiBT+SZ
 1izkcIjF2Q6CpvLo8wizKfwAwFHmFSU2FHp3hf08OFTCvrXZqtNQlfglnkSPZ7X1H9Zu
 EVS4u9hKzB78J80LZfLWU+WsPraZ4rTACEMNJpkVy8ilg18gnm/UKMz0NpblW12iJBO5
 TkO/K8hQWLzqxc6KDN1pGAqce9ZFteduRXxPm7mPRU0kJ3H/TLVpoXL2+juBV25TuiES
 ETLsidANbkzqc/TSbsSNvBdY5hIA85IlOsNBwNEh93iNwLFsA987Uk0gnws0qI9THFlw
 vDZA==
X-Gm-Message-State: AOAM530It2qYVdpthQjL0HhA/JCDF+H5nqzER9JiPFfWMMasb/d+TYUG
 Dh4+JmlyhXY68sp4bvqwNUzDFCOLEnQlRA==
X-Google-Smtp-Source: ABdhPJybEUxlMHi6VLCE7W8t6b0U1vgDfMv+KRxxBfBFQdFgXqLdr7efJByMl/GdkhklkGXg/QZzNg==
X-Received: by 2002:a63:f250:: with SMTP id d16mr8163911pgk.494.1639856583044; 
 Sat, 18 Dec 2021 11:43:03 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.43.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:43:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/20] tcg/i386: Implement avx512 multiply
Date: Sat, 18 Dec 2021 11:42:48 -0800
Message-Id: <20211218194250.247633-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 22eaa53cb1..f982b6e615 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -360,6 +360,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_PMOVZXDQ    (0x35 | P_EXT38 | P_DATA16)
 #define OPC_PMULLW      (0xd5 | P_EXT | P_DATA16)
 #define OPC_PMULLD      (0x40 | P_EXT38 | P_DATA16)
+#define OPC_VPMULLQ     (0x40 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_POR         (0xeb | P_EXT | P_DATA16)
 #define OPC_PSHUFB      (0x00 | P_EXT38 | P_DATA16)
 #define OPC_PSHUFD      (0x70 | P_EXT | P_DATA16)
@@ -2729,7 +2730,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         OPC_PSUBUB, OPC_PSUBUW, OPC_UD2, OPC_UD2
     };
     static int const mul_insn[4] = {
-        OPC_UD2, OPC_PMULLW, OPC_PMULLD, OPC_UD2
+        OPC_UD2, OPC_PMULLW, OPC_PMULLD, OPC_VPMULLQ
     };
     static int const shift_imm_insn[4] = {
         OPC_UD2, OPC_PSHIFTW_Ib, OPC_PSHIFTD_Ib, OPC_PSHIFTQ_Ib
@@ -3362,12 +3363,11 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return 0;
 
     case INDEX_op_mul_vec:
-        if (vece == MO_8) {
-            /* We can expand the operation for MO_8.  */
+        switch (vece) {
+        case MO_8:
             return -1;
-        }
-        if (vece == MO_64) {
-            return 0;
+        case MO_64:
+            return have_avx512dq;
         }
         return 1;
 
-- 
2.25.1


