Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF301F6F43
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 23:14:52 +0200 (CEST)
Received: from localhost ([::1]:50932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjUXD-0006dD-Md
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 17:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjTAl-0002Mu-ID
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:47:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30043
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjTAh-0001Tt-TN
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:47:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jgOHUr86uk5iUKCM5k8xEVjPaQJOtuaVUYx5SmDOBNM=;
 b=DDCW8HBzixor83G59QYN6WWOWKtnqc67GfoMMk0xDt8s/Edr/KA7DI9ULyT2P7BxmqZlaK
 mQ8mZG77Bfm2vlG9CQQbcYG+PehuZSgXgFDmUgX7/2idpx63GIA4caym1BzDWq/7O27gzV
 J9mZxEADIdrd4qEGSoD63ETlKvX0CDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-LwKVlOw4MaORwYjlyQus4g-1; Thu, 11 Jun 2020 15:47:29 -0400
X-MC-Unique: LwKVlOw4MaORwYjlyQus4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED25C835B41;
 Thu, 11 Jun 2020 19:47:27 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F0C98FF6A;
 Thu, 11 Jun 2020 19:47:27 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 113/115] replay: fix replay shutdown for console mode
Date: Thu, 11 Jun 2020 15:44:47 -0400
Message-Id: <20200611194449.31468-114-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 14:52:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>

When QEMU is used without any graphical window,
QEMU execution is terminated with the signal (e.g., Ctrl-C).
Signal processing in QEMU does not include
qemu_system_shutdown_request call. That is why shutdown
event is not recorded by record/replay in this case.
This patch adds shutdown event to the end of the record log.
Now every replay will shutdown the machine at the end.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
Message-Id: <159012995470.27967.18129611453659045726.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 replay/replay.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/replay/replay.c b/replay/replay.c
index 706c7b4f4b..7d93746c73 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -366,6 +366,11 @@ void replay_finish(void)
     /* finalize the file */
     if (replay_file) {
         if (replay_mode == REPLAY_MODE_RECORD) {
+            /*
+             * Can't do it in the signal handler, therefore
+             * add shutdown event here for the case of Ctrl-C.
+             */
+            replay_shutdown_request(SHUTDOWN_CAUSE_HOST_SIGNAL);
             /* write end event */
             replay_put_event(EVENT_END);
 
-- 
2.26.2



