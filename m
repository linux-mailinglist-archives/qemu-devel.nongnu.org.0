Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F7C4D97A4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 10:29:35 +0100 (CET)
Received: from localhost ([::1]:55486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU3Uk-0007yW-3k
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 05:29:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nU2lx-0008Sw-0y
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:43:19 -0400
Received: from [2607:f8b0:4864:20::102c] (port=56227
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nU2lu-000545-1l
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:43:15 -0400
Received: by mail-pj1-x102c.google.com with SMTP id e3so17031698pjm.5
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 01:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DEJtNZJacym7P3D55T00OdkxyEJk/tkTx1LWRg3rxNs=;
 b=uI9ItgBWvpWSsUBoL2AvQnXiyn1z3DmL+NHB+QW5SVNdAoA9LyITt8p28bvbiHr0s3
 QefmGlCK+HfFvxL9YAIFFnQUIlRlOVzOXuHcKM2wqEgpDKK4RO+o1JYKNbnbclQqNzju
 07bu7Uh2QfBrdGAFABtP69KXD5l7Ny79J6n5YAiA+Zov9AXRpezHxIwMB4GdSYuP5I3S
 nMV6+jrsLHS3toxT+2UhL0PuIInco/wgaRI3BdMKFEdwUaKEjhkG3KcCnm6TD3NxhDm7
 rcyLLyt0WFbbkmKZPMZEvvMcmIfln3Z2caDltnzvZxAckZ2ksExlZtYPCHZGH7Nrjcmi
 G5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DEJtNZJacym7P3D55T00OdkxyEJk/tkTx1LWRg3rxNs=;
 b=XLgB2q4dtmxyYD7AIHpdSZIlk39ToWvm7goADls8ZEflWguj26jPh4C+LuC0h8o2og
 EbEDbpOXuvlXXzoMB33J3zE8lZc42Vbnu3PuxhgReZ68kLDmV5KMQT4rD+VPyORewqNL
 ZDLpco1NvM1loOafmUUPmdmAnKi55owBUitEX925yAkuWRVnP2h5hgCaZ659xr7Rc2YM
 wnKx4xLVH+zvnx6Su6O4CyUreoQaUeuPutlFOBB/vVg2dpYeAbGImf5Abky+AHsSN4+3
 dbbTwHV37mAerDagaphDLHVmJ3dWfNSm4EALog6ghFziiAi9W+7PbpbMydSRXXhoHORl
 3gXA==
X-Gm-Message-State: AOAM531JXcetTNhXo0oslFQhtwKHclprGHsN383N1uEtoSjL3494RCQv
 CQUVF5Hpom38dE9yyiWSVMqxkzBrrCNYoA==
X-Google-Smtp-Source: ABdhPJwppdGGo1gjek07i4FD5O5UWEu/56zQfcFQ31+MqkTex1grmns59Pse2SlvHjodAAxTQkBdIg==
X-Received: by 2002:a17:902:cec2:b0:151:b337:a699 with SMTP id
 d2-20020a170902cec200b00151b337a699mr27885786plg.59.1647333792820; 
 Tue, 15 Mar 2022 01:43:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 ob13-20020a17090b390d00b001becfd7c6f3sm2233762pjb.27.2022.03.15.01.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 01:43:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] linux-user: Properly handle sigset arg to epoll_pwait
Date: Tue, 15 Mar 2022 01:43:07 -0700
Message-Id: <20220315084308.433109-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315084308.433109-1-richard.henderson@linaro.org>
References: <20220315084308.433109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unblocked signals are never delivered, because we
didn't record the new mask for process_pending_signals.
Handle this with the same mechanism as sigsuspend.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 8071a5191d..85de4e1bc7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -12694,29 +12694,21 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #if defined(TARGET_NR_epoll_pwait)
         case TARGET_NR_epoll_pwait:
         {
-            target_sigset_t *target_set;
-            sigset_t _set, *set = &_set;
+            sigset_t *set = NULL;
 
             if (arg5) {
-                if (arg6 != sizeof(target_sigset_t)) {
-                    ret = -TARGET_EINVAL;
+                ret = process_sigsuspend_mask(&set, arg5, arg6);
+                if (ret != 0) {
                     break;
                 }
-
-                target_set = lock_user(VERIFY_READ, arg5,
-                                       sizeof(target_sigset_t), 1);
-                if (!target_set) {
-                    ret = -TARGET_EFAULT;
-                    break;
-                }
-                target_to_host_sigset(set, target_set);
-                unlock_user(target_set, arg5, 0);
-            } else {
-                set = NULL;
             }
 
             ret = get_errno(safe_epoll_pwait(epfd, ep, maxevents, timeout,
                                              set, SIGSET_T_SIZE));
+
+            if (set) {
+                finish_sigsuspend_mask(ret);
+            }
             break;
         }
 #endif
-- 
2.25.1


