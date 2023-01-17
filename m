Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B887866D532
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 04:58:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHd69-0000Vf-1g; Mon, 16 Jan 2023 22:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHd64-0000Se-9U
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 22:57:18 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHd62-0005eC-Gz
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 22:57:16 -0500
Received: by mail-pl1-x634.google.com with SMTP id r21so170288plg.13
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 19:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aGVt08F4UpzpEZ1GVThy9tOfv3POzTFbKCIbVhJ6UWA=;
 b=ygUbIQ0w0isWjuC5WTNZlJhQD8+WzLJjdUxQCeBOFUaR8PPb2IYWaua/g5cBtIBceu
 cqpmbq5rCW/24Ha0El+wuRvL8991P5FyOSWZ0AhHPZDJ1+RVT/BOc3pGlihrFXRXqKV3
 iNd43rGa2o/hxfWB3XAjnr+1yArYALTomVOmo9nxzmbxqpvoYWbzFnJL/PTmllWLzaZw
 +q4Oi9SqwaJTpArAV7EBj+xdnT00uxIpzv0itSiB3CXa+sVrmDx7RWa7uhIJI4DgGwps
 rIKR1ofwG144nqmLspMS/jbMXbLx/sKWgN8ypAawhPmh6J60WJ/YqfCXIikJSA30WZzO
 VrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aGVt08F4UpzpEZ1GVThy9tOfv3POzTFbKCIbVhJ6UWA=;
 b=LsMkdZbAjeoAZhcIe26S0qVzxxyM4e+lIQBpbj7bXOPm1QQn+FlJS42N2PTpbVZ6aX
 w4IxmsUsG+8YVdGf8QTNMQY6dtYFh/48n8sIqRJeA/6vUkqFoB5/bIIaukHQ1UWeCSNI
 DFWUcOOzedh3Wzl4xbpe5CmYBdCz8LEmk+cYmJ7MYYNdWzpbTBbIhZUdzEmqAZkjhxxg
 jG64ng5gl8jfQFQo463Xs8grx6Y5Mv2JCbH0hk0sbep7FNcQP4KFqsFR2hvhEKRxYlks
 wM9JT2Pd57mzNC6oOyzIujvkhQrsAlYpBZ2gmK3ciDQqnCuFYUZS30B2TAZZ0jw+wfO5
 afMA==
X-Gm-Message-State: AFqh2kpDQwms2cQVlsnZt5mzA5LQTvazeAhR8xDiYuboJMyWpSykvkmJ
 37W0wVy+lbPnFQQdbRYCh3lInfEugJio+5Nt
X-Google-Smtp-Source: AMrXdXuV1Bg511MTWlv+DFfsh1jreqDfBXzQIYlu8DmmGOzMFJRo3V6f/8rubbYTKvin/wXMOmgTHA==
X-Received: by 2002:a17:902:c10d:b0:185:441e:4cfc with SMTP id
 13-20020a170902c10d00b00185441e4cfcmr2202333pli.44.1673927828727; 
 Mon, 16 Jan 2023 19:57:08 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a1709027e8f00b001869079d083sm19991531pla.90.2023.01.16.19.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 19:57:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 3/3] plugins: Iterate on cb_lists in qemu_plugin_user_exit
Date: Mon, 16 Jan 2023 17:57:01 -1000
Message-Id: <20230117035701.168514-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117035701.168514-1-richard.henderson@linaro.org>
References: <20230117035701.168514-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Rather than iterate over all plugins for all events,
iterate over plugins that have registered a given event.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 plugins/core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/plugins/core.c b/plugins/core.c
index 35aca0266d..f22f8edc74 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -509,9 +509,10 @@ void qemu_plugin_user_exit(void)
     /* un-register all callbacks except the final AT_EXIT one */
     for (ev = 0; ev < QEMU_PLUGIN_EV_MAX; ev++) {
         if (ev != QEMU_PLUGIN_EV_ATEXIT) {
-            struct qemu_plugin_ctx *ctx;
-            QTAILQ_FOREACH(ctx, &plugin.ctxs, entry) {
-                plugin_unregister_cb__locked(ctx, ev);
+            struct qemu_plugin_cb *cb, *next;
+
+            QLIST_FOREACH_SAFE_RCU(cb, &plugin.cb_lists[ev], entry, next) {
+                plugin_unregister_cb__locked(cb->ctx, ev);
             }
         }
     }
-- 
2.34.1


