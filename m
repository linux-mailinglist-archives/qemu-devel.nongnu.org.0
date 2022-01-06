Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9F14865D8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:12:44 +0100 (CET)
Received: from localhost ([::1]:49272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TVT-00035E-Bg
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:12:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sek-0005KH-MP
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Seg-0000xx-MY
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4akHXGYHIwd7HNeqwa3gMQKaZ7VYtAKPZ8TAtHqI2Gc=;
 b=MDIUKBX+9iDv8lADjowhdJFpMS7Luz9ms6FAtGL2ukoBxb7hwZhEQerOUExMaQOfereClz
 zlKxcKmALaF1RemyNNn9Aa2sFJDBf6XDlGAFSeE9ct2Ytx30sO4JQ7RU2+mTxtu5JUTZC/
 dpOgJfsOv0I/Q9Hflm9jBosT501y0Wg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-moZtS6feOFiot9BTuS9TJA-1; Thu, 06 Jan 2022 08:17:51 -0500
X-MC-Unique: moZtS6feOFiot9BTuS9TJA-1
Received: by mail-ed1-f71.google.com with SMTP id
 g11-20020a056402090b00b003f8fd1ac475so1950105edz.1
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:17:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4akHXGYHIwd7HNeqwa3gMQKaZ7VYtAKPZ8TAtHqI2Gc=;
 b=KYgH8mbdh4VcrM2hOSAY0VzpUDwZrsGnYASK6KQncdbIbmbWEecOEWBtHDHTOl0rya
 4C+A9EtIN20jDG5AEG/N5Y32yaDIibXmOy95vxasoQjqXQerS63b60/HomAb2dZ8uwbM
 XDsiS7drhQJVsd+VqmL3rfSY0JCrWOGXUK0cK0p962zYNmwt1lsPVPnmpHKAOtv/RG0d
 tezbaAV6fyqo+EuYDhRb3jF9FPjKCddSw2wrb6Ir5DaXkCr9AZlasX+4K5AzF9iOXfWh
 cLm938lygNn5kUcY87AeMHsiiMSbqzysKe1YE3JOk4KcTGYduq1SWcj/3xa56XDbBgqq
 G1Ig==
X-Gm-Message-State: AOAM533a9fYfw9xs7ElDO0109T3JuS1Zq6/6L9H9+WRUhUOKA5BB/olQ
 uLZOsOfsge3Cn+1BRtLdk/Q//LCnGQnmBd2K7NIcNHxkwFRHJnjFkSc0N7lAAg1jQ/XwKUwq3Bn
 UAp3Ecv+Wh/kvZEsAt59v4vjLdUFcOb4FDN+BCUALFJ1WMJGQADAmSNXXgOE1
X-Received: by 2002:a17:907:6d20:: with SMTP id
 sa32mr47862757ejc.35.1641475068715; 
 Thu, 06 Jan 2022 05:17:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwf0s9I5636gvk8wvszIwThJZ2kamXAkNntU11D8XvCCs40iQHj+DVLFyuPlYJKnXdydjH5NA==
X-Received: by 2002:a17:907:6d20:: with SMTP id
 sa32mr47862735ejc.35.1641475068439; 
 Thu, 06 Jan 2022 05:17:48 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id dz8sm717935edb.29.2022.01.06.05.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:17:48 -0800 (PST)
Date: Thu, 6 Jan 2022 08:17:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/52] util/oslib-posix: Don't create too many threads with
 small memory or little pages
Message-ID: <20220106131534.423671-33-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


