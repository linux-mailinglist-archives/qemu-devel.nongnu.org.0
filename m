Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2DE3C1625
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:38:36 +0200 (CEST)
Received: from localhost ([::1]:56306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1W6l-0008PV-Nl
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn6-000109-Ob
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:16 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn5-0008IO-7n
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:16 -0400
Received: by mail-ed1-x536.google.com with SMTP id x12so9050889eds.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wgLR4BFruCvCVVrS0V66nKDVCDgtz515OctKa1CFYC4=;
 b=GY+4Oi36mO/zFZIjfsMajywuuvuBKLQABqjqM46GxQ/zaPFijRUjnRBvALtIyvd3Iu
 bH8ao85PYg8s9SpYbhfKhSglIwWt31RexVyR4juonp8lk1ziGWks+ky4sIAUe04jT1sX
 RTazKAgizVaXg3UOJbkEqDVHlJjndohFFe5Hjh2Ef22kVAe6xtnQZiluSy5TmoOWLEU2
 sh6DQf1oXVVvWSIo19jkplUeld/ypeS0eYk1JqeLRonjSGx+Z9vc/JVjCB0wNGMLzOcN
 JOCUfqsUS9BuBNF8V4sncNMkR5IqdY+VJM9aR38udm7JYXpt+20MnBjgceysv9vB/mz7
 89TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wgLR4BFruCvCVVrS0V66nKDVCDgtz515OctKa1CFYC4=;
 b=ELsi1ZSjZKZq2eK+cvEVPObLdaEN60+Qlzq9RAxr4w71sJnZQ0PUEmS0Zuzmh1w8Cw
 DmGqkUiRHKBW6H1syGyCbHM1D34Wk8ryr7c5zn0eTGTzehVU3PYN5B9B3UT1ISnZg2ND
 m50rZhNwDi1fWLe/hizQc5e1hmI6erL9fSBohDmspeY1f+19ftJoW1BnuWnWEOck2LQu
 5IITOFD8OKTGzD3OXXZUljUdwCLkqIJg+dMVuN+S6/oRMUyIZdenxB0HKFH/Kj1kRXZq
 zF19BnO+iIBWoyAMF2L79qGh0dW6PWehCU5zetjlQK3gGaSTkXeE6gAC6e1pSAcEMUIj
 K06g==
X-Gm-Message-State: AOAM533zJbCil6WGzfdD4TrVMAYqmAYFG0UhBujwn5XKLj8SDFrkLVAh
 1X8/zsFPZYAJILhLpuGUe9PxUqR5nRo=
X-Google-Smtp-Source: ABdhPJxbEfT/ljzWFg8xIQfOrkuIjHDloOgNAoOHvHNtMGoE/IRJPWKd06WKVOXb/R53YIuCSQZ0jQ==
X-Received: by 2002:a50:c88b:: with SMTP id d11mr2371136edh.318.1625757494055; 
 Thu, 08 Jul 2021 08:18:14 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/48] monitor: allow register hmp commands
Date: Thu,  8 Jul 2021 17:17:34 +0200
Message-Id: <20210708151748.408754-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Allow commands having a NULL cmd pointer, add a function to set the
pointer later.  Use case: allow modules implement hmp commands.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-31-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/monitor/monitor.h |  3 +++
 monitor/hmp.c             |  7 +++++++
 monitor/misc.c            | 16 ++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 1211d6e6d6..1a8a369b50 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -51,4 +51,7 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id, int flags);
 void monitor_fdset_dup_fd_remove(int dup_fd);
 int64_t monitor_fdset_dup_fd_find(int dup_fd);
 
+void monitor_register_hmp(const char *name, bool info,
+                          void (*cmd)(Monitor *mon, const QDict *qdict));
+
 #endif /* MONITOR_H */
diff --git a/monitor/hmp.c b/monitor/hmp.c
index 6c0b33a0b1..d50c3124e1 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1089,6 +1089,13 @@ void handle_hmp_command(MonitorHMP *mon, const char *cmdline)
         return;
     }
 
+    if (!cmd->cmd) {
+        /* FIXME: is it useful to try autoload modules here ??? */
+        monitor_printf(&mon->common, "Command \"%.*s\" is not available.\n",
+                       (int)(cmdline - cmd_start), cmd_start);
+        return;
+    }
+
     qdict = monitor_parse_arguments(&mon->common, &cmdline, cmd);
     if (!qdict) {
         while (cmdline > cmd_start && qemu_isspace(cmdline[-1])) {
diff --git a/monitor/misc.c b/monitor/misc.c
index 1539e18557..ad476c6e51 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1974,6 +1974,22 @@ static void sortcmdlist(void)
           compare_mon_cmd);
 }
 
+void monitor_register_hmp(const char *name, bool info,
+                          void (*cmd)(Monitor *mon, const QDict *qdict))
+{
+    HMPCommand *table = info ? hmp_info_cmds : hmp_cmds;
+
+    while (table->name != NULL) {
+        if (strcmp(table->name, name) == 0) {
+            g_assert(table->cmd == NULL);
+            table->cmd = cmd;
+            return;
+        }
+        table++;
+    }
+    g_assert_not_reached();
+}
+
 void monitor_init_globals(void)
 {
     monitor_init_globals_core();
-- 
2.31.1



