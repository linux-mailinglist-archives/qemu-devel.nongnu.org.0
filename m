Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0616587A1E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:54:31 +0200 (CEST)
Received: from localhost ([::1]:55874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIobe-0002sF-Q5
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXk-0001L2-TX
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:29 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXf-0002Qp-Oq
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:28 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z16so17094524wrh.12
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=KjbLNdi3E1apNFwTGial5s5eMkKbrprSc8sGCh0PAC4=;
 b=QEtzfjEHObPZngplL0jW5i0a/FKoRYbv4BUQCKx/Yp6C8AdlEQuUx9doP39tV9rekZ
 0hy3lrFUAMHm1+kPZbo9nw5K6OZLtZCdbCyJukO6aQYH61ce5Dpx5JPYEM5ZjYL4oloo
 vn2ZBmmGgOMRFxpk1+PZbYar3n69i3vM3jfoamyk2BB2s0eM3oZfkRhrzqaG2KhDY7Tr
 slSInS07bC0q4r/E0WdfpvYJpCQINFopX1l5zg3ZT44KTfu2HkLboXknJd/SFs0rj1Fa
 qq57Jz1HJP/a+kKsb7yKKwhqkgwD8KzGrih94o1hfPxfRXsLrqp/apKyK+OynJwT7LPJ
 0YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=KjbLNdi3E1apNFwTGial5s5eMkKbrprSc8sGCh0PAC4=;
 b=UHb4OtJ/dwumY6ycu0eVXwSyZfoA3NvxhFVNhLOyC2mnvxznml+HZWLjhPXvGVZsEE
 ns4GeRle8NydUVl36ULzKMqxV8ZZNOJOSrYr8WHqDs7GJeeQAHrKp5uiIuI9qFJVQcpO
 Cw0jtqMSmgYtaJCQxHAyHSGCG9RAO6czyUj9TApxGkMC+s+Ns1F9Si0wYhUNYNUHuEgK
 5BbZlldyBmL2YeKrwCfsw+6BW4vzL3711oOvHntCGNG+Ot5j/DM9wlejffsMz9nR7lkg
 qHLAvQY/Alsm7x3fg6OjdNW12LTUXk0Y6LDzBjxdCqv4juUWoUQvUXgTZ/a0Nnb8+YvC
 Cg7Q==
X-Gm-Message-State: ACgBeo2NjEXgYD+Tf7F2S/mkz612N/upRHEH3/SyiGlYd/U0MKDmcvnw
 1Zhjf9lnyvZRVd4mzPJ+PpbPrg==
X-Google-Smtp-Source: AA6agR5S5YEePJrk/nHViSK1vfVaByvPjgkZr6qgd7TuHxedjbm6aeKQeyxKBxkKxoqFSU3Z6Kf7lw==
X-Received: by 2002:a05:6000:2aa:b0:21d:ac4b:95af with SMTP id
 l10-20020a05600002aa00b0021dac4b95afmr12207575wry.479.1659433822480; 
 Tue, 02 Aug 2022 02:50:22 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a5d6044000000b002205df9ce16sm8307395wrt.97.2022.08.02.02.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 02:50:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E18C1FFBF;
 Tue,  2 Aug 2022 10:50:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH  v4 07/22] hw/virtio: fix some coding style issues
Date: Tue,  2 Aug 2022 10:49:55 +0100
Message-Id: <20220802095010.3330793-8-alex.bennee@linaro.org>
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-user.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index c0b50deaf2..b7c13e7e16 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -200,7 +200,7 @@ typedef struct {
     VhostUserRequest request;
 
 #define VHOST_USER_VERSION_MASK     (0x3)
-#define VHOST_USER_REPLY_MASK       (0x1<<2)
+#define VHOST_USER_REPLY_MASK       (0x1 << 2)
 #define VHOST_USER_NEED_REPLY_MASK  (0x1 << 3)
     uint32_t flags;
     uint32_t size; /* the following payload size */
@@ -208,7 +208,7 @@ typedef struct {
 
 typedef union {
 #define VHOST_USER_VRING_IDX_MASK   (0xff)
-#define VHOST_USER_VRING_NOFD_MASK  (0x1<<8)
+#define VHOST_USER_VRING_NOFD_MASK  (0x1 << 8)
         uint64_t u64;
         struct vhost_vring_state state;
         struct vhost_vring_addr addr;
@@ -248,7 +248,8 @@ struct vhost_user {
     size_t             region_rb_len;
     /* RAMBlock associated with a given region */
     RAMBlock         **region_rb;
-    /* The offset from the start of the RAMBlock to the start of the
+    /*
+     * The offset from the start of the RAMBlock to the start of the
      * vhost region.
      */
     ram_addr_t        *region_rb_offset;
-- 
2.30.2


