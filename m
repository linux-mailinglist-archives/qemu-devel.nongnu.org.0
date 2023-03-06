Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55576AC57E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:35:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrZ-0004GJ-Jv; Mon, 06 Mar 2023 10:34:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrX-0004CO-BB
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:55 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrV-0002CT-Ah
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:55 -0500
Received: by mail-wr1-x435.google.com with SMTP id e13so9229767wro.10
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4qRma+FaBHwuFNRAoeQ01NejW3D8pi+OySt7ClbAjqQ=;
 b=eGOJnN8O4hnnSifLG90yJFBZ6Y8AV9HqmgS5h114aVnu2vBARpwkbIEAhG6eN8T4Ry
 Ezk0Jr7l1du43AqVCvXMS/eQ80JjgUXr4OUPtoAusONic05zcHoB9IXX6qJnkswXGUQq
 hFkyregVZppw+KpbXz4WvixZxOt9LWNul2g7Uybbib87wwZlMi8NDqtMyIHSlrs0wB4L
 eKbwj4g93ff34zHbDOMfgMltEzeWtxgmdIJJ69c8+5d+UkG7/Q8Czo5V11lIJAiB2T12
 WsL+3q8kVCRGS8vKG/N38hO1WlEeg2nV4zl6x9wNumZeCyjHprQkhFOPy+2XEkuu6bpC
 Kv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4qRma+FaBHwuFNRAoeQ01NejW3D8pi+OySt7ClbAjqQ=;
 b=ztg4RrqsxrPqKX3UqocnoJaSGrr7oDf5LUbcuhI86nHnnYQATSqwKgr0YLf2zINgIO
 2wEOKkcyKP0Q5rNZJVd95Pg9HCeyuyiq23+1z47a3ErUTnWg4DhtnvUYoObHZoDlEjk3
 rs30ruhv7LXd6FvQ3SpPAt4ktIrrupF8Eb1VUOy/1mshJooOSSzy9iwv3SvOIDZGlSvI
 H6DQYthsi1B2f0HK2YqejODqlAwMecrkAwRYpOU5P+l7xpxR9vhV3DCdlS6UR4Kjj484
 sQaC/n2tlPX9+JHJjNcalAiC0SfmVYma09yZ36g0HC13EzAXNhLdb2q3FusHlxHpA7aQ
 MHGA==
X-Gm-Message-State: AO0yUKXfPHx3oGDxjiWmTJAroeYKy3TvkBnklwvxv0zEaS2vG/I7/i17
 1Y5xrKctZo/KEM79noFXJC3UGoMDjGAWrTei8Lg=
X-Google-Smtp-Source: AK7set+nZWihpINJpyFe/J3RxmgxkEQy9tCQgisc1irJ9dRVKXOy+JRIcEw22SU3MYL/t2U36c2PWA==
X-Received: by 2002:adf:ef84:0:b0:2c7:e406:67d8 with SMTP id
 d4-20020adfef84000000b002c7e40667d8mr7779486wro.35.1678116892064; 
 Mon, 06 Mar 2023 07:34:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/21] hw: arm: Support direct boot for Linux/arm64 EFI zboot
 images
Date: Mon,  6 Mar 2023 15:34:33 +0000
Message-Id: <20230306153435.490894-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Ard Biesheuvel <ardb@kernel.org>

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
Message-id: 20230303160109.3626966-1-ardb@kernel.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: tweaked comment formatting, fixed checkpatch nits]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/loader.h | 19 ++++++++++
 hw/arm/boot.c       |  6 +++
 hw/core/loader.c    | 91 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 116 insertions(+)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 1384796a4b3..c4c14170ea3 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -86,6 +86,25 @@ ssize_t load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
                                   uint8_t **buffer);
 ssize_t load_image_gzipped(const char *filename, hwaddr addr, uint64_t max_sz);
 
