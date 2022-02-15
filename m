Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4FD4B6A37
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 12:06:40 +0100 (CET)
Received: from localhost ([::1]:53944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJvfK-0004AC-LM
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 06:06:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nJvZg-0001AB-GN
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:00:48 -0500
Received: from [2607:f8b0:4864:20::1032] (port=46831
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nJvZY-0006Pd-To
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:00:46 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso1789912pjh.5
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 03:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mx+KWoVXABuoln/P3GBYnAEsk58Ntd0Jlbah4CnMj5o=;
 b=S9+gbji3U6meP3eeTAYAjWavo1pSvBx01lTuUG4Voe2+UoNlKIiP7oZrdnyU2cnqZU
 KbXP45ioKSlivclQTxNsslb8smOnMm2luyaqBS8GkhanFRNSExlVVhE7EqHRl82Bhn7H
 3sRZehnMg4EmnJudCnNvF2ySt6tyABjBs5lGk04lWujaFRkHN3eAaWWgAUn+I7ezbrZW
 Pr5R4+Gqd64rXIjUPMIvcumvOfCRLF984a9vcHo14Rql/CMvAluaLq8no60IdY+PA9pD
 Hs+F+LxjpaN1/sXwBe7vUs36TKjaHQap5fD+kfEnzGN9d821Os4UKNbDVJr4vbgTARIJ
 tcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mx+KWoVXABuoln/P3GBYnAEsk58Ntd0Jlbah4CnMj5o=;
 b=D70dga5uJVvM3YnMRZ7wqN6Cpvn2OjlaB+HLuwu7Yo0PU9u/sUdAUdaC14xmaThKSJ
 vxO8MCSIkK2vc93kYpkpaLfsjLSWphwvJUnupxHLa/rBUDJWNOA7VVsn36jTz3QDMazu
 oc3C5teGtV69dqGnTneOXbPyKODcr/4KEpN1a0wlQ9x+kGpsdPGmbshv/mIWT19j78t5
 oTmZQnyjjlx3gyf4BGvbiaXZcLsnphqXQRPgq2shpG79OrtBGPkqPHH+BhSZKNd5jKP9
 2+Ce70dx/DrQ4x3hRYMNwq/bRV9jmjpxMRrgEGBQSwUagEtndkwxnd1uJXlFrLuYD2IO
 KuCw==
X-Gm-Message-State: AOAM53278vEt3A1IhAsEv1xoJbCDkuedmn+SYi0qxOX6HRCIiX7kVkK1
 lltTVmaTY+bemdl9lH9BjEfQ
X-Google-Smtp-Source: ABdhPJw8u16HzpFnlZtg/GiNxX9Zs04lmKIOslxnoIZVnTQkelXtrSbthbYxVCaNHVEz9vfz86imhg==
X-Received: by 2002:a17:90b:388e:: with SMTP id
 mu14mr3752419pjb.172.1644922831475; 
 Tue, 15 Feb 2022 03:00:31 -0800 (PST)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id s24sm2363861pgq.51.2022.02.15.03.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 03:00:30 -0800 (PST)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com
Subject: [PATCH v2 1/6] block: Support passing NULL ops to blk_set_dev_ops()
Date: Tue, 15 Feb 2022 18:59:38 +0800
Message-Id: <20220215105943.90-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215105943.90-1-xieyongji@bytedance.com>
References: <20220215105943.90-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=xieyongji@bytedance.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This supports passing NULL ops to blk_set_dev_ops()
so that we can remove stale ops in some cases.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 block/block-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 4ff6b4d785..08dd0a3093 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1015,7 +1015,7 @@ void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops,
     blk->dev_opaque = opaque;
 
     /* Are we currently quiesced? Should we enforce this right now? */
-    if (blk->quiesce_counter && ops->drained_begin) {
+    if (blk->quiesce_counter && ops && ops->drained_begin) {
         ops->drained_begin(opaque);
     }
 }
-- 
2.20.1


