Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FED7587A5E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:11:20 +0200 (CEST)
Received: from localhost ([::1]:57822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIorv-0006qK-7S
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXj-0001KP-Ne
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:28 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXi-0002Mq-4X
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:27 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m13so13216605wrq.6
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Go4zP69KIEX2yBSg0W79f2jSqF47viC9E/7rhCMdQ80=;
 b=Zu/eBhMqxZmJv23bC+/x/W6pmKMp+bSN2ox3VR+NVXDAX62dfO8/JqWPJeEbtP7UfG
 nlIwMkpYzWJ4wsyyXoE/WbO7fzFDAQdxuGYKx0xDMqBdUML5vZv5o3tPiE7DQJWLe1TI
 mBW77EsggRNHDn4s2lXwgtwb10/FJ+h7M9gIEJT6QejyM6xO7JTfv1CKR9sSaoKRB9aQ
 1hJLn/YO7pHr3MtegncqpxV0vE6nYu0FwZ5qQ1lcO2Ip5YIDpE62PuB1BYKP7MpwA+co
 +YlbFmBoZtkOkWh0YQWBL/VUuhEZH1rDo2ojUZ5NAvY5GuuZ8q5OWhi0hxOnfWAU8MXS
 YaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Go4zP69KIEX2yBSg0W79f2jSqF47viC9E/7rhCMdQ80=;
 b=vTvaafHnHEZ4cypw+9Q506DJmoT8e0USYllzUaypz/J8tKWy726T9xRBpT+9U5Fwh0
 HdKttgT6qY8j4joBN2yF0qUu9cZ27yXIvjIErAMhp3frJVhBhQuAowT63cnaupO9JBUV
 CuLH7e6ImXkYRwi009zBx+PRaI2MLeRckSK7d+oIoEq3s1eQBVeujNQFaAWsejhKIKwE
 GDJiJfrspN2IIay0bRQPXPiNPHlASg8lcwWTbRCAcAtpTVvZWEB/Z+Btvit8WfYxRrxa
 HHZhpABbv+MHW1vkdCqejetqYvhO3296pqh+jDSkApGAg0PsthVbWzjoWmmbAWBJE5gn
 clFw==
X-Gm-Message-State: ACgBeo0DaDITEhS7t1ubgj+IcMOlUaOpEPcTtv8JPAnzBlusTnTArkfB
 bfVKA05kErks0NrUlTq5z9otzA==
X-Google-Smtp-Source: AA6agR4odGMXGLJuRRI1qdqr7W1pdhJJYJi/TTGgiRCx8K3DE1vl9jV4jcVzNmFIs7Fy8SBz0mBvWg==
X-Received: by 2002:a05:6000:a09:b0:220:638f:3b4a with SMTP id
 co9-20020a0560000a0900b00220638f3b4amr5113877wrb.626.1659433825485; 
 Tue, 02 Aug 2022 02:50:25 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a1c5412000000b003a4c6e67f01sm9533635wmb.6.2022.08.02.02.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 02:50:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 387561FFC9;
 Tue,  2 Aug 2022 10:50:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v4 17/22] tests/qtest: catch unhandled vhost-user messages
Date: Tue,  2 Aug 2022 10:50:05 +0100
Message-Id: <20220802095010.3330793-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

We don't need to action every message but lets document the ones we
are expecting to consume so future tests don't get confused about
unhandled bits.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v1
  - drop g_test_fail() when we get unexpected result, that just hangs
v4
  - include ring addresses in set_vring_addr output
---
 tests/qtest/vhost-user-test.c | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 968113d591..f2c19839e0 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -358,12 +358,44 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         }
         break;
 
+    case VHOST_USER_SET_OWNER:
+        /*
+         * We don't need to do anything here, the remote is just
+         * letting us know it is in charge. Just log it.
+         */
+        qos_printf("set_owner: start of session\n");
+        break;
+
     case VHOST_USER_GET_PROTOCOL_FEATURES:
         if (s->vu_ops->get_protocol_features) {
             s->vu_ops->get_protocol_features(s, chr, &msg);
         }
         break;
 
+    case VHOST_USER_SET_PROTOCOL_FEATURES:
+        /*
+         * We did set VHOST_USER_F_PROTOCOL_FEATURES so its valid for
+         * the remote end to send this. There is no handshake reply so
+         * just log the details for debugging.
+         */
+        qos_printf("set_protocol_features: 0x%"PRIx64 "\n", msg.payload.u64);
+        break;
+
+        /*
+         * A real vhost-user backend would actually set the size and
+         * address of the vrings but we can simply report them.
+         */
+    case VHOST_USER_SET_VRING_NUM:
+        qos_printf("set_vring_num: %d/%d\n",
+                   msg.payload.state.index, msg.payload.state.num);
+        break;
+    case VHOST_USER_SET_VRING_ADDR:
+        qos_printf("set_vring_addr: 0x%"PRIx64"/0x%"PRIx64"/0x%"PRIx64"\n",
+                   msg.payload.addr.avail_user_addr,
+                   msg.payload.addr.desc_user_addr,
+                   msg.payload.addr.used_user_addr);
+        break;
+
     case VHOST_USER_GET_VRING_BASE:
         /* send back vring base to qemu */
         msg.flags |= VHOST_USER_REPLY_MASK;
@@ -428,7 +460,18 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         qemu_chr_fe_write_all(chr, p, VHOST_USER_HDR_SIZE + msg.size);
         break;
 
+    case VHOST_USER_SET_VRING_ENABLE:
+        /*
+         * Another case we ignore as we don't need to respond. With a
+         * fully functioning vhost-user we would enable/disable the
+         * vring monitoring.
+         */
+        qos_printf("set_vring(%d)=%s\n", msg.payload.state.index,
+                   msg.payload.state.num ? "enabled" : "disabled");
+        break;
+
     default:
+        qos_printf("vhost-user: un-handled message: %d\n", msg.request);
         break;
     }
 
-- 
2.30.2


