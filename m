Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D2D6616C5
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 17:40:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEYi0-00010H-SF; Sun, 08 Jan 2023 11:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYhz-0000y5-Bp
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:39:43 -0500
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYhx-0002fI-UI
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:39:43 -0500
Received: by mail-qt1-x82f.google.com with SMTP id h21so6022182qta.12
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 08:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BaGbKhSnqhHFWAmCitnff4clI2gayRmQn8Im1y8M/aY=;
 b=srq5Bv8vefDYwJ+7NtFDMUaRAT6JfQgUwG9ZSOPpWsFQV6wqqWLkSIQQ29SM9ohsc9
 iGlz3kas8F02PRhJ61w0VOKEElNImG5UW9GEgRC3qXkgulk5zcKe5aaOj7TZq7vpwJfx
 TTqk9ny+QmqJxIAjiPGF7RZ3OhWLRCb4XuCUv0N4F4wRfKsPUy2YGJHTbDYNMt9HMfxN
 E3pXM+/ukrV0IepAFRbqVAelIFGqnaiQfF7M7gKwQz1Em8mLPVY9iQlpfTIxxbc6xzmw
 pYuwEMr3d/W3WMn8wtZeEo+rhe8NyM9CZeG/yKUpp5vbPvptmbPxkGjb6J/+WGyeTgQ3
 Mwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BaGbKhSnqhHFWAmCitnff4clI2gayRmQn8Im1y8M/aY=;
 b=A4BAw6rJ5Mfvn5qN9+arIt7+31GnEyJbYu6BNygpn3HrnnZ3BPZ+F7GVkQpnkasT+O
 1cqUvhrzBmyzxswZN2dld8TYVXTjMhmObA9cdKFfjGhBZMdQY5XremgHnhs9sOX3gAB8
 PIcDvXpWNdSSdCv28NpaXXleLX62UXMFJU/HJx6B1YCCCDcnAUtQWYrx/H8rud/2hhP4
 YOrbwIzDqMuBm4nzbFH+rYr+aw9V95noVhn5IdGMt3jGqU8fyJSmtmDEamWg+qbpYghA
 /Vl5zBi8FP4vLRn0HguDZlr6GBWaI0zt34GPe6utr83F+KSlJbupiKwfiqhuz2UtpBM5
 2u+g==
X-Gm-Message-State: AFqh2koWhbNf0jyRX0VPYdn1IZScYkpsWmUlCrOfjwsfh85NVX2MiOdd
 mW5RoYMhst0f8N9gvnKUUlyUvpeRU4+JCn1bawVv6Q==
X-Google-Smtp-Source: AMrXdXsvk9lwNfLH6NwiVVHdumvaQrF9GljS/HaIs+e2cWGdZDLjmwYk4N9BvhVZL3PiWsOxnGgCPA==
X-Received: by 2002:a05:622a:a18:b0:3a5:8b:7719 with SMTP id
 bv24-20020a05622a0a1800b003a5008b7719mr84161270qtb.65.1673195980684; 
 Sun, 08 Jan 2023 08:39:40 -0800 (PST)
Received: from localhost ([185.156.46.146]) by smtp.gmail.com with ESMTPSA id
 d7-20020ac80607000000b003a7ec97c882sm3406995qth.6.2023.01.08.08.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:39:40 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH 2/4] util/qht: add missing atomic_set(hashes[i])
Date: Sun,  8 Jan 2023 11:39:03 -0500
Message-Id: <20230108163905.59601-3-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108163905.59601-1-cota@braap.org>
References: <20230108163905.59601-1-cota@braap.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::82f;
 envelope-from=cota@braap.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

We forgot to add this one in "a890643958 util/qht: atomically set b->hashes".

Detected with tsan.

Signed-off-by: Emilio Cota <cota@braap.org>
---
 util/qht.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qht.c b/util/qht.c
index 065fc501f4..15866299e6 100644
--- a/util/qht.c
+++ b/util/qht.c
@@ -688,7 +688,7 @@ static inline void qht_bucket_remove_entry(struct qht_bucket *orig, int pos)
     int i;
 
     if (qht_entry_is_last(orig, pos)) {
-        orig->hashes[pos] = 0;
+        qatomic_set(&orig->hashes[pos], 0);
         qatomic_set(&orig->pointers[pos], NULL);
         return;
     }
-- 
2.34.1


