Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECFF40044B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:48:44 +0200 (CEST)
Received: from localhost ([::1]:51064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDIx-00013f-K6
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDAx-0002PR-T6
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDAv-00050G-Af
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630690824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XaUg9euKBEDlRFT/nnz+Q21gALG1vnBlLHaDL6QJTcQ=;
 b=gU7okA8Y39aV/xjxMDFn9ONI4qd1tNINX9fbOV6zucvB8mkBBYIPQLlm2UWXo3RasPlwdo
 FjkL6GbJR6b8TQEJetB49HJIlTSr1Wlig3Cxym/plPp4PeqnaUbZtj+xwzY0QX5MAAXnJT
 BC+Gys3ksVeOIdJr5NYRtzzNyBw01RU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-pj-UCA2rMXm588ADd0K8Iw-1; Fri, 03 Sep 2021 13:40:22 -0400
X-MC-Unique: pj-UCA2rMXm588ADd0K8Iw-1
Received: by mail-wr1-f71.google.com with SMTP id
 p18-20020a5d4e12000000b0015940dc586aso1819008wrt.6
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XaUg9euKBEDlRFT/nnz+Q21gALG1vnBlLHaDL6QJTcQ=;
 b=U+8AUnFLtUKg/nHwIppUquGxMJ0aDAQAgVMSMhL1MMQtn2CUyWRDqvFBl5mVgJeJgx
 Co6cLRQ7RPWtnDnAMLxL7j5i9686uOwgEaIDJqxtjs0+X4QZm9XNtSonE3mHxhjnYRLh
 8HTF+u9ahqf2fg9HBaIMWX/2zAyb5QB5rV5PGaphxna+Th+y2Z3wlNU7g/fGhE7n88XT
 /E5j01grKxuXT7HivKiR1k6UOo7fLYtheEdbqAoR5kPxj4emxwjMLXLQAlVvM4MlIAiI
 ZExR3DWEtBiJg6JoAsp8dAlm6K+R2VLuna8D3T4/Punph0VsoqTxSwn57GVI96gYMlwl
 vdHA==
X-Gm-Message-State: AOAM530tOaDbp3WM3unFAEE0MmQdaU5fvD26/aIDtnmZypu2TnFCy2vV
 Dn9TCtnyZ5RNHHGDgcEdUj4VdIYisxEM3qNHeMjLOOYR69qshelWFrLT8NP13nL/1zQG/yuPO2S
 fTrzXSanXapB+hH80cvWzas7b+7JvfJ3fif8Q/8SbXWXgkMMhTwEZr7d5c6m2qJor
X-Received: by 2002:a1c:7304:: with SMTP id d4mr1556634wmb.119.1630690820958; 
 Fri, 03 Sep 2021 10:40:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuh2b/yTn9LcI7SJtmThfV8lu4ZzK4z5+srzcBTRe7ChXflDQOKGqEncXDl1Qg9xBnYc65Aw==
X-Received: by 2002:a1c:7304:: with SMTP id d4mr1556600wmb.119.1630690820684; 
 Fri, 03 Sep 2021 10:40:20 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s12sm5394375wru.41.2021.09.03.10.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:40:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/30] glib-compat: Introduce g_memdup2() wrapper
Date: Fri,  3 Sep 2021 19:39:40 +0200
Message-Id: <20210903174008.749126-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174008.749126-1-philmd@redhat.com>
References: <20210903174008.749126-1-philmd@redhat.com>
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
(Fedora 34 provides GLib 2.68.1) we get:

  hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
  ...

g_memdup() has been updated by g_memdup2() to fix eventual security
issues (size argument is 32-bit and could be truncated / wrapping).
GLib recommends to copy their static inline version of g_memdup2():
https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

Our glib-compat.h provides a comment explaining how to deal with
these deprecated declarations (see commit e71e8cc0355
"glib: enforce the minimum required version and warn about old APIs").

Following this comment suggestion, implement the g_memdup2_qemu()
wrapper to g_memdup2(), and use the safer equivalent inlined when
we are using pre-2.68 GLib.

Reported-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/glib-compat.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/glib-compat.h b/include/glib-compat.h
index 9e95c888f54..915d0156da0 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -68,6 +68,43 @@
  * without generating warnings.
  */
 
+/*
+ * g_memdup2_qemu:
+ * @mem: (nullable): the memory to copy.
+ * @byte_size: the number of bytes to copy.
+ *
+ * Allocates @byte_size bytes of memory, and copies @byte_size bytes into it
+ * from @mem. If @mem is %NULL it returns %NULL.
+ *
+ * This replaces g_memdup(), which was prone to integer overflows when
+ * converting the argument from a #gsize to a #guint.
+ *
+ * This static inline version is a backport of the new public API from
+ * GLib 2.68, kept internal to GLib for backport to older stable releases.
+ * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
+ *
+ * Returns: (nullable): a pointer to the newly-allocated copy of the memory,
+ *          or %NULL if @mem is %NULL.
+ */
+static inline gpointer g_memdup2_qemu(gconstpointer mem, gsize byte_size)
+{
+#if GLIB_CHECK_VERSION(2, 68, 0)
+    return g_memdup2(mem, byte_size);
+#else
+    gpointer new_mem;
+
+    if (mem && byte_size != 0) {
+        new_mem = g_malloc(byte_size);
+        memcpy(new_mem, mem, byte_size);
+    } else {
+        new_mem = NULL;
+    }
+
+    return new_mem;
+#endif
+}
+#define g_memdup2(a) g_memdup2_qemu(a)
+
 #if defined(G_OS_UNIX)
 /*
  * Note: The fallback implementation is not MT-safe, and it returns a copy of
-- 
2.31.1


