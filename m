Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7566C5320
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 18:57:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2hY-0000Am-1y; Wed, 22 Mar 2023 13:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3U0EbZAYKCmobQbcaZOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--titusr.bounces.google.com>)
 id 1pf2hV-00009W-EB
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:56:41 -0400
Received: from mail-ua1-x94a.google.com ([2607:f8b0:4864:20::94a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3U0EbZAYKCmobQbcaZOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--titusr.bounces.google.com>)
 id 1pf2hQ-0002GU-FN
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:56:37 -0400
Received: by mail-ua1-x94a.google.com with SMTP id
 c18-20020ab030d2000000b00751d7bbfb13so9506811uam.4
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 10:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679507795;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xgLuRZVtqHDGrFFer+S3EY1A5uZ4UquNrXBrasz7AHI=;
 b=f8AR9nKldyRtL/nSHJK8++JGEBphRh9At6FYSeu/uzGVIPQtKB3PCUd9R35tLjv1IV
 8/QxdI0MHCXgUwBIKjo9aOmJibUJhL8AsSSI1DoiTvhC2DO6lA2FcP42XFs0eAHaDVBN
 i/ZYf7wcnHWMjF6Ze0qon1GdHm7JQJp12Qp6b4+COAI2WN/d4vO6MWhmw6+mgUMzijQ2
 mLVjeFPyEVQcoaJO4FbXt9nh/+ASQR1kc60Jp3aW0frCAqbRQoGNk8CYESskrQwfZ0d3
 bBX2acVQEuBJu17WL0mTXG3NCwMJWoR1qg4DxE4xoZuD91fYsSdmo1AgbaSq+Yy1pxXh
 ecbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679507795;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xgLuRZVtqHDGrFFer+S3EY1A5uZ4UquNrXBrasz7AHI=;
 b=UHqs+mdCq6F72FzDsbT5KO0B9So9ZEWxqozLrmcRgjV4xVyXVrLmVJfhvn3WkyW127
 ZqgYXQ5Bal1QlG/QKbSABd9uq6c/rMRVSGB2KnjdlSOTZcOV17W5XxK2cLngsWYTbDMv
 3AyDtGZflxY4sjjOnUxVmG0uIYQ53TAzB+pyyGmOrzlUFGEwHS4zxRNz3ZCetDyUxufi
 wwrGDjSvJ31US8w0QJN78Jp/r0BMQKDc/SO4U8zSjGjnsILOO8htJML5pNvYnj2IKS2t
 jLq8zGXo52dEykz9mZXcWqwzEywWJpDYSEdY98a4NbH7o1RuJrKbUayG5fiUSPAvoudY
 XcWA==
X-Gm-Message-State: AAQBX9fuYM13IKxfQGm8bIRqK/B63lLN+0MU09hJZ2piBTlk3Mi/Hl/u
 T7BypdHsexqDLZb36aa3c8y721XJoY0=
X-Google-Smtp-Source: AKy350YwenfDHGVc76ZEfiGftk4KeX9JYCqKJ5O6ZUE1US6uXm1VEFMqlgKisJspDChPtVj805mXHapiem0=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6130:312:b0:68b:817b:eec8 with SMTP id
 ay18-20020a056130031200b0068b817beec8mr3924877uab.0.1679507795269; Wed, 22
 Mar 2023 10:56:35 -0700 (PDT)
Date: Wed, 22 Mar 2023 17:55:12 +0000
In-Reply-To: <20230322175513.1550412-1-titusr@google.com>
Mime-Version: 1.0
References: <20230322175513.1550412-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230322175513.1550412-5-titusr@google.com>
Subject: [PATCH 4/5] hw/i2c: pmbus: block uninitialised string reads
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::94a;
 envelope-from=3U0EbZAYKCmobQbcaZOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--titusr.bounces.google.com;
 helo=mail-ua1-x94a.google.com
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
2.40.0.rc1.284.g88254d51c5-goog


