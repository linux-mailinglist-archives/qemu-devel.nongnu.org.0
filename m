Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02F62F8916
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 00:03:26 +0100 (CET)
Received: from localhost ([::1]:55194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Y7p-0000u3-Sf
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 18:03:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsC-0003ZL-8s
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:17 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xs0-0005EL-2P
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:16 -0500
Received: by mail-pl1-x62c.google.com with SMTP id q4so5444449plr.7
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qD60vJJte7K6bQArBY0DduIczHDfCgP2vdEmcn/7+GI=;
 b=YwlZV9wYAP5Rt/Z+Xt+EGN2PHf3ePFuoh8BcVKwFszB6IR8/OymngxewUfx0X8pjZ8
 QQvfRKPY3qi3o3MQH6vejNAIvBoa+ZaC8E7cCs/k77dMnDp7eR6Ww6V2vtMrtxDEowlo
 o+dw87Dx3tAv1XLvTtH/HBSCoDy2z64DrCPajZ7tf2ZPX3OGUE3/lukbVPDX+uQ8uGrq
 f22EJjUFiSRXNyh+O9PraGYGWI5ffY76jdBR1rm8eF5//l+vlAla7h9LLzpXRmKILq1q
 x1KXup0FOSq++Kl0tlOogZNFskRAZ2a0imbe2c+/mRIhAUb4J6wUH2fWsXh3DLZI+G+q
 LTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qD60vJJte7K6bQArBY0DduIczHDfCgP2vdEmcn/7+GI=;
 b=oLKPrd9veOUjtSYSONKNS1X5QF+i6cUUpuXfXItjuyp5lGR6ndEeHardP2JsNv667P
 uQmh7wK+Bf4ovLvRjBiOjHwQn5POVRhOYx/+z9QWS5Vc+tqR6UqvYBKPr20qO9RRsFhz
 fpjCk3j7VkA/3+bnHt4EOi0xdbjawYQGuTf66hVtVW6NYsNcFURHo7kr1mk1/bgMYDC8
 16l5FPPRWF76hdvcpNeuvf2MXIswO8Tu7RhisztO/Jj/raoY+s4prssyPLXyutdWslqA
 W43X2tsIPKLfukZm0o2QiMvwV5rweWapK170dxBt2QbwvZqC0THyQv+Cr3wtoSz+q9dH
 AriQ==
X-Gm-Message-State: AOAM531O9MIuRpQ5Ch3DH4E7llkMBXyWuedkrl+SNa3f5ZRoEFUW1sgR
 dXiHMOPZHk3NGb8WHGKa8ZIKDnpggxabjm+E
X-Google-Smtp-Source: ABdhPJwgdAho/OdF+WELsY1fJDi903omlO+a51vggx3VfMy+YE8DCF3cIlTDCJ8rz1hbfLIvN1Fzeg==
X-Received: by 2002:a17:902:7086:b029:dc:8d:feab with SMTP id
 z6-20020a1709027086b02900dc008dfeabmr14921287plk.22.1610750820068; 
 Fri, 15 Jan 2021 14:47:00 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:46:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/21] linux-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Fri, 15 Jan 2021 12:46:31 -1000
Message-Id: <20210115224645.1196742-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These constants are only ever used with access_ok, and friends.
Rather than translating them to PAGE_* bits, let them equal
the PAGE_* bits to begin.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index a0f670832e..329a6de669 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -486,8 +486,8 @@ extern unsigned long guest_stack_size;
 
 /* user access */
 
-#define VERIFY_READ 0
-#define VERIFY_WRITE 1 /* implies read access */
+#define VERIFY_READ  PAGE_READ
+#define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
 
 static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
@@ -499,9 +499,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
          !guest_addr_valid(addr + size - 1))) {
         return false;
     }
-    return page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ :
-                            (PAGE_READ | PAGE_WRITE)) == 0;
+    return page_check_range((target_ulong)addr, size, type) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access.
-- 
2.25.1


