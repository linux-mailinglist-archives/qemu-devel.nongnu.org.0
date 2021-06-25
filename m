Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF923B45F9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:42:31 +0200 (CEST)
Received: from localhost ([::1]:35690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwn2M-0006Ga-V2
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfK-0003LW-QW
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:42 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfJ-0003F2-84
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:42 -0400
Received: by mail-ed1-x529.google.com with SMTP id w13so7641048edc.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qpjBRyyTP4cjVVNX0Br2C9CiFX8IHvmV4kWlXQxiCsA=;
 b=jCGCwDW6AqI+9Krkho8arWdBi0a0ZVQaQVi5zJn3yLKOsnLPaYaZKV/10GH1rO5PrW
 WFDEKv3BLJzmDnQCITlKRWjgadCCSwADF69EV/SNdZcO3t7kN5naLMIKt5gYL42+uCwd
 mzQJ7PN7kb4jMz6eIIBEsc0zPfcwuoAslbiyvnRi7gKzu2d9so4AAnbszGnt91VTlbue
 4ZF668IHm/k46erNkzAORbimRkUYERoiiEhY5jY1JEfbtNslrw/FqrXWmlSQrZ4Kok+/
 lJNDtQMZopfdCGZDHMz4UWzP+PCdl+vI9LcP84jZ9kkTsPtJB5hIsf5IHzbtn3aO/yBx
 KXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qpjBRyyTP4cjVVNX0Br2C9CiFX8IHvmV4kWlXQxiCsA=;
 b=VONhXnxflgqyjudykLYmweRvggG59WnBSWz7kfIphR6h4BH2/3uMHnomtzE51d8Ov3
 dxVmsVSNbdW8vOpzeFmZJYTyYpLIxjq4nu1zUbyH6PC2LjvLthfL/B3nj31by5eQfN8P
 5LO2HiL7IIxeaOG0Sn7vzRjx0A0oWLCoG5uVHGKEeXe61z/KD8YOLSjC/A8eERK1x8E2
 Tu7qJCqlnxyQXQ7LJV+iOmh6VeD5fvluiCS3/Ix/C1Ddvou1p8u1lh+kjpO0KKBG9+8N
 Q0rMt3dvGh3QmWtmVMDF3EE/vg/9sbYWA4X9wRtEZxOcST/YZztJRtxi6h+wK8IgubDj
 xnVA==
X-Gm-Message-State: AOAM533xP02VjBYlFdh0cqSbISHoXPRdB5dD1Jl0jt2HfJsXhIlJ9+c0
 KX+m1wDNg2w2F1T14vYN9ceRlDoYH9s=
X-Google-Smtp-Source: ABdhPJy9AWr9bXKKdgKVDoxDOshryv2Y7dxjVQHezoR8e4J7PSyskMi0QOKjHeBecVZX0Mspguct9Q==
X-Received: by 2002:a50:bf0f:: with SMTP id f15mr14705436edk.205.1624630719902; 
 Fri, 25 Jun 2021 07:18:39 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/28] block-backend: align max_transfer to request alignment
Date: Fri, 25 Jun 2021 16:18:10 +0200
Message-Id: <20210625141822.1368639-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Block device requests must be aligned to bs->bl.request_alignment.
It makes sense for drivers to align bs->bl.max_transfer the same
way; however when there is no specified limit, blk_get_max_transfer
just returns INT_MAX.  Since the contract of the function does not
specify that INT_MAX means "no maximum", just align the outcome
of the function (whether INT_MAX or bs->bl.max_transfer) before
returning it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-backend.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 15f1ea4288..6e37582740 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1957,12 +1957,12 @@ uint32_t blk_get_request_alignment(BlockBackend *blk)
 uint32_t blk_get_max_transfer(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
-    uint32_t max = 0;
+    uint32_t max = INT_MAX;
 
     if (bs) {
-        max = bs->bl.max_transfer;
+        max = MIN_NON_ZERO(max, bs->bl.max_transfer);
     }
-    return MIN_NON_ZERO(max, INT_MAX);
+    return ROUND_DOWN(max, blk_get_request_alignment(blk));
 }
 
 int blk_get_max_iov(BlockBackend *blk)
-- 
2.31.1



