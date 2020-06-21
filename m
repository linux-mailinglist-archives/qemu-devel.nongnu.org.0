Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B085E202B94
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Jun 2020 18:36:14 +0200 (CEST)
Received: from localhost ([::1]:56262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jn2x3-0007UH-O4
	for lists+qemu-devel@lfdr.de; Sun, 21 Jun 2020 12:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noh4hss@gmail.com>) id 1jn2jl-0006nu-A8
 for qemu-devel@nongnu.org; Sun, 21 Jun 2020 12:22:29 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:39370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <noh4hss@gmail.com>) id 1jn2jj-0007xk-4G
 for qemu-devel@nongnu.org; Sun, 21 Jun 2020 12:22:29 -0400
Received: by mail-lj1-x244.google.com with SMTP id a9so16628564ljn.6
 for <qemu-devel@nongnu.org>; Sun, 21 Jun 2020 09:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/OUUBKDsy3J40KxRYAgVxdYTHQyEXQLdkmrBWWB58eM=;
 b=bxXxVtqdICCNBJooeKtTOAVbxF09EFlkmcc91+j6Vfdm6tyLqpisg8rfmHqJuG5c8Y
 +uGg95J2/4oVIc3KwsEEMj+EaJo0kVxjSNiBH6KR/2Q7IyX/Z2YPl5WPueXgdTJouxVc
 SXmR3Jo0JRX8OTzXHS2RlqPXmb3jr8xaolPTOr2VNeiQoA8qw1kKpJExP4kWIP8+EGyZ
 JTUzE8ZEbHYf7TQrAb93Duty03HuXSoThIBX7FaXbvABzqG3+M9jvga0HRNW50XuCzGT
 qIOcMeGq630VH85iRcNVmRlwvxPVTa4l50QSakut5zMUmC/LEIpp4YL/wszmIRIp3umc
 iXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/OUUBKDsy3J40KxRYAgVxdYTHQyEXQLdkmrBWWB58eM=;
 b=CF+1mUf/e0zt0k7VLUOprtfrPVO0CfcsZZKwwnxsGPFnzxg0EiZIkhC47oRGJykqii
 w563IfQOYeW0lm9vnde5W8Ah3HNDTYglWZFivSkQBpYDo41T8yzuh4yJJ8wseDMGk4Qc
 sNds8P4K7dzAeuX1VelG860ARhP5qGmBtCzor/Cxd9yvi9sxoQml0l6UP+grK56vbaFM
 gtjPIdjUMfDNbxtNiLfrOrIMRMF4s+WwoHE5tRRwaCeKj+/NYVG/XUQpBzj+fudIrVXN
 WReJYS3xYJm022qGSjjE4tv3ee2Ws6YyZi97GVsZ+NtcBUQPA6TYgz91DAjoboIePFL9
 rpWQ==
X-Gm-Message-State: AOAM531LaIOM/pBqpwiuWfwYQ65lda8tRlwjBDUsCxvcBM3yJZYqBzDS
 ene3pfvfR8XsjF9AAaubmdJ1Qi7n41TUzQ==
X-Google-Smtp-Source: ABdhPJzSF6MtMj7BLCiNjiE547hPSpF1EnOLo25k/zV1i7vpcXLAtXts/2GUdkVqSVQ19nf3M1xKfA==
X-Received: by 2002:a2e:a58a:: with SMTP id m10mr6435806ljp.346.1592756545385; 
 Sun, 21 Jun 2020 09:22:25 -0700 (PDT)
Received: from localhost.localdomain (193-239-39-51.ksi-system.net.
 [193.239.39.51])
 by smtp.gmail.com with ESMTPSA id k7sm2822838lfd.67.2020.06.21.09.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2020 09:22:25 -0700 (PDT)
From: Szymon Lukasz <noh4hss@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] chardev: add support for retrieving the terminal size
Date: Sun, 21 Jun 2020 18:21:28 +0200
Message-Id: <20200621162132.62797-3-noh4hss@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621162132.62797-1-noh4hss@gmail.com>
References: <20200621162132.62797-1-noh4hss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=noh4hss@gmail.com; helo=mail-lj1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 21 Jun 2020 12:30:17 -0400
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
Cc: lvivier@redhat.com, amit@kernel.org, mst@redhat.com,
 Szymon Lukasz <noh4hss@gmail.com>, marcandre.lureau@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extend the class of chardevs with a new function - chr_get_winsize.
