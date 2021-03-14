Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C3533A27D
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 04:26:32 +0100 (CET)
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLHOg-0000EL-Q8
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 22:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLHMH-0006Vc-H6
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 22:24:02 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLHMF-0004RU-C3
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 22:24:01 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v15so6907456wrx.4
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 19:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BajUyfK396v7XdGJs5VK12t0TqFac+fXAWp2W7CZvi4=;
 b=NYw4mxvsGbWYnB32qoBuO35zU5yhFGs3LLivuPZslQd9Ddqw9I36e/l8MFygj0xOcc
 yZU1ppsm1zuQXYzieL6JuI4UzS7HyBVSbtFgWXhxGIR21XSLcMsyBleWtooI5nsarfEv
 BHSUd03doGa9h/X6DTnFyN4hnFewx8V871ycyPZRZp1D/F9BNV5qzWHjWz+MnMIeKOlO
 fqG1wB9pvEcsfuP3hn34hySwb4JMLnymABvwX/hX4aaZ47K8iCol+UM4WFH0ZLBfXPyV
 x5Ey7E8qf91NekepLqPgRcBkG7j/viiKOwhQVbzydIXR3MUfnorpaSxoqgKSVur7h1e9
 1yaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BajUyfK396v7XdGJs5VK12t0TqFac+fXAWp2W7CZvi4=;
 b=Twu7ytU/oZWS29eXmkiDbddhDk1Dt4QyAs0e5hamRaknfRvIqoWrt7h6erK6QhJSRG
 y3Ly5Uxhk6HdOVXg40QOhc/HOIapyJu1sjq/5yZO0MvBhA0y3JfHEX+6540gJearPLty
 LhcsywkzbdHeXyYMoKgwq8zGVn0gEJJoAZMpM/bHSxOyW0x+Lw2gF/6RvEPyReWhxUKg
 4tIN9a9yK0M+spsCIZNksXnK8rXaOMb/vimQhm3gdEdtl9NH3ZNASufHH86Y84jiJWm7
 Ilx6cjNlOkfD55iPwhfSHUA/v/RfnKY+/+kuyliHNHAONi6yjDNRA0y78s5gZENXNgpV
 fkgw==
X-Gm-Message-State: AOAM532eMna3y1Cqtrr6LAYlEvcUqOrY0AJUAWKC+4DR9VXktUKBEbSg
 NSUF330qIpK9XRmpyQpL1eohHfFKOSc=
X-Google-Smtp-Source: ABdhPJyQiBG3C3mbSJVJ6DguNxzXLhDF91H+STCd7xv8rLaUhXvLS4A96xNipLEbjQ59LqNoemRiBw==
X-Received: by 2002:a5d:570b:: with SMTP id a11mr21299224wrv.281.1615692237926; 
 Sat, 13 Mar 2021 19:23:57 -0800 (PST)
Received: from localhost.localdomain ([197.61.164.30])
 by smtp.googlemail.com with ESMTPSA id e1sm14922249wrd.44.2021.03.13.19.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 19:23:57 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] hw/audio/fmopl.c: Replaced calls to malloc with GLib's
 variants
Date: Sun, 14 Mar 2021 05:23:19 +0200
Message-Id: <20210314032324.45142-4-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314032324.45142-1-ma.mandourr@gmail.com>
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced calls to malloc(), and free() to their equivalent
allocation functions from GLib.

Also added checking for null after ENV_CURVE allocation
following the same pattern of checking on preceeding
table allocations.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 hw/audio/fmopl.c | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
index 51b773695a..795c7a23dc 100644
--- a/hw/audio/fmopl.c
+++ b/hw/audio/fmopl.c
@@ -607,33 +607,41 @@ static int OPLOpenTable( void )
 	double pom;
 
 	/* allocate dynamic tables */
-    TL_TABLE = malloc(TL_MAX * 2 * sizeof(int32_t));
+    TL_TABLE = g_try_new(int32_t, TL_MAX * 2);
     if (TL_TABLE == NULL) {
         return 0;
     }
 
-    SIN_TABLE = malloc(SIN_ENT * 4 * sizeof(int32_t *));
+    SIN_TABLE = g_try_new(int32_t *, SIN_ENT * 4);
     if (SIN_TABLE == NULL) {
-        free(TL_TABLE);
+        g_free(TL_TABLE);
         return 0;
     }
 
-    AMS_TABLE = malloc(AMS_ENT * 2 * sizeof(int32_t));
+    AMS_TABLE = g_try_new(int32_t, AMS_ENT * 2);
     if (AMS_TABLE == NULL) {
-        free(TL_TABLE);
-        free(SIN_TABLE);
+        g_free(TL_TABLE);
+        g_free(SIN_TABLE);
         return 0;
     }
 
-    VIB_TABLE = malloc(VIB_ENT * 2 * sizeof(int32_t));
+    VIB_TABLE = g_try_new(int32_t, VIB_ENT * 2);
     if (VIB_TABLE == NULL) {
-        free(TL_TABLE);
-        free(SIN_TABLE);
-        free(AMS_TABLE);
+        g_free(TL_TABLE);
+        g_free(SIN_TABLE);
+        g_free(AMS_TABLE);
+        return 0;
+    }
+
+    ENV_CURVE = g_try_new(int32_t, 2 * EG_ENT + 1);
+    if (ENV_CURVE == NULL) {
+        g_free(TL_TABLE);
+        g_free(SIN_TABLE);
+        g_free(AMS_TABLE);
+        g_free(VIB_TABLE);
         return 0;
     }
 
-    ENV_CURVE = g_new(int32_t, 2 * EG_ENT + 1);
 	/* make total level table */
 	for (t = 0;t < EG_ENT-1 ;t++){
 		rate = ((1<<TL_BITS)-1)/pow(10,EG_STEP*t/20);	/* dB -> voltage */
@@ -702,10 +710,10 @@ static int OPLOpenTable( void )
 static void OPLCloseTable( void )
 {
     g_free(ENV_CURVE);
-    free(TL_TABLE);
-    free(SIN_TABLE);
-    free(AMS_TABLE);
-    free(VIB_TABLE);
+    g_free(TL_TABLE);
+    g_free(SIN_TABLE);
+    g_free(AMS_TABLE);
+    g_free(VIB_TABLE);
 }
 
 /* CSM Key Control */
@@ -1088,7 +1096,7 @@ FM_OPL *OPLCreate(int clock, int rate)
 	state_size  = sizeof(FM_OPL);
 	state_size += sizeof(OPL_CH)*max_ch;
 	/* allocate memory block */
-    ptr = malloc(state_size);
+    ptr = g_try_malloc(state_size);
 	if(ptr==NULL) return NULL;
 	/* clear */
 	memset(ptr,0,state_size);
@@ -1134,7 +1142,7 @@ void OPLDestroy(FM_OPL *OPL)
 	}
 #endif
 	OPL_UnLockTable();
-    free(OPL);
+    g_free(OPL);
 }
 
 /* ----------  Option handlers ----------       */
-- 
2.25.1


