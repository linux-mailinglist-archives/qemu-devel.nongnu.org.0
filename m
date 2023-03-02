Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03776A829B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:49:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi9G-0004Hj-4A; Thu, 02 Mar 2023 07:35:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7D-0002uJ-Fa
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi79-0003ax-9k
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OrSLbO7tKD+zw7vGTWwSeKxeINeDggwd37wt5H4Kdrg=;
 b=TjCi7Z5BrMKDLMAr+8Gan65nC2JNgvcL6QL0vODRIA6e9yXxP6reCeHT6HSiCPIFKRbfdT
 ekCfJA4E8GHZ831LAaBCFfqSBP5qVguFzL/9RVJPMXqauxwpvIvX9+5aVf0dCZ974eJP9s
 4Ilpaw9HKBepNrT0ca9Z+dDIyYrIbLo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-R9dPZM5VNh6639hx4vob0g-1; Thu, 02 Mar 2023 07:32:49 -0500
X-MC-Unique: R9dPZM5VNh6639hx4vob0g-1
Received: by mail-wm1-f72.google.com with SMTP id
 k36-20020a05600c1ca400b003eac86e4387so1190577wms.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OrSLbO7tKD+zw7vGTWwSeKxeINeDggwd37wt5H4Kdrg=;
 b=yEt+02hnVBwvsNOSmx+bP8M2a5lMSfDv8wZwpHTftIUNOuzPdJcCDRAzcTJ6VOliAJ
 aaEzPPJFDo9AzhRUV3XT3M8jAj8HXXnH7g7HvXYTn/8NyIQH2M2YfKX6WE46iFJzHLrr
 wMHSOlmoU29g7VR0svg46U9kX0SWTOpT0evzP9kqbTNKQQeiPslmXCor2OhSewW/p9ie
 4Q7TN0mkf1YnELxrEDZY/RcNzROTztwIFu3trE5Ad/nWqIGrklvLB/CsOaa5SYatd4Ea
 YbhfRdC/TvjZ+SnGgs1ztyh9t2vqTKs0etXGkgI5dH7wCgZ6rAy5YBM3hvFTHverFNjw
 ibRQ==
X-Gm-Message-State: AO0yUKWrv9FsO6DZi04bmd43A5LIS7+oDD9UMFkfc9coQQ7KCcR+T0RT
 SvOU7nXCBdGjJrU8WT06ZQh9PO5ptmNKaa/jzxIIVnlY7jZdDw/r4llisNZZeKP/I4qxOBws/0c
 7/rifAo3Xl867dE3bqC5f+r35evJYNst7EI9ztAz3Hb0VVjxn2IYve7IQ4CX3lTSRrD4LWM6CJ8
 o=
X-Received: by 2002:a05:600c:3088:b0:3eb:3c76:c241 with SMTP id
 g8-20020a05600c308800b003eb3c76c241mr7679430wmn.13.1677760367763; 
 Thu, 02 Mar 2023 04:32:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8cpwXqaMKad2LN0GSH6d6gqf+Kz9aDjF5cpD2+KEuvataC04pGdc42kOv7NOTBs6GoVobiMA==
X-Received: by 2002:a05:600c:3088:b0:3eb:3c76:c241 with SMTP id
 g8-20020a05600c308800b003eb3c76c241mr7679412wmn.13.1677760367492; 
 Thu, 02 Mar 2023 04:32:47 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c2f0f00b003eae73f0fc1sm2934103wmn.18.2023.03.02.04.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 46/62] hw/xen: Implement GNTTABOP_query_size
Date: Thu,  2 Mar 2023 13:30:13 +0100
Message-Id: <20230302123029.153265-47-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_gnttab.c  | 19 +++++++++++++++++++
 hw/i386/kvm/xen_gnttab.h  |  2 ++
 target/i386/kvm/xen-emu.c | 16 +++++++++++++++-
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
index b54a94e2bd54..1e691ded326f 100644
--- a/hw/i386/kvm/xen_gnttab.c
+++ b/hw/i386/kvm/xen_gnttab.c
@@ -211,3 +211,22 @@ int xen_gnttab_get_version_op(struct gnttab_get_version *get)
     get->version = 1;
     return 0;
 }
+
+int xen_gnttab_query_size_op(struct gnttab_query_size *size)
+{
+    XenGnttabState *s = xen_gnttab_singleton;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (size->dom != DOMID_SELF && size->dom != xen_domid) {
+        size->status = GNTST_bad_domain;
+        return 0;
+    }
+
+    size->status = GNTST_okay;
+    size->nr_frames = s->nr_frames;
+    size->max_nr_frames = s->max_frames;
+    return 0;
+}
diff --git a/hw/i386/kvm/xen_gnttab.h b/hw/i386/kvm/xen_gnttab.h
index 79579677ba96..3bdbe9619147 100644
--- a/hw/i386/kvm/xen_gnttab.h
+++ b/hw/i386/kvm/xen_gnttab.h
@@ -17,7 +17,9 @@ int xen_gnttab_map_page(uint64_t idx, uint64_t gfn);
 
 struct gnttab_set_version;
 struct gnttab_get_version;
+struct gnttab_query_size;
 int xen_gnttab_set_version_op(struct gnttab_set_version *set);
 int xen_gnttab_get_version_op(struct gnttab_get_version *get);
+int xen_gnttab_query_size_op(struct gnttab_query_size *size);
 
 #endif /* QEMU_XEN_GNTTAB_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index d49b6117f1d2..3b46cab1dae0 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -1207,7 +1207,21 @@ static bool kvm_xen_hcall_gnttab_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         }
         break;
     }
-    case GNTTABOP_query_size:
+    case GNTTABOP_query_size: {
+        struct gnttab_query_size size;
+
+        qemu_build_assert(sizeof(size) == 16);
+        if (kvm_copy_from_gva(cs, arg, &size, sizeof(size))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_gnttab_query_size_op(&size);
+        if (!err && kvm_copy_to_gva(cs, arg, &size, sizeof(size))) {
+            err = -EFAULT;
+        }
+        break;
+    }
     case GNTTABOP_setup_table:
     case GNTTABOP_copy:
     case GNTTABOP_map_grant_ref:
-- 
2.39.1


