Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA8A6A7CA4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:29:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeFw-0003P8-5X; Thu, 02 Mar 2023 03:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFD-00028A-R3
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:24:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFC-0001yR-Au
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zPrRco/19b/UwmPHQphBosqDOoUGzra1uvANevhWyQY=;
 b=hInC7zWU9fR0SkwnG3evd8Brztu1WqSsvy785tWiY+zOwLk8i/G2tyu5LE+SRlcZQ3fctU
 vW2wWbZkKjfyFcUIeYDVI3HDyTofXojvG8Co72CRxPKTi9z0WEmhQuWf7FnP+mPi84UdEO
 X6jnTTr1jYxifbFzvyL3bmbMmiYxmNY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-ceIDXq5JPLCZpfLuOkDbFQ-1; Thu, 02 Mar 2023 03:24:52 -0500
X-MC-Unique: ceIDXq5JPLCZpfLuOkDbFQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 o15-20020a05600002cf00b002c54a27803cso3050129wry.22
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:24:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745490;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zPrRco/19b/UwmPHQphBosqDOoUGzra1uvANevhWyQY=;
 b=RPo6D16wsD2zllUNtKVgnf+c/qYFLPS41BWYmDIqSi6AfPDZTtsL92bUYMd/8suPe8
 vzY9gMPClOH3vno5Y7yRd6iR5juTxxNow2OpIO2fhxkBNuoTwiwjD0E2TfIEGInxlQzd
 pqYL7Hgr0d3g03VF3U5+2KqenuhI054kTeGWvHH1BnkTl8Z8Dod27AJYqn0zKdxb+fY7
 QDwqZpfLVDR0CQ0JmFxh5Kd+Nzy2RRDPQ64eWX7qG06/sphHRc4D6dhAWil74fqvWZZO
 yIZHCCzKuKtOu6zcT+hawpIhKKp8fzIeKQikNke9uc9pwh8ATcGDVPVcwo44v3GkSp2t
 Qjdg==
X-Gm-Message-State: AO0yUKW+ZG4HGCwN3+6e1EowpkWTFhM0U1wsWMW1GR0D86rc/p5zlBjh
 rZex/IX/77aBJsg+BWUhNkQ95O1y1x0ihDs8sh26msXSAtofUXqdAG+8QQacLRrQDeCByuD6ZMt
 /6w9/HOs8ggrVweVXyzL8cDGK8x+jHZESDQKlq/VuilXYRBpUBvDSaRpTEFUBsU9/gA==
X-Received: by 2002:adf:e745:0:b0:2c5:a38f:ca3a with SMTP id
 c5-20020adfe745000000b002c5a38fca3amr791304wrn.10.1677745490527; 
 Thu, 02 Mar 2023 00:24:50 -0800 (PST)
X-Google-Smtp-Source: AK7set994MK8bkfabCkt/AVi3AU+femKVeo0OwLef79HDaKr68InBeS91G85A8jzmYGO7LzAEXE3kw==
X-Received: by 2002:adf:e745:0:b0:2c5:a38f:ca3a with SMTP id
 c5-20020adfe745000000b002c5a38fca3amr791282wrn.10.1677745490189; 
 Thu, 02 Mar 2023 00:24:50 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 f3-20020a0560001b0300b002c70e60abd4sm14789134wrz.2.2023.03.02.00.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:24:49 -0800 (PST)
Date: Thu, 2 Mar 2023 03:24:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>, Dov Murik <dovmurik@linux.ibm.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 06/53] Revert "x86: use typedef for SetupData struct"
Message-ID: <20230302082343.560446-7-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Tested-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/x86.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 278dd54830..66cf171ace 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -658,12 +658,12 @@ DeviceState *ioapic_init_secondary(GSIState *gsi_state)
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
@@ -804,7 +804,7 @@ void x86_load_linux(X86MachineState *x86ms,
     FILE *f;
     char *vmode;
     MachineState *machine = MACHINE(x86ms);
-    SetupData *setup_data;
+    struct setup_data *setup_data;
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     const char *dtb_filename = machine->dtb;
@@ -1087,11 +1087,11 @@ void x86_load_linux(X86MachineState *x86ms,
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
@@ -1102,9 +1102,9 @@ void x86_load_linux(X86MachineState *x86ms,
 
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


