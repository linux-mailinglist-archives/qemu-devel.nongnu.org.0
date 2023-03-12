Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADD16B6CA2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 00:42:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbVK3-0008PF-N9; Sun, 12 Mar 2023 19:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1pbVJy-0008GL-HT
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 19:41:46 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1pbVJw-0003Tq-Un
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 19:41:46 -0400
Received: by mail-qt1-x833.google.com with SMTP id c19so11541649qtn.13
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 16:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678664503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YYf8IKPQjMmdVSpD++IIu0dqNQ4TJFmfxZjNuxNor9o=;
 b=KqED0EjmtxcaaOPdpeQUgPHtxZDwGNHwVbqthRe1dFef66ymtYtFtpFJ9NUFbr5Ui/
 iyvCl89W/q1qnTXAOtKSwMvBQSOxGividzqXKFUQe6upU4fYf69wzmAjSB5vHz8Qcfzl
 3OV0mzdoU3L6RKsGp/H3AUUIAajN9+nz/HEwCMC5W3uaLuU1XxXaBNl6bVwCfF8xCgVx
 CSQqBhdQOVYUU7rUGAqTRML+fEv0wwriGAKvvEseyXM8gTu8A47GCd9l1x5I5PSoY4Q+
 udxv4qzYB9WTTcLQZqgMhdmn0egU/vBPXOyqFWtqfMzGtBC8EAdhIvsink6tcS4DOHBX
 TBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678664503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YYf8IKPQjMmdVSpD++IIu0dqNQ4TJFmfxZjNuxNor9o=;
 b=Hnapgc2sI4uFyuAbHciL8xWE1pgO4d6CYPJ4iLl8O1go2KIEnl1y1wzATM8ilDDWPV
 7c2Ku4i4+cmCwOBsTNcMRP6mapwg6pfNjxxogC+XFef0xCjoOcY0XEMXvlf0FFlq/PKg
 0PkWt03Org1hCQzL9C+V7GrMel2Wk2KP8xwrk3bywRN0HzTUip5P0tg6R5Jsu/bJH//H
 L6DFGbDv6s+E6Ui0z8wv5Y5V99pty/qt/5Qr7AQxeC7wM1hpA2d6JPhSRhhrulFZl39Z
 eKdP0Ulqw3H51AA49pQVD7vTp8DfJecrA36vHGuBlm4U99dY7GGZJbsD2phOThcDbZyf
 zbLg==
X-Gm-Message-State: AO0yUKXlbTXQbiXy1hLJKalspxdxPK5JTfc3HLwkLXy0QsBu9eGIbRRh
 izqTNSWHstTbrQ4kHowTbwM=
X-Google-Smtp-Source: AK7set/L8BhEK5+uYXiz54fZi5/q7FNowgXgtI0ud4BIk7wMuW23tMNaJB//njDy7JyNrTINFztDkQ==
X-Received: by 2002:a05:622a:1304:b0:3bf:a461:e6f0 with SMTP id
 v4-20020a05622a130400b003bfa461e6f0mr24732469qtk.31.1678664503620; 
 Sun, 12 Mar 2023 16:41:43 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:6618:4c00:8b45:5f2f])
 by smtp.gmail.com with ESMTPSA id
 i10-20020ac8004a000000b003b2d890752dsm4444257qtg.88.2023.03.12.16.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 16:41:43 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Cc: qemu-devel@nongnu.org,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH] xen: fix dm_restrict startup
Date: Sun, 12 Mar 2023 19:41:31 -0400
Message-Id: <20230312234131.46898-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=jandryuk@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

QEMU is failing to signal it start when launched by libxl with
dm_restrict=1.  When xenstore_record_dm_state() is called, the
restrictions prevent xs_open() from succeeding.  QEMU can't write
running to the xenstore, and libxl fails the VM start up.

Pass in a open xenstore connection.  Let the call back use it and the
close it.  Use the completed boolean to only allow it to be called once.
This lets the xenstore connection be closed after the startup
indication.

Fixes: ba2a92db1ff6 ("hw/xen: Add xenstore operations to allow redirection to internal emulation")
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
I think xenstore_record_dm_state() only needs to indicate startup once,
so the completed bool makes sense.

 accel/xen/xen-all.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 00221e23c5..3843299843 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -30,17 +30,13 @@ xc_interface *xen_xc;
 xenforeignmemory_handle *xen_fmem;
 xendevicemodel_handle *xen_dmod;
 
-static void xenstore_record_dm_state(const char *state)
+static void xenstore_record_dm_state(struct xs_handle *xs, const char *state)
 {
-    struct xs_handle *xs;
+    static bool completed;
     char path[50];
 
-    /* We now have everything we need to set the xenstore entry. */
-    xs = xs_open(0);
-    if (xs == NULL) {
-        fprintf(stderr, "Could not contact XenStore\n");
-        exit(1);
-    }
+    if (completed)
+        return;
 
     snprintf(path, sizeof (path), "device-model/%u/state", xen_domid);
     /*
@@ -53,6 +49,7 @@ static void xenstore_record_dm_state(const char *state)
         exit(1);
     }
 
+    completed = true;
     xs_close(xs);
 }
 
@@ -60,9 +57,10 @@ static void xenstore_record_dm_state(const char *state)
 static void xen_change_state_handler(void *opaque, bool running,
                                      RunState state)
 {
+    struct xs_handle *xs = opaque;
     if (running) {
         /* record state running */
-        xenstore_record_dm_state("running");
+        xenstore_record_dm_state(xs, "running");
     }
 }
 
@@ -92,6 +90,7 @@ static void xen_setup_post(MachineState *ms, AccelState *accel)
 static int xen_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
+    struct xs_handle *xs;
 
     xen_xc = xc_interface_open(0, 0, 0);
     if (xen_xc == NULL) {
@@ -111,7 +110,14 @@ static int xen_init(MachineState *ms)
         xc_interface_close(xen_xc);
         return -1;
     }
-    qemu_add_vm_change_state_handler(xen_change_state_handler, NULL);
+
+    xs = xs_open(0);
+    if (xs == NULL) {
+        fprintf(stderr, "Could not contact XenStore\n");
+        exit(1);
+    }
+
+    qemu_add_vm_change_state_handler(xen_change_state_handler, xs);
     /*
      * opt out of system RAM being allocated by generic code
      */
-- 
2.37.2


