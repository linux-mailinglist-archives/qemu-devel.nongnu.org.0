Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE8F36DFC3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:43:36 +0200 (CEST)
Received: from localhost ([::1]:39346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbq5v-0005aw-HZ
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwu-0005qf-Sd
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:16 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:45602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwr-0004bj-R4
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:16 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so5951307pjb.4
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PTbBn14FconxhVlG/Qed7GcchUeX7ogzz1x+sK3RjOU=;
 b=mUqZ7PUvJ9gNfjurbj1vNWAeOK0KBcdGSU4m4JWMWNGsGPITebEk2WCkQ8oVWqaJG3
 sb2WYXofHWyyL9WDOMXPYcDi/GZ5ZewzZOYJgi21W8ZvNfZ+eo4gjLbX3dvchmarRFIX
 cZPaPj3rVY14XfxIB7K3xsDGtqUb1NO73VdquDR23TS9zQ0D+oGDJh4H9L1BqB+1X58V
 wGIZ/m8GinghDlSjx+/oO5M6BixGg0phiN/mO+0wo6NDCPh7g4gUP1I0xcpB6B+iwSuk
 OAl2EJcEF7woCYDpgxHW75aB4JVm9k6oYBe5AzvzskKmn57dG4/Rw7i5upoUJhIJDaKD
 XhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PTbBn14FconxhVlG/Qed7GcchUeX7ogzz1x+sK3RjOU=;
 b=kO8Z6qzdFIL/Fc8bWGWq7tbZR+EvxNgp5TfEzfTM9l9hXb6OFlq8mDuffW8QfVEeC0
 TkyKdTVepYitueaO5H5lfRV25gJKfBmKgf/qpfnk/n4sw43k7fTUH4eq0cYIZJXavwao
 z1/z05mPlXotYqeFiKbFPazqVWQR+FSW44SXN8J+lTWaBEbwr/OKEKUYX5mRtvXRR0L/
 nyGKWfXRnx/VBWvCFzEO0YgcwpoU1Q9mM//QAnlnDRQNZEWsjjjUDNkADprl9+VzRYyU
 OjDqVxYveoWCH58vpT5T4HuGEALECCwtmGARMSLVMO0uWHupZbGhAOKBkKe1jHj37TS4
 +dSg==
X-Gm-Message-State: AOAM531ETSI0SBGifWNaRVljKKfV2Vo3fV+WlxEoboDfqU9SXp8CSHZG
 McXwm0pcmJQKJ4oLwzJ5W9l9GqysvIkQwQ==
X-Google-Smtp-Source: ABdhPJztf4viBmY12lRNtneuYMVUj2ytm0/rNwxxvDv9TcamHlbLSJzzilR6BseCDrVEIGIg28NW1A==
X-Received: by 2002:a17:902:e804:b029:ed:5748:9047 with SMTP id
 u4-20020a170902e804b02900ed57489047mr10543072plg.36.1619638451913; 
 Wed, 28 Apr 2021 12:34:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h21sm403725pfo.211.2021.04.28.12.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:34:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/15] linux-user/s390x: Remove restore_sigregs return value
Date: Wed, 28 Apr 2021 12:33:57 -0700
Message-Id: <20210428193408.233706-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
References: <20210428193408.233706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function cannot fail.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 1dfca71fa9..e455a9818d 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -230,10 +230,8 @@ give_sigsegv:
     force_sigsegv(sig);
 }
 
-static int
-restore_sigregs(CPUS390XState *env, target_sigregs *sc)
+static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
 {
-    int err = 0;
     int i;
 
     for (i = 0; i < 16; i++) {
@@ -251,8 +249,6 @@ restore_sigregs(CPUS390XState *env, target_sigregs *sc)
     for (i = 0; i < 16; i++) {
         __get_user(*get_freg(env, i), &sc->fpregs.fprs[i]);
     }
-
-    return err;
 }
 
 long do_sigreturn(CPUS390XState *env)
@@ -271,9 +267,7 @@ long do_sigreturn(CPUS390XState *env)
     target_to_host_sigset_internal(&set, &target_set);
     set_sigmask(&set); /* ~_BLOCKABLE? */
 
-    if (restore_sigregs(env, &frame->sregs)) {
-        goto badframe;
-    }
+    restore_sigregs(env, &frame->sregs);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
@@ -297,9 +291,7 @@ long do_rt_sigreturn(CPUS390XState *env)
 
     set_sigmask(&set); /* ~_BLOCKABLE? */
 
-    if (restore_sigregs(env, &frame->uc.tuc_mcontext)) {
-        goto badframe;
-    }
+    restore_sigregs(env, &frame->uc.tuc_mcontext);
 
     target_restore_altstack(&frame->uc.tuc_stack, env);
 
-- 
2.25.1


