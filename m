Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D26512CAB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:25:55 +0200 (CEST)
Received: from localhost ([::1]:60404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njyXC-0001Nq-Mn
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy22-000090-O4
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:42 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:36763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy20-000555-TQ
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:42 -0400
Received: by mail-ed1-x533.google.com with SMTP id a1so4401603edt.3
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oacl5zBrDKP+vkk8XImtvnuzIDKCJChcNYTiCEt2Cts=;
 b=ZiY8siyYfC74M+VpRrcugBiSp5Ef4eoU1NwLaeiIfugnUZHhazb0qehj/UmwPjxnDg
 x4lDPZkodaO7i4jO33vgJ7c6si9cO6vj1M5fo+8ammhfMtuoZt+j17jneChOMeRzVipa
 RjqIzge8J7RbeBEtd1IMLOs7I+yKWDHEe4ZjnjAKCuygxdMt7yaSwCu/bXxdfyXN1r7P
 4vhnsI+265Cjgd6gyYbV1jilWhMtyaZ1Y9d1WAibzpoxxVADIfB8GRdcW9qjMj43tRr5
 qJM5PU/2djyqtPlsVXsCOZatkl3JjFlbPpu1cG9oueeliD0nN/fo4ca5sZBpKpJcgmwH
 pxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oacl5zBrDKP+vkk8XImtvnuzIDKCJChcNYTiCEt2Cts=;
 b=ISr1/ShAFjsxyqjJFMzoDBwV+kNfd5PPhALn3nLhL/NBJ4JBJXvBNJhxfJci0mZhvu
 TcGOqZc1G49Y21PA1FEHhGT9+h9kz+LNGfndpqwbsReprS1j3+U/meHnLW7s/XFKMhpt
 5w7kMoNRHe4qYhaH8nkD3w4f+8kT+DTF6ZWOgNdJSucksyHYrIdeCqXKH9PwtSZP61NZ
 cpSGLsFLDT+WEObcAUUQXLjG2+DxTfbOz3/8O3c8qVIseXnlXT/etnOyacM+fLX0LcsN
 jDvl5w4Nf4js9OgvI7IW/816q9ERN4BQLOByRSznwmwsOYIzW0HREw6sfiLWY9cbHjIK
 r9mg==
X-Gm-Message-State: AOAM530Ht8fdRD49/l0HmpsJw5OjKOOw0JtMsDSeOZO6zFkzbH/h3++U
 erX2qZbSl844SDYr12bB3Aluc8P3REm3Qw==
X-Google-Smtp-Source: ABdhPJz43YKrQK4ittzQwq8g1EHvq0wNMGB5tD8hi+FcA5lUnkRthlVGIBQYTMcMUH2GhWnRc6te6w==
X-Received: by 2002:a05:6402:26c5:b0:425:f7f0:fb6c with SMTP id
 x5-20020a05640226c500b00425f7f0fb6cmr14570282edd.133.1651128819457; 
 Wed, 27 Apr 2022 23:53:39 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/18] remove -writeconfig
