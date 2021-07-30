Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C32F03DB9E5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:00:47 +0200 (CEST)
Received: from localhost ([::1]:39918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9T4A-0006nc-Qw
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2U-00045K-Mc
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:02 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:43583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2S-0006YU-64
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:01 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so6487711wmq.2
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FJDl9mAtg/B5/AFGs/m7ohohIlPvDj9ka9ChwuTyltU=;
 b=FD3JCRld7N06zI9kwJwlQTZMeR84WEL8TcoRqhSbPyvtmXJsdefNvMyhylB7xcph8N
 fh3FU9kBW5UChYRBHFba4sh+rXzhUrXBB3klhl0jRbBNpV7irwFlOO7U9WwUNnxDXc2Y
 TX5ltPlOkUeQ4mILkpPYwcpFgSamSXERNEVmE70QYtgcLeDzs0w6kiw2ggsW5Q/mznUQ
 WnpGirzPMqYlonHIbayqjdDGT2SrRQMiDyrEh2xpiNBQykeS3S5AUpe5/67i4PXymyjb
 5WaP+OyKYkbZ/6Ewoah4OhM5bqcr5Rhh/+fdJf9MmQ4sIfPwx5RBtuIBPbziI51lRf5C
 BQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FJDl9mAtg/B5/AFGs/m7ohohIlPvDj9ka9ChwuTyltU=;
 b=rmJRwcZ+pygbWL1OkHmcA9GXfDjn2ROsxIzYQJ3wH08tNIMWgWZxvlkCzz0bVdckkH
 QdiVeR4FvUjPJEmzYrqt6Or1ymkcXwoC/0smqjrvdoRXElPlK7rQvW1BwqYlTHxX/ppq
 exxRgC+Pdu9mboTf9zaJLNzshpPM4UfRHq+Xl3qPIKjt4D7KdRoIn+uI/RFm2L5Mn/wb
 nQ+iQi4XtPrDimFIFEUVmk87Gz0bLdqLZDX1qnpLsHmvqIcC5tdev/93D5R3K0D/wXLd
 X4eQUqcalj1Gnqx7xfIHHUAZu+JCKrEju7ZtktzvAUV+2dXVHQdmmrStiCLg9xpIqs+t
 7RRw==
X-Gm-Message-State: AOAM530LHhnhWrGtkm9lnDoPVfQW9ETViyGBxFfaZeN+HIZxPRROuCbj
 M8l00Pec1QHzb8QF+8AHCHMBuhXCwGQ=
X-Google-Smtp-Source: ABdhPJwrJyjWhuNZ+/nq2z/szE4mVJ7N64SLsKGr6P6faM6bL7MpZXDqukc/v9Du4FKiwySB2l0v0w==
X-Received: by 2002:a05:600c:219:: with SMTP id
 25mr3124375wmi.49.1627653538287; 
 Fri, 30 Jul 2021 06:58:58 -0700 (PDT)
Received: from localhost.localdomain ([102.44.217.242])
 by smtp.gmail.com with ESMTPSA id h9sm1770277wrw.38.2021.07.30.06.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:58:57 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/13] plugins/hotpages: introduce sortby arg and parsed
 bool args correctly
Date: Fri, 30 Jul 2021 15:58:07 +0200
Message-Id: <20210730135817.17816-4-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730135817.17816-1-ma.mandourr@gmail.com>
References: <20210730135817.17816-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since plugin arguments now expect boolean arguments, a plugin argument
name "sortby" now expects a value of "read", "write", or "address".

"io" arg is now expected to be passed as a full-form boolean parameter,
i.e. "io=on|true|yes|off|false|no"

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/hotpages.c | 30 ++++++++++++++++++++----------
 docs/devel/tcg-plugins.rst | 15 +++++++++++++++
 2 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/contrib/plugins/hotpages.c b/contrib/plugins/hotpages.c
index bf53267532..0d12910af6 100644
--- a/contrib/plugins/hotpages.c
+++ b/contrib/plugins/hotpages.c
@@ -169,16 +169,26 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        if (g_strcmp0(opt, "reads") == 0) {
-            sort_by = SORT_R;
-        } else if (g_strcmp0(opt, "writes") == 0) {
-            sort_by = SORT_W;
-        } else if (g_strcmp0(opt, "address") == 0) {
-            sort_by = SORT_A;
-        } else if (g_strcmp0(opt, "io") == 0) {
-            track_io = true;
-        } else if (g_str_has_prefix(opt, "pagesize=")) {
-            page_size = g_ascii_strtoull(opt + 9, NULL, 10);
+        g_autofree char **tokens = g_strsplit(opt, "=", -1);
+
+        if (g_strcmp0(tokens[0], "sortby") == 0) {
+            if (g_strcmp0(tokens[1], "reads") == 0) {
+                sort_by = SORT_R;
+            } else if (g_strcmp0(tokens[1], "writes") == 0) {
+                sort_by = SORT_W;
+            } else if (g_strcmp0(tokens[1], "address") == 0) {
+                sort_by = SORT_A;
+            } else {
+                fprintf(stderr, "invalid value to sortby: %s\n", tokens[1]);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "io") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &track_io)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "pagesize") == 0) {
+            page_size = g_ascii_strtoull(tokens[1], NULL, 10);
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 370c11373f..d09c349234 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -192,6 +192,21 @@ Similar to hotblocks but this time tracks memory accesses::
   0x0000000048b000, 0x0001, 130594, 0x0001, 355
   0x0000000048a000, 0x0001, 1826, 0x0001, 11
 
+The hotpages plugin can be configured using the following arguments:
+
+  * sortby=reads|writes|address
+
+  Log the data sorted by either the number of reads, the number of writes, or
+  memory address. (Default: entries are sorted by the sum of reads and writes)
+
+  * io=on
+
+  Track IO addresses. Only relevant to full system emulation. (Default: off)
+
+  * pagesize=N
+
+  The page size used. (Default: N = 4096)
+
 - contrib/plugins/howvec.c
 
 This is an instruction classifier so can be used to count different
-- 
2.25.1


