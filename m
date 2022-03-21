Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF7D4E2C79
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:41:09 +0100 (CET)
Received: from localhost ([::1]:47958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWK9c-0005fN-3T
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:41:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJze-0005ET-QI
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:30:51 -0400
Received: from [2a00:1450:4864:20::62d] (port=40655
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzd-0004v2-AF
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:30:50 -0400
Received: by mail-ej1-x62d.google.com with SMTP id p15so30602122ejc.7
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fv7Hk1/HDLttl5dKx17BpMvs2hVpQkkoar5VTIKNwUg=;
 b=K5wwY7tn7bVAQ9KfGxGo0c8UeN4eku2snUfsU590OZe78ASs8JYIjfRDfcd0iQcwi8
 3dfKQA9tjVB2dz824e7drl9oQuNNTSgfellWkNgAG2KnKfHzuzr+Sr3nG7jwDjFBOKKz
 nviBDLxoCgwEfSP+OK3mz//vdx4P/XdrxN2n77sqT5WuxtZO9O3KCj0+WSZoTVVpOtYC
 5+y0Z/jhgw80wkAjCuCPi2Sld22mkZAvammPYnD3bAc/ad987DXtkIOGqNzzJa6odnNY
 ac9u/NChAxbO07VNelZwPcVsl0enzynp3xnMOPM/9Os1dUpxHOjr1xvN5YDhzSPkefdT
 f6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fv7Hk1/HDLttl5dKx17BpMvs2hVpQkkoar5VTIKNwUg=;
 b=qX/xSE6A/IwwBYsR0E2hYtoOL5USjDtnLKCRVFJm5d9xY4UlvBOiRvlHbLiQH9Oise
 pwxK9lMUyf7kNwx0oVC/1/dpy2lzLrw60D9X3D1FatYLlT6v6fQrq9y989uicg1YWa+a
 WY/NZKX/EXc5aqwt3mFe8omDfP64q7J/Zn8Pg0u5wMmEWQNdS09xufitf3lbte3EqUV0
 dCPhIBQgNdBNV7ZMsBoRDk8710xXRFhhNyjNCAamlDe/vowf4DAHk5J+hLadZdojqDJo
 8tWCf0SJAIaYeodudPNDbiAaPM7cEHlJImv7JoKl7kbkjHwmRE9BmPUrqcZyY49uEPS/
 /y/w==
X-Gm-Message-State: AOAM533YOLTtAzvcrjJ/aHsv5a+afn3+iYObJpRhGfv0xlADqzRtrnn2
 YIUPNM0jbm0CGwp73RB/Z/Q7Og==
X-Google-Smtp-Source: ABdhPJyyRuR0pMPPNlNxONiGz/N3o/1+fU9iI2jx4I85nz46roiP2tGNTNmU6+gXEfUucmJw0GZZZQ==
X-Received: by 2002:a17:907:b590:b0:6cf:48a4:9a4c with SMTP id
 qx16-20020a170907b59000b006cf48a49a4cmr20968594ejc.6.1647876644767; 
 Mon, 21 Mar 2022 08:30:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 ky5-20020a170907778500b006d1b2dd8d4csm7110747ejc.99.2022.03.21.08.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 08:30:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE4B01FFBB;
 Mon, 21 Mar 2022 15:30:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/13] hw/virtio: add vhost_user_[read|write] trace points
Date: Mon, 21 Mar 2022 15:30:27 +0000
Message-Id: <20220321153037.3622127-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220321153037.3622127-1-alex.bennee@linaro.org>
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are useful when trying to debug the initial vhost-user
negotiation, especially when it hard to get logging from the low level
library on the other side.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - fixed arguments
---
 hw/virtio/vhost-user.c | 4 ++++
 hw/virtio/trace-events | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 6abbc9da32..b27b8c56e2 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -489,6 +489,8 @@ static int vhost_user_write(struct vhost_dev *dev, VhostUserMsg *msg,
         return ret < 0 ? -saved_errno : -EIO;
     }
 
+    trace_vhost_user_write(msg->hdr.request, msg->hdr.flags);
+
     return 0;
 }
 
@@ -542,6 +544,8 @@ static int vhost_user_set_log_base(struct vhost_dev *dev, uint64_t base,
         }
     }
 
+    trace_vhost_user_read(msg.hdr.request, msg.hdr.flags);
+
     return 0;
 }
 
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 46851a7cd1..fd213e2a27 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -21,6 +21,8 @@ vhost_user_set_mem_table_withfd(int index, const char *name, uint64_t memory_siz
 vhost_user_postcopy_waker(const char *rb, uint64_t rb_offset) "%s + 0x%"PRIx64
 vhost_user_postcopy_waker_found(uint64_t client_addr) "0x%"PRIx64
 vhost_user_postcopy_waker_nomatch(const char *rb, uint64_t rb_offset) "%s + 0x%"PRIx64
+vhost_user_read(uint32_t req, uint32_t flags) "req:%d flags:0x%"PRIx32""
+vhost_user_write(uint32_t req, uint32_t flags) "req:%d flags:0x%"PRIx32""
 
 # vhost-vdpa.c
 vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
-- 
2.30.2


