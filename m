Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61988664BBF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:59:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH67-0003It-V0; Tue, 10 Jan 2023 11:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5r-00034f-TU
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5q-00052F-Ad
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WJ5zDUpYAW7GvU6+KEdiAVNPtpTVRWeAqKaWxQ4CG+c=;
 b=gTfrkezr1u9l6H+5080EWYaK9mPiwIU183IFoIcMG0NQKaKPyaJhT43Frh0sFawKUtEAmV
 jzkQgPcOk1Bkyard9fcPkH6CDSQRp5f/keWI8Q6uzbncY7rjHIpLybctCSIEjUaVEyRZzV
 aca5PA6/5HcV2pAi5Os1iDy52cSQCq0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-18-X2uBBvPyPbm9hw5oejdbcg-1; Tue, 10 Jan 2023 11:03:10 -0500
X-MC-Unique: X2uBBvPyPbm9hw5oejdbcg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c7-20020a1c3507000000b003d355c13ba8so6478423wma.6
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WJ5zDUpYAW7GvU6+KEdiAVNPtpTVRWeAqKaWxQ4CG+c=;
 b=cU0cN9i6LekpDEENJutdtCgSTHdBzIQxvIxyeYIlWUbc8g44R//t9oLIv4DGHJmAym
 V3vWa9X8R98CmtWLBg5j/4oKnMKKr6I06x290TtZyzt2/ttDECTKFQRS3MzUiJMsbNhA
 cJX6TOMM8u8BnbsIiMQstpqCN0kr3jnCkI76Xwh5vbVfudynTsu5ft4jPb0554QC1K9z
 GNjbgB2ugTPN/oFqx7kKj+7JC1SAeT9ZGHHOUVB6hEaHtaKBbzbdMqigTuUgrMUoSy5y
 aOWl3tVih/uO05HhN0kk2UeJLR4P2T7eHaQSUE3NGlyuY2KZpFi4uGLSphr12CbH6AEq
 bKpQ==
X-Gm-Message-State: AFqh2kohRTeFqKe+3t0H5CToL2BYzXs0oKqAHlcG52HVBsU7z7NvGGim
 BBBxvbcSS4ZC2rmmR16qKmndXuCPi/Y1jBh/iiG7exn4Vfg2aTofmsoEt5MbjoMTHFUF9ce0qLJ
 y8LHaiph7csZXLFqENibt+QCf+y06I6BE9lJhNxp/Lu9fAJIyKC2LochUSVSkTJoQ91I=
X-Received: by 2002:a05:600c:1c97:b0:3d2:274d:be7c with SMTP id
 k23-20020a05600c1c9700b003d2274dbe7cmr50838104wms.19.1673366582470; 
 Tue, 10 Jan 2023 08:03:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsvGpTEAocX1FO5jqi3kMiOP4gMxBHXxIH+oPixCDkWss/DssbQkmQSnIFcJy/HlIPav0CoVw==
X-Received: by 2002:a05:600c:1c97:b0:3d2:274d:be7c with SMTP id
 k23-20020a05600c1c9700b003d2274dbe7cmr50838075wms.19.1673366582141; 
 Tue, 10 Jan 2023 08:03:02 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a1c7708000000b003d9f00c8f07sm7339188wmi.21.2023.01.10.08.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 10/29] hw/xen: use G_GNUC_PRINTF/SCANF for various functions
Date: Tue, 10 Jan 2023 17:02:14 +0100
Message-Id: <20230110160233.339771-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Daniel P. Berrangé <berrange@redhat.com>

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Message-Id: <20221219130205.687815-3-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/xen/xen-bus.c                | 1 +
 hw/xen/xen_pvdev.c              | 1 +
 include/hw/xen/xen-bus-helper.h | 6 ++++--
 include/hw/xen/xen-bus.h        | 3 ++-
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 645a29a5a070..df3f6b9ae00f 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -561,6 +561,7 @@ void xen_device_backend_printf(XenDevice *xendev, const char *key,
     }
 }
 
+G_GNUC_SCANF(3, 4)
 static int xen_device_backend_scanf(XenDevice *xendev, const char *key,
                                     const char *fmt, ...)
 {
diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index 037152f06350..1a5177b35468 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -196,6 +196,7 @@ const char *xenbus_strstate(enum xenbus_state state)
  *  2 == noisy debug messages (logfile only).
  *  3 == will flood your log (logfile only).
  */
+G_GNUC_PRINTF(3, 0)
 static void xen_pv_output_msg(struct XenLegacyDevice *xendev,
                               FILE *f, const char *fmt, va_list args)
 {
diff --git a/include/hw/xen/xen-bus-helper.h b/include/hw/xen/xen-bus-helper.h
index 629a904d1a86..8782f3055086 100644
--- a/include/hw/xen/xen-bus-helper.h
+++ b/include/hw/xen/xen-bus-helper.h
@@ -31,10 +31,12 @@ void xs_node_printf(struct xs_handle *xsh,  xs_transaction_t tid,
 /* Read from node/key unless node is empty, in which case read from key */
 int xs_node_vscanf(struct xs_handle *xsh,  xs_transaction_t tid,
                    const char *node, const char *key, Error **errp,
-                   const char *fmt, va_list ap);
+                   const char *fmt, va_list ap)
+    G_GNUC_SCANF(6, 0);
 int xs_node_scanf(struct xs_handle *xsh,  xs_transaction_t tid,
                   const char *node, const char *key, Error **errp,
-                  const char *fmt, ...);
+                  const char *fmt, ...)
+    G_GNUC_SCANF(6, 7);
 
 /* Watch node/key unless node is empty, in which case watch key */
 void xs_node_watch(struct xs_handle *xsh, const char *node, const char *key,
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 713e763348f4..4d966a2dbbc1 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -94,7 +94,8 @@ void xen_device_frontend_printf(XenDevice *xendev, const char *key,
     G_GNUC_PRINTF(3, 4);
 
 int xen_device_frontend_scanf(XenDevice *xendev, const char *key,
-                              const char *fmt, ...);
+                              const char *fmt, ...)
+    G_GNUC_SCANF(3, 4);
 
 void xen_device_set_max_grant_refs(XenDevice *xendev, unsigned int nr_refs,
                                    Error **errp);
-- 
2.38.1


