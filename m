Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B78A1F6E5D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 21:56:37 +0200 (CEST)
Received: from localhost ([::1]:51486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjTJU-0006s4-CJ
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 15:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT8K-0007Gd-Np
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:04 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39785
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT8I-0000ms-JW
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cBKfrTprAHuwZsgp6tzfJ36X7teGtKYtH1MnqsWCe/k=;
 b=eymHB0rv1xQktkDaioe3gSZjd7UKzsZyMQ6HWH2x53cWYsVTVK/nVHSyBXG9TMsxcOYnlz
 abgzxU5Dfkbmi8YlbDEGxUrWFmyHdvcRxRnn2NvKu1trCL4i+kslgriifAT6yDqqykT11+
 a6i1wgnhHLTGW7MOiZQOphxefE4Y9uA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-EEG2IenhN_egTrkR8HK4xg-1; Thu, 11 Jun 2020 15:44:59 -0400
X-MC-Unique: EEG2IenhN_egTrkR8HK4xg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CCB4100A68C;
 Thu, 11 Jun 2020 19:44:58 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5411360CC0;
 Thu, 11 Jun 2020 19:44:57 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 011/115] icount: fix shift=auto for record/replay
Date: Thu, 11 Jun 2020 15:43:05 -0400
Message-Id: <20200611194449.31468-12-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 14:57:53
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

This patch fixes shift=auto when record/replay is enabled.
Now user does not need to guess the best shift value.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>

--

v2:
  moved icount_time_shift to vmstate subsection
Message-Id: <158988500050.15192.692077802469400393.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 cpus.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/cpus.c b/cpus.c
index 5670c96bcf..7ce0d569b3 100644
--- a/cpus.c
+++ b/cpus.c
@@ -379,7 +379,8 @@ static void icount_adjust(void)
 
     seqlock_write_lock(&timers_state.vm_clock_seqlock,
                        &timers_state.vm_clock_lock);
-    cur_time = cpu_get_clock_locked();
+    cur_time = REPLAY_CLOCK_LOCKED(REPLAY_CLOCK_VIRTUAL_RT,
+                                   cpu_get_clock_locked());
     cur_icount = cpu_get_icount_locked();
 
     delta = cur_icount - cur_time;
@@ -647,6 +648,11 @@ static bool adjust_timers_state_needed(void *opaque)
     return s->icount_rt_timer != NULL;
 }
 
+static bool shift_state_needed(void *opaque)
+{
+    return use_icount == 2;
+}
+
 /*
  * Subsection for warp timer migration is optional, because may not be created
  */
@@ -674,6 +680,17 @@ static const VMStateDescription icount_vmstate_adjust_timers = {
     }
 };
 
+static const VMStateDescription icount_vmstate_shift = {
+    .name = "timer/icount/shift",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = shift_state_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_INT16(icount_time_shift, TimersState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 /*
  * This is a subsection for icount migration.
  */
@@ -690,6 +707,7 @@ static const VMStateDescription icount_vmstate_timers = {
     .subsections = (const VMStateDescription*[]) {
         &icount_vmstate_warp_timer,
         &icount_vmstate_adjust_timers,
+        &icount_vmstate_shift,
         NULL
     }
 };
-- 
2.26.2



