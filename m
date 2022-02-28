Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018F84C753A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 18:52:46 +0100 (CET)
Received: from localhost ([::1]:34614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkCS-0004wD-Q5
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 12:52:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAH-000274-D7; Mon, 28 Feb 2022 12:50:29 -0500
Received: from [2607:f8b0:4864:20::22d] (port=39871
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAE-0007rU-Nm; Mon, 28 Feb 2022 12:50:29 -0500
Received: by mail-oi1-x22d.google.com with SMTP id q5so13916602oij.6;
 Mon, 28 Feb 2022 09:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BGZpXuBmFzrRnKmQswNCtyLKVKEPO84WJlehYraDfT8=;
 b=qlX5PWvKnCixxKimPJOWFJX9ixVax8SI4bMB1TdmacFqZWNgrclQw3EyQy6E3Uf8Lj
 JyrvCGuYEGNJdHS8lwd76EZepXcVYqonSDy5RehhuL/79RywOZHTliHCORiqtIOfGvWG
 fGgqzm6IQv4YKEKRJGtM1JJhQKLUMDZqtL2SyTBuGZ00DIxcnrUFi3mLpTNjkMLYmCZ5
 JCSERm700xYUbNAPVMry4hE11fJhDnsx7ui99Jq446X/i6BYkVi0E83bzhUmxkDlDSFu
 XyliVXmIhJoHaCOn0V+CYyaIYcb2y2o3TBt912iH0or0RV+HGhSa+Uq5JZl6mw8nM0VJ
 wRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BGZpXuBmFzrRnKmQswNCtyLKVKEPO84WJlehYraDfT8=;
 b=HmHzg/3Pp5dv60w89j6C0PVKBzWiu+I4YNMFC1gh3GK1fwwWYM3EWrdJTfd/ZkqXce
 PBs2g60u/DjMmbGK1aDpCxkecSiPPczwYgl3AMmyXVSJCxT3JKYMmRJ7gF4RY0VARvYZ
 8e8SvSCde6bF7zSYN2Knq+UsBDZRQdG40FveQS0GccOhMGpeOktL3aKS4LaWeFBxM9Pj
 705rTSyR039KSpxkYyPpjjk2hKVi+TDZ8X3erpUyDS6rAUVt8W9ZxQV1qSu3bCW0xna6
 czUJ45MGF2CNP4i/hCooY6y8aYtfSbGsrIeZI0zyFCoxILYkfjoUBqQXbJMeA+H7UBoE
 c5dw==
X-Gm-Message-State: AOAM53153xOHM1N5UU84JPwi72j66FprqcknO3g6BS8irSFKLm7HrGA3
 ZEgVJH1yZJglqbEmF318gwGWP61h4SE=
X-Google-Smtp-Source: ABdhPJzEgEqIjT0h/tpyGs4GKUwdTCG8bQGte3s2XadtNJU7KXTHKETAbjFC5jM9PRleKjqnEWGXMw==
X-Received: by 2002:a05:6808:2020:b0:2d4:df44:17cb with SMTP id
 q32-20020a056808202000b002d4df4417cbmr9541935oiw.69.1646070625023; 
 Mon, 28 Feb 2022 09:50:25 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a9d5c8c000000b005ad51592bd8sm5368481oti.49.2022.02.28.09.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:50:24 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/14] hw/ppc/spapr_caps.c: use g_autofree in
 spapr_cap_set_string()
Date: Mon, 28 Feb 2022 14:49:53 -0300
Message-Id: <20220228175004.8862-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228175004.8862-1-danielhb413@gmail.com>
References: <20220228175004.8862-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

And get rid of the 'out' label since it's now used.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_caps.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 6167431271..aab313ffb1 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -120,7 +120,7 @@ static void spapr_cap_set_string(Object *obj, Visitor *v, const char *name,
     SpaprCapabilityInfo *cap = opaque;
     SpaprMachineState *spapr = SPAPR_MACHINE(obj);
     uint8_t i;
-    char *val;
+    g_autofree char *val = NULL;
 
     if (!visit_type_str(v, name, &val, errp)) {
         return;
@@ -128,20 +128,18 @@ static void spapr_cap_set_string(Object *obj, Visitor *v, const char *name,
 
     if (!strcmp(val, "?")) {
         error_setg(errp, "%s", cap->possible->help);
-        goto out;
+        return;
     }
     for (i = 0; i < cap->possible->num; i++) {
         if (!strcasecmp(val, cap->possible->vals[i])) {
             spapr->cmd_line_caps[cap->index] = true;
             spapr->eff.caps[cap->index] = i;
-            goto out;
+            return;
         }
     }
 
     error_setg(errp, "Invalid capability mode \"%s\" for cap-%s", val,
                cap->name);
-out:
-    g_free(val);
 }
 
 static void spapr_cap_get_pagesize(Object *obj, Visitor *v, const char *name,
-- 
2.35.1


