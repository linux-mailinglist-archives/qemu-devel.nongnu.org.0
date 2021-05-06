Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979303754F3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:40:33 +0200 (CEST)
Received: from localhost ([::1]:52902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeEy-0000VC-KW
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeCp-00074n-8A
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeCm-0007k4-Pc
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620308296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cm48fhhROvZKoiSjxSIRZaypJ/0uOwpu6MiKB+h4o3c=;
 b=QwOA8MGZw5yNjkGiNvOVTG0Lpo2g98zw8x09pI9+On/34si0dFXy1vTya420EDtwUtDbtY
 TTrEJEzW0ASra1HCajfWzJDejZwHuFQe+1QMk64mQ9dQGrwRp+rGdnIaoVdU/szlDviHop
 oXiFPoz7rb0Viz+3T4oFMl4QPfxfHrs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-P3cFGvwQM_qmh2QSAkoD_Q-1; Thu, 06 May 2021 09:38:12 -0400
X-MC-Unique: P3cFGvwQM_qmh2QSAkoD_Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso2204375wrf.11
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 06:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cm48fhhROvZKoiSjxSIRZaypJ/0uOwpu6MiKB+h4o3c=;
 b=Ibs5p5nIr4yV9V16QNHDoRfWIJXucSgSyaFMfL5nf7IVl1KoRptNu5RsOXl3Q2uZFb
 ILq8IjbXs953bTQ3juPXt+lUQYo8tOY9k3OpHv4rOtOvoLl5+J3EaeXip0FxYWXDJhBI
 c+jtplJgdgNOBPXOyZYIv2oO3oqqRbpd4Fw0OGdyzy1NThxdOX7d2CnhTFLn+Se8/CHm
 4iiDkPOKR9H0Pa3SZc12mDt4FkRDVb/+Belw7UQ5NFXrTuLNVktl9vOJxfbRscSqhlRM
 hm86D6oAPZpUuuC2oZQ5y4F9sHKIzRowVYOv48Sisi2pp3JvGQpCTaHX7LlyUQ3oaORJ
 GWpQ==
X-Gm-Message-State: AOAM532MhgUsZBCvOUdaxxCW1xDQh/g800PqLPm9UAKtpNkc/x9p+fjC
 st/S3GbdXP+wexnEiW5mElmOgD3pv3IfILnnsEb5n4YIGmCVd8DcU7v4Sj5U/9zExMMwD4ntPO4
 dKiKiA4Ve8gI8w0UqVtPGoG5U2XNMBqY1WDcCqB/B8evTEOpM68eUqvqSGBZ9pcoj
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr5076474wri.178.1620308289951; 
 Thu, 06 May 2021 06:38:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1qLH+TeCACwmkPszo5iNqlWWZLZHj+h1hLu6j1DGNALRbLHKlnd4elCwd5Ol0yGq3nkA99w==
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr5076448wri.178.1620308289821; 
 Thu, 06 May 2021 06:38:09 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id j18sm3230757wmq.27.2021.05.06.06.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 06:38:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/9] backends/tpm: Replace qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
Date: Thu,  6 May 2021 15:37:51 +0200
Message-Id: <20210506133758.1749233-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210506133758.1749233-1-philmd@redhat.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm@vger.kernel.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify the tpm_emulator_ctrlcmd() handler by replacing a pair of
qemu_mutex_lock/qemu_mutex_unlock calls by the WITH_QEMU_LOCK_GUARD
macro.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 backends/tpm/tpm_emulator.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index a012adc1934..e5f1063ab6c 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -30,6 +30,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/sockets.h"
+#include "qemu/lockable.h"
 #include "io/channel-socket.h"
 #include "sysemu/tpm_backend.h"
 #include "sysemu/tpm_util.h"
@@ -124,31 +125,26 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
     uint32_t cmd_no = cpu_to_be32(cmd);
     ssize_t n = sizeof(uint32_t) + msg_len_in;
     uint8_t *buf = NULL;
-    int ret = -1;
 
-    qemu_mutex_lock(&tpm->mutex);
+    WITH_QEMU_LOCK_GUARD(&tpm->mutex) {
+        buf = g_alloca(n);
+        memcpy(buf, &cmd_no, sizeof(cmd_no));
+        memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
 
-    buf = g_alloca(n);
-    memcpy(buf, &cmd_no, sizeof(cmd_no));
-    memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
-
-    n = qemu_chr_fe_write_all(dev, buf, n);
-    if (n <= 0) {
-        goto end;
-    }
-
-    if (msg_len_out != 0) {
-        n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
+        n = qemu_chr_fe_write_all(dev, buf, n);
         if (n <= 0) {
-            goto end;
+            return -1;
+        }
+
+        if (msg_len_out != 0) {
+            n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
+            if (n <= 0) {
+                return -1;
+            }
         }
     }
 
-    ret = 0;
-
-end:
-    qemu_mutex_unlock(&tpm->mutex);
-    return ret;
+    return 0;
 }
 
 static int tpm_emulator_unix_tx_bufs(TPMEmulator *tpm_emu,
-- 
2.26.3


