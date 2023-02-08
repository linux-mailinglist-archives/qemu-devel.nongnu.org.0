Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C482468F990
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 22:14:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPrkW-0000my-5P; Wed, 08 Feb 2023 16:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPrkU-0000mR-5M
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:13:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPrkS-0007xG-8d
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675890779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tS9+7/8O/6fAFa8QO010Xn8p8THh7DB9ISxGEslYQs4=;
 b=JoojK9sy4aSTRHklrRWHQIFn90e77dC4r7XxzyAm/1hTJqOFTOY32Hdbc2d6EQY4T3ZubO
 0jzfwk1B+dwqbalV00ewF0aLol6qzi3SL+H2kYbACYZ7qKjS14aRh1/xGfCrGlYY4mWskI
 h6cCprvxzTQsxOVrejNakQEHdxtXD9Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-tlwhjAENOAO5t1E-Dya5vQ-1; Wed, 08 Feb 2023 16:12:52 -0500
X-MC-Unique: tlwhjAENOAO5t1E-Dya5vQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k17-20020a05600c1c9100b003dd41ad974bso38019wms.3
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 13:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tS9+7/8O/6fAFa8QO010Xn8p8THh7DB9ISxGEslYQs4=;
 b=Awri4bPm48XYGnicsTJQfrii7SwcPaE/outl1FfLWI6xfbl0DnM1i2Kpt76urlaOg/
 FNrgfz97VSLovn4FuzgswX5DZbxe3sRBzWNpmfFkvHchgCKnb5glYmbYdievsPHIQ8nV
 jQqLga4GPkjQJLngNv+GcXIzk0xtImCHWJVaR8oaIcy8dmynqcPf7fXtjIaCZm/UG+Zc
 lngeZhPce0aRBW1K3dB9QGebM4veHdn12zx6i6v3ai/u7n8wfRzwNI0efMF0aOdqbSLM
 eI2Bv1WT6eNEoZunGJY+cvgQ+NsiAEnf8j+tAMf3LJQ6pocXVDKRqmCeb9weFqkXlZC3
 oCKw==
X-Gm-Message-State: AO0yUKVD+WEHo/l58wovJhTDEzoLY6N9l/agIuWYz9U05CaDFFupwtdo
 LeI4gj1RDZyjYP16wS+/jQL58ZNFTgoYAoaP5eVSw7ZuS83l6oDMcloHgYmZ4HwkpYBM7X+lyuO
 CNl7SM8QKgAdTExU/MBRewWZ5AYlzPsh0Pe5ck3GEQTkwYRftoCRRJuWH1K8cyMTTIjEk
X-Received: by 2002:a05:600c:747:b0:3dc:438a:c381 with SMTP id
 j7-20020a05600c074700b003dc438ac381mr7510807wmn.28.1675890770931; 
 Wed, 08 Feb 2023 13:12:50 -0800 (PST)
X-Google-Smtp-Source: AK7set9iMoFTHiyVDA/tXK+cM7w+o64RXFY6qMkpfJBFLnhKSPwfd/l/vFf31/EdopCJ5I2wdU0tew==
X-Received: by 2002:a05:600c:747:b0:3dc:438a:c381 with SMTP id
 j7-20020a05600c074700b003dc438ac381mr7510779wmn.28.1675890770641; 
 Wed, 08 Feb 2023 13:12:50 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 j37-20020a05600c1c2500b003daf6e3bc2fsm7197641wms.1.2023.02.08.13.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 13:12:50 -0800 (PST)
Date: Wed, 8 Feb 2023 16:12:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Biggers <ebiggers@kernel.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH RFC 5/7] Revert "x86: use typedef for SetupData struct"
Message-ID: <20230208211212.41951-6-mst@redhat.com>
References: <20230208211212.41951-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208211212.41951-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

This reverts commit eebb38a5633a77f5fa79d6486d5b2fcf8fbe3c07.

Fixes: eebb38a563 ("x86: use typedef for SetupData struct")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/x86.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 32f37ab7c2..76b12108b4 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -657,12 +657,12 @@ DeviceState *ioapic_init_secondary(GSIState *gsi_state)
     return dev;
 }
 
-typedef struct SetupData {
+struct setup_data {
     uint64_t next;
     uint32_t type;
     uint32_t len;
     uint8_t data[];
-} __attribute__((packed)) SetupData;
+} __attribute__((packed));
 
 
 /*
@@ -803,7 +803,7 @@ void x86_load_linux(X86MachineState *x86ms,
     FILE *f;
     char *vmode;
     MachineState *machine = MACHINE(x86ms);
-    SetupData *setup_data;
+    struct setup_data *setup_data;
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     const char *dtb_filename = machine->dtb;
@@ -1086,11 +1086,11 @@ void x86_load_linux(X86MachineState *x86ms,
         }
 
         setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
-        kernel_size = setup_data_offset + sizeof(SetupData) + dtb_size;
+        kernel_size = setup_data_offset + sizeof(struct setup_data) + dtb_size;
         kernel = g_realloc(kernel, kernel_size);
 
 
-        setup_data = (SetupData *)(kernel + setup_data_offset);
+        setup_data = (struct setup_data *)(kernel + setup_data_offset);
         setup_data->next = cpu_to_le64(first_setup_data);
         first_setup_data = prot_addr + setup_data_offset;
         setup_data->type = cpu_to_le32(SETUP_DTB);
@@ -1101,9 +1101,9 @@ void x86_load_linux(X86MachineState *x86ms,
 
     if (!legacy_no_rng_seed) {
         setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
-        kernel_size = setup_data_offset + sizeof(SetupData) + RNG_SEED_LENGTH;
+        kernel_size = setup_data_offset + sizeof(struct setup_data) + RNG_SEED_LENGTH;
         kernel = g_realloc(kernel, kernel_size);
-        setup_data = (SetupData *)(kernel + setup_data_offset);
+        setup_data = (struct setup_data *)(kernel + setup_data_offset);
         setup_data->next = cpu_to_le64(first_setup_data);
         first_setup_data = prot_addr + setup_data_offset;
         setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
-- 
MST


