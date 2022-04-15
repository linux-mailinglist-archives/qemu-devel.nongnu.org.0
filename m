Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2843A502AE3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:23:13 +0200 (CEST)
Received: from localhost ([::1]:36580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfLuq-00014o-8p
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrP-0006Vq-JE; Fri, 15 Apr 2022 09:19:39 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:46772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrC-0007pr-Gr; Fri, 15 Apr 2022 09:19:38 -0400
Received: by mail-ej1-x62d.google.com with SMTP id t11so15299777eju.13;
 Fri, 15 Apr 2022 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AW9UshOwSu9Rwp97X5w5YvNGw7PfmQ7bFCKt0GNupsA=;
 b=RCEfvOj9Z8ncMCtmam5qW+qz7xydh7+9009iCOpmjC/MzRt8pC4u6wegRB8rPIUwRl
 J1h0wgdCqmMxQdgcbbG5hTw76rORJvQhQzPFdOv79OCmRPtGkeI1Typ8CtPCHjHfgXDB
 mIvaEnN1jOm06ITwYCYFOkaTTQhIFvFXNiJwJdBTSUKtmydd39MbjWqc/T2Xn+HE1IDi
 0ZbLDoz6HzqTuemnW/5CxvsrvUdfD/sWnJL8CWMv21GMuHZ04VXqarczoShWpi72U+i0
 V5ahfc7Oc3qSmfx+CGIxs9svocnBpmx9lecUDldqOEze4Sr35Jq5Hm12yH6By8lhJe0w
 RUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AW9UshOwSu9Rwp97X5w5YvNGw7PfmQ7bFCKt0GNupsA=;
 b=e7mz5kEK21VYTCgHB3g4xP3FvmmxoQhLVVi4dDimc8/43E4rIP4k8xEKN6r0vQxxNV
 vdUSacLBvW2Rxn7xMp9c9VBlTzqG/t0+oT1NlxHGwx4MmYo3iqfJwa2dX061hWsrKVq+
 5JQ2/xZrTLA/LwOYP9X6op8edRDxSsvwfIjU9Tqnwth2RgWRnqPqfSBjKqBzyiuka+nR
 02xcy4fYEjYnuwnsb9DP7xAdQchTVgsIoAjEEWkZaGUsjNgjACRnC071kGt/T39wWgye
 7+56wU7jfi60WsVqpDc3oBqgn7bsiO6b4fftdJm58EGdjec2QJW4G6LwUrS+5ALJdKKC
 ReBw==
X-Gm-Message-State: AOAM5323IzOzd0U0kYt1QI0HYXfld9zfxVLwpOpi6Vq0e/cPt2U4QD8U
 ELkXfEJzbvSmUPTPBsGnjyxZPcWQ7nBKew==
X-Google-Smtp-Source: ABdhPJxjDxQK0Svc2hlPuwN+gjYwMfRCkld1t2o+2g5ta6wExqucjc8Dg02yfxByHvjkS5AM76Exag==
X-Received: by 2002:a17:907:6284:b0:6e0:f895:15a with SMTP id
 nd4-20020a170907628400b006e0f895015amr6312004ejc.713.1650028759100; 
 Fri, 15 Apr 2022 06:19:19 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:19:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/26] qcow2: remove incorrect coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:36 +0200
Message-Id: <20220415131900.793161-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
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
 block/qcow2-refcount.c | 4 ++--
 block/qcow2.h          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index b91499410c..b6f90b2702 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1206,7 +1206,7 @@ void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
     }
 }
 
-int coroutine_fn qcow2_write_caches(BlockDriverState *bs)
+int qcow2_write_caches(BlockDriverState *bs)
 {
     BDRVQcow2State *s = bs->opaque;
     int ret;
@@ -1226,7 +1226,7 @@ int coroutine_fn qcow2_write_caches(BlockDriverState *bs)
     return 0;
 }
 
-int coroutine_fn qcow2_flush_caches(BlockDriverState *bs)
+int qcow2_flush_caches(BlockDriverState *bs)
 {
     int ret = qcow2_write_caches(bs);
     if (ret < 0) {
diff --git a/block/qcow2.h b/block/qcow2.h
index ba436a8d0d..c8d9e8ea79 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -874,8 +874,8 @@ void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
 int qcow2_update_snapshot_refcount(BlockDriverState *bs,
     int64_t l1_table_offset, int l1_size, int addend);
 
-int coroutine_fn qcow2_flush_caches(BlockDriverState *bs);
-int coroutine_fn qcow2_write_caches(BlockDriverState *bs);
+int qcow2_flush_caches(BlockDriverState *bs);
+int qcow2_write_caches(BlockDriverState *bs);
 int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                           BdrvCheckMode fix);
 
-- 
2.35.1



