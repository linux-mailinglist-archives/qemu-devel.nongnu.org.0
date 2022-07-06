Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A062B5685A0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:32:49 +0200 (CEST)
Received: from localhost ([::1]:35950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o92Ku-0007sH-M2
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o91mX-0004Tz-AV
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:57:17 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o91mP-0004Qz-9P
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:57:16 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 o3-20020a17090a744300b001ef8f7f3dddso6803955pjk.3
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 02:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sVKbdw8f+CQLlZAGWV2XYYE+jc2PlvWSVTp4LW5WggU=;
 b=H0cLjfxZBbdTS2AcnHOVI4LWcoEKv6YRMiZgiz47Cq2i9wVSv8BOGrxDf9bOQawtzO
 YYc8AlsUHi5AHx96YnBeRcEb+FFyl3eNAAWo0BTVNQTnEVIGerwiXJnsaCV5ZEvAvI78
 wPILbBm0Xn2T6uLn1golq5sWm5HFN941o+7yBIO6dOGc3wO04wOug+Y5XVEp09T8kk/1
 ic9R8Wz7xSZD2dLPeyPixWOTHudgvHzmHNhUiC+TDNYo5Uz/irGS8iqeVGQlj4ShRF7z
 ETQ3hxcA406Rdc+KV26dMbt+Sf/lthN3EIvqVY07czfWKu9b/HIklvRUjW2/uKEEGNK0
 p+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sVKbdw8f+CQLlZAGWV2XYYE+jc2PlvWSVTp4LW5WggU=;
 b=xKx1q2USHU2mzlb4YndNg04fOaS4JYKCr58lcZkdlzhfuYaOKWpz0xPRTIZNQYqaTc
 MM5JkrqEYvKL9V5lXCBmGmGeu7d2dcItTX1+f7xuPsFtqoTTv7fQ3C2JLlgZE7rmgKlw
 ioco4B+9KDHIzz6+pEgP7Yf0c4WO/RK0yBvNjf2YB6kUxueyuUKepCJNZPOG4U6W1/aI
 k9Y8gcFFPTVra9M7e41amfgMibv6KczaYsz0MyULzEfU2fXbbn7WI0EkO5wkQbuEqdZG
 KRj/Fp7bR+RChe32JL+43Yov3mmMLMY8mnckMO5SWGaMfCfJwQMOLZsw0qs7UDGkdyas
 ODnA==
X-Gm-Message-State: AJIora+SHkRmb8V/2ZSzFqpsnq7noYMjPUpjqVZ4vK7XWeWNLMKeAZht
 LYfK23fBVDwZjWYvR9aBvdY0VauJSQAv8SI=
X-Google-Smtp-Source: AGRyM1u5GjyeTSHrIIHNtmuRMOafHfohpt7ryuJH7bV7z48WZERSe6JxFvTAmGVhu60uCPuYGwrgrw==
X-Received: by 2002:a17:902:f78c:b0:169:b76f:2685 with SMTP id
 q12-20020a170902f78c00b00169b76f2685mr45976712pln.41.1657101428113; 
 Wed, 06 Jul 2022 02:57:08 -0700 (PDT)
Received: from localhost ([139.177.225.253]) by smtp.gmail.com with ESMTPSA id
 v6-20020aa799c6000000b00527f5aee1a4sm14473002pfi.33.2022.07.06.02.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 02:57:07 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com, stefanha@redhat.com, armbru@redhat.com,
 richard.henderson@linaro.org
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] libvduse: Pass positive value to strerror()
Date: Wed,  6 Jul 2022 17:56:24 +0800
Message-Id: <20220706095624.328-4-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706095624.328-1-xieyongji@bytedance.com>
References: <20220706095624.328-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=xieyongji@bytedance.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The value passed to strerror() should be positive.
So let's fix it.

Fixes: Coverity CID 1490226, 1490223
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 subprojects/libvduse/libvduse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index 1e36227388..1a5981445c 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -1257,7 +1257,7 @@ VduseDev *vduse_dev_create_by_name(const char *name, uint16_t num_queues,
     ret = vduse_dev_init(dev, name, num_queues, ops, priv);
     if (ret < 0) {
         fprintf(stderr, "Failed to init vduse device %s: %s\n",
-                name, strerror(ret));
+                name, strerror(-ret));
         free(dev);
         return NULL;
     }
@@ -1331,7 +1331,7 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
     ret = vduse_dev_init(dev, name, num_queues, ops, priv);
     if (ret < 0) {
         fprintf(stderr, "Failed to init vduse device %s: %s\n",
-                name, strerror(ret));
+                name, strerror(-ret));
         goto err;
     }
 
-- 
2.20.1


