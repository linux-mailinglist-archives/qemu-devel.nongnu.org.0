Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3F13C65E7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 00:05:47 +0200 (CEST)
Received: from localhost ([::1]:50938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m343e-00074z-9B
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 18:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tz-0000kv-7U
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:47 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:38750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tw-0006vA-OE
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:46 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 me13-20020a17090b17cdb0290173bac8b9c9so143788pjb.3
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 14:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=m7emFn9ZXxGGMcBZFosB1EnmF9R96t2zGLMZbzq44mc=;
 b=rxNTD/co5NHhu5YAUrO/4/3Q6zmq5wj1krlkzCno+nne0/ipSHG0K/ycuc0vCcEg22
 /yvZwjVZQo36lgaJiYiuy7opmBQMwI9a/2KK43qbqVsiehBLNdseNKpSoC3neWC6vErJ
 bFGB+sb2l30hqigiXYBHpnAya6yWoQwsejs2EFNb5Cj3npC32sE5n4+xu7MCx+ol4h1c
 boNSoY31FvdpeWY/YJXvNUhUuUDowrIE+EDsOUFrt/xJOalgaheaVBXWggRRK820oH1B
 eWa84HO8OC7vdMUtAq89eZzkc77iuu3l7Ake8hYt6VF5V2kt2FtEgiXslbfL4qgXAZ9d
 8bOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m7emFn9ZXxGGMcBZFosB1EnmF9R96t2zGLMZbzq44mc=;
 b=g0e1QodO9uK6Ifrw5Rc+derBFLScwWg58xn537BhRjGRjsUs7JzVt/1VfUwFHk1HJ6
 Gj6YHOLsNv7cmldpyZyW49m2ujDEzOVHEiEnPtJG145YWxswgG7ULNjpqkO5dGsCFKXl
 k0HOPsfie2EJ10DfIUuqVL7b+rrbj5DCuAVzaQjQ+cKjVHVl1dCCwVx6C04oQ6CsIXWp
 zo6/rqEpP1sHHfX9TZtAG/+2H8rN9DKJI6sLi/47ERWMBCn7uLm4HYIrTSHAsGIKkq6s
 mvbl/1EEspISz1kcWMITOvlomzISM2d4JX1/1+y0MR1fO4u1vcKoQGmhNy3kbBz44NWZ
 7AOQ==
X-Gm-Message-State: AOAM530XLwESUKNpqI4YXhFVBsSNYzIeCiF29CiU+mxFRDhQ454qj4ov
 eRSTQuSZlLJioKUGpjC/z9RNpcf/38xrPQ==
X-Google-Smtp-Source: ABdhPJwwA1OwQyav8nbzLjQ6EtTdx4cENSVCGtCT9AwKP0dcdOsPYWXwbcNQNRekar9rHSqbtRWAVQ==
X-Received: by 2002:a17:90a:1de3:: with SMTP id
 v90mr934918pjv.219.1626126943457; 
 Mon, 12 Jul 2021 14:55:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d2sm376932pjo.50.2021.07.12.14.55.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 14:55:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] tcg/ppc: Replace TCG_TARGET_CALL_DARWIN with
 _CALL_DARWIN
Date: Mon, 12 Jul 2021 14:55:34 -0700
Message-Id: <20210712215535.1471256-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712215535.1471256-1-richard.henderson@linaro.org>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If __APPLE__, ensure that _CALL_DARWIN is set, then remove
our local TCG_TARGET_CALL_DARWIN.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e0f4665213..2202ce017e 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -25,8 +25,8 @@
 #include "elf.h"
 #include "../tcg-pool.c.inc"
 
-#if defined _CALL_DARWIN || defined __APPLE__
-#define TCG_TARGET_CALL_DARWIN
+#if !defined _CALL_DARWIN && defined __APPLE__
+#define _CALL_DARWIN 1
 #endif
 #ifdef _CALL_SYSV
 # define TCG_TARGET_CALL_ALIGN_ARGS   1
@@ -169,7 +169,7 @@ static const int tcg_target_call_oarg_regs[] = {
 };
 
 static const int tcg_target_callee_save_regs[] = {
-#ifdef TCG_TARGET_CALL_DARWIN
+#ifdef _CALL_DARWIN
     TCG_REG_R11,
 #endif
     TCG_REG_R14,
@@ -2372,7 +2372,7 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 # define LINK_AREA_SIZE                (6 * SZR)
 # define LR_OFFSET                     (1 * SZR)
 # define TCG_TARGET_CALL_STACK_OFFSET  (LINK_AREA_SIZE + 8 * SZR)
-#elif defined(TCG_TARGET_CALL_DARWIN)
+#elif defined(_CALL_DARWIN)
 # define LINK_AREA_SIZE                (6 * SZR)
 # define LR_OFFSET                     (2 * SZR)
 #elif TCG_TARGET_REG_BITS == 64
-- 
2.25.1


