Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160904880BE
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:56:42 +0100 (CET)
Received: from localhost ([::1]:52480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60yH-0004zM-5x
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:56:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Ag-0004iL-Gp
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Af-0002bu-3j
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4akHXGYHIwd7HNeqwa3gMQKaZ7VYtAKPZ8TAtHqI2Gc=;
 b=MH3hb/9SgaFxes8GMcupFpiaB5L1w1k2bVFSBzJs4uzva/m31E9mtZ3YS9QWJCfIc4srcu
 vNWLhBqJgnkibcUixZL74THbXi7UpiJ/md+j5aa4baxsHFUwNtKEreSw0S8J880uTtXSZT
 A6fIbdAFgEmwVKD/kJuvBq34VoZTLQk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-2fb97krqONGBCJv_Q1nylw-1; Fri, 07 Jan 2022 20:05:20 -0500
X-MC-Unique: 2fb97krqONGBCJv_Q1nylw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r2-20020a05600c35c200b00345c3b82b22so5651186wmq.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:05:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4akHXGYHIwd7HNeqwa3gMQKaZ7VYtAKPZ8TAtHqI2Gc=;
 b=h5zE5cfzNiLj8DTQdA/4a8RanFmc4tKFAvbA4bqj4TyvX1ZDzii9s3utwjSLZD9Cb8
 NUhWUnZgn3zVAqsK6ErIpJ5hXqF158MCn5xKPfjpAvfnRPHdtj1rDeHisUF7OIr9JGc8
 ektEVlvrwGIbPuuHN+4kl9o8iEG6wWh73aYrYnyZ1bvGaPJzYCkSUdrowkEbSOdPG6Ef
 016j7Q7uKN37Mia7TNTbEe18VKKebRvkjpMDhwF9I2ZEOaGZ1T86Y5dJBnJP/qrO08tb
 Y/FF7Az+E4Qu2vmW/psBTNtdAbKcFY1y1ZiMCuNUDFu9P6RzaSQDF8QeofkCWrnUzFgV
 pbpA==
X-Gm-Message-State: AOAM531Q/kJ6efOhXkuaBQrc67IpiLfR8sS7owbkPwpQtALwPFogreSE
 QyyViiCtmFGdlYSctCEa4K7an3caxJPU1/lVvmLfuGDvS1tiwc+sBTJ+xtvSCV9oK9D4ta0Y+Mz
 0sc7kbpGuJhMcDVEMY3DVO9QfqGLaQF3O1qYGkuKrDtZNnNbjwDkIVPUe/aGP
X-Received: by 2002:adf:a40b:: with SMTP id d11mr55034977wra.209.1641603919236; 
 Fri, 07 Jan 2022 17:05:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmDXaNcgy49w9olFtkRxaPWPfdo+m9bJt8iEam8/Wy52GoX8KfWRttjyBvnTO/eM7ERMG0gw==
X-Received: by 2002:adf:a40b:: with SMTP id d11mr55034962wra.209.1641603919068; 
 Fri, 07 Jan 2022 17:05:19 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id p14sm233455wrt.12.2022.01.07.17.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:05:18 -0800 (PST)
Date: Fri, 7 Jan 2022 20:05:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 32/55] util/oslib-posix: Don't create too many threads with
 small memory or little pages
Message-ID: <20220108003423.15830-33-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's limit the number of threads to something sane, especially that
- We don't have more threads than the number of pages we have
- We don't have threads that initialize small (< 64 MiB) memory

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211217134611.31172-5-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 util/oslib-posix.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index cf2ead54ad..67c08a425e 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -40,6 +40,7 @@
 #include <libgen.h>
 #include "qemu/cutils.h"
 #include "qemu/compiler.h"
+#include "qemu/units.h"
 
 #ifdef CONFIG_LINUX
 #include <sys/syscall.h>
@@ -525,7 +526,8 @@ static void *do_madv_populate_write_pages(void *arg)
     return (void *)(uintptr_t)ret;
 }
 
-static inline int get_memset_num_threads(int smp_cpus)
+static inline int get_memset_num_threads(size_t hpagesize, size_t numpages,
+                                         int smp_cpus)
 {
     long host_procs = sysconf(_SC_NPROCESSORS_ONLN);
     int ret = 1;
@@ -533,6 +535,12 @@ static inline int get_memset_num_threads(int smp_cpus)
     if (host_procs > 0) {
         ret = MIN(MIN(host_procs, MAX_MEM_PREALLOC_THREAD_COUNT), smp_cpus);
     }
+
+    /* Especially with gigantic pages, don't create more threads than pages. */
+    ret = MIN(ret, numpages);
+    /* Don't start threads to prealloc comparatively little memory. */
+    ret = MIN(ret, MAX(1, hpagesize * numpages / (64 * MiB)));
+
     /* In case sysconf() fails, we fall back to single threaded */
     return ret;
 }
@@ -542,7 +550,7 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
 {
     static gsize initialized = 0;
     MemsetContext context = {
-        .num_threads = get_memset_num_threads(smp_cpus),
+        .num_threads = get_memset_num_threads(hpagesize, numpages, smp_cpus),
     };
     size_t numpages_per_thread, leftover;
     void *(*touch_fn)(void *);
-- 
MST


