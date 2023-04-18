Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BC76E57EF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 05:56:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pocQq-00087c-7V; Mon, 17 Apr 2023 23:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pocQo-00087U-KR
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 23:55:02 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pocQm-0005lH-2g
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 23:55:02 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1a686260adcso17792865ad.0
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 20:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681790098; x=1684382098;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=73TAvFemhExGcbTj6jdsDQa4LqtYapZ73Q5pdWYKImY=;
 b=GzP7o51x3TeEXp0aKESZb5f7kq8gRrGhnRGYSguU/u/T+804rQcb8S4cW0UmxbPLcz
 RkWAbyXeCKPERmuhME5lj9vPVQ6Ui5nDqy+Y4UemyzQjFN0iJRnfzEQAkycRm27Lu/Ny
 BocZivTAxsyPqSrTFCsZbcCe2lOg2hNBiNIJYbl9AWzV/f2R5l+hFTcOy3qS16CMbRWi
 FfW3C7kw0op2AF/fUaUzJlFtnlMYsvkMzMnAOwxodFnJktjzI2j61jAwe9MHL2erLH+H
 UgKVDaZ9LIPygFFJXf2i1Qvxjow21vH7gaSCo+5WZoIxL+onw5t2Rgd7kCU7sPzstfDg
 dNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681790098; x=1684382098;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=73TAvFemhExGcbTj6jdsDQa4LqtYapZ73Q5pdWYKImY=;
 b=EjUGxtR3XZjduUkRioljNNfBVwpVosg6DCSmt1NS/XcJLKYS9DDpJoZsUpQijQS0vN
 7jQBQLpzL+ku5JDWoWE97d3hW9t2IYXPTP48z5SKYv0NDbnGRHVTLID15eSeJGg0kq3D
 eCgGpUQynZl7vzr6jWHACeaR9W+mRe+ldr07Zz5jrCMGzM4KO8dOCnj1KLQ456+Lb6yL
 g/FtSViB6AghrvxZ28kyQ4R8Y4145qYxzp+uHjLjTvKLWjEiem24DK/kps+fDrWB+gMr
 kf5bIjn0HqpzQF29iJRZID/lS1ah3a/UNAjjwMCYwIHGw28qgtXgOI8bX/ObZ0g+c1lX
 uniw==
X-Gm-Message-State: AAQBX9d5wPtpkB7o2ZC9t/7fIPq1OReBgAbS8SGsQ/pIDzJ5pbxs/3uy
 5M1YedLmTC6Gtgg1ITZ2NHUTf7efacP/7+t8+sg=
X-Google-Smtp-Source: AKy350aY1h6HUnKOW1uJ30vVnlEJs1TiTSuryB/q+QEAueCc35N2JO6U5UObRCG1f5vx+gFf+Xjp6g==
X-Received: by 2002:a17:903:410c:b0:1a6:7f14:707e with SMTP id
 r12-20020a170903410c00b001a67f14707emr710344pld.9.1681790098033; 
 Mon, 17 Apr 2023 20:54:58 -0700 (PDT)
Received: from localhost ([122.172.85.8]) by smtp.gmail.com with ESMTPSA id
 h14-20020a170902f7ce00b00192aa53a7d5sm6482844plw.8.2023.04.17.20.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 20:54:57 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org
Subject: [PATCH V2] virtio: i2c: Check notifier helpers for
 VIRTIO_CONFIG_IRQ_IDX
Date: Tue, 18 Apr 2023 09:24:54 +0530
Message-Id: <d53ec8bc002001eafac597f6bd9a8812df989257.1681790067.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x631.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since the driver doesn't support interrupts, we must return early when
index is set to VIRTIO_CONFIG_IRQ_IDX.

Fixes: 544f0278afca ("virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX")
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2: Simplify and fix comments.

 hw/virtio/vhost-user-i2c.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index 60eaf0d95be0..4eef3f063376 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -128,6 +128,14 @@ static void vu_i2c_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
 {
     VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
 
+    /*
+     * We don't support interrupts, return early if index is set to
+     * VIRTIO_CONFIG_IRQ_IDX.
+     */
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
+
     vhost_virtqueue_mask(&i2c->vhost_dev, vdev, idx, mask);
 }
 
@@ -135,6 +143,14 @@ static bool vu_i2c_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
 
+    /*
+     * We don't support interrupts, return early if index is set to
+     * VIRTIO_CONFIG_IRQ_IDX.
+     */
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
+
     return vhost_virtqueue_pending(&i2c->vhost_dev, idx);
 }
 
-- 
2.31.1.272.g89b43f80a514


