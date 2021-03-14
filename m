Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4F533A8D7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:35:56 +0100 (CET)
Received: from localhost ([::1]:59524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaH5-0006kv-JW
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaBH-0008QJ-PQ
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:29:56 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaBG-0003iL-8o
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:29:55 -0400
Received: by mail-wr1-x433.google.com with SMTP id l12so7795719wry.2
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 16:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jJdhWW4fK4y5udXyK0NB1puC8z9XRvo9dDPHL5cwnpk=;
 b=r23GqKf9+DtJ9Us3Xw4RWewY3fgqXnWHzcUXztmGXO8letFa6EU5fLl4bK+gYVBUYj
 tEqXSSM+HU67zV+HEz8NAT58Uja0m+AV46WwapNqunaX3j688C0jX8Q+kspzUoBJhBvO
 yJ3pQ0JhI0u2oF6QUXYkAcH9siR4jLVPMfv5en/9WvimhshaTz10F+oAiT2T9iR2QawV
 q9PwwPuHTJS26EJn5tO3ht1luBVPFajRnOJEYyqrt94aKKbUhSz8Sj8ODcwuB1FitaPR
 QURDaEU+vfA3zfZmuPzP3odY8NhKcuxL35OCDB2C1ZtpXgA6hp1TbhtwoUvuQ78iNesz
 PoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jJdhWW4fK4y5udXyK0NB1puC8z9XRvo9dDPHL5cwnpk=;
 b=L4zJnO5KFvT3qKO0jmPaSF0woap14zp6jVvU/OIH5jLT9lGK/SHkO5RhJtmGmTihX3
 zTgjMb6ermjW0UV0bHcB+btkkRMqHohVqrPKWJ+TS64G85Eiea8gSVjxYWA/oRBc52ve
 FiuTidmk4dbd8NOgFjGAth+0ZzOcdWDUT6Pt6dFJQdG31Ubqw8hfPrFQlxSc1+i26ZQC
 Hf2es/jtmbY/vl1aiWY7hBta6ev5IuYfpnRttU6vAEpG5c9aom1r7jKIouvLddmocD5G
 /TEm079qNvnn9BvJDeU3dT4y95MReXo25aN/fi2LwtuGJTKVTRIADT3x7nCKIEnhKouY
 ZFuA==
X-Gm-Message-State: AOAM530eRTah5xAz7dI9hZgj5ODqG5jlpEsQfZuwTP7AdMLTuKGea2zm
 LpkrjdwCuNsWdAYY6WCrOhkHW+OGLrH2OQ==
X-Google-Smtp-Source: ABdhPJzKTB63rtSEOGIVWIkzGei/LAwidsPG0NwIli/yvBSG5aam3MaMz0qu0bu7YgHi6TsGinIyHg==
X-Received: by 2002:a5d:4903:: with SMTP id x3mr24656623wrq.143.1615764592458; 
 Sun, 14 Mar 2021 16:29:52 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o2sm7336952wmc.23.2021.03.14.16.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 16:29:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 7/8] monitor: Restrict CPU I/O instructions
Date: Mon, 15 Mar 2021 00:29:12 +0100
Message-Id: <20210314232913.2607360-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210314232913.2607360-1-f4bug@amsat.org>
References: <20210314232913.2607360-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict CPU I/O instructions to architectures providing
I/O bus.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 monitor/misc.c  | 4 ++++
 hmp-commands.hx | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/monitor/misc.c b/monitor/misc.c
index d40c7d5afc0..b59f11433eb 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -77,7 +77,9 @@
 #include "qapi/qmp-event.h"
 #include "sysemu/cpus.h"
 #include "qemu/cutils.h"
+#ifdef TARGET_HAS_IOPORT
 #include "exec/cpu-io.h"
+#endif
 #if defined(TARGET_S390X)
 #include "hw/s390x/storage-keys.h"
 #include "hw/s390x/storage-attributes.h"
@@ -884,6 +886,7 @@ static void hmp_mouse_button(Monitor *mon, const QDict *qdict)
     mouse_button_state = button_state;
 }
 
+#ifdef TARGET_HAS_IOPORT
 static void hmp_ioport_read(Monitor *mon, const QDict *qdict)
 {
     int size = qdict_get_int(qdict, "size");
@@ -939,6 +942,7 @@ static void hmp_ioport_write(Monitor *mon, const QDict *qdict)
         break;
     }
 }
+#endif /* TARGET_HAS_IOPORT */
 
 static void hmp_boot_set(Monitor *mon, const QDict *qdict)
 {
diff --git a/hmp-commands.hx b/hmp-commands.hx
index d4001f9c5dc..cedcedf7d8d 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -561,6 +561,7 @@ SRST
   used.
 ERST
 
+#ifdef TARGET_HAS_IOPORT
     {
         .name       = "i",
         .args_type  = "fmt:/,addr:i,index:i.",
@@ -586,6 +587,7 @@ SRST
 ``o/``\ *fmt* *addr* *val*
   Write to I/O port.
 ERST
+#endif /* TARGET_HAS_IOPORT */
 
     {
         .name       = "sendkey",
-- 
2.26.2


