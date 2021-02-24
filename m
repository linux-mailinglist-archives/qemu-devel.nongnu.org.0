Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A9F3242D8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:05:22 +0100 (CET)
Received: from localhost ([::1]:37254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lExbF-0007Lg-Ly
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:05:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lExUT-0003GF-S6
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:58:21 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lExUR-00074j-CK
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:58:21 -0500
Received: by mail-wm1-x336.google.com with SMTP id l13so2454574wmg.5
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 08:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z5aRHBbMC4Mouk4nv3EKL6EACIbK+IoheJgxjehumZ4=;
 b=JnfwqPtZLP8NBpJI1qfu8vTCF8uTHPoQmTSJPaCz0RtOH3N4PhxCVBJ4Uj5aWu2qly
 G7SaZSOZDIfYkNw2t6BG9n/3M9VEkEKCzla7fsQrJm2biRnFJYYzeS7a+rQ9wi2111Bb
 4i2DTxPXBDvk/DhpD5f9uMT7gDNiKNYhg913fo3xZWzabuesz3HOxbt6LjLLlG4NZNo5
 mb3SJnhy6vvcI/6iMD4z3m+Vp7XkfOKL4eUbv+5avoO92v9W1oKI0HSQULS3g8fAJ59A
 G2rPG8/foSZNbozq3scIO24jpt/j9f100Mkx3rPkKB6NJitg0VpmvP4Y6B5P9eEzjxJ/
 6lnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z5aRHBbMC4Mouk4nv3EKL6EACIbK+IoheJgxjehumZ4=;
 b=moXEHOr63Gf6QWI1xW1DeM9PaJ1j7EPBGuW9rBF5kqnoe1OyCtkmpFpW1ya/0e0Zoi
 rW6CE7sr48pHTL0OPWO3tKe4DTd2j1gXfgzHxOk8MI3MpQdnA4kH7GCrYfIqA90s07Gc
 rsExrbAKJmDMGaRk97CU3hdAaxF4e5Ch46m0QliyV97TGG9H+RMAVQAuHbO8L4GgprTR
 FFaroY66uZjmqU0gxHYkskJestZw/H2iTtTYO7XOu0esQCILSnqtMSjkkuMxO2yJEzsE
 QW2WB/SKatOplS4BOl6V/fFztl/vQIPouqPO+pJdErL97HXP2yOsQhjnrADE/8OXtKUh
 ZrEQ==
X-Gm-Message-State: AOAM532Xi69GqBJsVzNxumzYGhhxConQAxAaMjTvigL0/A/iSiEJ8bQI
 lG5766QHCsv+3/mXcH+ObSWPfw==
X-Google-Smtp-Source: ABdhPJwQuo+l5MUvOHMSbc+2XxjsYzvPWtV1H9a0AwUJMWW6gbk/smIEaDJBg5FYcx6ux+zr4xQCvw==
X-Received: by 2002:a1c:23c2:: with SMTP id j185mr4614005wmj.96.1614185897355; 
 Wed, 24 Feb 2021 08:58:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o10sm4246718wrx.5.2021.02.24.08.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 08:58:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D06111FF90;
 Wed, 24 Feb 2021 16:58:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [RFC PATCH  4/5] include/exec: lightly re-arrange TranslationBlock
Date: Wed, 24 Feb 2021 16:58:10 +0000
Message-Id: <20210224165811.11567-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224165811.11567-1-alex.bennee@linaro.org>
References: <20210224165811.11567-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, cota@braap.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lets make sure all the flags we compare when looking up blocks are
together in the same place.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/exec-all.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index acf66ab692..75f8c3981a 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -448,9 +448,6 @@ struct TranslationBlock {
     target_ulong pc;   /* simulated PC corresponding to this block (EIP + CS base) */
     target_ulong cs_base; /* CS base for this block */
     uint32_t flags; /* flags defining in which context the code was generated */
-    uint16_t size;      /* size of target code for this block (1 <=
-                           size <= TARGET_PAGE_SIZE) */
-    uint16_t icount;
     uint32_t cflags;    /* compile flags */
 #define CF_COUNT_MASK  0x00007fff
 #define CF_LAST_IO     0x00008000 /* Last insn may be an IO access.  */
@@ -464,6 +461,11 @@ struct TranslationBlock {
     /* Per-vCPU dynamic tracing state used to generate this TB */
     uint32_t trace_vcpu_dstate;
 
+    /* Above fields used for comparing */
+    uint16_t size;      /* size of target code for this block (1 <=
+                           size <= TARGET_PAGE_SIZE) */
+    uint16_t icount;
+
     struct tb_tc tc;
 
     /* first and second physical page containing code. The lower bit
-- 
2.20.1


