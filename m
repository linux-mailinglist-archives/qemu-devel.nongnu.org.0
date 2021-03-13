Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684DA339F2E
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 17:43:19 +0100 (CET)
Received: from localhost ([::1]:35546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7MC-0006sV-LX
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 11:43:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7HO-0002VJ-EK
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:38:18 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7HF-0007JR-P5
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:38:18 -0500
Received: by mail-wr1-x430.google.com with SMTP id u16so6454634wrt.1
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sg5nGgHTBeRiuxmxPZ+wz0jzsIryQrfg1B3YEn8ftJE=;
 b=cijuSOkWAzwILU47Vh5JZytpuGwr7ZsuvuWaxYYuhgkonXx4tjW1oWQfxiwzPFiiDm
 sxTe1GP8tmcwBlY/1mEseh4bSSNF46AVbQ+ENzGAzPO2nlEU8h9ggYNmDTYsZ+isdrHs
 tZ7U4nfveu/2pL/sJldqDQYaGyYDU47yvJ6yAlhOvu5t++8YbxfwYXoKd5NWeGrbuss/
 UIzjPWkDPjzIBfxnFs7nnXL1y4Trtfa+fBi9dlVAfCQJXBOYQKzQlVea3mYyiIKNx4D5
 TSbYdkk2BumSVFrDC0mz/yrzAX3enX2/1BHDo9yB3ZAdOVTUCVEkB6VaEhvgH6W88y/H
 m0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sg5nGgHTBeRiuxmxPZ+wz0jzsIryQrfg1B3YEn8ftJE=;
 b=EdzZVbg9OKxcPiEWcjHWEUP1ZHW5dYAPsjuvj52GpiquGIRDAUg/yo1U82JfpFeZ6i
 MQjxhK2PnNUDOTnJIm2ZJ5sm9lB6FmLO0clBg20Og/0dFmDy4tq7ryyfb8W1ZXpLqe2x
 Ei2VB6uNSejatsn7Fx5QaV4+f7DmwLNgCk0ZP6ssEt3e4MHTtKwbwo+McA8FMQcM2NTw
 +wl9Dtsr9iaHqRR7Khzgx0rhZeurrTHUBeXstcKLwteCLs4ljDRnHCS4/GyqiC9FFHxl
 WFFS65cIHrCMQ2qickqylGhs98LpXvy0buzpdwy3vW2efrWb2JklOmu0NHI8iM7WNMJb
 oZOA==
X-Gm-Message-State: AOAM533G7wBOj1jlQTLV3SYW/Fiuy6m8YjavfZ8XJWyfwoqeqqNJz9Jm
 XFXLLCZV/Tkza3WyvBVyoy7MDaDwgq8=
X-Google-Smtp-Source: ABdhPJzylw7DRrfpMzHvT6hJMZHrGRnd1AiKxGd4/BZSsbkx4kLBIl26mnsLFsHHKN+Kf597wmiO3g==
X-Received: by 2002:adf:e411:: with SMTP id g17mr19514333wrm.225.1615653487177; 
 Sat, 13 Mar 2021 08:38:07 -0800 (PST)
Received: from localhost.localdomain ([197.61.164.30])
 by smtp.googlemail.com with ESMTPSA id n6sm13173441wrt.1.2021.03.13.08.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:38:06 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] hw/audio/fmopl.c: Replaced calls to malloc with GLib's
 variants
Date: Sat, 13 Mar 2021 18:36:47 +0200
Message-Id: <20210313163653.37089-4-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313163653.37089-1-ma.mandourr@gmail.com>
References: <20210313163653.37089-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x430.google.com
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
 hw/audio/fmopl.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
index 45f15c53b3..6cecf2b963 100644
--- a/hw/audio/fmopl.c
+++ b/hw/audio/fmopl.c
@@ -607,27 +607,34 @@ static int OPLOpenTable( void )
 	double pom;
 
 	/* allocate dynamic tables */
-    if((TL_TABLE = malloc(TL_MAX * 2 * sizeof(int32_t))) == NULL)
+    if((TL_TABLE = g_try_new(int32_t, TL_MAX * 2)) == NULL)
         return 0;
-    if((SIN_TABLE = malloc(SIN_ENT * 4 *sizeof(int32_t *))) == NULL)
+    if((SIN_TABLE = g_try_new(int32_t *, SIN_ENT * 4)) == NULL)
     {
-        free(TL_TABLE);
+        g_free(TL_TABLE);
         return 0;
     }
-    if((AMS_TABLE = malloc(AMS_ENT * 2 * sizeof(int32_t))) == NULL)
+    if((AMS_TABLE = g_try_new(int32_t, AMS_ENT * 2)) == NULL)
     {
-        free(TL_TABLE);
-        free(SIN_TABLE);
+        g_free(TL_TABLE);
+        g_free(SIN_TABLE);
         return 0;
     }
-    if((VIB_TABLE = malloc(VIB_ENT *2 * sizeof(int32_t))) == NULL)
+    if((VIB_TABLE = g_try_new(int32_t, VIB_ENT * 2)) == NULL)
     {
-        free(TL_TABLE);
-        free(SIN_TABLE);
-        free(AMS_TABLE);
+        g_free(TL_TABLE);
+        g_free(SIN_TABLE);
+        g_free(AMS_TABLE);
+        return 0;
+    }
+    if((ENV_CURVE = g_try_new(int32_t, 2 * EG_ENT + 1)) == NULL)
+    {
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
@@ -696,10 +703,10 @@ static int OPLOpenTable( void )
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
@@ -1082,7 +1089,7 @@ FM_OPL *OPLCreate(int clock, int rate)
 	state_size  = sizeof(FM_OPL);
 	state_size += sizeof(OPL_CH)*max_ch;
 	/* allocate memory block */
-    ptr = malloc(state_size);
+    ptr = g_try_malloc(state_size);
 	if(ptr==NULL) return NULL;
 	/* clear */
 	memset(ptr,0,state_size);
@@ -1128,7 +1135,7 @@ void OPLDestroy(FM_OPL *OPL)
 	}
 #endif
 	OPL_UnLockTable();
-    free(OPL);
+    g_free(OPL);
 }
 
 /* ----------  Option handlers ----------       */
-- 
2.25.1


