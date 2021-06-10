Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200EF3A2438
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:06:14 +0200 (CEST)
Received: from localhost ([::1]:37196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrDpV-0007Qv-5C
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDiA-0002D0-Hl
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:58:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDi8-0001P3-Af
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623304715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MOKUaPRhEknQSp/c4EpmFfYQpAw20I4djJwTGWMwLZw=;
 b=ivlZ0RHZLsr65liCVV84EjDHuZD/sPK/1+JL51As1/YqdjVl1HJd4V+Q076FjZnrIuWpoL
 f7StO2UjgZsG2dkvTaCmwgvMcEpQAF+HA5DAba2JuvsVWa/C68LUtxca3epm4hcMswFnym
 NutpaGExJFlwC2YrjMSYc//Zt7tGqG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-1sog8kXgOamP2KVkZx7mOA-1; Thu, 10 Jun 2021 01:58:32 -0400
X-MC-Unique: 1sog8kXgOamP2KVkZx7mOA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E327800D62;
 Thu, 10 Jun 2021 05:58:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AE2819C46;
 Thu, 10 Jun 2021 05:58:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 63E2E180093F; Thu, 10 Jun 2021 07:57:55 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/18] modules: add qemu-modinfo utility
Date: Thu, 10 Jun 2021 07:57:40 +0200
Message-Id: <20210610055755.538119-4-kraxel@redhat.com>
In-Reply-To: <20210610055755.538119-1-kraxel@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Scan .modinfo sections of qemu modules,
write module metadata to modinfo.json.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qemu-modinfo.c | 270 +++++++++++++++++++++++++++++++++++++++++++++++++
 meson.build    |  11 ++
 2 files changed, 281 insertions(+)
 create mode 100644 qemu-modinfo.c

