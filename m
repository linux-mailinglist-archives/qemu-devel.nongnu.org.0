Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42B52EE71D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:44:42 +0100 (CET)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxc9B-0003gG-UH
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhW-0001XT-4z
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:06 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:37749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhH-0001gX-VI
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:04 -0500
Received: by mail-pj1-x102a.google.com with SMTP id b5so4478212pjk.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ASquR/6BxZoSVQzDtOnOXOHE8jLTrkcyVCDT0iJkP14=;
 b=hKm8O3voMxOeTDRXQ1qGghTB1XF7uPK1sETisjiocPsdJOW/mlyaPxQAjoHnXrdaQW
 wH1agmPELIJlv5iI6211+jidbPHmZ78NRZ6VI5gKGzJnLm6s1F7EB+U/Ziw7Or+t1o64
 D3AGNrgLCpavHZzCfw369Sz3aLueRKM74KCF+dYEpahANX4UfPJIjQgl45DIR7hXV50z
 iXAy2wcPJ/d0+xHuG9Lpw84D7Hvb2A+T+NpHdJcnejnnLRtb09Nv31EQmXCZUfZ1uRwM
 Y88JX4NBw5nB2X7i04c5WUr3Y+iq2TYYWryi41fCtCwRAm70hymWS8z5yDSNGTHz/G7Y
 M+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ASquR/6BxZoSVQzDtOnOXOHE8jLTrkcyVCDT0iJkP14=;
 b=E3781D5m7RaAGEvpQmvW6kCuTnUWaIzHxHb08WMfaKKF8x3mBUxrB5BRNDSxJyIsyb
 QQYRZVmqEwzlpKltXY8HYwVUPRawOv0QyAjqT93+Pd+o9zYspqU0eOb0S/hyTXuN+eBg
 0PDxNSMY24PhY2Vq4fI7ByzqXB+gnO2lQsjRfmWwmpnl3w18UsK4TMWhFLwISfQ/F4Mp
 rrgD8Yb4rZcoaNE3hpI0ulWctTRdCwlVIlqq0tniOpODQbEbZ1lpAVQNQyVrwhziMM9a
 0j3SiarBCdSSEXLZ5G963Z9hboZDxTAgKd1AwcCu7UEQiqUml1M21p8dNxPXLaPJraSf
 51Fw==
X-Gm-Message-State: AOAM533nE2+j2esPOJvnDff83Xz839yy/VON15KhmDZzp9Qcc/lwPeFy
 4cLPteEpdrkkoNcrTjMkAXoQdbatE791NA==
X-Google-Smtp-Source: ABdhPJzwvk2pNvxsS15ib+toX4dRbRHrsp9nBDvSj01k3rvO8X4fQs6IK6rV6/TmRHf20TeYWRSOcw==
X-Received: by 2002:a17:90b:4014:: with SMTP id
 ie20mr162657pjb.95.1610050548146; 
 Thu, 07 Jan 2021 12:15:48 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/47] tcg/ppc: Use tcg_out_mem_long to reset TCG_REG_TB
Date: Thu,  7 Jan 2021 10:14:33 -1000
Message-Id: <20210107201448.1152301-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The maximum TB code gen size is UINT16_MAX, which the current
code does not support.  Use our utility function to optimally
add an arbitrary constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index ed7a201578..1f8a446b90 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2392,9 +2392,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         set_jmp_reset_offset(s, args[0]);
         if (USE_REG_TB) {
             /* For the unlinked case, need to reset TCG_REG_TB.  */
-            c = -tcg_current_code_size(s);
-            assert(c == (int16_t)c);
-            tcg_out32(s, ADDI | TAI(TCG_REG_TB, TCG_REG_TB, c));
+            tcg_out_mem_long(s, ADDI, ADD, TCG_REG_TB, TCG_REG_TB,
+                             -tcg_current_code_size(s));
         }
         break;
     case INDEX_op_goto_ptr:
-- 
2.25.1


