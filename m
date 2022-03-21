Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E14A4E2152
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 08:24:30 +0100 (CET)
Received: from localhost ([::1]:48138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWCOz-0003M1-39
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 03:24:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nWCGV-0005yn-VE
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 03:15:44 -0400
Received: from [2607:f8b0:4864:20::62e] (port=45679
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nWCGT-00026G-BK
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 03:15:42 -0400
Received: by mail-pl1-x62e.google.com with SMTP id k6so4768984plg.12
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 00:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FI0rEWO2Hrb8q+RXCZbtt8y5SbloA1chKG+gNH/8y4Y=;
 b=6Q/r/a4mI+q2u4R+9o8g+3SQaj68WsqvsTyYx4IBJ9E9cSth2VJ2VGsBATgyhzJO6o
 uoojXCluPRS7oYpznRxzcHFUyrAb7iT7L3rumJToEa0MY9UbDFn4/atZcOarlsZ9hCz1
 G4M6hYXKAAszYjOrRJKCDSBGTFw7rd/35Dr/ybztrgaSfk3T36vu3gnnWNIrGm9tjfyD
 Y+cHHeoNoHROstW1br7YFDTmyAX4FJmw3eUBt/Nrgl7dUyaCjdJYKGACpQ4F+r97v9mr
 gR7pme3ct9ouYY0mTKCxA7mp6xH+C+0u8M18JALoX3wtPLRGZEu8kneqU/DMX+6mhNtx
 W3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FI0rEWO2Hrb8q+RXCZbtt8y5SbloA1chKG+gNH/8y4Y=;
 b=XHwwcBGdBVVA+AKaNdtFvxYhlux0im/nTwXEmaNfBLg6stgWUCrtimHe01GvaLJqZJ
 jp6+7ToVluMQid0SLWmIuC92TwY7GwiXfg51hQLrhBjxDuqOEW8BBr2FxDvfA8UZDo8U
 +aTMdusgTGrFU5gp5FQuh9oFAARZnHBBCmD6t7ebRsY632ZitXVNjHXtcRrbgtXtUqif
 5m/bYPMC1QONLqdfnyriLH1jFd75lgFQPJq9MSS3ZyOZvy5SY77oGX6U64sEHcd4ncDo
 /LjXlR0W6Qczusin01uxUJb3eBH+vFpi3POt+86SVY7wK+q9zcr3ZRFCbGJ80bN+PQ4x
 cyDA==
X-Gm-Message-State: AOAM531Y+PVh0EfCP1GH4hTcp7vVNBGJvfVdwb4LdVJ4WBhO2RT7wSxk
 /anaTzCYodks5NQ+0L7yyP3w
X-Google-Smtp-Source: ABdhPJxqcQlj6wiLyqbPy5V51NQtMc1nM7Gs2FsC8BpmO63kaAGP6KutEx3LboTP2IGfcOdVh3xfOw==
X-Received: by 2002:a17:90b:1c8f:b0:1b8:c6dc:ca61 with SMTP id
 oo15-20020a17090b1c8f00b001b8c6dcca61mr24582664pjb.13.1647846940143; 
 Mon, 21 Mar 2022 00:15:40 -0700 (PDT)
Received: from localhost ([139.177.225.230]) by smtp.gmail.com with ESMTPSA id
 f66-20020a62db45000000b004fa8a7b8ad3sm5744420pfg.77.2022.03.21.00.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 00:15:39 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com
Subject: [PATCH v3 1/6] block: Support passing NULL ops to blk_set_dev_ops()
Date: Mon, 21 Mar 2022 15:14:34 +0800
Message-Id: <20220321071439.151-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321071439.151-1-xieyongji@bytedance.com>
References: <20220321071439.151-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=xieyongji@bytedance.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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