diff --git a/qemu-modinfo.c b/qemu-modinfo.c
new file mode 100644
index 000000000000..611dbdb00683
--- /dev/null
+++ b/qemu-modinfo.c
@@ -0,0 +1,270 @@
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
+#include <stdint.h>
+#include <dirent.h>
+
+#include "qapi/qapi-types-modules.h"
+#include "qapi/qapi-visit-modules.h"
+#include "qapi/qobject-output-visitor.h"
+#include "qapi/qmp/qjson.h"
+#include "qapi/qmp/qstring.h"
+
+#if INTPTR_MAX == INT32_MAX
+# define Elf_Ehdr Elf32_Ehdr
+# define Elf_Shdr Elf32_Shdr
+# define ELFCLASS ELFCLASS32
+#elif INTPTR_MAX == INT64_MAX
+# define Elf_Ehdr Elf64_Ehdr
+# define Elf_Shdr Elf64_Shdr
+# define ELFCLASS ELFCLASS64
+#else
+# error Huh?  Neither 32-bit nor 64-bit host.
+#endif
+
+static const char *moddir = CONFIG_QEMU_MODDIR;
+static const char *dsosuf = CONFIG_HOST_DSOSUF;
+
+static ModuleInfo *modinfo(const char *module, char *info, size_t size)
+{
+    ModuleInfo *modinfo;
+    strList *sl;
+    size_t pos = 0, len;
+
+    modinfo = g_new0(ModuleInfo, 1);
+    modinfo->name = g_strdup(module);
+
+    if (info) {
+        do {
+            if (strncmp(info + pos, "obj=", 4) == 0) {
+                sl = g_new0(strList, 1);
+                sl->value = g_strdup(info + pos + 4);
+                sl->next = modinfo->objs;
+                modinfo->objs = sl;
+                modinfo->has_objs = true;
+            } else if (strncmp(info + pos, "dep=", 4) == 0) {
+                sl = g_new0(strList, 1);
+                sl->value = g_strdup(info + pos + 4);
+                sl->next = modinfo->deps;
+                modinfo->deps = sl;
+                modinfo->has_deps = true;
+            } else if (strncmp(info + pos, "arch=", 5) == 0) {
+                modinfo->arch = g_strdup(info + pos + 5);
+                modinfo->has_arch = true;
+            } else if (strncmp(info + pos, "opts=", 5) == 0) {
+                modinfo->opts = g_strdup(info + pos + 5);
+                modinfo->has_opts = true;
+            } else {
+                fprintf(stderr, "unknown tag: %s\n", info + pos);
+                exit(1);
+            }
+            len = strlen(info + pos) + 1;
+            pos += len;
+        } while (pos < size);
+    }
+
+    return modinfo;
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
+static ModuleInfo *elf_parse_module(const char *module,
+                                    const char *filename)
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
+    fp = fopen(filename, "r");
+    if (NULL == fp) {
+        fprintf(stderr, "open %s: %s\n", filename, strerror(errno));
+        exit(1);
+    }
+
+    ret = fread(&ehdr, sizeof(ehdr), 1, fp);
+    if (ret != 1) {
+        fprintf(stderr, "read error (%s)\n", filename);
+        exit(1);
+    }
+
+    if (ehdr.e_ident[EI_MAG0] != ELFMAG0 ||
+        ehdr.e_ident[EI_MAG1] != ELFMAG1 ||
+        ehdr.e_ident[EI_MAG2] != ELFMAG2 ||
+        ehdr.e_ident[EI_MAG3] != ELFMAG3) {
+        fprintf(stderr, "not an elf file (%s)\n", filename);
+        exit(1);
+    }
+    if (ehdr.e_ident[EI_CLASS] != ELFCLASS64) {
+        fprintf(stderr, "elf class mismatch (%s)\n", filename);
+        exit(1);
+    }
+    if (ehdr.e_shoff == 0) {
+        fprintf(stderr, "no section header (%s)\n", filename);
+        exit(1);
+    }
+
+    /* read string table */
+    if (ehdr.e_shstrndx == 0) {
+        fprintf(stderr, "no section strings (%s)\n", filename);
+        exit(1);
+    }
+    str = elf_read_section(fp, &ehdr, ehdr.e_shstrndx, &str_size);
+    if (NULL == str) {
+        fprintf(stderr, "no section strings (%s)\n", filename);
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
+    fclose(fp);
+
+    return modinfo(module, info, info_size);
+}
+
+int main(int argc, char **argv)
+{
+    DIR *dir;
+    FILE *fp;
+    ModuleInfo *modinfo;
+    ModuleInfoList *modlist;
+    Modules *modules;
+    Visitor *v;
+    QObject *obj;
+    Error *errp = NULL;
+    struct dirent *ent;
+    char *ext, *file, *name;
+    GString *gjson;
+    QString *qjson;
+    const char *json;
+
+    if (argc > 1) {
+        moddir = argv[1];
+    }
+
+    dir = opendir(moddir);
+    if (dir == NULL) {
+        fprintf(stderr, "opendir(%s): %s\n", moddir, strerror(errno));
+        exit(1);
+    }
+
+    modules = g_new0(Modules, 1);
+    while (NULL != (ent = readdir(dir))) {
+        ext = strrchr(ent->d_name, '.');
+        if (!ext) {
+            continue;
+        }
+        if (strcmp(ext, dsosuf) != 0) {
+            continue;
+        }
+
+        name = g_strndup(ent->d_name, ext - ent->d_name);
+        file = g_strdup_printf("%s/%s", moddir, ent->d_name);
+        modinfo = elf_parse_module(name, file);
+        g_free(file);
+        g_free(name);
+
+        modlist = g_new0(ModuleInfoList, 1);
+        modlist->value = modinfo;
+        modlist->next = modules->list;
+        modules->list = modlist;
+    }
+    closedir(dir);
+
+    v = qobject_output_visitor_new(&obj);
+    visit_type_Modules(v, NULL, &modules, &errp);
+    visit_complete(v, &obj);
+    visit_free(v);
+
+    gjson = qobject_to_json(obj);
+    qjson = qstring_from_gstring(gjson);
+    json = qstring_get_str(qjson);
+
+    file = g_strdup_printf("%s/modinfo.json", moddir);
+    fp = fopen(file, "w");
+    if (fp == NULL) {
+        fprintf(stderr, "open(%s): %s\n", file, strerror(errno));
+        exit(1);
+    }
+    fprintf(fp, "%s", json);
+    fclose(fp);
+
+    printf("%s written\n", file);
+    g_free(file);
+    return 0;
+}
diff --git a/meson.build b/meson.build
index d2a9ce91f556..9823c5889140 100644
--- a/meson.build
+++ b/meson.build
@@ -2380,6 +2380,17 @@ if xkbcommon.found()
                            dependencies: [qemuutil, xkbcommon], install: have_tools)
 endif
 
+if config_host.has_key('CONFIG_MODULES')
+   qemu_modinfo = executable('qemu-modinfo', files('qemu-modinfo.c') + genh,
+                             dependencies: [glib, qemuutil], install: have_tools)
+   custom_target('modinfo.json',
+                 input: [ softmmu_mods, block_mods ],
+                 output: 'modinfo.json',
+                 install: true,
+                 install_dir: qemu_moddir,
+                 command: [ qemu_modinfo, '.' ])
+endif
+
 if have_tools
   qemu_img = executable('qemu-img', [files('qemu-img.c'), hxdep],
              dependencies: [authz, block, crypto, io, qom, qemuutil], install: true)
-- 
2.31.1


