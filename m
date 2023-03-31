Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EBD6D13DF
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 02:09:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi2KU-0007gd-Sm; Thu, 30 Mar 2023 20:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hiQmZAYKCo8C1CDBAz77z4x.v759x5D-wxEx4676z6D.7Az@flex--titusr.bounces.google.com>)
 id 1pi2K8-0007CB-Rh
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 20:08:57 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hiQmZAYKCo8C1CDBAz77z4x.v759x5D-wxEx4676z6D.7Az@flex--titusr.bounces.google.com>)
 id 1pi2K5-0005pa-Sj
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 20:08:56 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5446a91c40cso204677637b3.18
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 17:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680221318;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=JVa+ysZi3CwbR24epjsK5up3WFbQnFpyGHTqEQOjKmA=;
 b=jS6OogHby3xJfSIk1dYJ483RUeggfOoDzT/xsIkiAGmJCb+bqVyfqLjss+Ba8PV8v/
 DnEMW8Nk6AYbeKd5E6Va7kGdJy1LE4n+mE5IrECeQDlP98g9NXDLXKQFUbwnQeWD3l58
 SfNDhOceC1xuNB3iPnYn/B7VEJ8uIGb5FKMVHUqJRImoYiSMsZpLF2os1l+8KVgUc6NK
 5Bhv7/cGty5/QwW64ozf8+rQJ2ZEXnHq4vEc9iOf4u2a4CEEHFBKX3KqC9Rrok5bCPlw
 25dn7vU8nlc4YfqOXVOmYAmCSEPyd+BMj0RSAo8sjwLbKlXGNlaEXXy8DIKJBvIQnO30
 0vHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680221318;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JVa+ysZi3CwbR24epjsK5up3WFbQnFpyGHTqEQOjKmA=;
 b=b288v+7Jv+QhEJqCYly+X8bie/AdnigzKCXsrcJ2gHNJiWDiDkqqC1h5MnC8YIHqWy
 dYHhxfQWDGFvpLtjconu+mI9aT7tBENg0o0KMEVXoj0L3nTXggvfsp9LlNMSCBMwH/W5
 rjBUZ/SyGpEKCqJnjQ3SbSIwWl7fAO0osRKqxpP+TYpEuB+8oG/LqXxX5DCUfmX9R7u7
 1tQmV0DTPTbe5UfMOPpIH9YgoYx+c1vIL0cocEAlbVOpfb9n6/Qns1GZ3H1TKB4Voujv
 zTOqZ4P3RLttexhJlXms+ZghTeROyD+LFa1aK0gW70absqrcVJVaGw5da+730l6M0DaV
 FubA==
X-Gm-Message-State: AAQBX9cj3XtpBjSCOqaXMv6JeJ36ysEmTlyxftTWIN5qtfkv1NiHB+gV
 ysV3YsicYxY6WYCtbPJjrgAL/DoknEk=
X-Google-Smtp-Source: AKy350b/Y/yWo1RERWHOkBQYfXgNf10mBUf9UM6AggmtpKb+gtFiIQFXinUMn2l0lsay9Ss0Neu0n7WCCME=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a25:2749:0:b0:b4a:e062:3576 with SMTP id
 n70-20020a252749000000b00b4ae0623576mr13087476ybn.13.1680221318127; Thu, 30
 Mar 2023 17:08:38 -0700 (PDT)
Date: Fri, 31 Mar 2023 00:07:53 +0000
In-Reply-To: <20230331000756.1712787-1-titusr@google.com>
Mime-Version: 1.0
References: <20230331000756.1712787-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.423.gd6c402a77b-goog
Message-ID: <20230331000756.1712787-5-titusr@google.com>
Subject: [PATCH 4/7] hw/i2c: pmbus: block uninitialised string reads
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3hiQmZAYKCo8C1CDBAz77z4x.v759x5D-wxEx4676z6D.7Az@flex--titusr.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

Devices models calling pmbus_send_string can't be relied upon to
send a non-zero pointer. This logs an error and doesn't segfault.

Reviewed-by: Patrick Venture <venture@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index bb42e410b4..18e629eaac 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -94,6 +94,13 @@ void pmbus_send64(PMBusDevice *pmdev, uint64_t data)
 
 void pmbus_send_string(PMBusDevice *pmdev, const char *data)
 {
+    if (!data) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: %s: uninitialised read from 0x%02x\n",
+                      __func__, DEVICE(pmdev)->canonical_path, pmdev->code);
+        return;
+    }
+
     size_t len = strlen(data);
     g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
     pmdev->out_buf[len + pmdev->out_buf_len] = len;
-- 
2.40.0.423.gd6c402a77b-goog


