Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B8F215C89
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 19:03:17 +0200 (CEST)
Received: from localhost ([::1]:33544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsUWS-00031I-FG
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 13:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jsUCR-0003rG-I0
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 12:42:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57685
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jsUCN-00039c-Dj
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 12:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594053750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JtZuVuHdVNu3fhWuwmHdVGNnNbZtoWf4TEAGF5WPKOQ=;
 b=OhBZoD6xNswFSDWER0UxUFlwR4SZmxuKtUpgjYE/EjPwFND7AY9MhQi7imnlA4RqgBYXFq
 18+nIpTZQDpaQE7ymC8VUvCnR0MBeJdIxeWe4mZEzzsxzjCAiTcbFS0nWun6luvMzuBRUQ
 LOFORPsK9fD/uVQkC3ZysRL8/k0RX6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-1_S1gXxyNFq_smQ5fXaIPw-1; Mon, 06 Jul 2020 12:42:26 -0400
X-MC-Unique: 1_S1gXxyNFq_smQ5fXaIPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA7A0800C64;
 Mon,  6 Jul 2020 16:42:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DDC85F7D8;
 Mon,  6 Jul 2020 16:42:24 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/53] iscsi: handle check condition status in retry loop
Date: Mon,  6 Jul 2020 12:41:36 -0400
Message-Id: <20200706164155.24696-35-pbonzini@redhat.com>
In-Reply-To: <20200706164155.24696-1-pbonzini@redhat.com>
References: <20200706164155.24696-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:52:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Xie Yongji <xieyongji@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xie Yongji <xieyongji@bytedance.com>

The handling of check condition was incorrect because
we would only do it after retries exceed maximum.

Fixes: 8c460269aa ("iscsi: base all handling of check condition on scsi_sense_to_errno")
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Message-Id: <20200701105444.3226-1-xieyongji@bytedance.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/iscsi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index a8b76979d8..2964c9f8d2 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -266,16 +266,16 @@ iscsi_co_generic_cb(struct iscsi_context *iscsi, int status,
                 timer_mod(&iTask->retry_timer,
                           qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + retry_time);
                 iTask->do_retry = 1;
-            }
-        } else if (status == SCSI_STATUS_CHECK_CONDITION) {
-            int error = iscsi_translate_sense(&task->sense);
-            if (error == EAGAIN) {
-                error_report("iSCSI CheckCondition: %s",
-                             iscsi_get_error(iscsi));
-                iTask->do_retry = 1;
-            } else {
-                iTask->err_code = -error;
-                iTask->err_str = g_strdup(iscsi_get_error(iscsi));
+            } else if (status == SCSI_STATUS_CHECK_CONDITION) {
+                int error = iscsi_translate_sense(&task->sense);
+                if (error == EAGAIN) {
+                    error_report("iSCSI CheckCondition: %s",
+                                 iscsi_get_error(iscsi));
+                    iTask->do_retry = 1;
+                } else {
+                    iTask->err_code = -error;
+                    iTask->err_str = g_strdup(iscsi_get_error(iscsi));
+                }
             }
         }
     }
-- 
2.26.2



