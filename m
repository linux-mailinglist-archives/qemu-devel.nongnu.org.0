Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2DE649F76
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:09:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iQN-0001dT-0c; Mon, 12 Dec 2022 08:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPV-0001Ci-IR
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPT-0000dx-VE
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670849995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SNf+Amfu4RgOHfZAxglCNQQHsEjLkMDXAIJYh2GuBxA=;
 b=LvI4gMvN96Fvkq6gp4yiYctAo46EwWANhNSCvnx5as6/thiePXoRweKuC3M40Kjc4Dk1Mt
 GaC/xWG2vneohGsAh6LemPFjLkc/oLjHqwghlNc61UCPvDJGI/i7XNehper89Tlvvmi7mH
 ykeSBzSlxWOpX6YT3vSBwqnqV/GuBXU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-346-DDs7snKdMtWUElUF8MrNHA-1; Mon, 12 Dec 2022 07:59:54 -0500
X-MC-Unique: DDs7snKdMtWUElUF8MrNHA-1
Received: by mail-wm1-f71.google.com with SMTP id
 h9-20020a1c2109000000b003cfd37aec58so3333841wmh.1
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SNf+Amfu4RgOHfZAxglCNQQHsEjLkMDXAIJYh2GuBxA=;
 b=ZPLqUZt9vPsq1BFU9KrhEMwvkBZC2RRwXbrq2Ug4UzjC8KEQ4YV+neIxb8ik5IxZya
 iM8AYdEbuI5z1YmezoyAa/H3LdzJuWp+fBr+2VSnlSMhsqXMZfZtD0+ab5k7smn5WINo
 DgBHz5KBsSsvlGY9bnOkYT/OO0nbLGXCUFUfMyLm9pYM5SniIqcytHB2TH8FIw4uwRB0
 ZnyqRJp7xZO7+b8I4oNKnkM41eQCRkSLexn4WwBy7QtGCERVhy8Z+29qlbWwb5Bkcfb+
 bUJ8YLtqKbisP0HEzauEC01/5ohrQepLAjCrtP4AIaqiHI9sa3VAy+7M1tuuEkn77sd8
 jfvA==
X-Gm-Message-State: ANoB5pnykcZzG8FXu8hqa23oRojhIC4xNQIPQEwHrKH7gHV4SKdkCJvn
 f3UN/9uKxBrEusRiwWa5V3d/AvbXsZRr1hG5/Ghz90iW0JslCr/yjTkEqMOQcpSrl/lMFQH+7Np
 MSczyB/vBoBvEfiez8/fTm1eGq3G6uV4HrFzuxL0fAPstPgs5Kpo0134/wF0/D6sVNmo=
X-Received: by 2002:a05:600c:4e54:b0:3cf:51cf:91c with SMTP id
 e20-20020a05600c4e5400b003cf51cf091cmr12492237wmq.11.1670849992586; 
 Mon, 12 Dec 2022 04:59:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6r2mohU+wm93TcPgW4TPz8HAa2okeHkZVb+hA9Zj4DosoZGy8NBDgjOnEFryeBAcrKjaU90Q==
X-Received: by 2002:a05:600c:4e54:b0:3cf:51cf:91c with SMTP id
 e20-20020a05600c4e5400b003cf51cf091cmr12492218wmq.11.1670849992275; 
 Mon, 12 Dec 2022 04:59:52 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a5d500b000000b00241fde8fe04sm8850859wrt.7.2022.12.12.04.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 04:59:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	eesposit@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 10/15] block-backend: always wait for drain before starting
 operation
Date: Mon, 12 Dec 2022 13:59:15 +0100
Message-Id: <20221212125920.248567-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212125920.248567-1-pbonzini@redhat.com>
References: <20221212125920.248567-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

All I/O operations call blk_wait_while_drained() immediately after
blk_inc_in_flight(), except for blk_abort_aio_request() where it
does not hurt to add such a call.  Merge the two functions into one,
and add a note about a disturbing lack of thread-safety that will
be fixed shortly.

While at it, make the quiesce_counter check a loop.  While the check
does not have to be "perfect", i.e. it only matters that an endless
stream of I/Os is stopped sooner or later, it is more logical to check
the counter repeatedly until it is zero.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-backend.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index fe42d53d655d..627d491d4155 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1270,18 +1270,6 @@ static int blk_check_byte_request(BlockBackend *blk, int64_t offset,
     return 0;
 }
 
-/* To be called between exactly one pair of blk_inc/dec_in_flight() */
-static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
-{
-    assert(blk->in_flight > 0);
-
-    if (blk->quiesce_counter && !blk->disable_request_queuing) {
-        blk_dec_in_flight(blk);
-        qemu_co_queue_wait(&blk->queued_requests, NULL);
-        blk_inc_in_flight(blk);
-    }
-}
-
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static int coroutine_fn
 blk_co_do_preadv_part(BlockBackend *blk, int64_t offset, int64_t bytes,
@@ -1334,7 +1322,6 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
-    blk_wait_while_drained(blk);
     ret = blk_co_do_preadv_part(blk, offset, bytes, qiov, 0, flags);
     blk_dec_in_flight(blk);
 
@@ -1349,7 +1336,6 @@ int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
-    blk_wait_while_drained(blk);
     ret = blk_co_do_preadv_part(blk, offset, bytes, qiov, qiov_offset, flags);
     blk_dec_in_flight(blk);
 
@@ -1401,7 +1387,6 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
-    blk_wait_while_drained(blk);
     ret = blk_co_do_pwritev_part(blk, offset, bytes, qiov, qiov_offset, flags);
     blk_dec_in_flight(blk);
 
@@ -1466,6 +1451,14 @@ void blk_inc_in_flight(BlockBackend *blk)
 {
     IO_CODE();
     qatomic_inc(&blk->in_flight);
+    if (!blk->disable_request_queuing) {
+        /* TODO: this is not thread-safe! */
+        while (blk->quiesce_counter) {
+            qatomic_dec(&blk->in_flight);
+            qemu_co_queue_wait(&blk->queued_requests, NULL);
+            qatomic_inc(&blk->in_flight);
+        }
+    }
 }
 
 void blk_dec_in_flight(BlockBackend *blk)
@@ -1546,7 +1539,6 @@ static BlockAIOCB *blk_aio_prwv(BlockBackend *blk, int64_t offset,
     Coroutine *co;
 
     blk_inc_in_flight(blk);
-    blk_wait_while_drained(blk);
     acb = blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
     acb->rwco = (BlkRwCo) {
         .blk    = blk,
@@ -1685,7 +1677,6 @@ int coroutine_fn blk_co_ioctl(BlockBackend *blk, unsigned long int req,
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
-    blk_wait_while_drained(blk);
     ret = blk_co_do_ioctl(blk, req, buf);
     blk_dec_in_flight(blk);
 
@@ -1749,7 +1740,6 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
-    blk_wait_while_drained(blk);
     ret = blk_co_do_pdiscard(blk, offset, bytes);
     blk_dec_in_flight(blk);
 
@@ -1790,7 +1780,6 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
-    blk_wait_while_drained(blk);
     ret = blk_co_do_flush(blk);
     blk_dec_in_flight(blk);
 
-- 
2.38.1


