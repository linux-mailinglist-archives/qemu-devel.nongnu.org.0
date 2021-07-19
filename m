Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E03A3CEC35
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:11:38 +0200 (CEST)
Received: from localhost ([::1]:55106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Zc1-0007DY-IL
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m5ZZE-00036i-1R; Mon, 19 Jul 2021 16:08:44 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m5ZZC-00026V-G0; Mon, 19 Jul 2021 16:08:43 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 62so20328592pgf.1;
 Mon, 19 Jul 2021 13:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H1Fo0Bc8ezELCqzkwb6OHOVSX3f5A3Fw+Iay/0zsNqg=;
 b=dVsuMRAD7uf382vjVeUIPCCzecO8E3FezXxzvEdo76qO8ZOGebz0BrENvuwIQfH2x3
 w5p6kkKJXTisksLALEg1JMVRTZncYBNiFbY5Loa1V26uoO6NfShew6Ay/U8BwA7YHzBL
 9EN/u+rsjGJgh4kVpJNtdeYTPQ3Kgzma/WthBLws8hf/ZAhVxtizxgg9Z1I9BOTKe9AY
 iAne8ivK3iUQN6e1aXGJqI4wxK83/CCL0xZh4gDHzcQXc9O9MJ+0o8COJYtQJaRwg82f
 neZqx6fJ3bVLP616YB1oyRBArgnLDGi+0At0/XcS6CjmF5cy7Xq2yxBrnmNgay+B1p9s
 JThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H1Fo0Bc8ezELCqzkwb6OHOVSX3f5A3Fw+Iay/0zsNqg=;
 b=ubrF+BoDfjJCa6OuUaaIRFPppSXhNC3uKUkOhDJNkAzy0fmw2KdeJ0jDEojfuNO0m4
 kn4plhwGg4XxFRaBBTTB2573nIEeGQiEQTGJkvsiYpOuUpFcnMYD9YmzRpIumOUedaDm
 tEAke9YJAugsioOqrgMpLjRSB2lku1M9zL6yLeACqYgj2kFH75as4Wyh43boWr0yXJVS
 oMvvjiwqbfbkhZCLApGm7u0IGWXviDtAE13dhS3vbIb8U2mAWQOPsnshPeSBJ7pM6iAH
 O/xkktQH+iJOAAbEp4bFuSyu+/FV8jYInZ40wsnjZKC8nOsxJQ5xiU7/e4SZDQhxbUkm
 5UrA==
X-Gm-Message-State: AOAM531Y748Vq8jw/Eoc13gBW1UPutdvrDGG6qGwXWccwWblLP+fdyfU
 zZtM3S7iH2zL+oPRKX6ZXbMXya0keMGxIA==
X-Google-Smtp-Source: ABdhPJy4646AzDM8/kHO6djEVAPUOZZ/KDKeth+Ve9Iy4C2Up9EYjIZgYMO/Qh6pb9T7iahjiVxOfw==
X-Received: by 2002:a65:6442:: with SMTP id s2mr27033631pgv.420.1626725320784; 
 Mon, 19 Jul 2021 13:08:40 -0700 (PDT)
Received: from rekt.ihost.com ([191.193.148.134])
 by smtp.gmail.com with ESMTPSA id e18sm21048805pfc.85.2021.07.19.13.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 13:08:40 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 v6 2/7] spapr.c: avoid sending MEM_UNPLUG_ERROR if
 dev->id is NULL
Date: Mon, 19 Jul 2021 17:08:22 -0300
Message-Id: <20210719200827.1507276-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210719200827.1507276-1-danielhb413@gmail.com>
References: <20210719200827.1507276-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=danielhb413@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: armbru@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As done in hw/acpi/memory_hotplug.c, avoid sending
qapi_event_send_mem_unplug_error() if dev->id is NULL.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 81699d4f8b..1611d7ab05 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3688,9 +3688,11 @@ void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
      * Tell QAPI that something happened and the memory
      * hotunplug wasn't successful.
      */
-    qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
-                                 "for device %s", dev->id);
-    qapi_event_send_mem_unplug_error(dev->id, qapi_error);
+    if (dev->id) {
+        qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
+                                     "for device %s", dev->id);
+        qapi_event_send_mem_unplug_error(dev->id, qapi_error);
+    }
 }
 
 /* Callback to be called during DRC release. */
-- 
2.31.1


