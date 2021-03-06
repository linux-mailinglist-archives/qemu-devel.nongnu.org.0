Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDCA32FDA3
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:51:31 +0100 (CET)
Received: from localhost ([::1]:44524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIepe-0003oV-5O
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebM-0007Os-TU
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:44 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebL-000310-2o
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:44 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so995238pjc.2
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F8oLm+b5MpB59nkWYQpAlXOnlN0WpiVVfnOPsmvYmdk=;
 b=Ndos8emaMlLeaoogiRUa+YsIPwrZhJseoGnQL6HO8OKslWjGk0JePnohKxzAnb/NUk
 U0MQKw4gf7mbFj/TfDilaaWsutm+6cvj9qoal7irkWLuNPhVQKLsoJu2EPgodUk8vXtr
 1eltfjhn6y96vGvzKSygiuPfX0mIGn45XKYUMb6rx/Fvo3iQPAy1dlsJNEAAJsnKQMVL
 u03SwA6EhqicMtCCNID26C1Co5o2/lj4VdNMZlTxBsBF/q8SVPTkcfQQJkJhyTrLyfMQ
 Y9KtT6jKpROKffWmBupNqNZ8Qdol1JxfUMnKdJ/8JDkw1sDj7Kt81ywJQkeT7hyIbKNQ
 7UPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F8oLm+b5MpB59nkWYQpAlXOnlN0WpiVVfnOPsmvYmdk=;
 b=uRr8W7I+utKq/wYrjyTAW9IVyzdWIb8zv6TGNXf9a+ZQk5oxc0S3u0zaieA7Rhlct6
 KKxwcBJf9PGwPjU7h0Q0F1Ahz48oUil77JuYMeI5fw6OdFzFiWJ2ZQrsm/ldRMV3vM3u
 yAObpjBByWCQIEIAujTI1/6TIHoJzf0VtJtriXTC92MJ3cUsvOOViMPEo2UeSZnN1PW6
 yHK5ojIfPHFHtlkqasCukBtusc+ZDM4U6j9tLngkxhUHWdzeRFrVRTu4ZJwZTje6Mc+l
 RfP6Et+xk7OxfQqAlLEzgeicN4ubmxLLx3U0KLY6u+PvDL/1LtDYXZYw5uRc2Vq5015o
 x24A==
X-Gm-Message-State: AOAM532jmoM4bHby/4ORha51RKgiwFsBfs73Hg/Hq3ZJdAWSRP8bMSph
 WHs5fFk2liMZ/423j3vJbPQOaKi2F9MxXg==
X-Google-Smtp-Source: ABdhPJwT49pfTORyanf6vHA7K/9ao9a2N8u1xE1I/sr7fvjNOqh/vHqrKoR/NPUOsshHjvlJPLFkig==
X-Received: by 2002:a17:90b:fd2:: with SMTP id
 gd18mr17221543pjb.115.1615066601707; 
 Sat, 06 Mar 2021 13:36:41 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/27] include/exec: lightly re-arrange TranslationBlock
Date: Sat,  6 Mar 2021 13:36:12 -0800
Message-Id: <20210306213613.85168-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Lets make sure all the flags we compare when looking up blocks are
together in the same place.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210224165811.11567-5-alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index acf66ab692..a262dd5804 100644
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
@@ -464,6 +461,14 @@ struct TranslationBlock {
     /* Per-vCPU dynamic tracing state used to generate this TB */
     uint32_t trace_vcpu_dstate;
 
+    /*
+     * Above fields used for comparing
+     */
+
+    /* size of target code for this block (1 <= size <= TARGET_PAGE_SIZE) */
+    uint16_t size;
+    uint16_t icount;
+
     struct tb_tc tc;
 
     /* first and second physical page containing code. The lower bit
-- 
2.25.1


