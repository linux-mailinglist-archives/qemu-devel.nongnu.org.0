Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C234851988D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 09:47:35 +0200 (CEST)
Received: from localhost ([::1]:59544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm9jH-0005TD-4H
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 03:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nm9cs-0002au-Lh
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:40:48 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:43693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nm9co-0006xW-1F
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:40:43 -0400
Received: by mail-pg1-x534.google.com with SMTP id q76so521415pgq.10
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 00:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FI0rEWO2Hrb8q+RXCZbtt8y5SbloA1chKG+gNH/8y4Y=;
 b=LtQ1XQ2HRyOunBnThtjwnSJOmazQ76m2xf4+DbIXbfbNjoE6zhgxB7nblsspctYX6t
 PVA6T4Dl905+in1p5SGZQXZ4i7g4lN7cMBJQizQTAYaSUxaCOGSQLsNSA3SgNhD0RWM9
 +cdKDkf8kQBTu0XXjU91PWOw/Sy2j4YzkaHWIEX788FBrIpArRxdZVIGdGNPc94n8KYp
 2UrV1OyqIP1ayh4nX+yV/4x8Vw312+0nRJwexGeIHQsdzR0g9thXCTHPUqFSwdSrcLp5
 Jji03Mti69bocG91X+uWQESnBi/SWiWTODilCTZ7rJXdGEY4Kxa/DPwahpuY1up2rvRY
 4w4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FI0rEWO2Hrb8q+RXCZbtt8y5SbloA1chKG+gNH/8y4Y=;
 b=ohvwJQy08CeWjNBffrlvmTAYmI9xbL85i3VbwufaFFT7AxukNnHqjXOcHHP+TCe/iU
 VRM5Uny+vhFt0F08sJFpft81cjs60u9q1ZMKHLg49bdY0B75YRqefIghcKmLatLOQ+6/
 KdsrjYp9z+yDuaqg6OpZ4f3h2q7TwkGe2I10TjZLhYtu+BODxjkLIioI+8eVCl98S2oY
 91atUb4Su71gtuv9rghV8G//IpXTzw8EzdRsp+X3+jrQWTa+taxbckCKn/k4/IcWHr8j
 zPs6vWE9cIyf7wZjrBUAhVdU7Pf+/vP/MzveIuhv/niy9S0e5SNheYB4EtaJm9G/ebwm
 EssQ==
X-Gm-Message-State: AOAM5330/P/Tbroi7JKt/uTfQO+JNJAyGclv2yQxbJMEKdoGxYX5s3Qf
 qgyt9ET4jkK3zdODT/QHQXlvn1FMccyV
X-Google-Smtp-Source: ABdhPJwaAbm+EDc3SSvRwcBasMj+BYuBKJyv5jQQFlO6+iJYs5tAp0h3PrKCK5hzGrjEgxDLM3ZvCg==
X-Received: by 2002:a65:63d9:0:b0:374:6b38:c6b3 with SMTP id
 n25-20020a6563d9000000b003746b38c6b3mr16850831pgv.195.1651650040721; 
 Wed, 04 May 2022 00:40:40 -0700 (PDT)
Received: from localhost ([139.177.225.233]) by smtp.gmail.com with ESMTPSA id
 q3-20020a17090311c300b0015e8d4eb2e9sm7301876plh.307.2022.05.04.00.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 00:40:40 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com, eblake@redhat.com,
 Coiby.Xu@gmail.com, hreitz@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 1/8] block: Support passing NULL ops to blk_set_dev_ops()
Date: Wed,  4 May 2022 15:40:44 +0800
Message-Id: <20220504074051.90-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504074051.90-1-xieyongji@bytedance.com>
References: <20220504074051.90-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=xieyongji@bytedance.com; helo=mail-pg1-x534.google.com
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

This supports passing NULL ops to blk_set_dev_ops()
so that we can remove stale ops in some cases.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 block/block-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index e0e1aff4b1..35457a6a1d 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1062,7 +1062,7 @@ void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops,
     blk->dev_opaque = opaque;
 
     /* Are we currently quiesced? Should we enforce this right now? */
-    if (blk->quiesce_counter && ops->drained_begin) {
+    if (blk->quiesce_counter && ops && ops->drained_begin) {
         ops->drained_begin(opaque);
     }
 }
-- 
2.20.1


