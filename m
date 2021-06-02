Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE0F398525
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:20:34 +0200 (CEST)
Received: from localhost ([::1]:41362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loN3B-00060s-Jf
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1loN0U-0001rs-Tu
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:17:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1loN0M-000297-Nt
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622625456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RM5MHuSldTCJkVJYzW/tgcOS3v6/2/Fa9OcJ8hyKu9s=;
 b=Pp9kCo/bAy8zSnC8uZSZxFqlcPYv+HNM47yLvniCcrd8N5JZKN3ofJUprB/QwHcboAx/BR
 E8SSz7hCJ2C1ohXxjAfdzYKuve3Fm6AE1zIl5WJHKxdOQ/edHZgRBS7jzCsB0IFTtgLTGq
 kfgG9PdNvxXPImsVwBIjnU2ai5I/wJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-DPpB68pnNBW4EBRy3ipq3w-1; Wed, 02 Jun 2021 05:17:33 -0400
X-MC-Unique: DPpB68pnNBW4EBRy3ipq3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40207107ACE3;
 Wed,  2 Jun 2021 09:17:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C47345D9D0;
 Wed,  2 Jun 2021 09:17:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 91EC1180087E; Wed,  2 Jun 2021 11:17:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] add qemu-modinfo utility
Date: Wed,  2 Jun 2021 11:17:20 +0200
Message-Id: <20210602091727.1023563-3-kraxel@redhat.com>
In-Reply-To: <20210602091727.1023563-1-kraxel@redhat.com>
References: <20210602091727.1023563-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, armbru@redhat.com,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For now only dump metadata.

TODO:
 * store in some file format (json?).
 * make qemu parse it, replace hard-coded lists in util/module.c
 * fix windows (seems to not have glob).
 * do we need non-elf support?

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qemu-modinfo.c | 182 +++++++++++++++++++++++++++++++++++++++++++++++++
 meson.build    |   3 +
 2 files changed, 185 insertions(+)
 create mode 100644 qemu-modinfo.c

