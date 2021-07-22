Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080F93D26FA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:44:31 +0200 (CEST)
Received: from localhost ([::1]:47908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6asA-00036Y-4j
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akK-0000bO-4I
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:24 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akG-0002jX-OB
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:23 -0400
Received: by mail-ed1-x530.google.com with SMTP id l1so7292316edr.11
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PpjWAo5stvNiyV4KTcrkBtX4qLcVV0HWWyAwngBxZRI=;
 b=bndu2lu5JmTiSfC+0MLNz4ocB5drLs8nmJ2MIEwaYPPoBFjLLUQK2trTDT1PRBOc3u
 fUH2qepoYwrn6dkGzhT2GCXSZAfAsuUU6xWdGDwyyaEtyEEKFmNtLe5G4VVj40QyYx20
 XOfJW8RZJIBWp2k7hiSZhatElSXs+1s8cl7yodeA0ErVIwanOGOjrEE5U59LQcXrk9Kk
 JdpZN018yielj/YWBoJuKqQaj2Npvk7D5fibHXmPp/0JQnl0MtQo4sQ2Iv7R77Rc5J9X
 8SrmwyVMfoLIaFNMdrjQwk2k/5DvW5+O1puOfpoAv38tB4LllryVujWenHkhUEOR7EA4
 SXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PpjWAo5stvNiyV4KTcrkBtX4qLcVV0HWWyAwngBxZRI=;
 b=IqLnTYBkRJISHlS4k72bibL+4HyE1qLTqMZ6+IA7hbSfat6Nu6v9XqzVkPTP+VZmME
 k1/cOxb5fONb91FsNjgjaxIKEwZQ3jX4AEA+8QaNskawq/vrti0uW2QZQt9qt7Bw1wR+
 eeY7RgpyVIZ4VbPxXYCAHWyMjBvDaaYU6DjdujUmqkggg38muu3ZJM6fp3lvnDl3C2VG
 DaDfda4kZxBt2FLViUyDFsb01m9muUvEUU8Tq/BYSy8PvNrshqOpLxXq7J3jS1uqkmst
 iIL7d506JhblhRDWvNajbA5Ms9qE6r5NwUx8AqdqSFZHliwlIyMNo/8mJZYdkTmG3lt0
 ukww==
X-Gm-Message-State: AOAM533BOoqJn1+Jky4aIiZMu/YITqIMNOTE8nzM86RuSjwr29qdpsW4
 ekHUm35MJZZ/uTxv4WMiESLzhJaMh1Ei5w==
X-Google-Smtp-Source: ABdhPJxeSduW9zXhO4fviwEmrXkcVyQj/p+NLsVH/WbNZgMvCL9DUwAoaz1JEFj5kj1BLTD6t1gtAQ==
X-Received: by 2002:a05:6402:60c:: with SMTP id
 n12mr228960edv.189.1626968178272; 
 Thu, 22 Jul 2021 08:36:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qo6sm9638628ejb.122.2021.07.22.08.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:36:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/15] qemu-config: restore "machine" in
 qmp_query_command_line_options()
Date: Thu, 22 Jul 2021 17:36:03 +0200
Message-Id: <20210722153612.955537-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722153612.955537-1-pbonzini@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Commit d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4 ("vl: switch -M parsing
to keyval") stopped adding the "machine" QemuOptsList. This causes
"machine" options to not show up in QMP query-command-line-options
output. For example, libvirt cannot detect that kernel_irqchip support
is available.

Adjust the "machine" opts enumeration in
qmp_query_command_line_options() so that options are properly reported.

Fixes: d8fb7d0969d5 ("vl: switch -M parsing to keyval")
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210721151055.424580-1-stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-config.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/util/qemu-config.c b/util/qemu-config.c
index fdf6cd69fc..436ab63b16 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -255,8 +255,6 @@ CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
             info->option = g_strdup(vm_config_groups[i]->name);
             if (!strcmp("drive", vm_config_groups[i]->name)) {
                 info->parameters = get_drive_infolist();
-            } else if (!strcmp("machine", vm_config_groups[i]->name)) {
-                info->parameters = query_option_descs(machine_opts.desc);
             } else {
                 info->parameters =
                     query_option_descs(vm_config_groups[i]->desc);
@@ -265,6 +263,13 @@ CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
         }
     }
 
+    if (!has_option || !strcmp(option, "machine")) {
+        info = g_malloc0(sizeof(*info));
+        info->option = g_strdup("machine");
+        info->parameters = query_option_descs(machine_opts.desc);
+        QAPI_LIST_PREPEND(conf_list, info);
+    }
+
     if (conf_list == NULL) {
         error_setg(errp, "invalid option name: %s", option);
     }
-- 
2.31.1



