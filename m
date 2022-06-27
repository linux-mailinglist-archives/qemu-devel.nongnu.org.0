Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0CC55B8E5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 11:13:11 +0200 (CEST)
Received: from localhost ([::1]:47816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5knv-0008RM-2d
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 05:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o5kdn-0004Xl-4S
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:02:43 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:39680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o5kdh-0006wr-8c
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:02:41 -0400
Received: by mail-pg1-x533.google.com with SMTP id q140so8521293pgq.6
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lobGhQMyEP9xa06Ky0/LJmVgLT+aF3hayGVBWKrCnw4=;
 b=wjd3IAYDgsB0u6wh/aWTE7t8E+1V3btQ8Y4qRNSQh7h+MqxZQ0tbaY0995qm/Zvswc
 +0Wieqn/xKdF4FpiqKFIQscf5NBRrj21et0SzmyGRdyELWzWFgnzO1g0GGwtkrf7zU9i
 ZVZxCie4nxPjOpiOVWRZ+Pk9uR+Pexz173LlMhl4oiQUms2CM3cLCkA9nKYeE4fkqybK
 Z823jHx66zaSOw6glFg5DBFpKH3RiksglEoWo7MXGI1MjwxCQAF4ETqThAH5z65aYX9d
 392HM2eLptMWaefU1XgUQjFIsEF/b+Oa+Jf6kmrItl/vPTkLqbyGG9sPtMy9hGzCcr+X
 H/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lobGhQMyEP9xa06Ky0/LJmVgLT+aF3hayGVBWKrCnw4=;
 b=cQqLMCdo0EUX8VL17IfB/Z6BzF02VFoscpi3tC+b/LtUXl7tjFQgGH8aTJbAlWVmMI
 qzXgA42+w4/98DsnkhtOa9/C4i1dIj8VkQhiFwgJZ0HcF2HCtRwsT4s0NzOgPIvEVC4N
 rEnu5CY1uAWt1QoTSq7dSbwqbSSM+CF+SvCCQG3NpyObJ8BiWundgby3oJGIVNCExQym
 BqQ52MkHAfVqsIfx807dhTPY65V4r7yu7/999sA7eeB/wcC0BqVg5GJJTSqzm729CMO3
 HWFul7OaNDiM13ug83fZmIU4jPBQ7DrIBR1P1P2jvhpZDZWF28jV7DjptG3y8BX1VcTp
 6VdQ==
X-Gm-Message-State: AJIora/Zr6Q5mTv6ReugkEUDTuUXKH7/2buKup0xXL79YSCQHw8IEx3J
 cUTZGQGvLfWn/vM7umv1ZZ+Y
X-Google-Smtp-Source: AGRyM1ty72mEpqVjg6vP2AZOuRmm2oqeLsBaoI/4WZmNw2awhosn3Vu+Lx8mQRtQlzLzwJczp8Yj1w==
X-Received: by 2002:a65:6e44:0:b0:3db:219e:2250 with SMTP id
 be4-20020a656e44000000b003db219e2250mr11621680pgb.369.1656320554342; 
 Mon, 27 Jun 2022 02:02:34 -0700 (PDT)
Received: from localhost ([139.177.225.225]) by smtp.gmail.com with ESMTPSA id
 a14-20020a1709027d8e00b0016b7ba73a18sm1740654plm.38.2022.06.27.02.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 02:02:33 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	armbru@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/4] libvduse: Pass positive value to strerror()
Date: Mon, 27 Jun 2022 17:02:02 +0800
Message-Id: <20220627090203.87-4-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627090203.87-1-xieyongji@bytedance.com>
References: <20220627090203.87-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=xieyongji@bytedance.com; helo=mail-pg1-x533.google.com
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

The value passed to strerror() should be positive.
So let's fix it.

Fixes: Coverity CID 1490226, 1490223
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 subprojects/libvduse/libvduse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index 1e36227388..1a5981445c 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -1257,7 +1257,7 @@ VduseDev *vduse_dev_create_by_name(const char *name, uint16_t num_queues,
     ret = vduse_dev_init(dev, name, num_queues, ops, priv);
     if (ret < 0) {
         fprintf(stderr, "Failed to init vduse device %s: %s\n",
-                name, strerror(ret));
+                name, strerror(-ret));
         free(dev);
         return NULL;
     }
@@ -1331,7 +1331,7 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
     ret = vduse_dev_init(dev, name, num_queues, ops, priv);
     if (ret < 0) {
         fprintf(stderr, "Failed to init vduse device %s: %s\n",
-                name, strerror(ret));
+                name, strerror(-ret));
         goto err;
     }
 
-- 
2.20.1


