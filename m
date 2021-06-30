Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BA03B8902
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:09:24 +0200 (CEST)
Received: from localhost ([::1]:41252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfaM-000707-L0
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0y-0005qS-Gl
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:48 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:37726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0v-00029s-HA
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:48 -0400
Received: by mail-pg1-x534.google.com with SMTP id t9so3197431pgn.4
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cqL8ixXnHLBIypnyWYXJ3pbFSn+qRlXr9cZUpIRddvA=;
 b=ObSzCpHyrnm35Af7BCQRjpEvH9s01TxtIfGkBkyZiT6dWfAaVYe/BzRKyNKZ5lLX0d
 +rfauUdWmbe95ZYzGSx7gBPCgQZ+dfKnMzLm1bAwKVYlrEO9kzMj0k3sN/4Bg3Qqb5xS
 Ow+qZwg0OsqZRBjvxWT+Sz7XZaFlDH9BiKJ0yW8RaB5N7EmY8sw907wajT8BAm2Gn52/
 HJAOykLM3ScMCom9hn4luwucIwzpmf/TOzcMsCV53SpxnBdb/edZ0WHqJ4FVeAdGakdy
 La7KEMVWEyRD0bXOKIpraoYLZn6orU9u2FT2bEKyM1ydU6HtmJ905njA3NUwkXIIm2ET
 n4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cqL8ixXnHLBIypnyWYXJ3pbFSn+qRlXr9cZUpIRddvA=;
 b=Ykgd1ppXCV7oOD7yJnwIesl00Ow/SP+cZL11aRhNY0eWav/RBm9D/a2U3hLTxOj7xh
 qW9OyqhjHUIQxx/s4PAZfUT6s/UbKVHTs97NrLMKTFBkDox2YwF44Ek35sPHezogCETi
 M/+o105sospLfSd593d8BCPj3fZ9YpDV2IhJ1ztm1zCMY8VpV93OpQqMMhI8rqz6m19v
 +5DmDnMamUv45QQezadsnSClcZjUMD2lZoMTK7SCFOg1yHSxvWbqM0g2BUJulQKc3lCT
 nAlzwHml6SxrrqkK2zoEyY143eAmXTUiYVREi9MwZcOSjih4lCGprabeD9MDCQhszVtw
 PJ4g==
X-Gm-Message-State: AOAM533E2DeV8Cyh0zZ51PI7Utit0OOGfK4Ot3l/+QtdAlkhG1TQfbaY
 crOfMxtHH4wFieHmEwxIdLs7zoM+NejIpA==
X-Google-Smtp-Source: ABdhPJz2fTjRCohEAeMJKqg8cKIwdSZjKAIiI2tyWYnMrqESJczTUhPTAgw4OQA5tVUdDuLvpabJeQ==
X-Received: by 2002:a63:4c5e:: with SMTP id m30mr35360683pgl.153.1625077964435; 
 Wed, 30 Jun 2021 11:32:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/28] target/xtensa: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:26 -0700
Message-Id: <20210630183226.3290849-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 14028d307d..ac42f5efdc 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -406,11 +406,7 @@ static void gen_jump(DisasContext *dc, TCGv dest)
 
 static int adjust_jump_slot(DisasContext *dc, uint32_t dest, int slot)
 {
-    if (((dc->base.pc_first ^ dest) & TARGET_PAGE_MASK) != 0) {
-        return -1;
-    } else {
-        return slot;
-    }
+    return translator_use_goto_tb(&dc->base, dest) ? slot : -1;
 }
 
 static void gen_jumpi(DisasContext *dc, uint32_t dest, int slot)
-- 
2.25.1


