Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E5F4366B4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:46:41 +0200 (CEST)
Received: from localhost ([::1]:51196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdaHB-0004Nq-0f
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx5-0000Ef-9a
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:55 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZwz-0002QJ-K0
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:54 -0400
Received: by mail-pl1-x631.google.com with SMTP id u6so678283ple.2
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p7YWf2lujzAh/0d3UGKlGnAGxER9ViPbSHizUh6kk68=;
 b=knG80ZLfW4p/cPYojkdsGeK+PSx0YEOXX/1dAH6esqdSFUie3YS3BBHCdLSFzjIafm
 /MMt0cVW6cqwoysoX2yFLRZ3wXl0pd+6Zz+TeVfmc4gT4DeiP/VpPHUJ8v7FIluRU3eo
 C0QlzEqORgIh+8uXyzFrCdTjAthHIkeQ9hxLUNhU+xuhesWiyXs6p5C+z6ENYZD7iJl8
 E0BCG6vgcP0ZRR+1npap7lFGaltfhIR3HVn+Bp17df2DNrJVJH74KfwU0bv2QOw+4bvX
 qMnATqxy8bPG45ixWfVi44LfYc5/F7EX9MLTYi3XAFDXLxnAE0lnH2AJ9NkIi3t0emOe
 Jmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p7YWf2lujzAh/0d3UGKlGnAGxER9ViPbSHizUh6kk68=;
 b=hwtnPzzYfFSWFH6kzY5y5AyuT0IyoyRgwlFHzTXjl6X+pbAFZUG8qmLEaNwilu/QY/
 fJSFnBYQJrweObQ/5C545x8ldqxXpxM1tnBqrH5RBWZu64zBRyS7iEygtwxD7q2ZH1KV
 b+lofzmFPIorQiYpBXqv4ct0P3DYjYO14KRZtK+DC0bwdydAIchU/PWUTmiEXHKqT1xT
 hHBtGXSMyQhxjnhRB+ya0rAkxXSmdZylq25+Ufo+9voI8BLiO6EaVIlTwLNeMbJvX/n6
 Ohwq9s0uQXBOK0AB/K2P1rXDSE3c+0kbiHVcd72kiEepS/x6OQxNqSgAZzhCBh5Kunq+
 hNiw==
X-Gm-Message-State: AOAM5320FZq6qkYcLC0xfKsfxE0Oszz5eCWzDmoLnNdCEvWdvHDGmYiP
 EviC65xD+iErphMexTtikF3tz+u1Ig++Gw==
X-Google-Smtp-Source: ABdhPJwaw1EFgyxtZHNn+FbGvVD36O9zJv321DrpwgkHSWazO37AdVqKk2bWXZVHenLjwsgTV8UEWw==
X-Received: by 2002:a17:902:ff02:b0:140:512:4dda with SMTP id
 f2-20020a170902ff0200b0014005124ddamr2552717plj.44.1634829948110; 
 Thu, 21 Oct 2021 08:25:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/19] hw/elf_ops.h: switch to ssize_t for elf loader return
 type
Date: Thu, 21 Oct 2021 08:25:30 -0700
Message-Id: <20211021152541.781175-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefano Garzarella <sgarzare@redhat.com>, Luc Michel <lmichel@kalray.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luc Michel <lmichel@kalray.eu>

Until now, int was used as the return type for all the ELF
loader related functions. The returned value is the sum of all loaded
program headers "MemSize" fields.

Because of the overflow check in elf_ops.h, trying to load an ELF bigger
than INT_MAX will fail. Switch to ssize_t to remove this limitation.

Signed-off-by: Luc Michel <lmichel@kalray.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20211014194325.19917-1-lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/elf_ops.h | 27 ++++++++++----------
 include/hw/loader.h  | 58 +++++++++++++++++++++---------------------
 hw/core/loader.c     | 60 +++++++++++++++++++++++---------------------
 3 files changed, 74 insertions(+), 71 deletions(-)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 1c37cec4ae..995de8495c 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -312,25 +312,26 @@ static struct elf_note *glue(get_elf_note_type, SZ)(struct elf_note *nhdr,
     return nhdr;
 }
 
