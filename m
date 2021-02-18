Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB61731F31E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:33:52 +0100 (CET)
Received: from localhost ([::1]:35956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsnv-0003rb-Rw
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:33:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsjF-0007YS-LU
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:29:02 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsjC-000365-Ir
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:29:01 -0500
Received: by mail-wr1-x433.google.com with SMTP id r21so4758463wrr.9
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 15:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XXMkXBsF42vikYhWm6f6trPmrfhthLvIloNBgjaGteM=;
 b=fBbbRjMD3joQj20o1bPi6McfeLQOmLnTPQByudyL9INOSZ39LQhc2Mc2oa+3n8Oftc
 qdFaIBhF9i/RSHSYXwy20xqeXZ0vNrjGssbsKNbGQ8FcJzx7yX9mUL26XompY4JckxW6
 dbwBbQ04fiO5pvRfGUjM/bAC3SP8h+G+12qKQjjfvq11ZFAVijvok9HocaIqFCywXDXG
 obdrf9vtBvTeB9LbErxLjhD2bMZNJSoVD3vQYSVZzbCN0x4g2OYe8JSF4yjfHQId/z7J
 MsrPyC2kIXrOpR4XzgPA/CKUIb1SRPD7YR+m9MARXUvOZYSLP5syhIEyf85FepR1I4NH
 wwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XXMkXBsF42vikYhWm6f6trPmrfhthLvIloNBgjaGteM=;
 b=RW0aZx+lYlPu+b471Ii4sJn3g47ODzoLWvdkwPxEaBnhqFE1fzY3Q0Qzcl55Lfh/tL
 j6DVAHtJ7vWk8XjYCpLgd1UgMFPL9JAVhWphsOgP3hFyl+rFPWV4HAnimnFLlPfzkGN6
 dlOpBDkB0Gu+irLKZvmhtwa2PYqfYJN4SDPamocea4dz5DQI9/EKaKN0m778JhpN+G56
 W9JZrk7JxJ5P6rKCF/q1lHPgzarPcHlpUZGa6UzkMx+EW3vxn5I1FAGHjGY8OgPUQtjb
 /hGXXb68d/Fb3weVdDOZRQDpZHjpli75Ex3g0ojl4aOqzS0DvgTow6mzclp8pY98IEgz
 jL1A==
X-Gm-Message-State: AOAM531StQ3HNTtAnA+ccHsHit8AZjuTGL998tyfjf7ZVb8tr09RW4UQ
 /7W0tb5OKIj52wojGYBHFLNVsEhA4DQ=
X-Google-Smtp-Source: ABdhPJyicduoxsmCMAvSK3yw/1xCq4DYSvQL96NtDA/mjr0ihd0NhZgHmghYQXTCaPGY0+CdkmhySw==
X-Received: by 2002:a5d:40cd:: with SMTP id b13mr6360482wrq.3.1613690936170;
 Thu, 18 Feb 2021 15:28:56 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 64sm12328012wrc.50.2021.02.18.15.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 15:28:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 3/5] tcg/tci: Merge identical cases in generation (deposit
 opcode)
Date: Fri, 19 Feb 2021 00:28:38 +0100
Message-Id: <20210218232840.1760806-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210218232840.1760806-1-f4bug@amsat.org>
References: <20210218232840.1760806-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use CASE_32_64 and CASE_64 to reduce ifdefs and merge
cases that are identical between 32-bit and 64-bit hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210217202036.1724901-5-richard.henderson@linaro.org>
[PMD: Split patch as 3/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/tci/tcg-target.c.inc | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 1896efd1006..4a86a3bb466 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -494,7 +494,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
         break;
-    case INDEX_op_deposit_i32:  /* Optional (TCG_TARGET_HAS_deposit_i32). */
+
+    CASE_32_64(deposit)  /* Optional (TCG_TARGET_HAS_deposit_*). */
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
@@ -505,15 +506,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
 #if TCG_TARGET_REG_BITS == 64
-    case INDEX_op_deposit_i64:  /* Optional (TCG_TARGET_HAS_deposit_i64). */
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_debug_assert(args[3] <= UINT8_MAX);
-        tcg_out8(s, args[3]);
-        tcg_debug_assert(args[4] <= UINT8_MAX);
-        tcg_out8(s, args[4]);
-        break;
     case INDEX_op_brcond_i64:
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
-- 
2.26.2


