Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C81481DF6
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 17:09:21 +0100 (CET)
Received: from localhost ([::1]:54150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2xzU-0002dA-Em
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 11:09:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xvr-00086Q-CJ
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 11:05:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xvo-0004GF-2p
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 11:05:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640880330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JMOfaJ/LMhDSs430s4HqaNJL/fJKyjqZbj2wrNrE+Yg=;
 b=Gk/kCMl0AQOqpgw4vGDGK3RNQui0WVnLpM8hOfYmMPOVBTqUUCS3Jw0OcjlP3MzDUf5UfO
 vAlQjpFX2H8G6xR1jZp108vMaLKptJK5bhUyP+4W8sFbnhtbHlM0l0EE0w7x6LvtVLnQ2X
 uvck8cKJ04ZemDcx/DMlAVm82ThVck0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-g0XA61BWOp-BWj9DDV5rZA-1; Thu, 30 Dec 2021 11:05:29 -0500
X-MC-Unique: g0XA61BWOp-BWj9DDV5rZA-1
Received: by mail-wm1-f69.google.com with SMTP id
 r2-20020a05600c35c200b00345c3b82b22so11748205wmq.0
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 08:05:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JMOfaJ/LMhDSs430s4HqaNJL/fJKyjqZbj2wrNrE+Yg=;
 b=rLbPBGxF6SgUado0YYZ46cPMMAdBayst4U3EUQHtVKm5GP1/qSqlE68c5Noi7IHbQC
 YsJcVIUqK2kaNfpFGKepHj3PnTWtt4Onbvh9KchGSS3uuDbvkHNqH8vd6vDgriEY9sb3
 9iBjZl8tSX61IgtSIrTjuuJxTkdTSV9k2s9rztQWIFlntDyhG2BQnyOtcysE3fwAkKNf
 MuLxCJoKNBWmwB/sBx3IenCZ3nfaopKbdh4wamWPEMkNVB5X3edK32SSB9p2u78z3p1H
 YnYj8MfoRW2XSv0Se27zMpCrq8MliKrm87d8+rZL1C0pKWEZ8tKCMZJhDZCBnldJxZEN
 rVtg==
X-Gm-Message-State: AOAM531bBe5XBBr5RkMpVeQAhchN/I7gr7t31NElscItQHRWzzrk4RQl
 LDV/hVm3pN4eWMdCT28PXNdvXw237b8Ri0/F4Tu/4zpAeekBVitkKt2X2cfB4z8k3iLHG/g4UNa
 WNw0vbgWBZ0if1DFRQ24huyfvI3NV3O7ZS4tY7ZzyeRl6bv3wLkLy6jBwoGpkKryk
X-Received: by 2002:a5d:440e:: with SMTP id z14mr3756661wrq.611.1640880328183; 
 Thu, 30 Dec 2021 08:05:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUMOda5qjaqTE+68qVvqb0A8MMGWgi4qK9A96jnG8eYpl7UNIBsyvnQXlILYYobsH3S+Ihlg==
X-Received: by 2002:a5d:440e:: with SMTP id z14mr3756636wrq.611.1640880328016; 
 Thu, 30 Dec 2021 08:05:28 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id y1sm23930187wrm.3.2021.12.30.08.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 08:05:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] migration: Don't return for postcopy_send_discard_bm_ram()
Date: Thu, 30 Dec 2021 17:05:25 +0100
Message-Id: <20211230160525.462185-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

postcopy_send_discard_bm_ram() always return zero. Since it can't
fail, simplify and do not return anything.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Based-on: <20211224065000.97572-1-peterx@redhat.com>
---
 migration/ram.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 5234d1ece11..e241ce98461 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2433,14 +2433,12 @@ void ram_postcopy_migrated_memory_release(MigrationState *ms)
 /**
  * postcopy_send_discard_bm_ram: discard a RAMBlock
  *
- * Returns zero on success
- *
  * Callback from postcopy_each_ram_send_discard for each RAMBlock
  *
  * @ms: current migration state
  * @block: RAMBlock to discard
  */
-static int postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *block)
+static void postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *block)
 {
     unsigned long end = block->used_length >> TARGET_PAGE_BITS;
     unsigned long current;
@@ -2464,8 +2462,6 @@ static int postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *block)
         postcopy_discard_send_range(ms, one, discard_length);
         current = one + discard_length;
     }
-
-    return 0;
 }
 
 static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block);
-- 
2.33.1


