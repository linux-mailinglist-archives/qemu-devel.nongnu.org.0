Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3E521E722
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 06:53:02 +0200 (CEST)
Received: from localhost ([::1]:40394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvCw9-0005nd-J4
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 00:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jvCui-00047X-P5; Tue, 14 Jul 2020 00:51:32 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:46730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jvCuh-0004u7-7Z; Tue, 14 Jul 2020 00:51:32 -0400
Received: by mail-qt1-x844.google.com with SMTP id i3so11860924qtq.13;
 Mon, 13 Jul 2020 21:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iKj8QRlEHnqQiQIMVUyx74CJD+1/xr2oFDQvFu0P86g=;
 b=gZA4fa5NxvZLxT7grMJolKq91xCjVvT8jUa4VoeoQ37Zt1nHyexY+3w2ymmqBzTg/b
 s6SL0QSJceP7IVHCooku83imwJsfJPcQLuXI52mdG5BSii+ZTlLSpzWyDdDxX7mhRvEv
 ioHuJvwXWrqF/NHkeNvgD+F8tqYjmNdS8fabJPARLnLooPa2bieH/z62aC02D9fmMsTf
 q6s9KUeZr1lqM+HIdlyU7/oxjQUpHIAWwOco2yCcJ3CIrTPfnizoImhlBo1vSB+BZJ9J
 SQwS1D9Hf86jFnIRMYOtmbH4SgVy2b/U+6kz94KIdTp+wFVb4pf2Tv7S66pe/NdKzzOo
 zebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iKj8QRlEHnqQiQIMVUyx74CJD+1/xr2oFDQvFu0P86g=;
 b=bMAvhcWhDz1r+SKIG+CJnnOt9bJsu7UDFUCKffQaIaII2Vrfwmv8zadIHgjTNMARD3
 meWOsqpKP43X/V1/S8ah/dmrmmw2IVB/6JJ0DA8/XXFtAv9TqDQ3KMlBZeb/YcFlwSuo
 p90oxBlzJQjhHLoaCg6Zt2RLsoMqsUhuuxUNeAEWtMkX0jkfeJL9rRfWi3co3e7DrR0y
 /ELE2ofgsxWuoubURNKPNpObyO7xG6lwwH7cy3gwTXEO6sy3O9mSSO1ttYasEzhzZut2
 A5pYjH4CL3MEFZkXJVJKh+saGe9+PDzxT/oPZt+Idgezwq+cGvZF7visBveM36GaGVKh
 gukw==
X-Gm-Message-State: AOAM531cAnP7ORF/gJjDfK1PUvjuQYX9yb08cxCBq5OSjNZB9MrzsYQF
 GipVKLpGUJcLuml9wZIPGnGseabr
X-Google-Smtp-Source: ABdhPJw9pbjlDMYjYUGRWBPGq/oxTABJG9F496KlXrJgyWwvFustjn8tuJbIoeNnnEpBE1fbWzFlFw==
X-Received: by 2002:ac8:4643:: with SMTP id f3mr2947246qto.128.1594702289484; 
 Mon, 13 Jul 2020 21:51:29 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id m14sm22046370qke.99.2020.07.13.21.51.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Jul 2020 21:51:28 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] util: Introduce qemu_get_host_name()
Date: Mon, 13 Jul 2020 23:51:13 -0500
Message-Id: <20200714045114.29319-4-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200714045114.29319-1-mdroth@linux.vnet.ibm.com>
References: <20200714045114.29319-1-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::844;
 envelope-from=flukshun@gmail.com; helo=mail-qt1-x844.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-stable@nongnu.org,
 Michal Privoznik <mprivozn@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michal Privoznik <mprivozn@redhat.com>

This function offers operating system agnostic way to fetch host
name. It is implemented for both POSIX-like and Windows systems.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 include/qemu/osdep.h | 10 ++++++++++
 util/oslib-posix.c   | 35 +++++++++++++++++++++++++++++++++++
 util/oslib-win32.c   | 13 +++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 979a403984..4841b5c6b5 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -655,4 +655,14 @@ static inline void qemu_reset_optind(void)
 #endif
 }
 
+/**
+ * qemu_get_host_name:
+ * @errp: Error object
+ *
+ * Operating system agnostic way of querying host name.
+ *
+ * Returns allocated hostname (caller should free), NULL on failure.
+ */
+char *qemu_get_host_name(Error **errp);
+
 #endif
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 72907d4d7f..e60aea85b6 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -794,3 +794,38 @@ void sigaction_invoke(struct sigaction *action,
     }
     action->sa_sigaction(info->ssi_signo, &si, NULL);
 }
+
+#ifndef HOST_NAME_MAX
+# ifdef _POSIX_HOST_NAME_MAX
+#  define HOST_NAME_MAX _POSIX_HOST_NAME_MAX
+# else
+#  define HOST_NAME_MAX 255
+# endif
+#endif
+
+char *qemu_get_host_name(Error **errp)
+{
+    long len = -1;
+    g_autofree char *hostname = NULL;
+
+#ifdef _SC_HOST_NAME_MAX
+    len = sysconf(_SC_HOST_NAME_MAX);
+#endif /* _SC_HOST_NAME_MAX */
+
+    if (len < 0) {
+        len = HOST_NAME_MAX;
+    }
+
+    /* Unfortunately, gethostname() below does not guarantee a
+     * NULL terminated string. Therefore, allocate one byte more
+     * to be sure. */
+    hostname = g_new0(char, len + 1);
+
+    if (gethostname(hostname, len) < 0) {
+        error_setg_errno(errp, errno,
+                         "cannot get hostname");
+        return NULL;
+    }
+
+    return g_steal_pointer(&hostname);
+}
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index e9b14ab178..3b49d27297 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -808,3 +808,16 @@ bool qemu_write_pidfile(const char *filename, Error **errp)
     }
     return true;
 }
+
+char *qemu_get_host_name(Error **errp)
+{
+    wchar_t tmp[MAX_COMPUTERNAME_LENGTH + 1];
+    DWORD size = G_N_ELEMENTS(tmp);
+
+    if (GetComputerNameW(tmp, &size) == 0) {
+        error_setg_win32(errp, GetLastError(), "failed close handle");
+        return NULL;
+    }
+
+    return g_utf16_to_utf8(tmp, size, NULL, NULL, NULL);
+}
-- 
2.17.1


