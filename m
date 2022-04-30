Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3237E515DA2
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:35:03 +0200 (CEST)
Received: from localhost ([::1]:52256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknFQ-00057k-Q5
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAP-0004kT-2n
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:46 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAN-0006Ew-2k
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:44 -0400
Received: by mail-pl1-x62e.google.com with SMTP id k1so704096pll.4
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ePCmgB81KOph48TAJ6SLINByRDQqJIYEYHjh8/K/gAE=;
 b=gVFBtkpurULAf4lJ9r1ofupYOo+fPfxx0kueNiwD6DQ9xOXrfgcQPbzmwuNyaccDqZ
 NcMswjn7j3xYA9Cue1vJLdpn2t+w0rritSeYOj4A56QptaTXOK1gIxa8GFaQV/5iAx6K
 hXCsBho66eChHTOq8U7I7R5m2qDcnBMgWrIjOBYifYhOeRuM6joPBG9gFDLju5oqC4+V
 H6jQBtittYB1mM6dEXuSu6SQGVSubcY8MgEuGOLer30H1p/2HvFjjI+uPc/+9AhhH0ay
 +hQ0vXFfbzN6dSYUMj8PmkJWtCinauM34uNDk2Ap4w+ufeFLgYpRu/bwMBVZ2NDAI022
 gNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ePCmgB81KOph48TAJ6SLINByRDQqJIYEYHjh8/K/gAE=;
 b=xyGXaWFuF1OR5kGL9fBYuq7QCMSicXIScroNt9/Mitt03YXsZfJxpwh25/9EyYkTUy
 wXq34KjsiXncfUtVBJfNA6xmHMTZ+v6M8WuG+JwVenSZ5P1x95FdBhyVZvza7vsBWroD
 VvreeWgrGIIukLmRVv1C6xDhMEGLg24hp/rICptrkzWxOdMDehS0aElt7iW9tSpRjIyj
 hBbKDciZprI7sO0TbwC1rMADCfLdcVw940u293CvuKvEnuDxEUgv+i4sqEDNYMzx7r3s
 //d3Fdi7/u2UfDcfud0NuCBdx/n6DpQaSL/pw1iO7UIxplv+dAYq/tRqsY3XZFg6owwI
 fJwg==
X-Gm-Message-State: AOAM531weQWf7MSir66cSDeGZy+/recpMLD6bWgP/zakTmuBlsuB5ugS
 eNm6wqwma19m3KbD9wow0fkF/zNYpXIR2w==
X-Google-Smtp-Source: ABdhPJyCm8+5toy8b8esfI9OE3dzFrNHMEcB84UCMtZAvcLo5aAlvDhykKFRpZZHolhvQduxvkYb/g==
X-Received: by 2002:a17:90b:4f92:b0:1cd:3a73:3a46 with SMTP id
 qe18-20020a17090b4f9200b001cd3a733a46mr4307896pjb.66.1651325381786; 
 Sat, 30 Apr 2022 06:29:41 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/43] semihosting: Generalize GuestFDFeatureFile
Date: Sat, 30 Apr 2022 06:28:57 -0700
Message-Id: <20220430132932.324018-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than hard-coding the buffer from which we deliver data,
pass it in on initialization.  This decouples the feature from
ARM semihosting.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/guestfd.h | 10 ++++++---
 semihosting/arm-compat-semi.c | 39 ++++++++++++++++++-----------------
 semihosting/guestfd.c         |  8 ++++---
 3 files changed, 32 insertions(+), 25 deletions(-)

diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index 5d6e744305..5aa2722cb2 100644
--- a/include/semihosting/guestfd.h
+++ b/include/semihosting/guestfd.h
@@ -15,7 +15,7 @@ typedef enum GuestFDType {
     GuestFDUnused = 0,
     GuestFDHost = 1,
     GuestFDGDB = 2,
-    GuestFDFeatureFile = 3,
+    GuestFDStatic = 3,
 } GuestFDType;
 
 /*
@@ -26,7 +26,11 @@ typedef struct GuestFD {
     GuestFDType type;
     union {
         int hostfd;
-        unsigned featurefile_offset;
+        struct {
+            const uint8_t *data;
+            size_t len;
+            size_t off;
+        } staticfile;
     };
 } GuestFD;
 
@@ -35,6 +39,6 @@ void dealloc_guestfd(int guestfd);
 GuestFD *get_guestfd(int guestfd);
 
 void associate_guestfd(int guestfd, int hostfd);
-void init_featurefile_guestfd(int guestfd);
+void staticfile_guestfd(int guestfd, const uint8_t *data, size_t len);
 
 #endif /* SEMIHOSTING_GUESTFD_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index c092138031..c6bfd4d1ba 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -553,13 +553,13 @@ static const uint8_t featurefile_data[] = {
     SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
 };
 
-static uint32_t featurefile_closefn(CPUState *cs, GuestFD *gf)
+static uint32_t staticfile_closefn(CPUState *cs, GuestFD *gf)
 {
     /* Nothing to do */
     return 0;
 }
 