-static int glue(load_elf, SZ)(const char *name, int fd,
-                              uint64_t (*elf_note_fn)(void *, void *, bool),
-                              uint64_t (*translate_fn)(void *, uint64_t),
-                              void *translate_opaque,
-                              int must_swab, uint64_t *pentry,
-                              uint64_t *lowaddr, uint64_t *highaddr,
-                              uint32_t *pflags, int elf_machine,
-                              int clear_lsb, int data_swab,
-                              AddressSpace *as, bool load_rom,
-                              symbol_fn_t sym_cb)
+static ssize_t glue(load_elf, SZ)(const char *name, int fd,
+                                  uint64_t (*elf_note_fn)(void *, void *, bool),
+                                  uint64_t (*translate_fn)(void *, uint64_t),
+                                  void *translate_opaque,
+                                  int must_swab, uint64_t *pentry,
+                                  uint64_t *lowaddr, uint64_t *highaddr,
+                                  uint32_t *pflags, int elf_machine,
+                                  int clear_lsb, int data_swab,
+                                  AddressSpace *as, bool load_rom,
+                                  symbol_fn_t sym_cb)
 {
     struct elfhdr ehdr;
     struct elf_phdr *phdr = NULL, *ph;
-    int size, i, total_size;
+    int size, i;
+    ssize_t total_size;
     elf_word mem_size, file_size, data_offset;
     uint64_t addr, low = (uint64_t)-1, high = 0;
     GMappedFile *mapped_file = NULL;
     uint8_t *data = NULL;
-    int ret = ELF_LOAD_FAILED;
+    ssize_t ret = ELF_LOAD_FAILED;
 
     if (read(fd, &ehdr, sizeof(ehdr)) != sizeof(ehdr))
         goto fail;
@@ -482,7 +483,7 @@ static int glue(load_elf, SZ)(const char *name, int fd,
                 }
             }
 
