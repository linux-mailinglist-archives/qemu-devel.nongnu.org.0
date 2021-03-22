Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F60A344ABE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:12:05 +0100 (CET)
Received: from localhost ([::1]:44384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lON9w-0001Tv-DI
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjw-0005NO-9d
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:45:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjt-000775-TC
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:45:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616427909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7MCCUAv4xuBxw3NN3h6dkjufSelH9In4sztB/9L9w9g=;
 b=AXJyVldDgms0qqpSwOiSdXz/Ybo6N3ABaXhrbRPBXgL/K3zELqABGmuL9mSeAFMcTVrCHf
 mTfIrBw4AKqVOIC5Sc3AAf9iQ0h5f+jWbz9Z0DLdtVzR+Yy3TwJ8TRJEd8/lhQ3IRfzPq/
 TRpxMjTrj3rUtnRuoDTkYNpKmPdaJn8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-6ooP0kVVNr29O6hUmit4ew-1; Mon, 22 Mar 2021 11:45:07 -0400
X-MC-Unique: 6ooP0kVVNr29O6hUmit4ew-1
Received: by mail-wr1-f72.google.com with SMTP id t14so8950708wrx.12
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7MCCUAv4xuBxw3NN3h6dkjufSelH9In4sztB/9L9w9g=;
 b=aGiFpRzsQ1W9vWrGZE6/4Woy0bMIUyzLc7XCe/DVe1MdyDpmWFXZ0khgcfvd2EcsF1
 JhkXZsoLp4FhX4qk/fOLLT2bulTxUuGH8uMm9gbH9qeqhvFdefwjNH5YiGAaaaGvY008
 6f+JWxgqrfnQLBy1hWsi68Ehaq7yUhJJuG7ef6Ses/h2fNB5+S3I4Op8cUZxY/gfSiuD
 4zFD30WM8IEQ2iDhKZDO0Yjj7BWryRAmJ1nn7ArQCJ4y8lV9MsqAEUupdg8Mw9gswbnL
 n/WZAk+gttqH9iq2qm+UAus74yuvN4JCppCuNVbj6z+MgtkmX3G1JM3lRy4g+0PLJisg
 /1Pw==
X-Gm-Message-State: AOAM531MDMnmwsGhlHAv77wxEcIC3FNcV57/JLtk6HW5SonYDbnvrJ5c
 HwHOn4TG+yW8v+OuSjsVS4aoxAwFCAuNpXFbd1QszpVLpWDerzbt9qLY58WXqxcH06mzJAsFTnP
 iFUFq+F803g4gQZ6nUJ/IiZD4P+760rv7BEvHE/Syyoicv91pfvWOIcmUMJcC
X-Received: by 2002:adf:f148:: with SMTP id y8mr141597wro.107.1616427905640;
 Mon, 22 Mar 2021 08:45:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH6Cght1cmcE/SpiWAWG8AF1jE44Mzh2mLSAk4Pvu96ewhIPtu+hqEvxBFS2788J/1GBSdrQ==
X-Received: by 2002:adf:f148:: with SMTP id y8mr141583wro.107.1616427905415;
 Mon, 22 Mar 2021 08:45:05 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id d13sm20885391wro.23.2021.03.22.08.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:45:05 -0700 (PDT)
Date: Mon, 22 Mar 2021 11:45:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/20] acpi: add aml_to_decimalstring() and aml_call6() helpers
Message-ID: <20210322154417.524229-14-mst@redhat.com>
References: <20210322154417.524229-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322154417.524229-1-mst@redhat.com>
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


