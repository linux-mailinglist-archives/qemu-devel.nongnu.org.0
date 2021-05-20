Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C4138AA46
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 13:12:21 +0200 (CEST)
Received: from localhost ([::1]:38444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljgbE-0002IB-Ba
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 07:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgYd-0007xx-MT
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:09:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgYb-0004T8-Uz
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621508977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BIUKBelUrGAg7JFPfqNH9aSjg1FuXfUME+/SSVTybmA=;
 b=Ads1KW9jf9UgrIJmirUn3zN7HPJfZ5ueJX7QxY6xv6GAxf4+6ZUCM+On44IQMEJsteOeco
 TplGyI/JF8kn8EFRxlGQfSnAIowyYSHsrfLSV+7ZDUYaPGF7WgZfx9dV7bZ9VgkcxWwwr1
 HVhd1CP/v6Lt/kXk2rQH7c5q1SwAlUE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-g_FFBUT2Pa-3SQk7IAGPzg-1; Thu, 20 May 2021 07:09:36 -0400
X-MC-Unique: g_FFBUT2Pa-3SQk7IAGPzg-1
Received: by mail-wr1-f71.google.com with SMTP id
 q15-20020adfc50f0000b0290111f48b865cso5029323wrf.4
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 04:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BIUKBelUrGAg7JFPfqNH9aSjg1FuXfUME+/SSVTybmA=;
 b=AmxfUdEDpbguboRsqF+jDJMavSSNJRCp2AGTmoch+UPq9h0C/zM4WYxzTQ0vrbkhOi
 wsW3VxV/jHAB0zQsYJ6H+ff8trA8/WyZv1hXSD8APXcWW2DOrTa9NzOrSXtiaUY2ycph
 /Q0GFaOmw2pqqim/hu/oDW/uICEK3RgqdBuQHDAI/MuRuhNh+KIxMl6tF4zlW0GaNEgy
 ML1ZzdEiyRmfv/sOgy2bU3vYNFde1UQW0c45OycSdvaUIq1DKbAZrL+NSJlXl9D0VmNw
 dKvBJwEOz5GKXo+cBDsjVOBuk/dOeE94tqSag87IYQt1SoZGWoKXU1JKUK23df5kX2Wc
 o4Ig==
X-Gm-Message-State: AOAM532HUL7y6pfX5NgVQeNBHwGMi0Fun04/Zzbvh3h08o4dkesss4gB
 CJfyhnoDpmdlGqYUl1Y9YBwSINtqfCXpCJmPOE+MEQIlgkj3qmCvHgb4BpjIMEaY2eqsx2y0+78
 pk0GM/Tn2iP1u9SjFPdQ6JiXXTBuQ0V9N6l5l2ZJqY+HJYwYsqp5ZFuMh4+aRFKHq
X-Received: by 2002:a5d:62c7:: with SMTP id o7mr3673020wrv.372.1621508974757; 
 Thu, 20 May 2021 04:09:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEUAwnlIZe3JtCq7uoFHBWXQoJs3UxNmzzOa9mrg8Z+HtdwTbQUbXUK7S5h4KZbQr5i0Yq5A==
X-Received: by 2002:a5d:62c7:: with SMTP id o7mr3672987wrv.372.1621508974526; 
 Thu, 20 May 2021 04:09:34 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c6sm2750046wru.50.2021.05.20.04.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:09:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 03/12] exec/memory_ldst: Return MEMTX_UNALIGNED_ERROR for
 unaligned addresses
Date: Thu, 20 May 2021 13:09:10 +0200
Message-Id: <20210520110919.2483190-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210520110919.2483190-1-philmd@redhat.com>
References: <20210520110919.2483190-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All address_space internal handlers have the /* warning: addr
must be aligned */ comment, so we don't expect any caller to
pass unaligned addresses.

