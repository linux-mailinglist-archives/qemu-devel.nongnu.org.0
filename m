Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107A2358064
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:16:22 +0200 (CEST)
Received: from localhost ([::1]:48674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURi0-0005YW-Hl
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lURfG-0003z0-MX
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:13:30 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:42985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lURfC-0008Nz-47
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:13:28 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so1077746pjv.1
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 03:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dKPwSkTbAVOtr/o4bF4yXTXX7KuGdgrHUmzYU0eZs/U=;
 b=bB/xANzvL698U0VzO+LulrpQpku29bn/bxAxo6FruQ9/opD/ulJPC9FiNT4Shmifth
 HazcdjQoUR+7TyCBt/467HRQa7W4DTNu/T4MJLU2s36Z/iJlYOdHHyTrc2fXlVveqNrZ
 BdONaVo/du8V8g63qeGEpZyNpC4+e79UuDKBDhKkcWEMFU6c0svqPClg/rDRzw+MlW2B
 i33dGBywxK6RJAQyEDB2tKwu6A2O4p1C8ahvQ2t9CslOAydbWwUkwhQvdAN6anHBi2fP
 N5Ly1oLuB74p1QMd9vbxttXxNronu0ANRoXOaKZGYFYzC5otTv1oV89g2EMCLDzulVqD
 7+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dKPwSkTbAVOtr/o4bF4yXTXX7KuGdgrHUmzYU0eZs/U=;
 b=sAS9izJEq44/q5bdzhf8n6xxnAV0lmbU3ax6WAC+CrHKsD9tttbFoMVCJTUAurciHn
 2IXfPAxxRjULQGsSi17vd2X25+qe0pmwA4cj7wHI9hIwZqaSxn1PFCDGswK2/j+Qa2ga
 0cKXsW0O1CXrurCtyt8LvA/xEihQPbt8D7yegwqL8ZDEggwDFT+ZlFYQbyv2KVSmU4RP
 3UNGRiV70gHezWx5oJKkB3waraw7UEMwerzqi66kUvJ2lnq2a+g8rVe6NqTWu0f5RgHS
 O/q5l9CQjj03LkDKkAIYAm377DaYSA9m7Gf5QdNc+jWGTBTHtNpEJYvzpjOK5VW+Jbly
 7SCQ==
X-Gm-Message-State: AOAM531jd9KK9AJcOfjpHU3aovGODp38UybRAqIIWTgYtMsQYYXbBYxH
 0ocC0MUI9HXhlxmB23tAb4HN
X-Google-Smtp-Source: ABdhPJy8tGHCPVmi3xVLybX8fL8td6WG5SqwABBBkfHP6rfCwDT5oinbk4ujwABqK4GhaQTQslDdXw==
X-Received: by 2002:a17:902:ac95:b029:e9:11:5337 with SMTP id
 h21-20020a170902ac95b02900e900115337mr7079860plr.8.1617876804638; 
 Thu, 08 Apr 2021 03:13:24 -0700 (PDT)
Received: from localhost ([139.177.225.243])
 by smtp.gmail.com with ESMTPSA id p5sm7684774pjf.30.2021.04.08.03.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 03:13:24 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, stefanha@redhat.com, sgarzare@redhat.com,
 raphael.norwitz@nutanix.com, lingshan.zhu@intel.com,
 changpeng.liu@intel.com, jasowang@redhat.com, kwolf@redhat.com,
 mreitz@redhat.com
Subject: [PATCH 1/3] vhost-vdpa: Remove redundant declaration of
 address_space_memory
Date: Thu,  8 Apr 2021 18:12:50 +0800
Message-Id: <20210408101252.552-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408101252.552-1-xieyongji@bytedance.com>
References: <20210408101252.552-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=xieyongji@bytedance.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The symbol address_space_memory are already declared in
include/exec/address-spaces.h. So let's add this header file
and remove the redundant declaration in include/hw/virtio/vhost-vdpa.h.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 hw/virtio/vhost-vdpa.c         | 1 +
 include/hw/virtio/vhost-vdpa.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 01d2101d09..13de4f94f3 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -18,6 +18,7 @@
 #include "hw/virtio/vhost-backend.h"
 #include "hw/virtio/virtio-net.h"
 #include "hw/virtio/vhost-vdpa.h"
+#include "exec/address-spaces.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "trace.h"
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 9b81a409da..eeae6f8c4a 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -21,7 +21,6 @@ typedef struct vhost_vdpa {
     struct vhost_dev *dev;
 } VhostVDPA;
 
-extern AddressSpace address_space_memory;
 extern int vhost_vdpa_get_device_id(struct vhost_dev *dev,
                                    uint32_t *device_id);
 #endif
-- 
2.25.1


