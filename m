Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC454F6704
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 19:36:10 +0200 (CEST)
Received: from localhost ([::1]:56768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc9Zh-0004Ah-Hd
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 13:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nc9Xm-0002wl-Cg
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 13:34:10 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nc9Xk-0002P2-JT
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 13:34:10 -0400
Received: by mail-ej1-x634.google.com with SMTP id i27so5727545ejd.9
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 10:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zJhJE0L1jlhUd2sHuMKxqOvmmtQD0eXyLIqAEEV6JQ4=;
 b=TXn5Y0AESTrepH955fOd8bd2N4wlfRVidu4imVaUyHvy/sh3Y25UdbQtwOdPSZFlZ8
 yyw5QMigkDXiMM18Uc1+lqZWmbjZHrF7AOxpyJ4bxJ+Un0hHh9rmbCiyyEVnMsOXV8MG
 YgLvvL5Q9KnfFh6eR4wbxojQHFYOXKNuy8sD4r50jntFO1jQCwn1/Y6FQKdM1DO+cGWJ
 83pTjRuy2vKlWFBsWBCP5GrrvWZh4pc/jF4bwWSIxFK0yaUaLGuLLyLTJiXosO6vVUS2
 kuvVyvH+wJLg9dz6ahz+ZzWkAr9xjxxZKYhCBnryTUPk+1WiIDjgrD/Uv5dKQSwx/f0c
 vfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zJhJE0L1jlhUd2sHuMKxqOvmmtQD0eXyLIqAEEV6JQ4=;
 b=DcXQPVCazP9WcmhEwqc89b4tDjFpqRLZnnBqNsTGTuekQ2PGjT0/Gv3SWEn8Q4+zao
 PzCKp6ro1O4ti7Ki33n2LuRQlsTzAQIJArBJIHxFMa9qWmjOdCxJknOnfVWdLNqJIvkP
 ++q0IOjZ7iVVuMuRs9SOucM/ud7eOu6Wghf9KurDDXdjbLGAB9E+IjztXDlSUWkRgUu1
 kmKrfgUPK/sZ+hHtE3KOZJ7d6oxsFNUVSCvxSIPWQnDgQh/7vXL7RNl7OphUMBdfOIOp
 Ffp+TEPuQxlf+WKMkr9fUQi+pSEYOe+ShkUex3O+B20aJKRt9LuJjrw6uppkTA3XqMgL
 og2w==
X-Gm-Message-State: AOAM533+1Efia6yfNmPuZqjiPIxbHZkN+4cfNMt6gpJKcXpb+zLYHJyo
 aaR5MANkpc5lJV1Ur6j2r57UmA==
X-Google-Smtp-Source: ABdhPJzwo4PLmw6we3SF2Hm2gGaUfpg4MyrLIgqltRX13GoG1YBv1Rdf4Xg+0/nHBCYkWF3G/VPs2g==
X-Received: by 2002:a17:907:6ea2:b0:6e0:4ef5:1a2c with SMTP id
 sh34-20020a1709076ea200b006e04ef51a2cmr9309231ejc.350.1649266446506; 
 Wed, 06 Apr 2022 10:34:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a056402439100b0041938757232sm8198513edc.17.2022.04.06.10.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 10:34:05 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7CF671FFB7;
 Wed,  6 Apr 2022 18:34:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/qtest: properly initialise the vring used idx
Date: Wed,  6 Apr 2022 18:33:56 +0100
Message-Id: <20220406173356.1891500-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Eric Auger <eric.auger@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric noticed while attempting to enable the vhost-user-blk-test for
Aarch64 that that things didn't work unless he put in a dummy
guest_malloc() at the start of the test. Without it
qvirtio_wait_used_elem() would assert when it reads a junk value for
idx resulting in:

  qvirtqueue_get_buf: idx:2401 last_idx:0
  qvirtqueue_get_buf: 0x7ffcb6d3fe74, (nil)
  qvirtio_wait_used_elem: 3000000/0
  ERROR:../../tests/qtest/libqos/virtio.c:226:qvirtio_wait_used_elem: assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
  Bail out! ERROR:../../tests/qtest/libqos/virtio.c:226:qvirtio_wait_used_elem: assertion failed (got_desc_idx == desc_idx): (50331648 == 0)

What was actually happening is the guest_malloc() effectively pushed
the allocation of the vring into the next page which just happened to
have clear memory. After much tedious tracing of the code I could see
that qvring_init() does attempt initialise a bunch of the vring
structures but skips the vring->used.idx value. It is probably not
wise to assume guest memory is zeroed anyway. Once the ring is
properly initialised the hack is no longer needed to get things
working.

Thanks-to: John Snow <jsnow@redhat.com> for helping debug
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/libqos/virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/libqos/virtio.c b/tests/qtest/libqos/virtio.c
index 6fe7bf9555..fba9186659 100644
--- a/tests/qtest/libqos/virtio.c
+++ b/tests/qtest/libqos/virtio.c
@@ -260,6 +260,8 @@ void qvring_init(QTestState *qts, const QGuestAllocator *alloc, QVirtQueue *vq,
 
     /* vq->used->flags */
     qvirtio_writew(vq->vdev, qts, vq->used, 0);
+    /* vq->used->idx */
+    qvirtio_writew(vq->vdev, qts, vq->used + 2, 0);
     /* vq->used->avail_event */
     qvirtio_writew(vq->vdev, qts, vq->used + 2 +
                    sizeof(struct vring_used_elem) * vq->size, 0);
-- 
2.30.2


