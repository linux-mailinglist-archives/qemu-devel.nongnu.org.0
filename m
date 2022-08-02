Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE30587A6B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:14:01 +0200 (CEST)
Received: from localhost ([::1]:34360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIouW-0001fp-2P
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIohP-00058t-16
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:00:27 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIohN-0006QU-3j
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:00:26 -0400
Received: by mail-wr1-x432.google.com with SMTP id j1so8815749wrw.1
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 03:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=vdim50/4QWM59eJmuqXHbqgfci2iCoUWAD1+T4jr3FI=;
 b=gYsUZoviNG20Yp8iVFGsqKJVFG6KjmJvAV+gErCRnbn1Ez/vfOtE3QE9U/Xxk1GEXh
 LAOZleDGvgqDorkSk2czqVF4B/l51jO+wLKlExweGpWZaQjSSVeoRcH/Sj/3yJVrmw2q
 dkRSpSqUeIRYNinFUVxqm68TnLNUiyx1YvtwpWYbJzamsRTQNaECO4EUr0sCLJVUJAPz
 e8DdBkhdZAfJXzRGGA67lpSJCdD1SkyyliMzfRUYfiyDK3UvxnZFaXTw4hyroTnkqLgH
 ZTaG3SUe32YHNhuMpwehFtqbdLMJvDe9YI5Kripl0e7y4p8g5HSYT4CvQvd0PjN0+EL9
 SwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=vdim50/4QWM59eJmuqXHbqgfci2iCoUWAD1+T4jr3FI=;
 b=JvbjA7i7VwRmsr5RDHesFCo1Ze+44xCHL1f8gg5Zj346Itm91XFVJdPqsUjVTO6eUL
 dFi6BctDQQ+/yD2MX5BgzBOhC1aFv1kLcE7MJFQK17Qc9ueEd81YjYg7Lc2U5wfre9/H
 zjvyM8mdyRZjvQ4FnehLPDuvUeye3EEqXDy6ZmS4r5NUk8G7yVGhnJaPAdCpTJZZSDRa
 +mXq+Hm4poSSzfb2nIHtuEkXLy9795zndm+UpF2x9Usmtcy1Z7HOsBgZItTjw5Dq1rCb
 v41vXpdVK68J0Gfn+g581RweYBD4rWAfDju1svQd+7ZWRhNaomNBmXs0nukp+YADRTWR
 cUDA==
X-Gm-Message-State: ACgBeo2zLYL51Q+os1zR6WDwbicTYyz8NxEYcUtTzZxjIu9CQ47kWL0j
 DyyEEgTYIkDAEo5HY6yUSjpVlA==
X-Google-Smtp-Source: AA6agR62jZMuvAIY132dMhgJgCD0UrMQMBStBbR3Z6iOfNXqgTL6PY79d+cNTHJL7TLbSJn9V/0MFQ==
X-Received: by 2002:adf:fb83:0:b0:21d:649a:72d9 with SMTP id
 a3-20020adffb83000000b0021d649a72d9mr12115328wrr.688.1659434423706; 
 Tue, 02 Aug 2022 03:00:23 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a05600c19cd00b003a2e1883a27sm28459213wmq.18.2022.08.02.03.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 03:00:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7C4BC1FFCD;
 Tue,  2 Aug 2022 10:50:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 21/22] tests/qtest: add a get_features op to vhost-user-test
Date: Tue,  2 Aug 2022 10:50:09 +0100
Message-Id: <20220802095010.3330793-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

As we expand this test for more virtio devices we will need to support
different feature sets. Add a mandatory op field to fetch the list of
features needed for the test itself.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/vhost-user-test.c | 37 +++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 61980bfc6a..fe46e28cf2 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -171,10 +171,11 @@ struct vhost_user_ops {
             const char *chr_opts);
 
     /* VHOST-USER commands. */
+    uint64_t (*get_features)(TestServer *s);
     void (*set_features)(TestServer *s, CharBackend *chr,
-            VhostUserMsg *msg);
+                         VhostUserMsg *msg);
     void (*get_protocol_features)(TestServer *s,
-            CharBackend *chr, VhostUserMsg *msg);
+                                  CharBackend *chr, VhostUserMsg *msg);
 };
 
 static const char *init_hugepagefs(void);
@@ -338,20 +339,22 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
 
     switch (msg.request) {
     case VHOST_USER_GET_FEATURES:
+        /* Mandatory for tests to define get_features */
+        g_assert(s->vu_ops->get_features);
+
         /* send back features to qemu */
         msg.flags |= VHOST_USER_REPLY_MASK;
         msg.size = sizeof(m.payload.u64);
-        msg.payload.u64 = 0x1ULL << VHOST_F_LOG_ALL |
-            0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
-        if (s->queues > 1) {
-            msg.payload.u64 |= 0x1ULL << VIRTIO_NET_F_MQ;
-        }
+
         if (s->test_flags >= TEST_FLAGS_BAD) {
             msg.payload.u64 = 0;
             s->test_flags = TEST_FLAGS_END;
+        } else {
+            msg.payload.u64 = s->vu_ops->get_features(s);
         }
-        p = (uint8_t *) &msg;
-        qemu_chr_fe_write_all(chr, p, VHOST_USER_HDR_SIZE + msg.size);
+
+        qemu_chr_fe_write_all(chr, (uint8_t *) &msg,
+                              VHOST_USER_HDR_SIZE + msg.size);
         break;
 
     case VHOST_USER_SET_FEATURES:
@@ -993,8 +996,21 @@ static void test_multiqueue(void *obj, void *arg, QGuestAllocator *alloc)
     wait_for_rings_started(s, s->queues * 2);
 }
 
+
+static uint64_t vu_net_get_features(TestServer *s)
+{
+    uint64_t features = 0x1ULL << VHOST_F_LOG_ALL |
+        0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
+
+    if (s->queues > 1) {
+        features |= 0x1ULL << VIRTIO_NET_F_MQ;
+    }
+
+    return features;
+}
+
 static void vu_net_set_features(TestServer *s, CharBackend *chr,
-        VhostUserMsg *msg)
+                                VhostUserMsg *msg)
 {
     g_assert(msg->payload.u64 & (0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES));
     if (s->test_flags == TEST_FLAGS_DISCONNECT) {
@@ -1023,6 +1039,7 @@ static struct vhost_user_ops g_vu_net_ops = {
 
     .append_opts = append_vhost_net_opts,
 
+    .get_features = vu_net_get_features,
     .set_features = vu_net_set_features,
     .get_protocol_features = vu_net_get_protocol_features,
 };
-- 
2.30.2