Now than we added the MemTxAttrs.aligned attribute, callers
might want to pass unaligned addresses. In case they do, be
ready and return MEMTX_UNALIGNED_ERROR.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 memory_ldst.c.inc | 49 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/memory_ldst.c.inc b/memory_ldst.c.inc
index 84b868f2946..efeb545479e 100644
--- a/memory_ldst.c.inc
+++ b/memory_ldst.c.inc
@@ -32,6 +32,13 @@ static inline uint32_t glue(address_space_ldl_internal, SUFFIX)(ARG1_DECL,
     MemTxResult r;
     bool release_lock = false;
 
+    if (unlikely(!QEMU_IS_ALIGNED(addr, sizeof(uint32_t)))) {
+        if (result) {
+            *result = MEMTX_UNALIGNED_ERROR;
+        }
+        return (uint32_t)-1; /* XXX */
+    }
+
     RCU_READ_LOCK();
     mr = TRANSLATE(addr, &addr1, &l, false, attrs);
     if (l < 4 || !memory_access_is_direct(mr, false)) {
@@ -101,6 +108,13 @@ static inline uint64_t glue(address_space_ldq_internal, SUFFIX)(ARG1_DECL,
     MemTxResult r;
     bool release_lock = false;
 
+    if (unlikely(!QEMU_IS_ALIGNED(addr, sizeof(uint64_t)))) {
+        if (result) {
+            *result = MEMTX_UNALIGNED_ERROR;
+        }
+        return (uint64_t)-1; /* XXX */
+    }
+
     RCU_READ_LOCK();
     mr = TRANSLATE(addr, &addr1, &l, false, attrs);
     if (l < 8 || !memory_access_is_direct(mr, false)) {
@@ -205,6 +219,13 @@ static inline uint16_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
     MemTxResult r;
     bool release_lock = false;
 
+    if (unlikely(!QEMU_IS_ALIGNED(addr, sizeof(uint16_t)))) {
+        if (result) {
+            *result = MEMTX_UNALIGNED_ERROR;
+        }
+        return (uint16_t)-1; /* XXX */
+    }
+
     RCU_READ_LOCK();
     mr = TRANSLATE(addr, &addr1, &l, false, attrs);
     if (l < 2 || !memory_access_is_direct(mr, false)) {
@@ -275,6 +296,13 @@ void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DECL,
     uint8_t dirty_log_mask;
     bool release_lock = false;
 
+    if (unlikely(!QEMU_IS_ALIGNED(addr, sizeof(uint32_t)))) {
+        if (result) {
+            *result = MEMTX_UNALIGNED_ERROR;
+        }
+        return;
+    }
+
     RCU_READ_LOCK();
     mr = TRANSLATE(addr, &addr1, &l, true, attrs);
     if (l < 4 || !memory_access_is_direct(mr, true)) {
@@ -312,6 +340,13 @@ static inline void glue(address_space_stl_internal, SUFFIX)(ARG1_DECL,
     MemTxResult r;
     bool release_lock = false;
 
+    if (unlikely(!QEMU_IS_ALIGNED(addr, sizeof(uint32_t)))) {
+        if (result) {
+            *result = MEMTX_UNALIGNED_ERROR;
+        }
+        return;
+    }
+
     RCU_READ_LOCK();
     mr = TRANSLATE(addr, &addr1, &l, true, attrs);
     if (l < 4 || !memory_access_is_direct(mr, true)) {
@@ -408,6 +443,13 @@ static inline void glue(address_space_stw_internal, SUFFIX)(ARG1_DECL,
     MemTxResult r;
     bool release_lock = false;
 
+    if (unlikely(!QEMU_IS_ALIGNED(addr, sizeof(uint16_t)))) {
+        if (result) {
+            *result = MEMTX_UNALIGNED_ERROR;
+        }
+        return;
+    }
+
     RCU_READ_LOCK();
     mr = TRANSLATE(addr, &addr1, &l, true, attrs);
     if (l < 2 || !memory_access_is_direct(mr, true)) {
@@ -472,6 +514,13 @@ static void glue(address_space_stq_internal, SUFFIX)(ARG1_DECL,
     MemTxResult r;
     bool release_lock = false;
 
+    if (unlikely(!QEMU_IS_ALIGNED(addr, sizeof(uint64_t)))) {
+        if (result) {
+            *result = MEMTX_UNALIGNED_ERROR;
+        }
+        return;
+    }
+
     RCU_READ_LOCK();
     mr = TRANSLATE(addr, &addr1, &l, true, attrs);
     if (l < 8 || !memory_access_is_direct(mr, true)) {
-- 
2.26.3


