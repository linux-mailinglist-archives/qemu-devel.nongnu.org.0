Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1116256747A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 18:35:40 +0200 (CEST)
Received: from localhost ([::1]:46780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8lWU-0006s9-U5
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 12:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lEk-0005PC-J7
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:17:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lEi-00065k-WA
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s5NFGNgolZ/YljHW0KwUSMv6ruJwU5YNYfxBcIZUuwM=;
 b=NGRMrGuPLoZWiympeMZebXkQdiyFpbCNYvce031AcxFfTLR1HNltI0wCOiKuRxbkkb85C6
 yeiNV+ESf4zmU6yoqSvVt4DuMKay2pHnFCMI27hp2l4jHiQXTP2Bl3lKvpqEtRpffNgpfu
 1WsuvSFeyZS+K4SsnXnDMnXYVtbbOqU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-mDdAtetyNiShvKjXz3lyiw-1; Tue, 05 Jul 2022 12:17:11 -0400
X-MC-Unique: mDdAtetyNiShvKjXz3lyiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65C071C1395B;
 Tue,  5 Jul 2022 16:16:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5401E140EBE4;
 Tue,  5 Jul 2022 16:16:53 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Eric Blake <eblake@redhat.com>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Weil <sw@weilnetz.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Bin Meng <bin.meng@windriver.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-riscv@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 qemu-arm@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 13/18] block: Implement blk_pdiscard() using
 generated_co_wrapper
Date: Tue,  5 Jul 2022 17:15:21 +0100
Message-Id: <20220705161527.1054072-14-afaria@redhat.com>
In-Reply-To: <20220705161527.1054072-1-afaria@redhat.com>
References: <20220705161527.1054072-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-backend.c             | 12 ------------
 block/coroutines.h                |  3 ---
 include/sysemu/block-backend-io.h |  3 ++-
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 8129259e50..823c98a031 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1715,18 +1715,6 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
     return ret;
 }
 
-int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
-{
-    int ret;
-    IO_OR_GS_CODE();
-
-    blk_inc_in_flight(blk);
-    ret = blk_do_pdiscard(blk, offset, bytes);
-    blk_dec_in_flight(blk);
-
-    return ret;
-}
-
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 int coroutine_fn blk_co_do_flush(BlockBackend *blk)
 {
diff --git a/block/coroutines.h b/block/coroutines.h
index 94fd283f62..2693ecabfb 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -110,9 +110,6 @@ nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 int generated_co_wrapper
 blk_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
-int generated_co_wrapper
-blk_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
-
 int generated_co_wrapper blk_do_flush(BlockBackend *blk);
 
 #endif /* BLOCK_COROUTINES_H */
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 5ce9b80023..5c56737453 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -160,6 +160,8 @@ static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
     return blk_co_pwritev(blk, offset, bytes, &qiov, flags);
 }
 
+int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offset,
+                                      int64_t bytes);
 int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
                                  int64_t bytes);
 
@@ -173,7 +175,6 @@ int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
                                                const void *buf);
 int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
                                           int64_t bytes, const void *buf);
-int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                            int64_t bytes,
                                            BdrvRequestFlags flags);
-- 
2.36.1


