Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13911FA933
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 08:54:39 +0200 (CEST)
Received: from localhost ([::1]:36676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl5UU-00041q-Lp
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 02:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl5N7-0002Cb-Bu
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:47:01 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24263
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl5N4-0005or-Ar
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592290016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/JCYQPXxv0aPlPyN+C7Yfog1V7A9i6Guix0MwTTgQQU=;
 b=cdqJbEoCtZCbNomUgQKnMTUgIxQPzUvu7090IcxNbIOxqw2XU6QY6tAraWGcBmcDcDaKC5
 h5gtA0W3rOAfaSmy3+wW9C/p8/fq0JA/bobugAx7surCHM7ihiwtnYPqEQXH2u5MHZTKSc
 kZa5G5+DG0+3/rVloGf/dyqEXYCn+18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-UUiDzfjcMcmvjV-yiWKgIQ-1; Tue, 16 Jun 2020 02:46:54 -0400
X-MC-Unique: UUiDzfjcMcmvjV-yiWKgIQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 657E7184D179;
 Tue, 16 Jun 2020 06:46:53 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-222.pek2.redhat.com
 [10.72.13.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83C8C90341;
 Tue, 16 Jun 2020 06:46:51 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 27/33] net/colo-compare.c: Only hexdump packets if tracing is
 enabled
Date: Tue, 16 Jun 2020 14:45:38 +0800
Message-Id: <1592289944-13727-28-git-send-email-jasowang@redhat.com>
In-Reply-To: <1592289944-13727-1-git-send-email-jasowang@redhat.com>
References: <1592289944-13727-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:01:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

Else the log will be flooded if there is a lot of network
traffic.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/colo-compare.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 62ecd38..a609f49 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -483,10 +483,12 @@ sec:
         g_queue_push_head(&conn->primary_list, ppkt);
         g_queue_push_head(&conn->secondary_list, spkt);
 
-        qemu_hexdump((char *)ppkt->data, stderr,
-                     "colo-compare ppkt", ppkt->size);
-        qemu_hexdump((char *)spkt->data, stderr,
-                     "colo-compare spkt", spkt->size);
+        if (trace_event_get_state_backends(TRACE_COLO_COMPARE_MISCOMPARE)) {
+            qemu_hexdump((char *)ppkt->data, stderr,
+                        "colo-compare ppkt", ppkt->size);
+            qemu_hexdump((char *)spkt->data, stderr,
+                        "colo-compare spkt", spkt->size);
+        }
 
         colo_compare_inconsistency_notify(s);
     }
-- 
2.5.0


