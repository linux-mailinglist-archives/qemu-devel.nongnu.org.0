Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2A755B8DB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 11:05:27 +0200 (CEST)
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kgO-0007rA-Ac
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 05:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o5kdc-0004Py-QP
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:02:33 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o5kdX-0006vf-PR
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:02:29 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 b12-20020a17090a6acc00b001ec2b181c98so11718591pjm.4
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 02:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WB4U1grSmPbKhsyhD3ueGmnY+ms5NTRAoGVFPsY0gog=;
 b=vEeoB6/JiqyjiepGsJOHPrtLIau01QKECJl4XuZ6wLi1G61gJ9GX1SEfD6pakBhXGv
 BQXYAyca0HrOzj0TAU0E1Mau86q7i3Dc0Ew2NMscpZHdN8erhfh8aPB6Tei36gsV8HLH
 rdCe03A4+tcsHLoqyr53bwmcXYni32ZyVdjT00eDRH9VXy3LzV0W0lywmnCfr0oukE/J
 X4auIcx2PMPwr5O1P2UgaeW32pSekPK+FfD9Ltm0IdwOCvyA2/VxY3hErHjJ9tXdV5+I
 pTf9nr0c/kAAIIBWIYdZ8Yhvh57DhXwF21tnBo5KiDkdYMNJvj0b63OGj4oPDTjXTBWI
 4qjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WB4U1grSmPbKhsyhD3ueGmnY+ms5NTRAoGVFPsY0gog=;
 b=zGeaxl1oUpiMR31eBAViyw5u470wCVoSpalpgBLc4WO/YpGl3uVAx4Oy9F47r+TUfC
 WFKvTPjrG55InTltzBWRBaxUHpdQP9rJETIRJpa5jvwpxJmK/QiEbH88WWa7+a9aSUmn
 eatwBd63xQjize6DYzjGX0+QktVKD4mCdy5+grVMKV9P9XT3a8Tos4wH9JYPs09jekM1
 hO7Xbb4HCiLlfC/VJdgNW72ZhcwP1Ud3s1z5a/9bO/B4M1M7nKBOARuC1O6Rs1uWxjKz
 VlNkUZmVWhmxW9yn2YSybvUu46Sgamauwrs5YxILpZLaQypyAP1hn+XOQBktCcKSORKQ
 WKwg==
X-Gm-Message-State: AJIora8RWazY5m1iD9PNZ3f/LJ2aB/LWHQh+JMVQkmeDE3l0akJbs1aa
 RtfUf0e6unzXGsqhEGiA1ulh
X-Google-Smtp-Source: AGRyM1tFYuRtzfUSkg+mx4Z0hcjIhdghgHdn/BzvZj4Ur3Gfhgs1qOo+19GWZObXTSCASDNWQ/HJFA==
X-Received: by 2002:a17:902:9046:b0:168:b8ee:8164 with SMTP id
 w6-20020a170902904600b00168b8ee8164mr13544571plz.159.1656320546270; 
 Mon, 27 Jun 2022 02:02:26 -0700 (PDT)
Received: from localhost ([139.177.225.225]) by smtp.gmail.com with ESMTPSA id
 y9-20020a056a001c8900b005254535a2cfsm6615644pfw.136.2022.06.27.02.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 02:02:25 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	armbru@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/4] libvduse: Fix the incorrect function name
Date: Mon, 27 Jun 2022 17:02:00 +0800
Message-Id: <20220627090203.87-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627090203.87-1-xieyongji@bytedance.com>
References: <20220627090203.87-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=xieyongji@bytedance.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In vduse_name_is_valid(), we actually check whether
the name is invalid or not. So let's change the
function name to vduse_name_is_invalid() to match
the behavior.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 subprojects/libvduse/libvduse.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index 9a2bcec282..6374933881 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -1193,7 +1193,7 @@ static int vduse_dev_init(VduseDev *dev, const char *name,
     return 0;
 }
 
-static inline bool vduse_name_is_valid(const char *name)
+static inline bool vduse_name_is_invalid(const char *name)
 {
     return strlen(name) >= VDUSE_NAME_MAX || strstr(name, "..");
 }
@@ -1242,7 +1242,7 @@ VduseDev *vduse_dev_create_by_name(const char *name, uint16_t num_queues,
     VduseDev *dev;
     int ret;
 
-    if (!name || vduse_name_is_valid(name) || !ops ||
+    if (!name || vduse_name_is_invalid(name) || !ops ||
         !ops->enable_queue || !ops->disable_queue) {
         fprintf(stderr, "Invalid parameter for vduse\n");
         return NULL;
@@ -1276,7 +1276,7 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
     struct vduse_dev_config *dev_config;
     size_t size = offsetof(struct vduse_dev_config, config);
 
-    if (!name || vduse_name_is_valid(name) ||
+    if (!name || vduse_name_is_invalid(name) ||
         !has_feature(features,  VIRTIO_F_VERSION_1) || !config ||
         !config_size || !ops || !ops->enable_queue || !ops->disable_queue) {
         fprintf(stderr, "Invalid parameter for vduse\n");
-- 
2.20.1


