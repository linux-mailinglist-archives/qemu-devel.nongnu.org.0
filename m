Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF944E3EA4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:41:31 +0100 (CET)
Received: from localhost ([::1]:34254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdpK-0004Wh-D9
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:41:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nWdV4-0005bI-HL
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:20:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nWdV2-0001cp-0o
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647951631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GMuDRGg3lIcChTtYMxg+25gDdhcuPe/2uiUlW2/Y36Q=;
 b=FlS2m6bJ2J62xFpSm2jRycT+xln0wc9h+5AiCp4v7fUOJRVpLpdnK2p9OyHUCkKrwiHfDH
 t57xm6Lz0poF+CnfaPVgfgyaC1z+/4DkeYYJMrOCKbSPgEXwLdE4XJFPjWn+AqO9H5FgEz
 g2wGvUtW2s+nThPV0KK0fZCcNVOdar4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-ziReuRaUNkq0VAaoldJBOQ-1; Tue, 22 Mar 2022 08:20:27 -0400
X-MC-Unique: ziReuRaUNkq0VAaoldJBOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B31C3106657C;
 Tue, 22 Mar 2022 12:20:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 775A9C27E96;
 Tue, 22 Mar 2022 12:20:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CF30C180062E; Tue, 22 Mar 2022 13:20:24 +0100 (CET)
Date: Tue, 22 Mar 2022 13:20:24 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v3 17/36] pflash_cfi01/tdx: Introduce ram_mode of
 pflash for TDVF
Message-ID: <20220322122024.blyut6mnszhyw6hz@sirius.home.kraxel.org>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-18-xiaoyao.li@intel.com>
 <f418548e-c24c-1bc3-4e16-d7a775298a18@gmail.com>
 <7a8233e4-0cae-b05a-7931-695a7ee87fc9@intel.com>
 <20220322092141.qsgv3pqlvlemgrgw@sirius.home.kraxel.org>
 <YjmXFZRCbKXTkAhN@redhat.com>
 <20220322103518.ljbi4pvghbgjxm7k@sirius.home.kraxel.org>
 <YjmqOolbafWkMEHN@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjmqOolbafWkMEHN@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 seanjc@google.com, erdemaktas@google.com, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> At the time I did try a gross hack that (IIRC) disabled the
> rom_reset logic, and munged x86_bios_rom_init so that it would
> force load it straight at the RAM location.

Sounds reasonable.  The whole rom logic exists to handle resets,
but with confidential guests we don't need that, we can't change
guest state to perform a reset anyway ...

take care,
  Gerd

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 4cf107baea34..169ef96682de 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1115,15 +1115,26 @@ void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
         goto bios_error;
     }
     bios = g_malloc(sizeof(*bios));
+
     memory_region_init_ram(bios, NULL, "pc.bios", bios_size, &error_fatal);
-    if (!isapc_ram_fw) {
-        memory_region_set_readonly(bios, true);
-    }
-    ret = rom_add_file_fixed(bios_name, (uint32_t)(-bios_size), -1);
-    if (ret != 0) {
-    bios_error:
-        fprintf(stderr, "qemu: could not load PC BIOS '%s'\n", bios_name);
-        exit(1);
+    if (1 /* confidential computing */) {
+        /*
+         * The concept of a "reset" simply doesn't exist for
+         * confidential computing guests, we have to destroy and
+         * re-launch them instead.  So there is no need to register
+         * the firmware as rom to properly re-initialize on reset.
+         * Just go for a straight file load instead.
+         */
+        void *ptr = memory_region_get_ram_ptr(bios);
+        load_image_size(filename, ptr, bios_size);
+    } else {
+        if (!isapc_ram_fw) {
+            memory_region_set_readonly(bios, true);
+        }
+        ret = rom_add_file_fixed(bios_name, (uint32_t)(-bios_size), -1);
+        if (ret != 0) {
+            goto bios_error;
+        }
     }
     g_free(filename);
 
@@ -1144,6 +1155,11 @@ void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
     memory_region_add_subregion(rom_memory,
                                 (uint32_t)(-bios_size),
                                 bios);
+    return;
+
+bios_error:
+    fprintf(stderr, "qemu: could not load PC BIOS '%s'\n", bios_name);
+    exit(1);
 }
 
 bool x86_machine_is_smm_enabled(const X86MachineState *x86ms)


