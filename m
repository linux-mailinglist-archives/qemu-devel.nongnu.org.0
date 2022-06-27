Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B3055B8E2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 11:09:18 +0200 (CEST)
Received: from localhost ([::1]:41608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kk7-0004G5-OG
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 05:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o5kdd-0004SG-Gq
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:02:33 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o5kdb-0006wM-Qh
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:02:32 -0400
Received: by mail-pl1-x631.google.com with SMTP id c4so7589501plc.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 02:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=auTM1k9MJH1G+/UMXAU7lBSEiGjik9z9z+Wt3cqMDh8=;
 b=qEebbFYVVAb8Sm615bsm3hHmDCIv+f8pDZ91V66y4Gm4gMim4zTG0Z0SzXjgZq/GjB
 zTdNbQhOV3K0lqy1BYlmLtRa9/ZfnqV9XzsCqdLYLdz+//SpnL1EARzAJNDUhYXRPqS9
 Ev0fWwjt3pd+09cJ56Odywl8JtZf8BsJpyBUIuSjpNhp7amnbVyVJzDEOvMc5qCEnhgX
 /8BKVtRXFzJ2e9haKv4e1fi2xzhgujzOv6VA9xkl+jtrFxc1uKITiPu6GQNtPOO62rG6
 ayh/CDweb6Pqpgvc8Xl5UbAGWjmhYTCTTm7DxfYGXJDtPkMR5xN8phPjIU2NIr+oyZVq
 We+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=auTM1k9MJH1G+/UMXAU7lBSEiGjik9z9z+Wt3cqMDh8=;
 b=UiBtyW2/w0kv/tJiOwGwj7A2zpPKioVReEOh6UXhec/soLIgdTvLoKnFPKtvugkj6X
 /5D/MbFzQCcMqjp8V1T09YieCkeyqnuQ6DBKT6w/YbLViHZh637HFJwb5hXZUqr0VFrw
 vxIbbj0Hg6zY5ofMz0WU9HRf8iCl4Yo7gl/rqcfF9sKJUffp+meURVcTTzPLMAUqjy3G
 OaLdDpP2Egav0ulfHC2+8en4huYHq9l1SRJ7FUtiQtjUfo+PyNqDgrA5gUcTDyju6Mt8
 TjWzRulFwfWuRaKNTZv241FTkhO6ZisOywsgEmTc4/tpQ4T6E2IpVuNKO23B/cq/JGIO
 2aEg==
X-Gm-Message-State: AJIora9CHDrSmOQIaVwPF1MvYQI8CpW4XwtFJS1ZR9y8Mm13R1tZlW7T
 +MPbfHl7WTIsLn6uL+KHwlFE
X-Google-Smtp-Source: AGRyM1vvfrobmP9Et4vbVKZ1ZQ9ZGlXseXXOHpwHS/3clYBGPhQzgw1C0s+52E3eSYv7zqJR9mgyag==
X-Received: by 2002:a17:90a:3e07:b0:1ed:492d:2792 with SMTP id
 j7-20020a17090a3e0700b001ed492d2792mr11663297pjc.57.1656320550330; 
 Mon, 27 Jun 2022 02:02:30 -0700 (PDT)
Received: from localhost ([139.177.225.225]) by smtp.gmail.com with ESMTPSA id
 x9-20020a056a00188900b0050dc762818csm6760511pfh.102.2022.06.27.02.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 02:02:29 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	armbru@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/4] libvduse: Replace strcpy() with strncpy()
Date: Mon, 27 Jun 2022 17:02:01 +0800
Message-Id: <20220627090203.87-3-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627090203.87-1-xieyongji@bytedance.com>
References: <20220627090203.87-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=xieyongji@bytedance.com; helo=mail-pl1-x631.google.com
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

Coverity reported a string overflow issue since we copied
"name" to "dev_config->name" without checking the length.
This should be a false positive since we already checked
the length of "name" in vduse_name_is_invalid(). But anyway,
let's replace strcpy() with strncpy() to fix the coverity
complaint.

Fixes: Coverity CID 1490224
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 subprojects/libvduse/libvduse.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index 6374933881..1e36227388 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -1309,7 +1309,8 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
         goto err_dev;
     }
 
-    strcpy(dev_config->name, name);
+    strncpy(dev_config->name, name, VDUSE_NAME_MAX);
+    dev_config->name[VDUSE_NAME_MAX - 1] = '\0';
     dev_config->device_id = device_id;
     dev_config->vendor_id = vendor_id;
     dev_config->features = features;
-- 
2.20.1


