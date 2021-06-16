Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748BC3A8E23
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:15:38 +0200 (CEST)
Received: from localhost ([::1]:38916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltK9Z-0000ep-EF
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6N-0005GE-9B
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:19 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:56182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6H-0008LK-KN
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:18 -0400
Received: by mail-pj1-x1036.google.com with SMTP id k7so708605pjf.5
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ll4cjliMp/QpwwT+A7QYxtz3tMdXsCsrcywGN6UTaqo=;
 b=XasN7KerkAux5h/jqkF/x0qQLCMBrL+BnCwPXIvknphiqrpc1TCbj2pTT0ycnJ7pKk
 tU4upxoBSfv5BacrpoBM+ckumBy3TKbVdJPwQ36Ffg+lztYZx8X1YG+xi/C4E+bPibHP
 LFjV8lryc7brQdUBqHn+uPnDIZr9WqSWy5WtNfDM65XuzoQyJB90LN2Vvs8g4FunR2ey
 9rnmx7gffIhpHNX16OOQivjGlkLsdU47j33Oj1uO3GrIKXBdzYGqp8CQ7hanFlRg2rKx
 pzSp3DBKnZKhBSfsmIt5kvqUwHNX9HOozcqaOYwjyhsbnERLmbSM2slaISTF507rSySO
 8XOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ll4cjliMp/QpwwT+A7QYxtz3tMdXsCsrcywGN6UTaqo=;
 b=fLhQRRbZ8vf6dj8cWxACTZlKM5DiTB88QBuF3yxuh7nE51XAN/6NgIO60FzFVsvF+K
 j/sorAfriNOxuw/SpC0m2wtVusvqtvuFszNjcxgKps724AftISTRqVJ7C4H/MnozfbYF
 1OF7YNI2kcVmeyS9Mpg9/uXWWThAsfO3i8xJ+pJXMHbB6pBPdd8pmXfYfe+CSTRF6qAa
 cl5fcnX5OaBEIByOLGcrZdIKhXMwsUBJ0WnZIxI8XBScOjkULngYGvVF2Y2DeozUFkoQ
 ZkKk6i/BIthUFmE8rsVaHX17TDeBe3YPZcUNoUtX3i+GjVrL/OxYk/t2QTtIrcGqUalH
 IGFg==
X-Gm-Message-State: AOAM530z95OEaxTPN/+HZqHRL+uLDbtEznB6WHzVS4OgT5zlJu0SL2Q7
 pDXne6FznoSql7pN3iPb3LPRvbuGJBWAjg==
X-Google-Smtp-Source: ABdhPJxAXlR2i24dSpgvsk2S5NkAGRfhxzwt3KkATdfrkhTzSAcFNF8z4QJsNi8EZ6jEJ5OKhwyfuw==
X-Received: by 2002:a17:902:562:b029:10e:eadc:41a4 with SMTP id
 89-20020a1709020562b029010eeadc41a4mr6737245plf.45.1623805932310; 
 Tue, 15 Jun 2021 18:12:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/21] linux-user/arm: Force v2 frames for fdpic
Date: Tue, 15 Jun 2021 18:11:51 -0700
Message-Id: <20210616011209.1446045-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The value of get_os_release may be controlled by a command
line option.  Since fdpic was added in v4.14, and v2 frame
were added in v2.6.12, this makes no change under normal conditions.

Split out a helper function to perform the test.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/signal.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index 32b68ee302..2d30345fc2 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -165,6 +165,18 @@ static inline int valid_user_regs(CPUARMState *regs)
     return 1;
 }
 
+static bool v2_frame(void)
+{
+    /*
+     * We do not create fdpic trampolines for v1 frames.
+     * Thus we force v2 frames, regardless of what uname says.
+     * Support for fdpic dates from Linux 4.14, so this is not
+     * really a behaviour change.
+     */
+    int is_fdpic = info_is_fdpic(((TaskState *)thread_cpu->opaque)->info);
+    return is_fdpic || get_osversion() >= 0x020612;
+}
+
 static void
 setup_sigcontext(struct target_sigcontext *sc, /*struct _fpstate *fpstate,*/
                  CPUARMState *env, abi_ulong mask)
@@ -422,7 +434,7 @@ sigsegv:
 void setup_frame(int usig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUARMState *regs)
 {
-    if (get_osversion() >= 0x020612) {
+    if (v2_frame()) {
         setup_frame_v2(usig, ka, set, regs);
     } else {
         setup_frame_v1(usig, ka, set, regs);
@@ -516,7 +528,7 @@ void setup_rt_frame(int usig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
+    if (v2_frame()) {
         setup_rt_frame_v2(usig, ka, info, set, env);
     } else {
         setup_rt_frame_v1(usig, ka, info, set, env);
@@ -734,7 +746,7 @@ badframe:
 
 long do_sigreturn(CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
+    if (v2_frame()) {
         return do_sigreturn_v2(env);
     } else {
         return do_sigreturn_v1(env);
@@ -823,7 +835,7 @@ badframe:
 
 long do_rt_sigreturn(CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
+    if (v2_frame()) {
         return do_rt_sigreturn_v2(env);
     } else {
         return do_rt_sigreturn_v1(env);
-- 
2.25.1


