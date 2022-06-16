Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7698154DF93
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:56:48 +0200 (CEST)
Received: from localhost ([::1]:35994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1nB8-000515-MP
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjo-0001p1-Bh
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:33 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:42517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjm-0001v3-Hu
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:31 -0400
Received: by mail-lj1-x236.google.com with SMTP id c30so992422ljr.9
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A+vAUD5r+ra5troGbu4m4n5hv4XEb2YdZlgZ0icNGgs=;
 b=WuTIUa89yOUjicF6h1P+zrFlp0GJSArDtlB4QqmYNWeT7PDdChyLmW6vjGDj/XQGBD
 651hWb7iy1ESuKHt0Oo6SxU0wIHKyekmABa+3Vf17WwMtWS0dAr+ZXJvGTdFQuhCQ3XO
 DNQIZvOs0bDczn3qZ5qPP02p+J6pL2Zk1H0atgVGs2VuMGySQFI646+qoNg7pVGiwiQK
 MxFhG+HTGTb0L6SaVWIjDS2C4Z5AQJxy/csMAW9IBOAd7NEgwVkTsfa9Li+IiJhmkR9a
 BynLn3N7Gid7h+km3tV3BmG0ZLWqVCCjQ+wMgm9nBltd/RPbGocdKdp43ZS/3BjLrri6
 6kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A+vAUD5r+ra5troGbu4m4n5hv4XEb2YdZlgZ0icNGgs=;
 b=Yg0NlcbJYJ361WVHHVtmRYpkDWBjUQAoqVIoqzgzldDCZLIIDVcx9eyjUNIvp3Unuu
 HbCZojQCP2IIeSOboPjYvQ1+a6vApH+NlKJqCgM2MoLWFtR1NraNKoDTY2vtasTOBQtL
 WaXVww/trlkAXGnPAxDalyYbyGrDCEbEeWdcMC0aG9UmavB3peDaKXssSnvwxvKHV1sn
 Q9L36spoD8jteYAHXVmaVFT2XrdkbL2PLbN4cLqE/cHTuXEHFUV8b7Sd7hPsTDhkODzv
 +1CwACFo2tONo1kV+y32cxj9BL+2HzQXVQO7KSjq3t01szHF1jd+jYThDZi0DwIEen4u
 dyaQ==
X-Gm-Message-State: AJIora9ECOHdsQbCVZP/MFqfg2ANrNX416GFWPzERJNP0Wssz9InFeJV
 A702UXIv1Jn8chjNbW8PMQA6AxftfrUSDvQy
X-Google-Smtp-Source: AGRyM1sjcqqr6wa28eikzPE+S4DNfTic7PmkrMttoB1RQn6jNQVQb4CUcV9bw21dxHjDjhAJUarsiQ==
X-Received: by 2002:a2e:3a16:0:b0:255:7811:2827 with SMTP id
 h22-20020a2e3a16000000b0025578112827mr2152565lja.130.1655375308820; 
 Thu, 16 Jun 2022 03:28:28 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:28 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 12/17] migration/snapshot: Move RAM_SAVE_FLAG_xxx defines
 to migration/ram.h
Date: Thu, 16 Jun 2022 13:28:06 +0300
Message-Id: <20220616102811.219007-13-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102811.219007-1-nikita.lapshin@openvz.org>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x236.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nikita Lapshin <nikita.lapshin@openvz.org>

Move RAM_SAVE_FLAG_xxx defines from migration/ram.c to migration/ram.h

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 migration/ram.c | 16 ----------------
 migration/ram.h | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index ddc7abd08a..da7c7ec0e5 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -66,22 +66,6 @@
 /***********************************************************/
 /* ram save/restore */
 
-/* RAM_SAVE_FLAG_ZERO used to be named RAM_SAVE_FLAG_COMPRESS, it
- * worked for pages that where filled with the same char.  We switched
- * it to only search for the zero value.  And to avoid confusion with
- * RAM_SSAVE_FLAG_COMPRESS_PAGE just rename it.
- */
-
-#define RAM_SAVE_FLAG_FULL     0x01 /* Obsolete, not used anymore */
-#define RAM_SAVE_FLAG_ZERO     0x02
-#define RAM_SAVE_FLAG_MEM_SIZE 0x04
-#define RAM_SAVE_FLAG_PAGE     0x08
-#define RAM_SAVE_FLAG_EOS      0x10
-#define RAM_SAVE_FLAG_CONTINUE 0x20
-#define RAM_SAVE_FLAG_XBZRLE   0x40
-/* 0x80 is reserved in migration.h start with 0x100 next */
-#define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
-
 XBZRLECacheStats xbzrle_counters;
 
 /* struct contains XBZRLE cache and a static page
diff --git a/migration/ram.h b/migration/ram.h
index 2c6dc3675d..9dddfd381a 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -33,6 +33,22 @@
 #include "exec/cpu-common.h"
 #include "io/channel.h"
 
+/* RAM_SAVE_FLAG_ZERO used to be named RAM_SAVE_FLAG_COMPRESS, it
+ * worked for pages that where filled with the same char.  We switched
+ * it to only search for the zero value.  And to avoid confusion with
+ * RAM_SSAVE_FLAG_COMPRESS_PAGE just rename it.
+ */
+
+#define RAM_SAVE_FLAG_FULL     0x01 /* Obsolete, not used anymore */
+#define RAM_SAVE_FLAG_ZERO     0x02
+#define RAM_SAVE_FLAG_MEM_SIZE 0x04
+#define RAM_SAVE_FLAG_PAGE     0x08
+#define RAM_SAVE_FLAG_EOS      0x10
+#define RAM_SAVE_FLAG_CONTINUE 0x20
+#define RAM_SAVE_FLAG_XBZRLE   0x40
+/* 0x80 is reserved in migration.h start with 0x100 next */
+#define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
+
 extern MigrationStats ram_counters;
 extern XBZRLECacheStats xbzrle_counters;
 extern CompressionStats compression_counters;
-- 
2.31.1


