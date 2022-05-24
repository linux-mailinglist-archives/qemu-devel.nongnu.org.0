Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52D4532F1A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:39:40 +0200 (CEST)
Received: from localhost ([::1]:32802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntXZM-0002C1-1p
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWn2-00086o-Lz
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:49:45 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:47039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWn1-0006bw-14
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:49:44 -0400
Received: by mail-ej1-x62d.google.com with SMTP id rs12so24471380ejb.13
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5yuBY8XhniW5U3BckTrWu3/MUge9sIzVNIAB45zhSUM=;
 b=Y6HqfDQHFttIjqC81mmE82QINLR8upwEZNbs5ioxVJBvMlel5J73AR8dM+FfN4cPqm
 /xiU0W+60mFkLU26ADGqp4fq4y/uY6fJK82+ATViGmwrCkmC07QzubmJ2I7+5e9z/tN6
 ++2c9/VmPb7olA6TGkpfTIncAC2l1RQnrSP28HVtgzOZb1DpaB2KdhJe7sNIX7+wJSG9
 5FRT7VNcrAfF9NqvDmgxsGrokpwcwBeD7DOn4ZStgVuav+PJmtqO0h3TWckPq05Aupud
 vfSKnsuCGH9nJGcZQIkYiDyFfie6jIAbHQfDpWF4o8AGYyfGa4FBcrqGruVzGig4IabN
 dzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5yuBY8XhniW5U3BckTrWu3/MUge9sIzVNIAB45zhSUM=;
 b=B1a6POS90F4PPAXUUhZITaMr3wUmSMc8WLWACWGRF0/yiYPGNryHSWFKIm0rZKgaMa
 R48+EKiCjatdQwCosPab7c7hJshv03Vi43fQenr3dVHMapACxsvL3LJp9LZwPMgA907X
 GnEO04q4rXhsFZxo+ow+jbr07wde+1sM6TIuHYQHlAfd+Ot3O86WI+eehrfaHnDCC8c9
 7aTUByi8YXqGt4OGNf8DMHP+FVfRTU5wU30iANKin5MoVZ7Y/DCWpnAPA335jdwKFl11
 hQZ8UIsiN4TzNnGXTBSbaiigpQelXu2DjHurytwcKrzQyKRcpzoO2nLMToeuGTAxeaB/
 EEfg==
X-Gm-Message-State: AOAM532+0WVt8xYbfxO/eArYbs2tyKKwDhW9NLYdeoMUnklOKqD+jzpt
 T5Gf5EaAN0C5CheajjAvMYowjQ==
X-Google-Smtp-Source: ABdhPJx0rLGO5JKToKDZGb3vrDzgx1tMy/u1XwO4jU1JTBBEZGcx/oLtsMo1ghMGZ1J3W9t/W8Y+Vw==
X-Received: by 2002:a17:907:6093:b0:6fe:a585:143c with SMTP id
 ht19-20020a170907609300b006fea585143cmr19705845ejc.236.1653407381562; 
 Tue, 24 May 2022 08:49:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a1709063ac900b006fedcb78854sm2525982ejd.164.2022.05.24.08.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:49:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 99E3A1FFC6;
 Tue, 24 May 2022 16:40:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 14/15] tests/qtest: add a get_features op to vhost-user-test
Date: Tue, 24 May 2022 16:40:55 +0100
Message-Id: <20220524154056.2896913-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220524154056.2896913-1-alex.bennee@linaro.org>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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


