Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1678649F6B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:08:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iPP-000111-QZ; Mon, 12 Dec 2022 07:59:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPM-0000w7-RA
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPL-0000c5-7o
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670849986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uLV1gQudJd+2ESbdrMy1FxHMXOTy4Nn2ipJ8lzvzrV0=;
 b=TSCvr3NGG1I+4iFxEFxrn3oe+FvuY/RnNICD2eUHxWCicA9mJTn5DduiOCzQ8Xoo5J6caK
 18nCP8QBETTuAMsytX2+scYoBcLSMs+/cLQMsIEp19ELMI1E0I7Aqw2v9puLjsjYtNUhhP
 RiTlpQ7v9PyA1KXxvdujidSLvFxpxUE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-73-d-2VbveMMKGVS7gXAZY7QQ-1; Mon, 12 Dec 2022 07:59:45 -0500
X-MC-Unique: d-2VbveMMKGVS7gXAZY7QQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r67-20020a1c4446000000b003d09b0fbf54so4143481wma.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uLV1gQudJd+2ESbdrMy1FxHMXOTy4Nn2ipJ8lzvzrV0=;
 b=olcipee14mVEy7rDt0jOMsR9SWZsyOoFzHpFX0hktC3eaExwHDlrumKgWfiObf/mTf
 4SBTRh6P6EO4zaT3DxduZZec9B/i/IQcaDlFkMpjXOUD7izD49oZGrB/sUduugk6papo
 xO1EuFVWn7DoqyJRistFOU15jejMzRfIq6xt7z1ECvKIxf3vGAVSIUBMF89xdsjX3wGw
 9GitfCwpEhovQENtOze6ZFgIz9WwQeagGW4X/2/tIGyQoeaL+kMqQxx85DgAfEyEQuqC
 OXA61yItocLxg18Tew1QcZrOnfyIapUENayOsGMDpblyRZtPISSe1ocRUQV7pWLD2SBJ
 dAaQ==
X-Gm-Message-State: ANoB5pk3QSsjyaHh8jfYlhyfOOvx5vWolhqx/xveIO6vgpxwGfidZAPc
 Mzrk87y9uoI6PiFitpO+53to7+KoAiW/G9qPdnbkiNmeho9zYmhjscXqQdyFgbdDsVavcaZyWWA
 dfox9I/LPig6XgMzuxHoIB+tH8RlWaSMwHZnoVBeIC4rNTQyKvlJ+2838UNl+bCGh5Pg=
X-Received: by 2002:a05:600c:348a:b0:3cf:69f4:bfd4 with SMTP id
 a10-20020a05600c348a00b003cf69f4bfd4mr12547445wmq.7.1670849984063; 
 Mon, 12 Dec 2022 04:59:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4UKkREgl74Wde8Kle2VYN31cjdWZN1cwSzBnrOfSCqPwNuXN0gv7MBlCzKO3pH/MGQYiutyw==
X-Received: by 2002:a05:600c:348a:b0:3cf:69f4:bfd4 with SMTP id
 a10-20020a05600c348a00b003cf69f4bfd4mr12547427wmq.7.1670849983764; 
 Mon, 12 Dec 2022 04:59:43 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b003b4fe03c881sm9970929wmq.48.2022.12.12.04.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 04:59:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	eesposit@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 07/15] block-backend: enter aio coroutine only after drain
Date: Mon, 12 Dec 2022 13:59:12 +0100
Message-Id: <20221212125920.248567-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212125920.248567-1-pbonzini@redhat.com>
References: <20221212125920.248567-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

When called from within (another) coroutine, aio_co_enter will not
enter a coroutine immediately; instead the new coroutine is scheduled
to run after qemu_coroutine_yield().  This however might cause the
currently-running coroutine to yield without having raised blk->in_flight.
If it was a ->drained_begin() callback who scheduled the coroutine,
bdrv_drained_begin() might exit without waiting for the I/O operation
to finish.  Right now, this is masked by unnecessary polling done by
bdrv_drained_begin() after the callbacks return, but it is wrong and
a latent bug.

So, ensure that blk_inc_in_flight() and blk_wait_while_drained()
are called before aio_co_enter().  To do so, pull the call to
blk_wait_while_drained() out of the blk_co_do_* functions, which are
called from the AIO coroutines, and place them separately in the public
blk_co_* functions and in blk_aio_prwv.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-backend.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 2852a892de6c..c4a884b86c2b 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1288,8 +1288,6 @@ blk_co_do_preadv_part(BlockBackend *blk, int64_t offset, int64_t bytes,
     BlockDriverState *bs;
     IO_CODE();
 
-    blk_wait_while_drained(blk);
-
     /* Call blk_bs() only after waiting, the graph may have changed */
     bs = blk_bs(blk);
     trace_blk_co_preadv(blk, bs, offset, bytes, flags);
@@ -1332,6 +1330,7 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
+    blk_wait_while_drained(blk);
     ret = blk_co_do_preadv_part(blk, offset, bytes, qiov, 0, flags);
     blk_dec_in_flight(blk);
 
@@ -1346,6 +1345,7 @@ int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
+    blk_wait_while_drained(blk);
     ret = blk_co_do_preadv_part(blk, offset, bytes, qiov, qiov_offset, flags);
     blk_dec_in_flight(blk);
 
@@ -1362,8 +1362,6 @@ blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
     BlockDriverState *bs;
     IO_CODE();
 
-    blk_wait_while_drained(blk);
-
     /* Call blk_bs() only after waiting, the graph may have changed */
     bs = blk_bs(blk);
     trace_blk_co_pwritev(blk, bs, offset, bytes, flags);
@@ -1399,6 +1397,7 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
+    blk_wait_while_drained(blk);
     ret = blk_co_do_pwritev_part(blk, offset, bytes, qiov, qiov_offset, flags);
     blk_dec_in_flight(blk);
 
@@ -1543,6 +1542,7 @@ static BlockAIOCB *blk_aio_prwv(BlockBackend *blk, int64_t offset,
     Coroutine *co;
 
     blk_inc_in_flight(blk);
+    blk_wait_while_drained(blk);
     acb = blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
     acb->rwco = (BlkRwCo) {
         .blk    = blk,
@@ -1667,8 +1667,6 @@ blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
 {
     IO_CODE();
 
-    blk_wait_while_drained(blk);
-
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
     }
@@ -1683,6 +1681,7 @@ int coroutine_fn blk_co_ioctl(BlockBackend *blk, unsigned long int req,
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
+    blk_wait_while_drained(blk);
     ret = blk_co_do_ioctl(blk, req, buf);
     blk_dec_in_flight(blk);
 
@@ -1713,8 +1712,6 @@ blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
     int ret;
     IO_CODE();
 
-    blk_wait_while_drained(blk);
-
     ret = blk_check_byte_request(blk, offset, bytes);
     if (ret < 0) {
         return ret;
@@ -1748,6 +1745,7 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
+    blk_wait_while_drained(blk);
     ret = blk_co_do_pdiscard(blk, offset, bytes);
     blk_dec_in_flight(blk);
 
@@ -1757,7 +1755,6 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static int coroutine_fn blk_co_do_flush(BlockBackend *blk)
 {
-    blk_wait_while_drained(blk);
     IO_CODE();
 
     if (!blk_is_available(blk)) {
@@ -1789,6 +1786,7 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
+    blk_wait_while_drained(blk);
     ret = blk_co_do_flush(blk);
     blk_dec_in_flight(blk);
 
-- 
2.38.1


