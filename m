Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F21581A9B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:59:01 +0200 (CEST)
Received: from localhost ([::1]:57620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQho-0004NQ-Lz
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ8F-0003No-P4
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:16 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ8E-0002Gz-4p
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:15 -0400
Received: by mail-wr1-x431.google.com with SMTP id m17so21167266wrw.7
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5yuBY8XhniW5U3BckTrWu3/MUge9sIzVNIAB45zhSUM=;
 b=aYHkGrAWWbmJzOEvdL6EsWf5rY3TvU1X5EE6dpqIPsw47NhrxzW/yzy9XPfdW3C8b6
 dP72QJZGdWh1xuBDci+l80i8/QXQCO6JkA7hq16xQqNgyNaB3Cj6W4VipNxIg7FLdFI+
 3jY3kWIrecnk0MPCT2SE/wOliO6lJx77Pgs5Li2E+t+dMIvQ+H2YRxaviWEdBminb3op
 PvQ/GWI6aneYOkszsPNdUJhb8P4L7Rr95fUVt9AEcym/lRKPZa5ysYcaedzEXCWVNMRo
 8Qe9Cisb+P8iVMuCmqnUiBXXGa2D9Ksbtj3HXV9RuqB5yWf25F09SSpHTNKFJBCpM82E
 87gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5yuBY8XhniW5U3BckTrWu3/MUge9sIzVNIAB45zhSUM=;
 b=tefjm0eNX1ke9k+y16cPVzS8IrBan5/k40fJvJnSfkBozqH41O2vQAkh+BHvBmgBlF
 Q4E0FhqX1ER9p/mqZtMl3WpNYclD71eqYE5T4zC5MkNgoEowNgrhrh8QM5EDi5RUSYXo
 WwvsDrNwg/mU2POl6wKAiSnywkJXnXHsAPy0rRC44g0oljsdZc86ipQuyRR/pRF7AJHk
 RqmbbK+pqd+lhWFFD22yT650K1AK3mSnCZ00JXA1/kqTYOUmv45ZouiD+U3yfc3QHnpu
 4u2bfppLj/SrKzodzqgk7IhqozjQnxA2kESecek1uQ2TKy+pFDV5AdlqONftAJVADSws
 AJAg==
X-Gm-Message-State: AJIora+Y04BCQPzjqPlWyCtIDjVVRY3YSFMe8m1hqFkdKYB6Ue4A0IxA
 8rxjVRFcD7dCXPYBz1Q5axzdrcP8RHwbig==
X-Google-Smtp-Source: AGRyM1vi457BNj5NqMsPy3KxJOdZDZtoV3dIMhHkmuSHAhdHWUfPzkSbMRWR3tYBM/ThsA2kKm8bIQ==
X-Received: by 2002:adf:ed8d:0:b0:21e:c7fb:7945 with SMTP id
 c13-20020adfed8d000000b0021ec7fb7945mr158066wro.353.1658863332721; 
 Tue, 26 Jul 2022 12:22:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a5d6142000000b0021d70a871cbsm15306184wrt.32.2022.07.26.12.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:22:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 053CF1FFCC;
 Tue, 26 Jul 2022 20:21:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 20/21] tests/qtest: add a get_features op to vhost-user-test
Date: Tue, 26 Jul 2022 20:21:49 +0100
Message-Id: <20220726192150.2435175-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
index d546721f5d..28b4cf28ec 100644
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
@@ -990,8 +993,21 @@ static void test_multiqueue(void *obj, void *arg, QGuestAllocator *alloc)
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
@@ -1020,6 +1036,7 @@ static struct vhost_user_ops g_vu_net_ops = {
 
     .append_opts = append_vhost_net_opts,
 
+    .get_features = vu_net_get_features,
     .set_features = vu_net_set_features,
     .get_protocol_features = vu_net_get_protocol_features,
 };
-- 
2.30.2