Date: Thu, 28 Apr 2022 08:53:20 +0200
Message-Id: <20220428065335.189795-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Like -set and -readconfig, it would not really be too hard to
extend -writeconfig to parsing mechanisms other than QemuOpts.
However, the uses of -writeconfig are substantially more
limited, as it is generally easier to write the configuration
by hand in the first place.  In addition, -writeconfig does
not even try to detect cases where it prints incorrect
syntax (for example if values have a quote in them, since
qemu_config_parse does not support any kind of escaping.
Just remove it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220414145721.326866-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/deprecated.rst       |  7 ------
 docs/about/removed-features.rst |  7 ++++++
 include/qemu/config-file.h      |  1 -
 qemu-options.hx                 |  8 ++-----
 softmmu/vl.c                    | 20 ----------------
 util/qemu-config.c              | 42 ---------------------------------
 6 files changed, 9 insertions(+), 76 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 257cc15f82..896e5a97ab 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -67,13 +67,6 @@ and will cause a warning.
 The replacement for the ``nodelay`` short-form boolean option is ``nodelay=on``
 rather than ``delay=off``.
 
-``-writeconfig`` (since 6.0)
-'''''''''''''''''''''''''''''
-
-The ``-writeconfig`` option is not able to serialize the entire contents
-of the QEMU command line.  It is thus considered a failed experiment
-and deprecated, with no current replacement.
-
 Userspace local APIC with KVM (x86, since 6.0)
 ''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 7c37dc2bda..4a0b270296 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -348,6 +348,13 @@ or ``gnutls`` library enabled as a cryptography provider.
 Neither the ``nettle`` library, or the built-in cryptography provider are
 supported on FIPS enabled hosts.
 
+``-writeconfig`` (removed in 7.1)
+'''''''''''''''''''''''''''''''''
+
+The ``-writeconfig`` option was not able to serialize the entire contents
+of the QEMU command line.  It is thus considered a failed experiment
+and removed without a replacement.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
index f605423321..321e7c7c03 100644
--- a/include/qemu/config-file.h
+++ b/include/qemu/config-file.h
@@ -12,7 +12,6 @@ void qemu_add_opts(QemuOptsList *list);
 void qemu_add_drive_opts(QemuOptsList *list);
 int qemu_global_option(const char *str);
 
-void qemu_config_write(FILE *fp);
 int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname,
                       Error **errp);
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 1764eebfaf..bc196808ae 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4622,18 +4622,14 @@ SRST
 ERST
 
 DEF("readconfig", HAS_ARG, QEMU_OPTION_readconfig,
-    "-readconfig <file>\n", QEMU_ARCH_ALL)
+    "-readconfig <file>\n"
+    "                read config file\n", QEMU_ARCH_ALL)
 SRST
 ``-readconfig file``
     Read device configuration from file. This approach is useful when
     you want to spawn QEMU process with many command line options but
     you don't want to exceed the command line character limit.
 ERST
-DEF("writeconfig", HAS_ARG, QEMU_OPTION_writeconfig,
-    "-writeconfig <file>\n"
-    "                read/write config file (deprecated)\n", QEMU_ARCH_ALL)
-SRST
-ERST
 
 DEF("no-user-config", 0, QEMU_OPTION_nouserconfig,
     "-no-user-config\n"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 06a0e342fe..c2919579fd 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3551,26 +3551,6 @@ void qemu_init(int argc, char **argv, char **envp)
                 display_remote++;
                 break;
 #endif
-            case QEMU_OPTION_writeconfig:
-                {
-                    FILE *fp;
-                    warn_report("-writeconfig is deprecated and will go away without a replacement");
-                    if (strcmp(optarg, "-") == 0) {
-                        fp = stdout;
-                    } else {
-                        fp = fopen(optarg, "w");
-                        if (fp == NULL) {
-                            error_report("open %s: %s", optarg,
-                                         strerror(errno));
-                            exit(1);
-                        }
-                    }
-                    qemu_config_write(fp);
-                    if (fp != stdout) {
-                        fclose(fp);
-                    }
-                    break;
-                }
             case QEMU_OPTION_qtest:
                 qtest_chrdev = optarg;
                 break;
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 436ab63b16..433488aa56 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -314,48 +314,6 @@ void qemu_add_opts(QemuOptsList *list)
     abort();
 }
 
-struct ConfigWriteData {
-    QemuOptsList *list;
-    FILE *fp;
-};
-
-static int config_write_opt(void *opaque, const char *name, const char *value,
-                            Error **errp)
-{
-    struct ConfigWriteData *data = opaque;
-
-    fprintf(data->fp, "  %s = \"%s\"\n", name, value);
-    return 0;
-}
-
-static int config_write_opts(void *opaque, QemuOpts *opts, Error **errp)
-{
-    struct ConfigWriteData *data = opaque;
-    const char *id = qemu_opts_id(opts);
-
-    if (id) {
-        fprintf(data->fp, "[%s \"%s\"]\n", data->list->name, id);
-    } else {
-        fprintf(data->fp, "[%s]\n", data->list->name);
-    }
-    qemu_opt_foreach(opts, config_write_opt, data, NULL);
-    fprintf(data->fp, "\n");
-    return 0;
-}
-
-void qemu_config_write(FILE *fp)
-{
-    struct ConfigWriteData data = { .fp = fp };
-    QemuOptsList **lists = vm_config_groups;
-    int i;
-
-    fprintf(fp, "# qemu config file\n\n");
-    for (i = 0; lists[i] != NULL; i++) {
-        data.list = lists[i];
-        qemu_opts_foreach(data.list, config_write_opts, &data, NULL);
-    }
-}
-
 /* Returns number of config groups on success, -errno on error */
 static int qemu_config_foreach(FILE *fp, QEMUConfigCB *cb, void *opaque,
                                const char *fname, Error **errp)
-- 
2.35.1



