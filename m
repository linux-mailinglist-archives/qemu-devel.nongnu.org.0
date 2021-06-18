Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4E33AD2E4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:32:26 +0200 (CEST)
Received: from localhost ([::1]:59730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKE5-0004Ms-St
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBj-0001QI-Uk
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:29:59 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBf-0001Q9-Gj
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:29:59 -0400
Received: by mail-pl1-x636.google.com with SMTP id x10so5207468plg.3
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vF/Dv3hdb1vnrzJPeq46hpO+A1VIsu9mSs+eyoe3lIs=;
 b=RbVyyHno/O+Shg0lvjANiqAKI+ptVlioZ0YFEbbi6mV7m4f0Jpo9nY9DVu83OFdkCz
 0EFEW2+PQBZDeNYfDlJNQOamB403QuqpSQ3bsIhhd5cBYDhtSES6kl0oiGab/FfhPWKr
 /xvEJYareZ/5DRQ9N4Y6OlBbTYwKle45983NV0EOpXeK4XBvhMYZeI4UQgfcV1YuSQG3
 N7WWr/EXtmpcBsBtsNhySRSqCmkFMnhoMKfdueAZttGeu5IJiUGr9eqQnoMIhNLNA+YC
 q4TYvUd9rNmtte3A26Y82v6CDhJ15H61p28phbNolHaHIXB2HFJMT7F/e9MNqMX3wHT3
 Of4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vF/Dv3hdb1vnrzJPeq46hpO+A1VIsu9mSs+eyoe3lIs=;
 b=acX/PszOdwuo4ucuNvAy0tgG+NlMR8ZGEe1QwU40CGsXz53pRetQJQzcRUQP+uS3CI
 EDTALydU7CU968aRjg7s3zNfS8YdkGWHcIEkJxltUp/EACtDP3T0oQvsU5OHtXSkjkkh
 p+wmTBgYmsoyf4BCSYn4VfXeHIeZis//R0G9tpotg3j2MjU4JWgaG160axg0T3TAQzw6
 tJXjgG/Sf0yFmxWhvQEmL2hoLv7kXe/Th7TncIuo/Fk3IcqiFzK8HzWRYCvgoE0fBsSC
 afvXLU17myaNf6FdTSGavfMicQJXtSLYCcdJOBRjmpjoVa/TjbWRpKKqG5SA0eWJvyHa
 qyXw==
X-Gm-Message-State: AOAM5309OQQ/BOSD47y2mezJP7onq8fHlebPNNUlDnHHqKDdZQtV78W2
 rLMlqRpGu2+eWXwYFSx3cb5ivuTDgyhbMA==
X-Google-Smtp-Source: ABdhPJzM7TbizGuojneKZmJl+RlBw/cUTJ9UxKZi1IIQ5Q9GshINiIYI5QGfKuVdJOTVQM5wH0hlIw==
X-Received: by 2002:a17:902:9a01:b029:11a:d4e:8f4 with SMTP id
 v1-20020a1709029a01b029011a0d4e08f4mr6140345plp.52.1624044594110; 
 Fri, 18 Jun 2021 12:29:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:29:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/23] linux-user/arm: Split out v2_frame
Date: Fri, 18 Jun 2021 12:29:31 -0700
Message-Id: <20210618192951.125651-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out a helper function to test for a v2 signal frame.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/signal.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index 32b68ee302..cb65623965 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -165,6 +165,11 @@ static inline int valid_user_regs(CPUARMState *regs)
     return 1;
 }
 
+static bool v2_frame(void)
+{
+    return get_osversion() >= 0x020612;
+}
+
 static void
 setup_sigcontext(struct target_sigcontext *sc, /*struct _fpstate *fpstate,*/
                  CPUARMState *env, abi_ulong mask)
@@ -422,7 +427,7 @@ sigsegv:
 void setup_frame(int usig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUARMState *regs)
 {
-    if (get_osversion() >= 0x020612) {
+    if (v2_frame()) {
         setup_frame_v2(usig, ka, set, regs);
     } else {
         setup_frame_v1(usig, ka, set, regs);
@@ -516,7 +521,7 @@ void setup_rt_frame(int usig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
+    if (v2_frame()) {
         setup_rt_frame_v2(usig, ka, info, set, env);
     } else {
         setup_rt_frame_v1(usig, ka, info, set, env);
@@ -734,7 +739,7 @@ badframe:
 
 long do_sigreturn(CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
+    if (v2_frame()) {
         return do_sigreturn_v2(env);
     } else {
         return do_sigreturn_v1(env);
@@ -823,7 +828,7 @@ badframe:
 
 long do_rt_sigreturn(CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
+    if (v2_frame()) {
         return do_rt_sigreturn_v2(env);
     } else {
         return do_rt_sigreturn_v1(env);
-- 
2.25.1