A chardev backend should implement if it is able to get the size of
the connected terminal and can detect changes in the terminal size,
i.e. if the backend cannot detect resizes it must not implement this
(e.g. if we have a tty backend connected to some (pseudo)terminal
there is no clean way to detect resizes since SIGWINCH is sent only
for the controlling terminal).

Signed-off-by: Szymon Lukasz <noh4hss@gmail.com>
---
 chardev/char-fe.c         | 11 +++++++++++
 chardev/char-mux.c        |  7 +++++++
 include/chardev/char-fe.h | 11 +++++++++++
 include/chardev/char.h    |  1 +
 4 files changed, 30 insertions(+)

diff --git a/chardev/char-fe.c b/chardev/char-fe.c
index f3530a90e6..802d3096cd 100644
--- a/chardev/char-fe.c
+++ b/chardev/char-fe.c
@@ -336,6 +336,17 @@ void qemu_chr_fe_set_echo(CharBackend *be, bool echo)
     }
 }
 
+int qemu_chr_fe_get_winsize(CharBackend *be, uint16_t *cols, uint16_t *rows)
+{
+    Chardev *chr = be->chr;
+
+    if (chr && CHARDEV_GET_CLASS(chr)->chr_get_winsize) {
+        return CHARDEV_GET_CLASS(chr)->chr_get_winsize(chr, cols, rows);
+    }
+
+    return -1;
+}
+
 void qemu_chr_fe_set_open(CharBackend *be, int fe_open)
 {
     Chardev *chr = be->chr;
diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index 46c44af67c..368ce2334e 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -293,6 +293,12 @@ static void mux_chr_update_read_handlers(Chardev *chr)
                                   chr->gcontext, true, false);
 }
 
+static int mux_chr_get_winsize(Chardev *chr, uint16_t *cols, uint16_t *rows)
+{
+    MuxChardev *d = MUX_CHARDEV(chr);
+    return qemu_chr_fe_get_winsize(&d->chr, cols, rows);
+}
+
 void mux_set_focus(Chardev *chr, int focus)
 {
     MuxChardev *d = MUX_CHARDEV(chr);
@@ -385,6 +391,7 @@ static void char_mux_class_init(ObjectClass *oc, void *data)
     cc->chr_be_event = mux_chr_be_event;
     cc->chr_machine_done = open_muxes;
     cc->chr_update_read_handler = mux_chr_update_read_handlers;
+    cc->chr_get_winsize = mux_chr_get_winsize;
 }
 
 static const TypeInfo char_mux_type_info = {
diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
index a553843364..b7943df93a 100644
--- a/include/chardev/char-fe.h
+++ b/include/chardev/char-fe.h
@@ -154,6 +154,17 @@ int qemu_chr_fe_wait_connected(CharBackend *be, Error **errp);
  */
 void qemu_chr_fe_set_echo(CharBackend *be, bool echo);
 
+/**
+ * qemu_chr_fe_get_winsize:
+ * @cols: the address for storing columns
+ * @rows: the address for storing rows
+ *
+ * Get the terminal size of the backend.
+ *
+ * Returns: 0 on success and < 0 on error
+ */
+int qemu_chr_fe_get_winsize(CharBackend *be, uint16_t *cols, uint16_t *rows);
+
 /**
  * qemu_chr_fe_set_open:
  *
diff --git a/include/chardev/char.h b/include/chardev/char.h
index 00589a6025..fb20707917 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -276,6 +276,7 @@ typedef struct ChardevClass {
     void (*chr_be_event)(Chardev *s, QEMUChrEvent event);
     /* Return 0 if succeeded, 1 if failed */
     int (*chr_machine_done)(Chardev *chr);
+    int (*chr_get_winsize)(Chardev *chr, uint16_t *cols, uint16_t *rows);
 } ChardevClass;
 
 Chardev *qemu_chardev_new(const char *id, const char *typename,
-- 
2.27.0


