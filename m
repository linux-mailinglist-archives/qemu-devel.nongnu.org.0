Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38BD669B53
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:03:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKmf-0000um-QV; Fri, 13 Jan 2023 09:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmS-0000r6-7c
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:42 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmP-0003dg-Fb
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:39 -0500
Received: by mail-wm1-x329.google.com with SMTP id g10so15354457wmo.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yQOKxbWfNbJ6ZYIkx8c2YswZ3peqlz+Y7JAPsZrSkN8=;
 b=tKzEpYk+p9BEmTWInUrHBV/qTXtw8YrhAhpGAzcth47EPNsj0cJTSgPjLqePTtmRWr
 ZYdL/UqVZFCMreHQiW4jnexSJHZGHOhFFE13/gswzmbFsnqIurFQ1xdF7fam5P8OfGiC
 0BSj/8R8SBIhK0FWrxyTK7dfV8tPJ4YD+nykfjcRp+AzhfDjbu9wDzGg4fLBXPVvuCjn
 vlv511DlMvt9dL9UkIAxGEKvIpwKxspDGEtokbt0dRg7j73fsAeENWihwwpVN1GRAEXD
 rf9yZrRyNemmenSPvrAjYFR9jjMJ6rfGs4PwtdRsIA81XXyqaZIseIlce4g1yfKN/jxO
 815A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yQOKxbWfNbJ6ZYIkx8c2YswZ3peqlz+Y7JAPsZrSkN8=;
 b=QdpI8PfKuAhaDdAEDPG2TTOAjTcxAgnJbh4qd2vGt3BXHy6plGE7PeiEq5ZbXBvtJX
 urJQi3RIPFJ0vfSV6zxGGe8ND7S9RoB1LBBz9qKUZk+L8NYvWmS/J1U2WyZcYw5NPmLP
 xTX49wY3hqwjm25D7wc/2dJ2TJGmmzehY263vfF1U7OOb4ydVc+GFXhh1r/Vfe7JZaty
 GYTK2UrpTTMEHgqhfH/3FQrbpkHc2qKF4Gx3lPcXRbe3Yxaw5zU05XKYphiRsmq5rI7i
 joMIK0+tI39HXv6q1CsycXfaom4OWonadPdCUUerjkwW70CCuPNqgH8bd33aBqKv5X/C
 RcHw==
X-Gm-Message-State: AFqh2krUWmsUqfvMar2hFyEPJZhhe+ioZ5IeF5q47SxR4dvCpS4W7nEq
 mmcw+gt9qvi59BMwmR7PDLQLFKH0vkknQTIu
X-Google-Smtp-Source: AMrXdXv7sSXUuqi7g4FQ51IzSrNbaND14WyTCD2BNvSwJ7Vr3tVkhTZLQrR1RnTHSjjYpY1O6BWmMg==
X-Received: by 2002:a7b:ce87:0:b0:3d9:f37e:2acb with SMTP id
 q7-20020a7bce87000000b003d9f37e2acbmr13911484wmj.20.1673619096788; 
 Fri, 13 Jan 2023 06:11:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/38] target/arm: Fix sve_probe_page
Date: Fri, 13 Jan 2023 14:10:58 +0000
Message-Id: <20230113141126.535646-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Don't dereference CPUTLBEntryFull until we verify that
the page is valid.  Move the other user-only info field
updates after the valid check to match.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1412
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230104190056.305143-1-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_helper.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 1afeadf9c85..521fc9b9697 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5354,15 +5354,10 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
 #ifdef CONFIG_USER_ONLY
     flags = probe_access_flags(env, addr, access_type, mmu_idx, nofault,
                                &info->host, retaddr);
-    memset(&info->attrs, 0, sizeof(info->attrs));
-    /* Require both ANON and MTE; see allocation_tag_mem(). */
-    info->tagged = (flags & PAGE_ANON) && (flags & PAGE_MTE);
 #else
     CPUTLBEntryFull *full;
     flags = probe_access_full(env, addr, access_type, mmu_idx, nofault,
                               &info->host, &full, retaddr);
-    info->attrs = full->attrs;
-    info->tagged = full->pte_attrs == 0xf0;
 #endif
     info->flags = flags;
 
@@ -5371,6 +5366,15 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
         return false;
     }
 
+#ifdef CONFIG_USER_ONLY
+    memset(&info->attrs, 0, sizeof(info->attrs));
+    /* Require both ANON and MTE; see allocation_tag_mem(). */
+    info->tagged = (flags & PAGE_ANON) && (flags & PAGE_MTE);
+#else
+    info->attrs = full->attrs;
+    info->tagged = full->pte_attrs == 0xf0;
+#endif
+
     /* Ensure that info->host[] is relative to addr, not addr + mem_off. */
     info->host -= mem_off;
     return true;
-- 
2.34.1