diff --git a/qemu-modinfo.c b/qemu-modinfo.c
new file mode 100644
index 000000000000..ecd5f6c3adf2
--- /dev/null
+++ b/qemu-modinfo.c
@@ -0,0 +1,182 @@
+/*
+ * QEMU module parser
+ *
+ * read modules, find modinfo section, parse & store metadata.
+ *
+ * Copyright Red Hat, Inc. 2021
+ *
+ * Authors:
+ *     Gerd Hoffmann <kraxel@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "elf.h"
+#include <glob.h>
+
+#define Elf_Ehdr Elf64_Ehdr
+#define Elf_Shdr Elf64_Shdr
+#define ELFCLASS ELFCLASS64
+
+static const char *moddir = CONFIG_QEMU_MODDIR;
+static const char *dsosuf = CONFIG_HOST_DSOSUF;
+
+static void modinfo(const char *module, char *info, size_t size)
+{
+    size_t pos = 0, len;
+
+    fprintf(stderr, "%s\n", module);
+    do {
+        fprintf(stderr, "  -> %s\n", info + pos);
+        len = strlen(info + pos) + 1;
+        pos += len;
+    } while (pos < size);
+}
+
+static void elf_read_section_hdr(FILE *fp, Elf_Ehdr *ehdr,
+                                 int section, Elf_Shdr *shdr)
+{
+    size_t pos, len;
+    int ret;
+
+    pos = ehdr->e_shoff + section * ehdr->e_shentsize;
+    len = MIN(ehdr->e_shentsize, sizeof(*shdr));
+
+    ret = fseek(fp, pos, SEEK_SET);
+    if (ret != 0) {
+        fprintf(stderr, "seek error\n");
+        exit(1);
+    }
+
+    memset(shdr, 0, sizeof(*shdr));
+    ret = fread(shdr, len, 1, fp);
+    if (ret != 1) {
+        fprintf(stderr, "read error\n");
+        exit(1);
+    }
+}
+
+static void *elf_read_section(FILE *fp, Elf_Ehdr *ehdr,
+                              int section, size_t *size)
+{
+    Elf_Shdr shdr;
+    void *data;
+    int ret;
+
+    elf_read_section_hdr(fp, ehdr, section, &shdr);
+    if (shdr.sh_offset && shdr.sh_size) {
+        ret = fseek(fp, shdr.sh_offset, SEEK_SET);
+        if (ret != 0) {
+            fprintf(stderr, "seek error\n");
+            exit(1);
+        }
+
+        data = g_malloc(shdr.sh_size);
+        ret = fread(data, shdr.sh_size, 1, fp);
+        if (ret != 1) {
+            fprintf(stderr, "read error\n");
+            exit(1);
+        }
+        *size = shdr.sh_size;
+    } else {
+        data = NULL;
+        *size = 0;
+    }
+    return data;
+}
+
+static void elf_parse_module(const char *module)
+{
+    Elf_Ehdr ehdr;
+    Elf_Shdr shdr;
+    FILE *fp;
+    int ret, i;
+    char *str;
+    size_t str_size;
+    char *info;
+    size_t info_size;
+
+    fp = fopen(module, "r");
+    if (NULL == fp) {
+        fprintf(stderr, "open %s: %s\n", module, strerror(errno));
+        exit(1);
+    }
+
+    ret = fread(&ehdr, sizeof(ehdr), 1, fp);
+    if (ret != 1) {
+        fprintf(stderr, "read error (%s)\n", module);
+        exit(1);
+    }
+
+    if (ehdr.e_ident[EI_MAG0] != ELFMAG0 ||
+        ehdr.e_ident[EI_MAG1] != ELFMAG1 ||
+        ehdr.e_ident[EI_MAG2] != ELFMAG2 ||
+        ehdr.e_ident[EI_MAG3] != ELFMAG3) {
+        fprintf(stderr, "not an elf file (%s)\n", module);
+        exit(1);
+    }
+    if (ehdr.e_ident[EI_CLASS] != ELFCLASS64) {
+        fprintf(stderr, "elf class mismatch (%s)\n", module);
+        exit(1);
+    }
+    if (ehdr.e_shoff == 0) {
+        fprintf(stderr, "no section header (%s)\n", module);
+        exit(1);
+    }
+
+    /* read string table */
+    if (ehdr.e_shstrndx == 0) {
+        fprintf(stderr, "no section strings (%s)\n", module);
+        exit(1);
+    }
+    str = elf_read_section(fp, &ehdr, ehdr.e_shstrndx, &str_size);
+    if (NULL == str) {
+        fprintf(stderr, "no section strings (%s)\n", module);
+        exit(1);
+    }
+
+    /* find and read modinfo section */
+    info = NULL;
+    for (i = 0; i < ehdr.e_shnum; i++) {
+        elf_read_section_hdr(fp, &ehdr, i, &shdr);
+        if (!shdr.sh_name) {
+            continue;
+        }
+        if (strcmp(str + shdr.sh_name, ".modinfo") == 0) {
+            info = elf_read_section(fp, &ehdr, i, &info_size);
+        }
+    }
+
+    if (info) {
+        modinfo(module, info, info_size);
+    }
+
+    fclose(fp);
+}
+
+int main(int argc, char **argv)
+{
+    char *pattern;
+    glob_t files;
+    int ret, i;
+
+    if (argc > 1) {
+        moddir = argv[1];
+    }
+
+    pattern = g_strdup_printf("%s/*%s", moddir, dsosuf);
+    ret = glob(pattern, 0, NULL, &files);
+    if (ret != 0) {
+        fprintf(stderr, "glob(%s) failed: %d\n", pattern, ret);
+        exit(1);
+    }
+
+    for (i = 0; i < files.gl_pathc; i++) {
+        elf_parse_module(files.gl_pathv[i]);
+    }
+
+    globfree(&files);
+    g_free(pattern);
+    return 0;
+}
diff --git a/meson.build b/meson.build
index a45f1a844f13..179e92aa7ae1 100644
--- a/meson.build
+++ b/meson.build
@@ -2358,6 +2358,9 @@ if xkbcommon.found()
                            dependencies: [qemuutil, xkbcommon], install: have_tools)
 endif
 
+qemu_modinfo = executable('qemu-modinfo', files('qemu-modinfo.c') + genh,
+                          dependencies: [glib], install: have_tools)
+
 if have_tools
   qemu_img = executable('qemu-img', [files('qemu-img.c'), hxdep],
              dependencies: [authz, block, crypto, io, qom, qemuutil], install: true)
-- 
2.31.1


