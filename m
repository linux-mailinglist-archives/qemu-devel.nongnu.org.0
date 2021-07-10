Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22B73C352E
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:35:58 +0200 (CEST)
Received: from localhost ([::1]:52920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F1J-0007gN-NI
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exa-0005rL-Bn
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:06 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:39902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExY-0002PM-IY
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:05 -0400
Received: by mail-pl1-x635.google.com with SMTP id h1so6636704plf.6
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cuDFz+AjESRkTBOBfcUaJCGcjz05pqAAlTOVb+wGFjY=;
 b=nbPj/Xvd3873WIvua2AwG2rjUl9nVsruIeixf2yQiGkXjaqwHRP8nwclkB5VrZHdsv
 OjXcaAjZbDZBGfKCE2DhSLLrAijzPoaiULsFCOmczRmtX6ciPXgiLCl7r4PVsEJ/bb8D
 WvjeJgLY4Twafl7M0MTIYaVffevIZNSnT5Emxv8PsgLrsPxehzCNDzsaf9WqtkHl5G2s
 kBpBar2DKkNkAAj/kvki13WIW/XztXuBf9kWz31pyKlTRP4vCNR/AqVmcgUBqrzVwA7l
 jVz48arq7MQhmzuLN65UvmX38aDtT3djhsN8hMMHd34cMfIADDa0jhSBlZkj+ez8pt3n
 NBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cuDFz+AjESRkTBOBfcUaJCGcjz05pqAAlTOVb+wGFjY=;
 b=AUD+eNbf6gI6VP73xsOFkZoBE1aU+XnPRV23JDWx8iX0hvM73zZIacxSW9/vHe0Wrh
 uI2RsoTmII7V4XbImk7o509BmajlsMytwgxUeOX3a5/tHAFjERDGBxM89WacmehDZ89d
 Qhjoim59FHZvbjHRVIYssXg2rGTJ4JIHdVdJte+rWS9u6ctNOyAtg6JIT5lclxye+UDi
 8F6mBFE1H+0SJvbJ1rgDsrxdKWesDcBagnbWDP1vPPZyNsSkZJFrZk9YBUfvmJnIkfQC
 xTwNLS0hOx2dvWADAAHp3SEgEvC9rr11Lm94ixPc62UqOuhfynhJ/yENcIko6tCfRLB4
 FErQ==
X-Gm-Message-State: AOAM532smbJpjwqZ7BZnYxYy4MwHPvIvDDnHNupJXh9h4O0GJiVkoRuN
 GtfqkGqqgWYGu+BlXy4ssBnVS5wH6+0nXQ==
X-Google-Smtp-Source: ABdhPJxkGbDPjBM5hnnODhPywTzVwVr10/i2l8Pu4lovkJTmbm6PdqEkwn1O5kmX/R9viBSUQWttBQ==
X-Received: by 2002:a17:90a:6a43:: with SMTP id
 d3mr4944161pjm.15.1625931123370; 
 Sat, 10 Jul 2021 08:32:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:32:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/41] target/s390x: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:29 -0700
Message-Id: <20210710153143.1320521-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
index 5af68e01c6..767e77ca19 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -696,12 +696,7 @@ static bool use_goto_tb(DisasContext *s, uint64_t dest)
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


