Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D69C3C17C2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:09:32 +0200 (CEST)
Received: from localhost ([::1]:33944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XWl-000546-5F
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5M-0001wv-Kq
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:12 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5E-0008EE-GH
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:12 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 d9-20020a17090ae289b0290172f971883bso5672010pjz.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=feiSsJm9roNlYIb4rXwJMU5pf7Fj/o5TmasdZr7ISdw=;
 b=soNWdZg8zgokGLmET06BEJMuRbxxamsBMsmhibLm8xAKDzKqnHxOpRrhhDgDZhNdpz
 u8cuTNoqWSLog0/s6T6GFpJMcehNUU9I1hnbr2TRPqYEphOu0t5wCR9cSbXafpIKV75h
 HqXxJLcJ5kxdOFzb5q0Mj3f3Rk0c1PYvOnJjG1MhY0v1FW7dWdWDKNJnyl7Dw5gBnr7H
 6mnJ/53Mdjni0xtgQv0SEXWZwEOpDeBmJrbB8OSZu5lc3ZPD1KglRM+2ew/p+Xpq83LH
 qNng9fpgdh1ONP5D8e3TurgXl1wXvC8sxU7RmWN3vltm9lgaoq6fYZNkMNeBx6bw4LWJ
 yucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=feiSsJm9roNlYIb4rXwJMU5pf7Fj/o5TmasdZr7ISdw=;
 b=tJcOpkuWOJURrHXIsj4BMRj2mFO0Sun5uqnSITj1yqHuZEHjxAOV9bRSem7xoCBPLo
 S8H2KIc2DYw+1ccB5fSKIKjiA8As4HOzSUnKx8p1bA6ycF+BJHUCDdFW2qk6W+BgBleR
 KbSVSTqZ7XYPNjmQUHnTX5ekG0neWetquhKBRZJ/pAxjax3Wkk7Bpz+4GHa2+hOI2Dy4
 TIVW00SpE51PSPq2zlcHJYsHqlUPSoYCc9v2QBx31KU9re32INvTFDbFg30TM/qvJffv
 T5HsKrM8QOAxZmcARSiRDemENeWlTUqDS1hoW6igUOkGYPEwISX3nQDP0FVl0Xgtwxfg
 Cv9w==
X-Gm-Message-State: AOAM533eiNT1lulptgQYuq45ERZ1dzmFTv8EKqS+/Oi1F90E4nRXIaRe
 NnDFMrPGZEw7U5DMazkxDO7bUOAIruDiJg==
X-Google-Smtp-Source: ABdhPJzLPvT926nuzc1bbpLZnkhtH+TxcKFTMZ2dcp4nbOrJl2zVX10FwmORZT21NCcSnWzlxb4gWQ==
X-Received: by 2002:a17:90a:b704:: with SMTP id
 l4mr26805949pjr.55.1625762463348; 
 Thu, 08 Jul 2021 09:41:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:41:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/28] target/s390x: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:44 -0700
Message-Id: <20210708164050.711967-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/translate.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 03dab9f350..117a890ecd 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -697,12 +697,7 @@ static bool use_goto_tb(DisasContext *s, uint64_t dest)
     if (unlikely(use_exit_tb(s))) {
         return false;
     }
-#ifndef CONFIG_USER_ONLY
-    return (dest & TARGET_PAGE_MASK) == (s->base.tb->pc & TARGET_PAGE_MASK) ||
-           (dest & TARGET_PAGE_MASK) == (s->base.pc_next & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
+    return translator_use_goto_tb(&s->base, dest);
 }
 
 static void account_noninline_branch(DisasContext *s, int cc_op)
-- 
2.25.1


