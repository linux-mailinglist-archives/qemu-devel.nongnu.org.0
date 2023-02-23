Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0738E6A06C4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:53:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV9EL-0005Ps-4E; Thu, 23 Feb 2023 05:53:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1pV9EH-00050Z-47; Thu, 23 Feb 2023 05:53:37 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1pV9EE-00044n-Tm; Thu, 23 Feb 2023 05:53:36 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E7B7F616BD;
 Thu, 23 Feb 2023 10:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D7BC433D2;
 Thu, 23 Feb 2023 10:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677149604;
 bh=4ElqaZOtVO/Q4aOwdIjJ/5dEgXMMGUtQbm9GfpQMHYk=;
 h=From:To:Cc:Subject:Date:From;
 b=M+zMr+3r6Z8IDZr9mrkyxyKk4I05FAbL/sOD1lnwoU+fLWNAby9Pwc7Yt0UftgSen
 RR6SM4jpHScpalPN6qOtZltPRZS2V6LFXWMYcCAgV2nyXQ1UaWr3AktnsNhXojtuUl
 NEu948OQWa/scIUlwZNVKBlkFTv3Rufclwgf2GBAhu/yoUHkEHz1SOuHGGw7YXfvDA
 tGwaDjWJCd7LFZxYA8yaAKY97gJK/symBCQ5X8yg4wQ2YdOq25Cc1feDtIOI5wjusH
 lQhirjTXIy+Yw8bRqABOvtIl6PRP4qvDi+Xiagfw7+gFaa0DeW+ivgGUiqiikltV9m
 uJFVv1JfD8Q+Q==
From: Ard Biesheuvel <ardb@kernel.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Ard Biesheuvel <ardb@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH] hw: arm: Support direct boot for Linux/arm64 EFI zboot
 images
Date: Thu, 23 Feb 2023 11:53:08 +0100
Message-Id: <20230223105308.559632-1-ardb@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ardb@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

Fedora 39 will ship its arm64 kernels in the new generic EFI zboot
format, using gzip compression for the payload.

For doing EFI boot in QEMU, this is completely transparent, as the
firmware or bootloader will take care of this. However, for direct
kernel boot without firmware, we will lose the ability to boot such
distro kernels unless we deal with the new format directly.

EFI zboot images contain metadata in the header regarding the placement
of the compressed payload inside the image, and the type of compression
used. This means we can wire up the existing gzip support without too
much hassle, by parsing the header and grabbing the payload from inside
the loaded zboot image.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 hw/arm/boot.c       |  4 ++
 hw/core/loader.c    | 64 ++++++++++++++++++++
 include/hw/loader.h |  2 +
 3 files changed, 70 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 3d7d11f782feb5da..dc10a0788227443e 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -924,6 +924,10 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
         size = len;
     }
 
+    if (unpack_efi_zboot_image(&buffer, &size)) {
+        return -1;
+    }
+
     /* check the arm64 magic header value -- very old kernels may not have it */
     if (size > ARM64_MAGIC_OFFSET + 4 &&
         memcmp(buffer + ARM64_MAGIC_OFFSET, "ARM\x64", 4) == 0) {
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 173f8f67f6e3e79c..7e7f49261a309012 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -857,6 +857,70 @@ ssize_t load_image_gzipped(const char *filename, hwaddr addr, uint64_t max_sz)
     return bytes;
 }
 
+// The Linux header magic number for a EFI PE/COFF
+// image targetting an unspecified architecture.
+#define LINUX_EFI_PE_MAGIC        "\xcd\x23\x82\x81"
+
+struct linux_efi_zboot_header {
+    uint8_t     msdos_magic[4];         // PE/COFF 'MZ' magic number
+    uint8_t     zimg[4];                // "zimg" for Linux EFI zboot images
+    uint32_t    payload_offset;         // LE offset to the compressed payload
+    uint32_t    payload_size;           // LE size of the compressed payload
+    uint8_t     reserved[8];
+    char        compression_type[32];   // Compression type, e.g., "gzip"
+    uint8_t     linux_magic[4];         // Linux header magic
+    uint32_t    pe_header_offset;       // LE offset to the PE header
+};
+
+/*
+ * Check whether *buffer points to a Linux EFI zboot image in memory.
+ *
+ * If it does, attempt to decompress it to a new buffer, and free the old one.
+ * If any of this fails, return an error to the caller.
+ *
+ * If the image is not a Linux EFI zboot image, do nothing and return success.
+ */
+int unpack_efi_zboot_image(uint8_t **buffer, int *size)
+{
+    const struct linux_efi_zboot_header *header;
+    uint8_t *data = NULL;
+    ssize_t bytes;
+
+    /* ignore if this is too small to be a EFI zboot image */
+    if (*size < sizeof(*header)) {
+        return 0;
+    }
+
+    header = (struct linux_efi_zboot_header *)*buffer;
+
+    /* ignore if this is not a Linux EFI zboot image */
+    if (memcmp(&header->zimg, "zimg", 4) != 0 ||
+        memcmp(&header->linux_magic, LINUX_EFI_PE_MAGIC, 4) != 0) {
+        return 0;
+    }
+
+    if (strncmp(header->compression_type, "gzip", 4) != 0) {
+        fprintf(stderr, "unable to handle EFI zboot image with \"%s\" compression\n",
+                header->compression_type);
+        return -1;
+    }
+
+    data = g_malloc(LOAD_IMAGE_MAX_GUNZIP_BYTES);
+    bytes = gunzip(data, LOAD_IMAGE_MAX_GUNZIP_BYTES,
+                   *buffer + le32_to_cpu(header->payload_offset),
+                   le32_to_cpu(header->payload_size));
+    if (bytes < 0) {
+        fprintf(stderr, "failed to decompress EFI zboot image\n");
+        g_free(data);
+        return -1;
+    }
+
+    g_free(*buffer);
+    *buffer = g_realloc(data, bytes);
+    *size = bytes;
+    return 0;
+}
+
 /*
  * Functions for reboot-persistent memory regions.
  *  - used for vga bios and option roms.
diff --git a/include/hw/loader.h b/include/hw/loader.h
index 70248e0da77908c1..d1092c8bfbd903c7 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -86,6 +86,8 @@ ssize_t load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
                                   uint8_t **buffer);
 ssize_t load_image_gzipped(const char *filename, hwaddr addr, uint64_t max_sz);
 
+int unpack_efi_zboot_image(uint8_t **buffer, int *size);
+
 #define ELF_LOAD_FAILED       -1
 #define ELF_LOAD_NOT_ELF      -2
 #define ELF_LOAD_WRONG_ARCH   -3
-- 
2.39.1


