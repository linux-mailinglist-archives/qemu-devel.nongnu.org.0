Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A5F55B8E3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 11:09:29 +0200 (CEST)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kkK-0004dC-5S
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 05:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o5kdn-0004XX-2T
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:02:43 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:40817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o5kdj-0006xC-TK
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:02:42 -0400
Received: by mail-pf1-x42c.google.com with SMTP id c205so8377321pfc.7
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 02:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iI/8y2WKhVlI7+Tk5R1G7JW9URpKy+i2P2xkIFUTLj0=;
 b=etDgIugDx/Gfp2lViqplaJWfyyBxKfwUsA6nneR0d5r9cg3X4O7Wzf3+Gy8KqgR1Nf
 7RbBypmhTHHCT1zERbS2Yzrdmjwh43Y8wz76krHgphq308ZgqJFsnYUf/+IA2/GVHobT
 4fti0ebdDFd6S7CVkjay3HU4IrEDAJ6UVluNR0yTNxjXcF5WaFAEyVJ68TixHq9aRWPN
 0vnV5fC2gU0mGCxLUcbjfvTQxGh3LvwORdWXxLN82NNx+OEurUaTqK8loPB7VCRUFX+d
 zbx6esxD4k6htImsL1sVm9VC2bLroiVswkk+d7jM7GrFqMC6gq+jGNMTcttAfRMIuelw
 L58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iI/8y2WKhVlI7+Tk5R1G7JW9URpKy+i2P2xkIFUTLj0=;
 b=s2Q/VzcHgKclRaPRB2xY7ghFSSb6ciPtv96CXgDISLSjWSYz5wUWbNJ9xV3SpRig/r
 L81zYmVqFYM4P61AZ157H4/m6gSXDYp1ASe6pRMamI+2esDOPQHQ2HwLifJ+5hBqf4TI
 sND38fE/nIWytstV5qrNDr5sld83s8bUn790yl/0g+O6uo+SHP4mBzxQINcBQOawMIvJ
 /IPI6Q6jag6qy4nbwQMEbTeGfvoWvV8eDuII1sN+UgOkro9Y7C+O/xt/r92Skw+ZNW9C
 HJeiXoY/7HtIH9eIhsnRn5LKDhdPFqPMGk4xuPC6Xuq+F+59yZMwJk8d58L2+C1kTP3W
 F+HA==
X-Gm-Message-State: AJIora/fcBkvmMLcSeX5peH0xK/emrzBiEBBgY9wdKb0YXzuoHx7X6aw
 X4mRJgdUmuCxNDdANG+AHiHd
X-Google-Smtp-Source: AGRyM1vzq9XNv7pgNHrFODYL4R2d+h6cjq3ARcy9y+LK5cbynpGjjtXF/u2sNOAgr6VnbVQtfT6JUg==
X-Received: by 2002:a63:6aca:0:b0:408:8af6:a885 with SMTP id
 f193-20020a636aca000000b004088af6a885mr11814291pgc.477.1656320558163; 
 Mon, 27 Jun 2022 02:02:38 -0700 (PDT)
Received: from localhost ([139.177.225.225]) by smtp.gmail.com with ESMTPSA id
 125-20020a630483000000b0040d2717473fsm6765403pge.38.2022.06.27.02.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 02:02:37 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	armbru@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/4] libvduse: Check the return value of some ioctls
Date: Mon, 27 Jun 2022 17:02:03 +0800
Message-Id: <20220627090203.87-5-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627090203.87-1-xieyongji@bytedance.com>
References: <20220627090203.87-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Coverity pointed out (CID 1490222, 1490227) that we called
ioctl somewhere without checking the return value. This
patch fixes these issues.

Fixes: Coverity CID 1490222, 1490227
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 subprojects/libvduse/libvduse.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index 1a5981445c..bf7302c60a 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -947,7 +947,10 @@ static void vduse_queue_disable(VduseVirtq *vq)
 
     eventfd.index = vq->index;
     eventfd.fd = VDUSE_EVENTFD_DEASSIGN;
-    ioctl(dev->fd, VDUSE_VQ_SETUP_KICKFD, &eventfd);
+    if (ioctl(dev->fd, VDUSE_VQ_SETUP_KICKFD, &eventfd)) {
+        fprintf(stderr, "Failed to disable eventfd for vq[%d]: %s\n",
+                vq->index, strerror(errno));
+    }
     close(vq->fd);
 
     assert(vq->inuse == 0);
@@ -1337,7 +1340,10 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
 
     return dev;
 err:
-    ioctl(ctrl_fd, VDUSE_DESTROY_DEV, name);
+    if (ioctl(ctrl_fd, VDUSE_DESTROY_DEV, name)) {
+        fprintf(stderr, "Failed to destroy vduse device %s: %s\n",
+                name, strerror(errno));
+    }
 err_dev:
     close(ctrl_fd);
 err_ctrl:
-- 
2.20.1