-            if (mem_size > INT_MAX - total_size) {
+            if (mem_size > SSIZE_MAX - total_size) {
                 ret = ELF_LOAD_TOO_BIG;
                 goto fail;
             }
diff --git a/include/hw/loader.h b/include/hw/loader.h
index 81104cb02f..4fa485bd61 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -90,7 +90,7 @@ int load_image_gzipped(const char *filename, hwaddr addr, uint64_t max_sz);
 #define ELF_LOAD_WRONG_ARCH   -3
 #define ELF_LOAD_WRONG_ENDIAN -4
 #define ELF_LOAD_TOO_BIG      -5
-const char *load_elf_strerror(int error);
+const char *load_elf_strerror(ssize_t error);
 
 /** load_elf_ram_sym:
  * @filename: Path of ELF file
@@ -128,48 +128,48 @@ const char *load_elf_strerror(int error);
 typedef void (*symbol_fn_t)(const char *st_name, int st_info,
                             uint64_t st_value, uint64_t st_size);
 
-int load_elf_ram_sym(const char *filename,
-                     uint64_t (*elf_note_fn)(void *, void *, bool),
-                     uint64_t (*translate_fn)(void *, uint64_t),
-                     void *translate_opaque, uint64_t *pentry,
-                     uint64_t *lowaddr, uint64_t *highaddr, uint32_t *pflags,
-                     int big_endian, int elf_machine,
-                     int clear_lsb, int data_swab,
-                     AddressSpace *as, bool load_rom, symbol_fn_t sym_cb);
+ssize_t load_elf_ram_sym(const char *filename,
+                         uint64_t (*elf_note_fn)(void *, void *, bool),
+                         uint64_t (*translate_fn)(void *, uint64_t),
+                         void *translate_opaque, uint64_t *pentry,
+                         uint64_t *lowaddr, uint64_t *highaddr,
+                         uint32_t *pflags, int big_endian, int elf_machine,
+                         int clear_lsb, int data_swab,
+                         AddressSpace *as, bool load_rom, symbol_fn_t sym_cb);
 
 /** load_elf_ram:
  * Same as load_elf_ram_sym(), but doesn't allow the caller to specify a
  * symbol callback function
  */
-int load_elf_ram(const char *filename,
-                 uint64_t (*elf_note_fn)(void *, void *, bool),
-                 uint64_t (*translate_fn)(void *, uint64_t),
-                 void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
-                 uint64_t *highaddr, uint32_t *pflags, int big_endian,
-                 int elf_machine, int clear_lsb, int data_swab,
-                 AddressSpace *as, bool load_rom);
+ssize_t load_elf_ram(const char *filename,
+                     uint64_t (*elf_note_fn)(void *, void *, bool),
+                     uint64_t (*translate_fn)(void *, uint64_t),
+                     void *translate_opaque, uint64_t *pentry,
+                     uint64_t *lowaddr, uint64_t *highaddr, uint32_t *pflags,
+                     int big_endian, int elf_machine, int clear_lsb,
+                     int data_swab, AddressSpace *as, bool load_rom);
 
 /** load_elf_as:
  * Same as load_elf_ram(), but always loads the elf as ROM
  */
-int load_elf_as(const char *filename,
-                uint64_t (*elf_note_fn)(void *, void *, bool),
-                uint64_t (*translate_fn)(void *, uint64_t),
-                void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
-                uint64_t *highaddr, uint32_t *pflags, int big_endian,
-                int elf_machine, int clear_lsb, int data_swab,
-                AddressSpace *as);
+ssize_t load_elf_as(const char *filename,
+                    uint64_t (*elf_note_fn)(void *, void *, bool),
+                    uint64_t (*translate_fn)(void *, uint64_t),
+                    void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
+                    uint64_t *highaddr, uint32_t *pflags, int big_endian,
+                    int elf_machine, int clear_lsb, int data_swab,
+                    AddressSpace *as);
 
 /** load_elf:
  * Same as load_elf_as(), but doesn't allow the caller to specify an
  * AddressSpace.
  */
-int load_elf(const char *filename,
-             uint64_t (*elf_note_fn)(void *, void *, bool),
-             uint64_t (*translate_fn)(void *, uint64_t),
-             void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
-             uint64_t *highaddr, uint32_t *pflags, int big_endian,
-             int elf_machine, int clear_lsb, int data_swab);
+ssize_t load_elf(const char *filename,
+                 uint64_t (*elf_note_fn)(void *, void *, bool),
+                 uint64_t (*translate_fn)(void *, uint64_t),
+                 void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
+                 uint64_t *highaddr, uint32_t *pflags, int big_endian,
+                 int elf_machine, int clear_lsb, int data_swab);
 
 /** load_elf_hdr:
  * @filename: Path of ELF file
diff --git a/hw/core/loader.c b/hw/core/loader.c
index c623318b73..c7f97fdce8 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -326,7 +326,7 @@ static void *load_at(int fd, off_t offset, size_t size)
 #define SZ		64
 #include "hw/elf_ops.h"
 
-const char *load_elf_strerror(int error)
+const char *load_elf_strerror(ssize_t error)
 {
     switch (error) {
     case 0:
@@ -402,12 +402,12 @@ fail:
 }
 
 /* return < 0 if error, otherwise the number of bytes loaded in memory */
-int load_elf(const char *filename,
-             uint64_t (*elf_note_fn)(void *, void *, bool),
-             uint64_t (*translate_fn)(void *, uint64_t),
-             void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
-             uint64_t *highaddr, uint32_t *pflags, int big_endian,
-             int elf_machine, int clear_lsb, int data_swab)
+ssize_t load_elf(const char *filename,
+                 uint64_t (*elf_note_fn)(void *, void *, bool),
+                 uint64_t (*translate_fn)(void *, uint64_t),
+                 void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
+                 uint64_t *highaddr, uint32_t *pflags, int big_endian,
+                 int elf_machine, int clear_lsb, int data_swab)
 {
     return load_elf_as(filename, elf_note_fn, translate_fn, translate_opaque,
                        pentry, lowaddr, highaddr, pflags, big_endian,
@@ -415,12 +415,13 @@ int load_elf(const char *filename,
 }
 
 /* return < 0 if error, otherwise the number of bytes loaded in memory */
-int load_elf_as(const char *filename,
-                uint64_t (*elf_note_fn)(void *, void *, bool),
-                uint64_t (*translate_fn)(void *, uint64_t),
-                void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
-                uint64_t *highaddr, uint32_t *pflags, int big_endian,
-                int elf_machine, int clear_lsb, int data_swab, AddressSpace *as)
+ssize_t load_elf_as(const char *filename,
+                    uint64_t (*elf_note_fn)(void *, void *, bool),
+                    uint64_t (*translate_fn)(void *, uint64_t),
+                    void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
+                    uint64_t *highaddr, uint32_t *pflags, int big_endian,
+                    int elf_machine, int clear_lsb, int data_swab,
+                    AddressSpace *as)
 {
     return load_elf_ram(filename, elf_note_fn, translate_fn, translate_opaque,
                         pentry, lowaddr, highaddr, pflags, big_endian,
@@ -428,13 +429,13 @@ int load_elf_as(const char *filename,
 }
 
 /* return < 0 if error, otherwise the number of bytes loaded in memory */
-int load_elf_ram(const char *filename,
-                 uint64_t (*elf_note_fn)(void *, void *, bool),
-                 uint64_t (*translate_fn)(void *, uint64_t),
-                 void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
-                 uint64_t *highaddr, uint32_t *pflags, int big_endian,
-                 int elf_machine, int clear_lsb, int data_swab,
-                 AddressSpace *as, bool load_rom)
+ssize_t load_elf_ram(const char *filename,
+                     uint64_t (*elf_note_fn)(void *, void *, bool),
+                     uint64_t (*translate_fn)(void *, uint64_t),
+                     void *translate_opaque, uint64_t *pentry,
+                     uint64_t *lowaddr, uint64_t *highaddr, uint32_t *pflags,
+                     int big_endian, int elf_machine, int clear_lsb,
+                     int data_swab, AddressSpace *as, bool load_rom)
 {
     return load_elf_ram_sym(filename, elf_note_fn,
                             translate_fn, translate_opaque,
@@ -444,16 +445,17 @@ int load_elf_ram(const char *filename,
 }
 
 /* return < 0 if error, otherwise the number of bytes loaded in memory */
-int load_elf_ram_sym(const char *filename,
-                     uint64_t (*elf_note_fn)(void *, void *, bool),
-                     uint64_t (*translate_fn)(void *, uint64_t),
-                     void *translate_opaque, uint64_t *pentry,
-                     uint64_t *lowaddr, uint64_t *highaddr, uint32_t *pflags,
-                     int big_endian, int elf_machine,
-                     int clear_lsb, int data_swab,
-                     AddressSpace *as, bool load_rom, symbol_fn_t sym_cb)
+ssize_t load_elf_ram_sym(const char *filename,
+                         uint64_t (*elf_note_fn)(void *, void *, bool),
+                         uint64_t (*translate_fn)(void *, uint64_t),
+                         void *translate_opaque, uint64_t *pentry,
+                         uint64_t *lowaddr, uint64_t *highaddr,
+                         uint32_t *pflags, int big_endian, int elf_machine,
+                         int clear_lsb, int data_swab,
+                         AddressSpace *as, bool load_rom, symbol_fn_t sym_cb)
 {
-    int fd, data_order, target_data_order, must_swab, ret = ELF_LOAD_FAILED;
+    int fd, data_order, target_data_order, must_swab;
+    ssize_t ret = ELF_LOAD_FAILED;
     uint8_t e_ident[EI_NIDENT];
 
     fd = open(filename, O_RDONLY | O_BINARY);
-- 
2.25.1


