Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3603FFEC5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:14:14 +0200 (CEST)
Received: from localhost ([::1]:40234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM79B-0000DW-RK
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM72k-000565-Ub
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:07:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM72h-0000B0-P4
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:07:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YRPx8k5aASvYP1xf6/9soHjF4TaI9K/GxMLKkwWKabI=;
 b=cRs8otB9zwvwNsebMCRJ9sn295kK0l+hblhfe8ywFoqFJOebI4mi+02XBCuItr14yPEbMY
 0haEFfwg/2cRlRcq7WasZDcBtt5Hqw7InBEuSqHrGJ2kEzp+Lk1q/axO/WkTjsxJldK4wj
 kPPxqdcNaFHA/xbmhr7v6BSB9Moytt4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-walzWl42Mo6VqyC03e9x5Q-1; Fri, 03 Sep 2021 07:07:30 -0400
X-MC-Unique: walzWl42Mo6VqyC03e9x5Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so2517792wml.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YRPx8k5aASvYP1xf6/9soHjF4TaI9K/GxMLKkwWKabI=;
 b=X9kdsYu9E2rNCNv4AQRwVUbJjL59LauiuABhEaTmsSSHMVk4L/dJ1sQfSxBCscFHyI
 uDkjlTkQpnAKIvcPBKz0ucNmM1yjRmnBhWyWGguF6pTNgiFZNuCo0UkpiixI9+8d724c
 WkxavLwXTvhL0xxQcKkqEM/L2ylU70eXE/G4dXW8LXzzwYHcxLa9/uD6GS62iBRqr0fe
 05umpxtBGRmqgvgTpT0ULxkUPZUVPHEEhUFeerBYoNO/Za0VpruoLc/gLd9BkE5vyH23
 S8YIxY1h3bdbIN5ZU1gHCyt4azwi/UY8Nxce4qp7lVBBNriu1NDVEUR0JMoRB6q9glE5
 uFwQ==
X-Gm-Message-State: AOAM533b9O6XbWZgVyQyv+F7YgDOMLDlArYvgkdg383xHm9x8yic2ZY0
 mQBp7P21zA7nLY0z/o7T28uyadI9XUaglglFA3JxvsWtMxeM6XuEJkYyGHA0VfQFxTkP2D/j0TK
 8riOyi3i+OCT6vrxcthfk05WgQ8br1wR3Qc5o+dWYIYu8PHFdPD2bZ7KiRge6p6wl
X-Received: by 2002:a05:6000:92:: with SMTP id
 m18mr3355304wrx.293.1630667248845; 
 Fri, 03 Sep 2021 04:07:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlwFkOP0MVQF4y1XJ9fLv0qg256KT5I44ftRi9235B9/2W1BEuHyhR7G5P4RskcOmyCVOd6Q==
X-Received: by 2002:a05:6000:92:: with SMTP id
 m18mr3355251wrx.293.1630667248603; 
 Fri, 03 Sep 2021 04:07:28 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f5sm4032824wmb.47.2021.09.03.04.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:07:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/28] accel/tcg: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:38 +0200
Message-Id: <20210903110702.588291-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 accel/tcg/cputlb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b1e5471f949..1d5069a30d1 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -826,7 +826,7 @@ void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
         tlb_flush_range_by_mmuidx_async_0(cpu, d);
     } else {
         /* Otherwise allocate a structure, freed by the worker.  */
-        TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
+        TLBFlushRangeData *p = g_memdup2_qemu(&d, sizeof(d));
         async_run_on_cpu(cpu, tlb_flush_range_by_mmuidx_async_1,
                          RUN_ON_CPU_HOST_PTR(p));
     }
@@ -868,7 +868,7 @@ void tlb_flush_range_by_mmuidx_all_cpus(CPUState *src_cpu,
     /* Allocate a separate data block for each destination cpu.  */
     CPU_FOREACH(dst_cpu) {
         if (dst_cpu != src_cpu) {
-            TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
+            TLBFlushRangeData *p = g_memdup2_qemu(&d, sizeof(d));
             async_run_on_cpu(dst_cpu,
                              tlb_flush_range_by_mmuidx_async_1,
                              RUN_ON_CPU_HOST_PTR(p));
@@ -918,13 +918,13 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
     /* Allocate a separate data block for each destination cpu.  */
     CPU_FOREACH(dst_cpu) {
         if (dst_cpu != src_cpu) {
-            p = g_memdup(&d, sizeof(d));
+            p = g_memdup2_qemu(&d, sizeof(d));
             async_run_on_cpu(dst_cpu, tlb_flush_range_by_mmuidx_async_1,
                              RUN_ON_CPU_HOST_PTR(p));
         }
     }
 
-    p = g_memdup(&d, sizeof(d));
+    p = g_memdup2_qemu(&d, sizeof(d));
     async_safe_run_on_cpu(src_cpu, tlb_flush_range_by_mmuidx_async_1,
                           RUN_ON_CPU_HOST_PTR(p));
 }
-- 
2.31.1


