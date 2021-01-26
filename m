Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D6D303158
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 02:38:18 +0100 (CET)
Received: from localhost ([::1]:58874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4DJB-0006MJ-RF
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 20:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6X-0005f4-7Q
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 20:25:22 -0500
Received: from mail-pf1-f181.google.com ([209.85.210.181]:37588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6T-0006AM-7v
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 20:25:12 -0500
Received: by mail-pf1-f181.google.com with SMTP id 11so9465998pfu.4
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 17:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JWajNuHMbFLeCYP/PsxYbKNIiTAbIrYsUJE7nhjw6p4=;
 b=URjtkS4D/99uFCzVzbTq57SnczbbqaATQqLGartrTcpslicFMD35rKHC2kELBdD9fI
 Kfs8emaWUKulUJS1v53vq93o0/vF/QqXYKqTzlQ36etZQhdh3YMlpVBXl3mAsE/7MPFE
 HzVI6gWfgiGl6wCiPykJfUo50MVwf+P/7EzwgbQrQjVvGLixXW0ifMlw5iMUqoaF+fAV
 azpmPkCc3HvVjDhA55WIjg2n5k2DkZ1jc8FsP6XVhuWHfkGmEribh2n/F4tG3WJvCUvu
 GLRtv3uKLcabjYdUVRsaN6ziWt7ziXKA5rXWWyFPNTMlc3jDHgJoTboLU2PMSRycG1z6
 UTEQ==
X-Gm-Message-State: AOAM530Am7xTLUEyH9h4kszEHd1kp+JjlZJ2/elkrDt67/u8DWP6xwsn
 IoIqzhmzh1KNujZA/rKBgXVzIfXC+pQ=
X-Google-Smtp-Source: ABdhPJzESxjDW7OI6bjAG2H8Z85ei7exnSES4mtAt/RuKmIdEvYW2HOduaSaMM7LwX5xa/nHH2oL5Q==
X-Received: by 2002:a63:1d47:: with SMTP id d7mr3266859pgm.251.1611624304726; 
 Mon, 25 Jan 2021 17:25:04 -0800 (PST)
Received: from Yifans-Mac-Mini.hsd1.ca.comcast.net. ([98.35.5.7])
 by smtp.gmail.com with ESMTPSA id o14sm536921pjf.12.2021.01.25.17.25.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 17:25:04 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 05/11] osdep: build with non-working system() function
Date: Mon, 25 Jan 2021 17:24:51 -0800
Message-Id: <20210126012457.39046-6-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210126012457.39046-1-j@getutm.app>
References: <20210126012457.39046-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.181;
 envelope-from=osy86github@gmail.com; helo=mail-pf1-f181.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build without error on hosts without a working system(). If system()
is called, return -1 with ENOSYS.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 meson.build          |  1 +
 include/qemu/osdep.h | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/meson.build b/meson.build
index f1e67b8cd1..a7650956d3 100644
--- a/meson.build
+++ b/meson.build
@@ -1118,6 +1118,7 @@ config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
 config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
+config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
 arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index a434382c58..5bd1a67769 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -682,4 +682,16 @@ char *qemu_get_host_name(Error **errp);
  */
 size_t qemu_get_host_physmem(void);
 
+/**
+ * Platforms which do not support system() return ENOSYS
+ */
+#ifndef HAVE_SYSTEM_FUNCTION
+#define system platform_does_not_support_system
+static inline int platform_does_not_support_system(const char *command)
+{
+    errno = ENOSYS;
+    return -1;
+}
+#endif /* !HAVE_SYSTEM_FUNCTION */
+
 #endif
-- 
2.28.0


