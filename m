Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D0B68CB98
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 02:01:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPCKK-0000Vr-9X; Mon, 06 Feb 2023 19:59:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCKH-0000Rs-HX
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:59:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCKF-0003yC-VF
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675731551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hudZzsRpagzcLI/XtX7LAUqMBRpe4HeJEe9q7k4gr1A=;
 b=TP6NHmQta45BY+8R8rh6pu+0rXHO8gFYef0N6bovD9ffwlhFZsOtAwDNu4E00U95MayzRc
 dyCdASpxtOu/5IqoUcfFxiYSqOLIkMtVyF4tdQ9lGEsTVZaH8SNF948u1b8cu1wEqh93EQ
 ufiQTo+CgLq/S7BfqhX+ij3ieiF1nDw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-x1a2aZd-N7OUrSZJE7rzRw-1; Mon, 06 Feb 2023 19:59:08 -0500
X-MC-Unique: x1a2aZd-N7OUrSZJE7rzRw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C25980D0EE;
 Tue,  7 Feb 2023 00:59:07 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0986F492C3C;
 Tue,  7 Feb 2023 00:59:01 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@redhat.com>,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>, Peter Xu <peterx@redhat.com>
Subject: [PULL 24/30] migration/dirtyrate: Show sample pages only in
 page-sampling mode
Date: Tue,  7 Feb 2023 01:56:44 +0100
Message-Id: <20230207005650.1810-25-quintela@redhat.com>
In-Reply-To: <20230207005650.1810-1-quintela@redhat.com>
References: <20230207005650.1810-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

The value of "Sample Pages" is confusing in mode other than page-sampling.
See below:

(qemu) calc_dirty_rate -b 10 520
(qemu) info dirty_rate
Status: measuring
Start Time: 11646834 (ms)
Sample Pages: 520 (per GB)
Period: 10 (sec)
Mode: dirty-bitmap
Dirty rate: (not ready)

(qemu) info dirty_rate
Status: measured
Start Time: 11646834 (ms)
Sample Pages: 0 (per GB)
Period: 10 (sec)
Mode: dirty-bitmap
Dirty rate: 2 (MB/s)

While it's totally useless in dirty-ring and dirty-bitmap mode, fix to
show it only in page-sampling mode.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/dirtyrate.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 4bfb97fc68..575d48c397 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -714,8 +714,8 @@ void qmp_calc_dirty_rate(int64_t calc_time,
         mode =  DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
     }
 
-    if (has_sample_pages && mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) {
-        error_setg(errp, "either sample-pages or dirty-ring can be specified.");
+    if (has_sample_pages && mode != DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING) {
+        error_setg(errp, "sample-pages is used only in page-sampling mode");
         return;
     }
 
@@ -785,8 +785,10 @@ void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict)
                    DirtyRateStatus_str(info->status));
     monitor_printf(mon, "Start Time: %"PRIi64" (ms)\n",
                    info->start_time);
-    monitor_printf(mon, "Sample Pages: %"PRIu64" (per GB)\n",
-                   info->sample_pages);
+    if (info->mode == DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING) {
+        monitor_printf(mon, "Sample Pages: %"PRIu64" (per GB)\n",
+                       info->sample_pages);
+    }
     monitor_printf(mon, "Period: %"PRIi64" (sec)\n",
                    info->calc_time);
     monitor_printf(mon, "Mode: %s\n",
-- 
2.39.1


