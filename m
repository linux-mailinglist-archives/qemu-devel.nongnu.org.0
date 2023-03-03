Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1986A956D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:40:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2pU-0001qV-1p; Fri, 03 Mar 2023 05:40:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY2pR-0001q4-Vq
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:39:58 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY2pQ-0007wy-3Q
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:39:57 -0500
Received: by mail-pl1-x631.google.com with SMTP id i10so2217716plr.9
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677839989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oybiXPgSNhTbwAYyTDdPbCgWTqNqgxckr+HdWHzShIw=;
 b=JwN5AT7baeX/ppTBGFiXmTutZ5s8cgKWbf8eR9wLQwbmHquHpd0GrnnYtd2hOFthue
 5lX+Uhw8oMeejb/Nrio3NJSmIeoe0PfKVlAbFdnKJX0l/EBVnBM8hjrWkYJHsSmHd6fD
 t1Sy76mEeMxZl8ciLbUuC6tTAYWMEgFC+U1/s7dbjfRsBJEIKvNd9hUsU9/eWEkYpEAY
 8gXWATftxNOfnmEcFp7e/Rn85fpyU5FuNQGLXzyCuUw9gEoSYHA7RKSLTv60i3vlmTCG
 mPPDZiUMfKZDVOPXw1ADojwzn5YONMWxUdWwyED1C4iqQIcOh+lmfjByom2Ko4O0vnvo
 BhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677839989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oybiXPgSNhTbwAYyTDdPbCgWTqNqgxckr+HdWHzShIw=;
 b=Tku131FC6WlfMcUFn0CkDoZv0UA7Xx3IJY6p0xvS2/wYsJQ+rCJPC0g68DoBSOPrma
 632HZcwDxYdmLyW2wWvOyxQvcgYF+ocR5bvV13/Nos35WpkcoHjMd+S8xIL06tU+ifa+
 JiapiaQv5X+8pFrJgKAxm2TEJMpDWe7pf1tIInEpL8EqYuhLJ9Vgl8MZiw0PX60CNfVk
 zAZPelxZnPesOztEjFv74cUr0ZpyNu5Y+W+8iFEs7LMkcbxqEp5uYED3ZXXIW4QaxZjP
 G/HvfgWKlMo+NWLBElCT0EuUL5x6dVkdAXQelrQs7xs+PYmAxOhG87/7Y/upOOQM9t0V
 aJ8Q==
X-Gm-Message-State: AO0yUKWudTr9P3SorG+lJtf8Dhac9zIEmY5dih387E1DY+GfA7SMXs9p
 XOEDeuKO/BgHNUGBgy/sowUjzVAJPdS5eme3
X-Google-Smtp-Source: AK7set8MHj30gQCcrkkdpyJ+7PDKXZhIHyC7M7C1OY1ABGzGJvg15ml1LkgEo/qlZ4CL3wJECEEb9g==
X-Received: by 2002:a05:6a20:507:b0:cb:867d:1592 with SMTP id
 7-20020a056a20050700b000cb867d1592mr2360743pzp.4.1677839989287; 
 Fri, 03 Mar 2023 02:39:49 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 6-20020aa79106000000b0059085684b54sm1316420pfh.140.2023.03.03.02.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:39:48 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH v6 2/5] rcu: Introduce rcu_read_is_locked()
Date: Fri,  3 Mar 2023 18:39:32 +0800
Message-Id: <20230303103935.370903-3-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230303103935.370903-1-xuchuangxclwt@bytedance.com>
References: <20230303103935.370903-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add rcu_read_is_locked() to detect holding of rcu lock.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 include/qemu/rcu.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index b063c6fde8..719916d9d3 100644
--- a/include/qemu/rcu.h
+++ b/include/qemu/rcu.h
@@ -119,6 +119,13 @@ static inline void rcu_read_unlock(void)
     }
 }
 
+static inline bool rcu_read_is_locked(void)
+{
+    struct rcu_reader_data *p_rcu_reader = get_ptr_rcu_reader();
+
+    return p_rcu_reader->depth > 0;
+}
+
 extern void synchronize_rcu(void);
 
 /*
-- 
2.20.1


