Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796DE40045A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:54:02 +0200 (CEST)
Received: from localhost ([::1]:39518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDO5-0003wU-EN
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDFz-0007EV-Tn
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:45:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDFx-0000ke-0S
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:45:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CXCzW8bCYFLnmDpFGRYWy7aRyivvYc+p/NDbg6+FNF8=;
 b=BfCvZ4cOTUnYP59S8h/fPo++62aztVa1nEUvsMxeKFuZsx4ZWab2yRiI1i7fpL8hk5Kxkh
 PzG79ihjmVL8y4XSfPkuZYKlOeqfYZbKMpwi1P/NF7ADMHB8KZQ84gpToz7IbhGihxQfjU
 efiOi49W8E8gSNTdIr9qoTgBSWM5zGU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-yD27k5_lOhK1do0wT62m4g-1; Fri, 03 Sep 2021 13:45:35 -0400
X-MC-Unique: yD27k5_lOhK1do0wT62m4g-1
Received: by mail-wm1-f70.google.com with SMTP id
 s197-20020a1ca9ce000000b002e72ba822dcso45280wme.6
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CXCzW8bCYFLnmDpFGRYWy7aRyivvYc+p/NDbg6+FNF8=;
 b=nvOHhYLO9UrmlPSKMuNUVaiTG8N7M8Ca+EgmC9vUa4qCM/SPIaE9YotdvH+3jaKcYi
 EpGMirge5iWKwwFEaMn2Xg4Kne8uj9bgUEYJ9Dm7FsjSqCa0cnt/lgrHSKVWc1W0+xT4
 EoOYt9K18XdDQwA2XCqpNc6vJm18tamV+Yqj+BbL5T9MOgpd+YC6DguqE63n6ZqOqpLx
 0rOxbq9fkwzj5fCUmMsF4gAwWPJ6ExHPZJpxHjZ3Qw/220mSTfXDRELIbrzm/QDZFDIK
 IUz0vlhAQSwfysb0GC3td9b8x7dxHVSh0jWZ6XbUNoyegxE8rWiMC60pEIDiM0sjsZIL
 W4vQ==
X-Gm-Message-State: AOAM5315merOOj+/OwhkIhodHXSHsnH5c795aALjjY9xw1wU1VMMYmjx
 shfr+MLvMQRLbAh9zRRsh6MC0SE5O63Aqx+sbi5mwx90i7kTQrKeq/rcEErnDd/fm9pYJh/XmeB
 Ss370n63wva9oVQOy1ru/VJB6UMotFi5Q5I3nhtI1vVVqMm4j1b+hNKhSS4XLKs4L
X-Received: by 2002:adf:c54a:: with SMTP id s10mr238944wrf.405.1630691134114; 
 Fri, 03 Sep 2021 10:45:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+zMZZBdsiCnPGLNZOqOowTX12oFIDz5c69PhgosuOGX74PNQuE1lnRJ5RJkQ6708CDi+C5g==
X-Received: by 2002:adf:c54a:: with SMTP id s10mr238902wrf.405.1630691133892; 
 Fri, 03 Sep 2021 10:45:33 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id i20sm67976wml.37.2021.09.03.10.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:45:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/28] accel/tcg: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:46 +0200
Message-Id: <20210903174510.751630-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
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

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 accel/tcg/cputlb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b1e5471f949..08951f0683e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -826,7 +826,7 @@ void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
         tlb_flush_range_by_mmuidx_async_0(cpu, d);
     } else {
         /* Otherwise allocate a structure, freed by the worker.  */
-        TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
+        TLBFlushRangeData *p = g_memdup2(&d, sizeof(d));
         async_run_on_cpu(cpu, tlb_flush_range_by_mmuidx_async_1,
                          RUN_ON_CPU_HOST_PTR(p));
     }
@@ -868,7 +868,7 @@ void tlb_flush_range_by_mmuidx_all_cpus(CPUState *src_cpu,
     /* Allocate a separate data block for each destination cpu.  */
     CPU_FOREACH(dst_cpu) {
         if (dst_cpu != src_cpu) {
-            TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
+            TLBFlushRangeData *p = g_memdup2(&d, sizeof(d));
             async_run_on_cpu(dst_cpu,
                              tlb_flush_range_by_mmuidx_async_1,
                              RUN_ON_CPU_HOST_PTR(p));
@@ -918,13 +918,13 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
     /* Allocate a separate data block for each destination cpu.  */
     CPU_FOREACH(dst_cpu) {
         if (dst_cpu != src_cpu) {
-            p = g_memdup(&d, sizeof(d));
+            p = g_memdup2(&d, sizeof(d));
             async_run_on_cpu(dst_cpu, tlb_flush_range_by_mmuidx_async_1,
                              RUN_ON_CPU_HOST_PTR(p));
         }
     }
 
-    p = g_memdup(&d, sizeof(d));
+    p = g_memdup2(&d, sizeof(d));
     async_safe_run_on_cpu(src_cpu, tlb_flush_range_by_mmuidx_async_1,
                           RUN_ON_CPU_HOST_PTR(p));
 }
-- 
2.31.1