+/**
+ * unpack_efi_zboot_image:
+ * @buffer: pointer to a variable holding the address of a buffer containing the
+ *          image
+ * @size: pointer to a variable holding the size of the buffer
+ *
+ * Check whether the buffer contains a EFI zboot image, and if it does, extract
+ * the compressed payload and decompress it into a new buffer. If successful,
+ * the old buffer is freed, and the *buffer and size variables pointed to by the
+ * function arguments are updated to refer to the newly populated buffer.
+ *
+ * Returns 0 if the image could not be identified as a EFI zboot image.
+ * Returns -1 if the buffer contents were identified as a EFI zboot image, but
+ * unpacking failed for any reason.
+ * Returns the size of the decompressed payload if decompression was performed
+ * successfully.
+ */
+ssize_t unpack_efi_zboot_image(uint8_t **buffer, int *size);
+
 #define ELF_LOAD_FAILED       -1
 #define ELF_LOAD_NOT_ELF      -2
 #define ELF_LOAD_WRONG_ARCH   -3
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 1e021c4a340..50e5141116b 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -926,6 +926,12 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
             return -1;
         }
         size = len;
+
+        /* Unpack the image if it is a EFI zboot image */
+        if (unpack_efi_zboot_image(&buffer, &size) < 0) {
+            g_free(buffer);
+            return -1;
+        }
     }
 
     /* check the arm64 magic header value -- very old kernels may not have it */
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 173f8f67f6e..cd53235fed9 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -857,6 +857,97 @@ ssize_t load_image_gzipped(const char *filename, hwaddr addr, uint64_t max_sz)
     return bytes;
 }
 
+/* The PE/COFF MS-DOS stub magic number */
+#define EFI_PE_MSDOS_MAGIC        "MZ"
+
+/*
+ * The Linux header magic number for a EFI PE/COFF
+ * image targetting an unspecified architecture.
+ */
+#define EFI_PE_LINUX_MAGIC        "\xcd\x23\x82\x81"
+
+/*
+ * Bootable Linux kernel images may be packaged as EFI zboot images, which are
+ * self-decompressing executables when loaded via EFI. The compressed payload
+ * can also be extracted from the image and decompressed by a non-EFI loader.
+ *
+ * The de facto specification for this format is at the following URL:
+ *
+ * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/firmware/efi/libstub/zboot-header.S
+ *
+ * This definition is based on Linux upstream commit 29636a5ce87beba.
+ */
+struct linux_efi_zboot_header {
+    uint8_t     msdos_magic[2];         /* PE/COFF 'MZ' magic number */
+    uint8_t     reserved0[2];
+    uint8_t     zimg[4];                /* "zimg" for Linux EFI zboot images */
+    uint32_t    payload_offset;         /* LE offset to compressed payload */
+    uint32_t    payload_size;           /* LE size of the compressed payload */
+    uint8_t     reserved1[8];
+    char        compression_type[32];   /* Compression type, NUL terminated */
+    uint8_t     linux_magic[4];         /* Linux header magic */
+    uint32_t    pe_header_offset;       /* LE offset to the PE header */
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
+ssize_t unpack_efi_zboot_image(uint8_t **buffer, int *size)
+{
+    const struct linux_efi_zboot_header *header;
+    uint8_t *data = NULL;
+    int ploff, plsize;
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
+    if (memcmp(&header->msdos_magic, EFI_PE_MSDOS_MAGIC, 2) != 0 ||
+        memcmp(&header->zimg, "zimg", 4) != 0 ||
+        memcmp(&header->linux_magic, EFI_PE_LINUX_MAGIC, 4) != 0) {
+        return 0;
+    }
+
+    if (strcmp(header->compression_type, "gzip") != 0) {
+        fprintf(stderr,
+                "unable to handle EFI zboot image with \"%.*s\" compression\n",
+                (int)sizeof(header->compression_type) - 1,
+                header->compression_type);
+        return -1;
+    }
+
+    ploff = ldl_le_p(&header->payload_offset);
+    plsize = ldl_le_p(&header->payload_size);
+
+    if (ploff < 0 || plsize < 0 || ploff + plsize > *size) {
+        fprintf(stderr, "unable to handle corrupt EFI zboot image\n");
+        return -1;
+    }
+
+    data = g_malloc(LOAD_IMAGE_MAX_GUNZIP_BYTES);
+    bytes = gunzip(data, LOAD_IMAGE_MAX_GUNZIP_BYTES, *buffer + ploff, plsize);
+    if (bytes < 0) {
+        fprintf(stderr, "failed to decompress EFI zboot image\n");
+        g_free(data);
+        return -1;
+    }
+
+    g_free(*buffer);
+    *buffer = g_realloc(data, bytes);
+    *size = bytes;
+    return bytes;
+}
+
 /*
  * Functions for reboot-persistent memory regions.
  *  - used for vga bios and option roms.
-- 
2.34.1


