Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335741D1F33
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 21:29:41 +0200 (CEST)
Received: from localhost ([::1]:32980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYx4W-0001Zq-67
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 15:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jYx35-0000Fk-Tl
 for qemu-devel@nongnu.org; Wed, 13 May 2020 15:28:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51703
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jYx34-0000fW-Dd
 for qemu-devel@nongnu.org; Wed, 13 May 2020 15:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589398088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XIV06agoJGThx8sKxBH0uyMQlIWPA5+B5K3kTkShU5Q=;
 b=eVkC+t2GxQ1F7FH7KIoJc2yfH1xyUS/TqGLkiWA0ifoHmS9gsYd0tbVpUHjGNKyH60+sQJ
 0AyxkVJ909yPgYmIs+jiV6J0fbnOC8c1RBs+PNyncXudHgoiKk8M80OXBpMTM5tBsX8SI/
 gAE42Jwa58+3AMAtoLVoGYCJLQEHIi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-NgRLTLguNPCQpfkKge_rQA-1; Wed, 13 May 2020 15:28:07 -0400
X-MC-Unique: NgRLTLguNPCQpfkKge_rQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCDEC460;
 Wed, 13 May 2020 19:28:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.74.9.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 049CE648DB;
 Wed, 13 May 2020 19:27:56 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v2 1/3] megasas: use unsigned type for reply_queue_head and
 check index
Date: Thu, 14 May 2020 00:55:38 +0530
Message-Id: <20200513192540.1583887-2-ppandit@redhat.com>
In-Reply-To: <20200513192540.1583887-1-ppandit@redhat.com>
References: <20200513192540.1583887-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ppandit@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 03:05:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, Prasad J Pandit <pjp@fedoraproject.org>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Ding Ren <rding@gatech.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Hanqing Zhao <hanqing@gatech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

A guest user may set 'reply_queue_head' field of MegasasState to
a negative value. Later in 'megasas_lookup_frame' it is used to
index into s->frames[] array. Use unsigned type to avoid OOB
access issue.

Also check that 'index' value stays within s->frames[] bounds
through the while() loop in 'megasas_lookup_frame' to avoid OOB
access.

Reported-by: Ren Ding <rding@gatech.edu>
Reported-by: Hanqing Zhao <hanqing@gatech.edu>
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/scsi/megasas.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Update v1 -> v2: fix OOB access when index > MEGASAS_MAX_FRAMES(=2048)
 -> https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg03131.html

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index af18c88b65..6ce598cd69 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -112,7 +112,7 @@ typedef struct MegasasState {
     uint64_t reply_queue_pa;
     void *reply_queue;
     int reply_queue_len;
-    int reply_queue_head;
+    uint16_t reply_queue_head;
     int reply_queue_tail;
     uint64_t consumer_pa;
     uint64_t producer_pa;
@@ -445,7 +445,7 @@ static MegasasCmd *megasas_lookup_frame(MegasasState *s,
 
     index = s->reply_queue_head;
 
-    while (num < s->fw_cmds) {
+    while (num < s->fw_cmds && index < MEGASAS_MAX_FRAMES) {
         if (s->frames[index].pa && s->frames[index].pa == frame) {
             cmd = &s->frames[index];
             break;
-- 
2.25.4


