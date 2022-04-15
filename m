Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAED9502B42
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:49:09 +0200 (CEST)
Received: from localhost ([::1]:35594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfMJw-0005T2-6d
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsU-0007Nq-Fx; Fri, 15 Apr 2022 09:20:46 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:44666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsS-0008U8-M9; Fri, 15 Apr 2022 09:20:46 -0400
Received: by mail-ed1-x531.google.com with SMTP id c64so9888435edf.11;
 Fri, 15 Apr 2022 06:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hHG9UaL2QFsVN2h+2yuEM3KkGGegTuTWP1BniOMjvDg=;
 b=bKOMtu3GM90eOe1rigWKdi4qhkvEsNc6Nou4JfHTSCzD8JBwWz3PiYILM7Fz+vSVOe
 3b4pGRAMdXUEyjkVT3XXKsSRcCwoEJJ2UOhNasOXshKeYgX0aKpxomtg4NzfngzEt4DN
 c2XRSrnvhigXmcjkuH3W3jnJm+5+OVlwHDKCDG4RWuxV0Bg+3ceAYLiFQRYVL/a6NhUq
 j4OSExNXI6J6JIqaHIjTbMON/aJCvgzIY1zfqwR3FU6gXmbNLP42sJohXxM5rcuiW5K0
 2v52qOPa9vOuzAUbafIaCSozvYE7sJhqTJDtG4oFgNUcFhyy38L8DX0Z2eZ0OSydwhK2
 3PKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hHG9UaL2QFsVN2h+2yuEM3KkGGegTuTWP1BniOMjvDg=;
 b=uu0Sd8quPXyfjOlLl6UnFj0VywJTxCz/qWCDkxDpxrlfwOz5CIeNO35r81W2JH4A0Y
 Ni8+K+FHxHcY7DPn4c3+679URMrkAxp3y5HZGqppoyJYDot789rxgZU4zDpVY/1pNbtC
 X3rDkupeuaAb4eUPtpEcfUYIFCy3jjdsQ3C+nge5IAKSRQyd4mIt9j7LtugwcSZIu1uQ
 S3x52eLOR1LUZjOn6DpVtJxdRUkKtPbJv7M4M/ivbfU68irWgOfefaSPVZM/N/1qw4o1
 2SnTvmd9f0Cog4yA9rNKpH2AyBKquRnu1jCCQG+SxaaNbFMh9kKAqojJTMIOKaTaDtOe
 jF4A==
X-Gm-Message-State: AOAM530T9HXV5KE4KQXHV0dkQSxzAVFp2H9gpuCTczi6sYaf5+ESAAaW
 JCJ60rsRelBo0OLhFPAQz2boDHNhR7iUkg==
X-Google-Smtp-Source: ABdhPJwTYOX9zgv8n2NCTTRcKiz22MDQe5vgjyQqLC7AGCOCTxkf1rSsgAbRvzzP7f4PxXNfzJyT1w==
X-Received: by 2002:a50:baa8:0:b0:415:b0bc:6353 with SMTP id
 x37-20020a50baa8000000b00415b0bc6353mr8370264ede.220.1650028842898; 
 Fri, 15 Apr 2022 06:20:42 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:20:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/26] vmdk: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:54 +0200
Message-Id: <20220415131900.793161-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: malureau@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/vmdk.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index 37c0946066..27d3732255 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1741,10 +1741,10 @@ static int coroutine_fn vmdk_co_block_status(BlockDriverState *bs,
     return ret;
 }
 
-static int vmdk_write_extent(VmdkExtent *extent, int64_t cluster_offset,
-                            int64_t offset_in_cluster, QEMUIOVector *qiov,
-                            uint64_t qiov_offset, uint64_t n_bytes,
-                            uint64_t offset)
+static int coroutine_fn vmdk_write_extent(VmdkExtent *extent, int64_t cluster_offset,
+                                         int64_t offset_in_cluster, QEMUIOVector *qiov,
+					  uint64_t qiov_offset, uint64_t n_bytes,
+					  uint64_t offset)
 {
     int ret;
     VmdkGrainMarker *data = NULL;
@@ -1822,9 +1822,9 @@ static int vmdk_write_extent(VmdkExtent *extent, int64_t cluster_offset,
     return ret;
 }
 
-static int vmdk_read_extent(VmdkExtent *extent, int64_t cluster_offset,
-                            int64_t offset_in_cluster, QEMUIOVector *qiov,
-                            int bytes)
+static int coroutine_fn vmdk_read_extent(VmdkExtent *extent, int64_t cluster_offset,
+                                        int64_t offset_in_cluster, QEMUIOVector *qiov,
+					 int bytes)
 {
     int ret;
     int cluster_bytes, buf_bytes;
@@ -1971,9 +1971,9 @@ fail:
  *
  * Returns: error code with 0 for success.
  */
-static int vmdk_pwritev(BlockDriverState *bs, uint64_t offset,
-                       uint64_t bytes, QEMUIOVector *qiov,
-                       bool zeroed, bool zero_dry_run)
+static int coroutine_fn vmdk_pwritev(BlockDriverState *bs, uint64_t offset,
+				     uint64_t bytes, QEMUIOVector *qiov,
+				     bool zeroed, bool zero_dry_run)
 {
     BDRVVmdkState *s = bs->opaque;
     VmdkExtent *extent = NULL;
-- 
2.35.1



