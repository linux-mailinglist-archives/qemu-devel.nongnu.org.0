Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904AF4B2864
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 15:55:26 +0100 (CET)
Received: from localhost ([::1]:60172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIXKX-0006aS-D8
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 09:55:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXHd-0003WO-7V
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:52:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXHI-0001ib-Mw
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644591124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fAA58+YqzW/Wf6SebeGNfv2q6hQASG9FtF0X8LBs0jw=;
 b=LedWrgpV1UEXVEMcPl0rrhIvjCTLVnF/AInVOWeOFSD8NBBeE3h0O1YgH4Lx1yz5/1haan
 81TdREZYbB/lo8tKjeryDXXK15HAOfVZSpuYJPrK8et42JpJtP/gF2wJH1TFYxWrP2hfUL
 NYVWY3pcsyVD8HqchPPFobF7gzVPn3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-hiGUjPcwOvyFi2unVIyMGA-1; Fri, 11 Feb 2022 09:52:01 -0500
X-MC-Unique: hiGUjPcwOvyFi2unVIyMGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD15594EE2;
 Fri, 11 Feb 2022 14:51:59 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 898C27C0E8;
 Fri, 11 Feb 2022 14:51:58 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 02/31] main loop: macros to mark GS and I/O functions
Date: Fri, 11 Feb 2022 09:51:24 -0500
Message-Id: <20220211145153.2861415-3-eesposit@redhat.com>
In-Reply-To: <20220211145153.2861415-1-eesposit@redhat.com>
References: <20220211145153.2861415-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Righ now, IO_CODE and IO_OR_GS_CODE are nop, as there isn't
really a way to check that a function is only called in I/O.
On the other side, we can use qemu_in_main_thread to check if
we are in the main loop.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/main-loop.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index bc42b5939d..77adc51627 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -269,6 +269,15 @@ bool qemu_mutex_iothread_locked(void);
  */
 bool qemu_in_main_thread(void);
 
+/* Mark and check that the function is part of the global state API. */
+#define GLOBAL_STATE_CODE() assert(qemu_in_main_thread())
+
+/* Mark and check that the function is part of the I/O API. */
+#define IO_CODE() /* nop */
+
+/* Mark and check that the function is part of the "I/O OR GS" API. */
+#define IO_OR_GS_CODE() /* nop */
+
 /**
  * qemu_mutex_lock_iothread: Lock the main loop mutex.
  *
-- 
2.31.1


