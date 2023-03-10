Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9096B3C4C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:33:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paa2F-0007g7-K9; Fri, 10 Mar 2023 05:31:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa28-0007Wi-0J
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:32 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa24-0004GZ-7f
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:31 -0500
Received: by mail-wr1-x430.google.com with SMTP id r18so4593164wrx.1
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 02:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678444286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7fq5EVdfHfpp6lGs6caGYbPvDM6mvk0QNUVhbY/HNCs=;
 b=nIueiIYy0eFa3Bwl+UTfhahlGp3gelLYfdfGzYCq4oS9Pw7ud3DEUCiGY1WMBw32Lt
 byvLQNMymw4JsKB6N8kZmQwXpBouA09WLKVK3Wg4ThZVyCXcAOlScYgYTqguhnSiOTCU
 oQXOdjkNPfPf6Q+LzJKe2aHzs1+yovMQu5CTxoYjZii69lYJD8lVavZ90jbazUSP1hH7
 jWKcYgjMFKZS6ls7XqcTqvEfjDhUKaeii8tLGKKeArtqaB2z62b/bcOZG4wZ6O3MC7KF
 o/I5J/gjlzBo2jNyz9uhiZKEDwnMB7ANFKGddHg9brQUpSQ3mySJ35oRvtVIhnYvz/CC
 tGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678444286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7fq5EVdfHfpp6lGs6caGYbPvDM6mvk0QNUVhbY/HNCs=;
 b=gTGzKZZsHu6nIf/NG2h1ypMKrQD/KI8wFrxL2FQWJozIbC6RgdygSWI7IXRK5huXbx
 ENSmSM9v+05w8c61WDZvixOcRv4LX4JIqrJTDZj2ADyhLMztpk47CJ402AdeIyUeJVO7
 8fo9FJ6MAwwhV/rrWSh2UR2X2sRrQLLfccmDvQG67nPLdZ/js19OPRG36GygYXcCNfJd
 RUC97BSHlvR6fTE5pUrSPTy2mofwBIsyi7/6vWrd/MLqkAQYMMfJ5SmJhCRlB9mZ9xTX
 0RMUD9kApbAW//hrSllqqZYV3uXROVgPzPw1ov3uyNwHj1yLgbJrRmQXOXCjbsqbg4R6
 SJbg==
X-Gm-Message-State: AO0yUKWwBBS77Lyusbw9WJfiqfE0hicXxQmo2zgK+toO6kbrukbYAcNj
 7W60LPsmNHMBePsU+KRmn4BNsg==
X-Google-Smtp-Source: AK7set+tdVMMNg+UFUW84XFbOiY8VPhEGqwiLCtLtFLRBUdONv/322GRFJtZyBr93/NLFyhHahbcpQ==
X-Received: by 2002:a5d:5042:0:b0:2c7:1a86:aecd with SMTP id
 h2-20020a5d5042000000b002c71a86aecdmr17574249wrt.2.1678444286658; 
 Fri, 10 Mar 2023 02:31:26 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d4ecb000000b002c55efa9cbesm1779916wrv.39.2023.03.10.02.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:31:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 859DA1FFC0;
 Fri, 10 Mar 2023 10:31:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 10/11] include/exec: fix kerneldoc definition
Date: Fri, 10 Mar 2023 10:31:22 +0000
Message-Id: <20230310103123.2118519-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310103123.2118519-1-alex.bennee@linaro.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

The kerneldoc processor complains about the mismatched variable name.
Fix it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/memory.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 6fa0b071f0..15ade918ba 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1738,7 +1738,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
  *
  * @notifier: the notifier to be notified
  */
-void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n);
+void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *notifier);
 
 
 /**
-- 
2.39.2


