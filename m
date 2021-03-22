Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347423452C4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 00:06:58 +0100 (CET)
Received: from localhost ([::1]:40044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOTdR-0003zy-8g
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 19:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTXC-0007CJ-Fd
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTX8-0001Gf-FI
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616454025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7MCCUAv4xuBxw3NN3h6dkjufSelH9In4sztB/9L9w9g=;
 b=Qc0I3DPtxsxu83s1+XT8azJYae6iMw8PwecQxtbbcZIJUEvrw2SYqMf2BiBRsDV9AAJSfB
 ZCzUWzZFw0JvBhoxOuj1VnTaYFohEiLYKAuSgjDid0v4GmAUOGLvo7wto7u1rDDEG5aaIo
 qGPKDM0iXVtG20X/8V1VmOxhC3/kXyw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-R_dxmVTNNgKM59dMNVDVwg-1; Mon, 22 Mar 2021 19:00:24 -0400
X-MC-Unique: R_dxmVTNNgKM59dMNVDVwg-1
Received: by mail-wr1-f72.google.com with SMTP id 75so157538wrl.3
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 16:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7MCCUAv4xuBxw3NN3h6dkjufSelH9In4sztB/9L9w9g=;
 b=HdPyTvrD42Tc6uYlhXqjaj/McOrOr5+BaoNJvDKtIOH5J4crqXjb0XVdzvd7n9PgRU
 5RzgwmlB7k7kFwgRtRQQLrtIK3xQqgjg7pqmp0Yny1oVlgwc1gqPPtsOILN4SPxzTiQE
 opc63ZEK/kR9PgS9qi1OOYB9QqAoRAYbi4clDHi2u0TTTCq9O+FxZLOITKstbmpHF9hG
 JqfAINTaN7pC+VirNKU9B0ThDOUL4DhFMSe7jr6wXh3GdUzcxEkMNVvWx3+YyNJlxQ/E
 oO9V92kVDlGGHFT/hyeWApEp/Z5g4x7O6bRdOMXHtJVUnhcvnrNOWSZz4rI2q6iftBFb
 94wQ==
X-Gm-Message-State: AOAM531TQrOK0BMkh4QqJP6XEyZsLcfrHFx6vrtgJRKnF1Iqo1d6YDQf
 z3L/87SqfKIyt2Fx/JjNU3sTj79/2Dhkgj0Zd8NNfE76k3lYME2lKzqVHM3mWIUkvzr0aafHKLQ
 iCuSW6Z2uLTtGZs4+n9Plry3z0b0/7lw9pyxeYLRg4wcWc+t1MtHyvwJW0RpC
X-Received: by 2002:a05:600c:4f03:: with SMTP id
 l3mr575040wmq.149.1616454022628; 
 Mon, 22 Mar 2021 16:00:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbsiaweEsba1J/eja9tw08n3gbJA/zQB/N65lMg8sVjD33NHIPLsZKbZVnbzJ60JNMCz1SCw==
X-Received: by 2002:a05:600c:4f03:: with SMTP id
 l3mr575029wmq.149.1616454022410; 
 Mon, 22 Mar 2021 16:00:22 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id e13sm24840415wrg.72.2021.03.22.16.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 16:00:22 -0700 (PDT)
Date: Mon, 22 Mar 2021 19:00:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 12/19] acpi: add aml_to_decimalstring() and aml_call6()
 helpers
Message-ID: <20210322225907.541943-13-mst@redhat.com>
References: <20210322225907.541943-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322225907.541943-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it will be used by follow up patches

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210315180102.3008391-5-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/aml-build.h |  3 +++
 hw/acpi/aml-build.c         | 28 ++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 380d3e3924..e652106e26 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -301,6 +301,7 @@ Aml *aml_arg(int pos);
 Aml *aml_to_integer(Aml *arg);
 Aml *aml_to_hexstring(Aml *src, Aml *dst);
 Aml *aml_to_buffer(Aml *src, Aml *dst);
+Aml *aml_to_decimalstring(Aml *src, Aml *dst);
 Aml *aml_store(Aml *val, Aml *target);
 Aml *aml_and(Aml *arg1, Aml *arg2, Aml *dst);
 Aml *aml_or(Aml *arg1, Aml *arg2, Aml *dst);
@@ -323,6 +324,8 @@ Aml *aml_call3(const char *method, Aml *arg1, Aml *arg2, Aml *arg3);
 Aml *aml_call4(const char *method, Aml *arg1, Aml *arg2, Aml *arg3, Aml *arg4);
 Aml *aml_call5(const char *method, Aml *arg1, Aml *arg2, Aml *arg3, Aml *arg4,
                Aml *arg5);
+Aml *aml_call6(const char *method, Aml *arg1, Aml *arg2, Aml *arg3, Aml *arg4,
+               Aml *arg5, Aml *arg6);
 Aml *aml_gpio_int(AmlConsumerAndProducer con_and_pro,
                   AmlLevelAndEdge edge_level,
                   AmlActiveHighAndLow active_level, AmlShared shared,
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index a2cd7a5830..d33ce8954a 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -634,6 +634,19 @@ Aml *aml_to_buffer(Aml *src, Aml *dst)
     return var;
 }
 
+/* ACPI 2.0a: 17.2.4.4 Type 2 Opcodes Encoding: DefToDecimalString */
+Aml *aml_to_decimalstring(Aml *src, Aml *dst)
+{
+    Aml *var = aml_opcode(0x97 /* ToDecimalStringOp */);
+    aml_append(var, src);
+    if (dst) {
+        aml_append(var, dst);
+    } else {
+        build_append_byte(var->buf, 0x00 /* NullNameOp */);
+    }
+    return var;
+}
+
 /* ACPI 1.0b: 16.2.5.4 Type 2 Opcodes Encoding: DefStore */
 Aml *aml_store(Aml *val, Aml *target)
 {
@@ -835,6 +848,21 @@ Aml *aml_call5(const char *method, Aml *arg1, Aml *arg2, Aml *arg3, Aml *arg4,
     return var;
 }
 
+/* helper to call method with 5 arguments */
+Aml *aml_call6(const char *method, Aml *arg1, Aml *arg2, Aml *arg3, Aml *arg4,
+               Aml *arg5, Aml *arg6)
+{
+    Aml *var = aml_alloc();
+    build_append_namestring(var->buf, "%s", method);
+    aml_append(var, arg1);
+    aml_append(var, arg2);
+    aml_append(var, arg3);
+    aml_append(var, arg4);
+    aml_append(var, arg5);
+    aml_append(var, arg6);
+    return var;
+}
+
 /*
  * ACPI 5.0: 6.4.3.8.1 GPIO Connection Descriptor
  * Type 1, Large Item Name 0xC
-- 
MST


