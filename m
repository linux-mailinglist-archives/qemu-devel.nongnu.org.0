Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56CA615ECF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 10:04:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq9eI-000572-0l; Wed, 02 Nov 2022 05:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oq9eG-00056U-EY
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 05:03:00 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oq9eF-0004tj-09
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 05:03:00 -0400
Received: by mail-pf1-x429.google.com with SMTP id q9so740528pfg.5
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uIJI8qtfB8shFbIn2oA8BDymOBmXIALKaFltN8adAkA=;
 b=fRYqhSvhOnQs7ohJUyZpydNSQK+4tq2EK5V7n1A5/wp3+NrMdXqkV393UMEBgz0qTZ
 V3J6mrCsV37EvTHx7tC1LRFuFMs707tlv4awIEPb70nXgOlsITmpe5c8FCP8787cCrUI
 6WZzZ6vRetJNZ6/4EgeEcwyHyoH5hQhYZf/NrpRHr91Rw60yC8Gur1+BtNLdLM2pMQQK
 iPxVhiuS0ofLcQUZDVTyCyaeuI63vChHIroz2Qm1FrF/LEmTOfrRcldKB/BPuiNhMfw3
 OLMF6orwyDFtTnkCxi9ixluQdmD/NNJR5kCQMfn3LJSMh0EAi8w634ts2W4xM7Pi/3ds
 yOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uIJI8qtfB8shFbIn2oA8BDymOBmXIALKaFltN8adAkA=;
 b=iPWkTHwI+bYQlxko1Q3xjk9JZE9XxscDovesZr77QsJeqeWDXs2B4yi017pMwk++Xv
 WBWMLS/e62IXhUTt+k4C2Wt1rw4T31ebAn/MxRjsJm5LT1GfIPGAHtr6AF/mG4hc6six
 vGUWamWoz7a4sf38Z4+sgLKCLkCmabiwwlwKGMyN36W+LxuSudFa2OKnMKQv3eJxU5Qu
 pwwFqvOYA0lqXjqjaC+RuB/MGX1/Cj+DJVnEZUc6ZrrzzUlW75VeBA0Wp8FKfpBu7JCv
 mgbQAh3eMGIj2MCgOZAXxErQgV0ngq6UYnxgzoTfU/me0C5tHi4ZzZqT46ft0BqwxtuJ
 bN7w==
X-Gm-Message-State: ACrzQf2YULoIttIxaR1PWgAK8fdjEG3H0tVZ2KttzyuDkpth1kZ5KUhQ
 LvkBraaOh0+V8Ji8m7HUIezHiw==
X-Google-Smtp-Source: AMsMyM7Y+eFK6KjDT5oh0cu5doRnwyU/fl3yhgEy1DEmzj7LQHUEQnTB0DO/wujAwgx8k4/9HUQ3IQ==
X-Received: by 2002:a63:1f5c:0:b0:469:d0e6:dac0 with SMTP id
 q28-20020a631f5c000000b00469d0e6dac0mr20253704pgm.427.1667379777491; 
 Wed, 02 Nov 2022 02:02:57 -0700 (PDT)
Received: from FVFDK26JP3YV.bytedance.net ([139.177.225.245])
 by smtp.gmail.com with ESMTPSA id
 x129-20020a623187000000b0056da073b2b7sm4359987pfx.210.2022.11.02.02.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 02:02:57 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: pizhenwei@bytedance.com, qemu-devel@nongnu.org,
 Lei He <helei.sig11@bytedance.com>
Subject: [PATCH 2/2] cryptodev: fix memory-leak occurs on error path
Date: Wed,  2 Nov 2022 17:02:43 +0800
Message-Id: <20221102090243.52140-3-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20221102090243.52140-1-helei.sig11@bytedance.com>
References: <20221102090243.52140-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

- Fix memory-leak when 'virtio_crypto_handle_request' returns non-zero
value.
- When error occurred, always pass negative status to function
'virtio_crypto_req_complete'.

Signed-off-by: Lei He <helei.sig11@bytedance.com>
---
 hw/virtio/virtio-crypto.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 7ba63790d5..97da74e719 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -895,12 +895,15 @@ check_result:
         if (ret == -EFAULT) {
             return -1;
         } else if (ret == -VIRTIO_CRYPTO_NOTSUPP) {
-            virtio_crypto_req_complete(request, VIRTIO_CRYPTO_NOTSUPP);
+            virtio_crypto_req_complete(request, -VIRTIO_CRYPTO_NOTSUPP);
         } else {
-            cryptodev_backend_crypto_operation(vcrypto->cryptodev,
+            ret = cryptodev_backend_crypto_operation(vcrypto->cryptodev,
                                     request, queue_index,
                                     virtio_crypto_req_complete,
                                     request);
+            if (ret < 0) {
+                virtio_crypto_req_complete(request, ret);
+            }
         }
         break;
 
@@ -911,7 +914,7 @@ check_result:
     default:
         error_report("virtio-crypto unsupported dataq opcode: %u",
                      opcode);
-        virtio_crypto_req_complete(request, VIRTIO_CRYPTO_NOTSUPP);
+        virtio_crypto_req_complete(request, -VIRTIO_CRYPTO_NOTSUPP);
     }
 
     return 0;
-- 
2.11.0