-static uint32_t featurefile_writefn(CPUState *cs, GuestFD *gf,
+static uint32_t staticfile_writefn(CPUState *cs, GuestFD *gf,
                                     target_ulong buf, uint32_t len)
 {
     /* This fd can never be open for writing */
@@ -568,7 +568,7 @@ static uint32_t featurefile_writefn(CPUState *cs, GuestFD *gf,
     return set_swi_errno(cs, -1);
 }
 
-static uint32_t featurefile_readfn(CPUState *cs, GuestFD *gf,
+static uint32_t staticfile_readfn(CPUState *cs, GuestFD *gf,
                                    target_ulong buf, uint32_t len)
 {
     CPUArchState *env = cs->env_ptr;
@@ -582,11 +582,11 @@ static uint32_t featurefile_readfn(CPUState *cs, GuestFD *gf,
     }
 
     for (i = 0; i < len; i++) {
-        if (gf->featurefile_offset >= sizeof(featurefile_data)) {
+        if (gf->staticfile.off >= gf->staticfile.len) {
             break;
         }
-        s[i] = featurefile_data[gf->featurefile_offset];
-        gf->featurefile_offset++;
+        s[i] = gf->staticfile.data[gf->staticfile.off];
+        gf->staticfile.off++;
     }
 
     unlock_user(s, buf, len);
@@ -595,21 +595,21 @@ static uint32_t featurefile_readfn(CPUState *cs, GuestFD *gf,
     return len - i;
 }
 
-static uint32_t featurefile_isattyfn(CPUState *cs, GuestFD *gf)
+static uint32_t staticfile_isattyfn(CPUState *cs, GuestFD *gf)
 {
     return 0;
 }
 
-static uint32_t featurefile_seekfn(CPUState *cs, GuestFD *gf,
+static uint32_t staticfile_seekfn(CPUState *cs, GuestFD *gf,
                                    target_ulong offset)
 {
-    gf->featurefile_offset = offset;
+    gf->staticfile.off = offset;
     return 0;
 }
 
-static uint32_t featurefile_flenfn(CPUState *cs, GuestFD *gf)
+static uint32_t staticfile_flenfn(CPUState *cs, GuestFD *gf)
 {
-    return sizeof(featurefile_data);
+    return gf->staticfile.len;
 }
 
 typedef struct GuestFDFunctions {
@@ -638,13 +638,13 @@ static const GuestFDFunctions guestfd_fns[] = {
         .seekfn = gdb_seekfn,
         .flenfn = gdb_flenfn,
     },
-    [GuestFDFeatureFile] = {
-        .closefn = featurefile_closefn,
-        .writefn = featurefile_writefn,
-        .readfn = featurefile_readfn,
-        .isattyfn = featurefile_isattyfn,
-        .seekfn = featurefile_seekfn,
-        .flenfn = featurefile_flenfn,
+    [GuestFDStatic] = {
+        .closefn = staticfile_closefn,
+        .writefn = staticfile_writefn,
+        .readfn = staticfile_readfn,
+        .isattyfn = staticfile_isattyfn,
+        .seekfn = staticfile_seekfn,
+        .flenfn = staticfile_flenfn,
     },
 };
 
@@ -765,7 +765,8 @@ target_ulong do_common_semihosting(CPUState *cs)
                 errno = EACCES;
                 return set_swi_errno(cs, -1);
             }
-            init_featurefile_guestfd(guestfd);
+            staticfile_guestfd(guestfd, featurefile_data,
+                               sizeof(featurefile_data));
             return guestfd;
         }
 
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index e77265db0f..b6405f5663 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -94,13 +94,15 @@ void associate_guestfd(int guestfd, int hostfd)
     gf->hostfd = hostfd;
 }
 
-void init_featurefile_guestfd(int guestfd)
+void staticfile_guestfd(int guestfd, const uint8_t *data, size_t len)
 {
     GuestFD *gf = do_get_guestfd(guestfd);
 
     assert(gf);
-    gf->type = GuestFDFeatureFile;
-    gf->featurefile_offset = 0;
+    gf->type = GuestFDStatic;
+    gf->staticfile.data = data;
+    gf->staticfile.len = len;
+    gf->staticfile.off = 0;
 }
 
 /*
-- 
2.34.1


