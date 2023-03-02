Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720846A823C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:31:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi5O-0007Yo-T2; Thu, 02 Mar 2023 07:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5G-0007RV-Kw
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5E-0002rM-Vd
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PuO2tPm3S38XBWHvi8ppp01n0hbysJkpz9K9/a1K8AU=;
 b=OEQKcID897Tuo0dvxiOjtAynQrBzrIYsyzVmoRvM2hGgYcXOpavVJMDR7xYXDRx69ewaka
 /QiAIPlKoODz8h60NPtNfCnXCHCuiVRSEGqx/o2//vtQPHBzNmRqGjhe3UBD9TIHIT11s0
 DT+6rfZ7ptRQTVt/pnYIgoYG0I5/CDQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-VYIsNn6VNRm-2ysKebIzew-1; Thu, 02 Mar 2023 07:30:44 -0500
X-MC-Unique: VYIsNn6VNRm-2ysKebIzew-1
Received: by mail-wr1-f71.google.com with SMTP id
 i18-20020a05600011d200b002c94d861113so3141544wrx.16
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:30:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PuO2tPm3S38XBWHvi8ppp01n0hbysJkpz9K9/a1K8AU=;
 b=dlTJkdsxhXOrPGWayWIOxjHX5fMthlR66ctKeZf6XmpxKxKYkZF4Ecv8qJxwBds0cg
 7Dn4LPjmFQIGeEZhwa0wAK+QwbOAznmKfjwA4UNJkqldKOSnNxRx8fhFOcuI6Z5q+Jxv
 20Q5dogiUcvId7hn98Y0r5hH76hZfHdx7ov+e2rQKqqRz3yND/OkI0cECChVAgvMfSqM
 JDbYCtU0obsBYlxp0WVDPk7v4xoOvxJ8e1MC8SKBQbi/8GhcZ3IpDtlNMrOJUwiurjEA
 l70Tx0/8o8Ru1hDBZd0tTNGwZNXJraBPF7ubCDnblbjWh8goVewlHrewC/p/6ZtATZaJ
 6TXQ==
X-Gm-Message-State: AO0yUKWkxuL/CnkTkfVIQ32m4zQcQ2HmKpq/DGCMHAenuVjG15PkQ9bS
 RfjWuHw9S4dEQDJjjRU4p9B2k+NXsWJwBw6QgwgAZAS0CE7t4Qn28HXlR6ROzxJddcXuQNA9WxI
 Tvby+QCSnOlKSUtdnIYA1pgkKO91L107+eaAFQM8GU+V6qzFFC+3xsq0ejL2cO+7V+D5ZsRl1q9
 Y=
X-Received: by 2002:a05:600c:3b13:b0:3eb:38a2:2bbc with SMTP id
 m19-20020a05600c3b1300b003eb38a22bbcmr7532185wms.7.1677760243093; 
 Thu, 02 Mar 2023 04:30:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9hYPN4dcdPn2W29KRLhhN75SoPjcf1iyyLYqBL3udoZksmxWHiF384F9S6nsdiMTXc50WcXg==
X-Received: by 2002:a05:600c:3b13:b0:3eb:38a2:2bbc with SMTP id
 m19-20020a05600c3b1300b003eb38a22bbcmr7532169wms.7.1677760242816; 
 Thu, 02 Mar 2023 04:30:42 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a05600c458e00b003e21ba8684dsm3027244wmo.26.2023.03.02.04.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:30:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 03/62] xen: Add XEN_DISABLED mode and make it default
Date: Thu,  2 Mar 2023 13:29:30 +0100
Message-Id: <20230302123029.153265-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

From: David Woodhouse <dwmw@amazon.co.uk>

Also set XEN_ATTACH mode in xen_init() to reflect the truth; not that
anyone ever cared before. It was *only* ever checked in xen_init_pv()
before.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 accel/xen/xen-all.c  | 2 ++
 include/hw/xen/xen.h | 5 +++--
 softmmu/globals.c    | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index c1b697a8bda1..e85e4aeba51f 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -171,6 +171,8 @@ static int xen_init(MachineState *ms)
      * opt out of system RAM being allocated by generic code
      */
     mc->default_ram_id = NULL;
+
+    xen_mode = XEN_ATTACH;
     return 0;
 }
 
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 4d412fd4b266..03983939f92a 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -22,8 +22,9 @@
 
 /* xen-machine.c */
 enum xen_mode {
-    XEN_EMULATE = 0,  // xen emulation, using xenner (default)
-    XEN_ATTACH        // attach to xen domain created by libxl
+    XEN_DISABLED = 0, /* xen support disabled (default) */
+    XEN_ATTACH,       /* attach to xen domain created by libxl */
+    XEN_EMULATE,      /* emulate Xen within QEMU */
 };
 
 extern uint32_t xen_domid;
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 527edbefdd07..0a4405614e7f 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -63,5 +63,5 @@ QemuUUID qemu_uuid;
 bool qemu_uuid_set;
 
 uint32_t xen_domid;
-enum xen_mode xen_mode = XEN_EMULATE;
+enum xen_mode xen_mode = XEN_DISABLED;
 bool xen_domid_restrict;
-- 
2.39.1


