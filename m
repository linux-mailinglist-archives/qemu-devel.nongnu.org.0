Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892B3581A46
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:26:03 +0200 (CEST)
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQBu-0000UF-CH
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ80-0003Cz-HR
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:00 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ7y-0002HV-0i
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:21:59 -0400
Received: by mail-wr1-x436.google.com with SMTP id g2so13396966wru.3
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=84wQKQaoKJK6iaVE173auQGOX9Kt1NYCFzy5qnZ8uJk=;
 b=kch7zEt17q5jtDmuSy/r4PrZ0BPhTdm93LGH5/AQ2qqOpD9tBfi4PVRFPzHSxRDC22
 xtCuwNNEACgZbHpfRPtnnpM3Sbfq8vrEfySYWcBH2d4sVRSGN/bqwxql9XA02cZE/aaI
 TS1mLiyz4E4/16JX2qbG8Gkmg8BiYXR4X1C7r7u0PYV0jZZwHz6IlY5EVvob/a7I4oMO
 jsgaw8itkUk5tsUKOq/Oz2BWa+crPqxyzK4lpw8rK5huxgktACtL1yFDIfjQzCottYwr
 0cLFbICEcAQL68TZVb6Tlge0sfH9doQBI5P7huFLAvwISkRBx+E6inh7tradlKTbTJ7R
 lygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=84wQKQaoKJK6iaVE173auQGOX9Kt1NYCFzy5qnZ8uJk=;
 b=tLoOD6fQ5oaoFO9tgmjHgaCZydu8TeS/6UjcvrK4lFMIz7GLvYdeK0o2kberJEfspL
 8UDmKveriKr+t1u+W61lzR19ovXuJpsw6AZNGjrubnOwG5ofrCy6FYHthLpgRIf6OwKn
 D4lWqwJAygu/qMlgbY6WNmUyBwTcOv/gnlMFhajU9D+Ong9PXywB3lhGMmZZEMuEN4Yq
 t4+gNGFxU/N1wPjLhNO/GOBdCz0pAOAcJSxCWMdGWYwdd6Wd0nNI9DOftgcRqFPfWHze
 0D7MChyLAqH6hOfcQfCxDcvkt3fSGLT/KnyXPzWn6UC46hv6msjgfJztjJNZU3W5CkF6
 GHrg==
X-Gm-Message-State: AJIora9joVfhv3S6py34eZQWz4JqrwoyFEsfqMQDaSFnQDQHxE7TpKYV
 YwOPqNbdbFfKcEjchVwIBCclUQ==
X-Google-Smtp-Source: AGRyM1tYFS5T4JB9pCJKP+5yHNnwItuOyc5yLE5g7OzQRU+V2vfQyHwcZMmzNrLDk2+TSk00H7eNNg==
X-Received: by 2002:a05:6000:188b:b0:21d:b277:d492 with SMTP id
 a11-20020a056000188b00b0021db277d492mr12246772wri.311.1658863316526; 
 Tue, 26 Jul 2022 12:21:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a5d5543000000b0021e4bc9edbfsm15095344wrw.112.2022.07.26.12.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:21:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 966EB1FFBB;
 Tue, 26 Jul 2022 20:21:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 03/21] hw/virtio: fix some coding style issues
Date: Tue, 26 Jul 2022 20:21:32 +0100
Message-Id: <20220726192150.2435175-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
---
 hw/virtio/vhost-user.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 75b8df21a4..55fce18480 100644
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


