Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDD623D7DD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 10:13:01 +0200 (CEST)
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3b1I-00019g-T0
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 04:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k3ax3-0002Pd-49; Thu, 06 Aug 2020 04:08:37 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:56194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k3ax1-0005gU-2Y; Thu, 06 Aug 2020 04:08:36 -0400
Received: by mail-wm1-x32e.google.com with SMTP id 9so7995508wmj.5;
 Thu, 06 Aug 2020 01:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9LYhTPA+0RjAHP6HLE9QxoCa5EB+fRF80ZAoq1URUGk=;
 b=LHljM23t/K8o4aLlCm8bBXh/r7b8prEa7Q4epFhBb3l+jMN4VT/fy1kN/gp43iCv05
 nl1wVdkC+ZtpiG0qolkkUYEOVv/SgbLUgyOGvuWMd0RBmGghVkeK97JFvndM7bQsFi4G
 yRkHR8hTsGp6f6FIj8E85YxmPJ9iPHkgMfLIL/DXypFR7W5pPt9ag+k1qKqyuJk3X9PQ
 /6noB0QhKUO4fZHjk8jUfSWlInYNi9wjIRfO/NGn+NyikLD9rY+7A2rz8AwwTcFxOX3j
 PkdjsnQjxCmLSQMN7qrd8ypKkX223H6Gyft0SSXxb0JVmz+6e2gVdO4OWmt+jgbY8UbR
 Ytww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9LYhTPA+0RjAHP6HLE9QxoCa5EB+fRF80ZAoq1URUGk=;
 b=KSRBX7x4pE60wykdkfN02LXyZ3YM2x9yPdnvc4up/xr5jQJ163A9vg5PvLc1YwS+yy
 6eEws8JM3iENOoK7NHxdDcww4g2orljeImJ9I5nKCNCL8drwAoTQcbNMLlwOeSmrDCbq
 WJrgZSZITR/C2kkN5WJVKzE3Rja1tDMxE6JpG2x+88rhuBWmWl2DvVGiqwtXdK7yhpKs
 wIzm5z2D2eIhTAYe84Jc8rV6jZIOOZJs+2xd/GVxjuM7KTHRUO5JDF9yCazrk80ze4F3
 SyS1Ig+1a7GzVqPYeFJjiE0uIiHBciNRytA3NUOSOx6JeaOsUQcbJheHujfsT46xR5On
 a6sw==
X-Gm-Message-State: AOAM533pSq6+ECTbvdSToa27JHHydd/Fll1nGInByIT5noYb5fW3CW23
 WVWmpXe5WwLsWvejO+WfEeNPUrX7
X-Google-Smtp-Source: ABdhPJzIyY9HchRIJ6VPScs9HjqlQ8LZSVbgcAbPbn2020qrAokAiOVcnAEMTHQU981JcEY05Uulvg==
X-Received: by 2002:a7b:c011:: with SMTP id c17mr6697267wmb.63.1596701312026; 
 Thu, 06 Aug 2020 01:08:32 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id w2sm6039587wre.5.2020.08.06.01.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 01:08:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 4/7] hw/block/fdc: Convert debug FLOPPY_DPRINTF() to
 trace events
Date: Thu,  6 Aug 2020 10:08:21 +0200
Message-Id: <20200806080824.21567-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200806080824.21567-1-f4bug@amsat.org>
References: <20200806080824.21567-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert debug FLOPPY_DPRINTF() to trace events.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/fdc.c        | 6 +++---
 hw/block/trace-events | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index ee45ec0b27..f9f3f3c079 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -326,7 +326,7 @@ static int fd_seek(FDrive *drv, uint8_t head, uint8_t track, uint8_t sect,
 /* Set drive back to track 0 */
 static void fd_recalibrate(FDrive *drv)
 {
-    FLOPPY_DPRINTF("recalibrate\n");
+    trace_floppy_recalibrate();
     fd_seek(drv, 0, 0, 1, 1);
 }
 
@@ -438,7 +438,7 @@ static void fd_revalidate(FDrive *drv)
 {
     int rc;
 
-    FLOPPY_DPRINTF("revalidate\n");
+    trace_floppy_revalidate();
     if (drv->blk != NULL) {
         drv->ro = blk_is_read_only(drv->blk);
         if (!blk_is_inserted(drv->blk)) {
@@ -1283,7 +1283,7 @@ static void fdctrl_reset(FDCtrl *fdctrl, int do_irq)
 {
     int i;
 
-    FLOPPY_DPRINTF("reset controller\n");
+    trace_fdc_reset();
     fdctrl_reset_irq(fdctrl);
     /* Initialise controller */
     fdctrl->sra = 0;
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 958fcc5508..9f7caf9b17 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -1,8 +1,11 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
 # fdc.c
+fdc_reset(void) ""
 fdc_ioport_read(uint8_t reg, uint8_t value) "read reg 0x%02x val 0x%02x"
 fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02x"
+floppy_recalibrate(void) ""
+floppy_revalidate(void) ""
 
 # pflash_cfi02.c
 # pflash_cfi01.c
-- 
2.21.3


