Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5A74C7657
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:02:56 +0100 (CET)
Received: from localhost ([::1]:35036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkMI-0007UA-U0
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:02:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAS-0002gg-OB; Mon, 28 Feb 2022 12:50:40 -0500
Received: from [2607:f8b0:4864:20::22c] (port=42648
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAR-0007y0-4v; Mon, 28 Feb 2022 12:50:40 -0500
Received: by mail-oi1-x22c.google.com with SMTP id a6so13891185oid.9;
 Mon, 28 Feb 2022 09:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oKD/C7wjIjDJYk8HQQyKcIQhAW36scXHc1YW7sGgnZ8=;
 b=StBzxM+0SkG8c7xcr+LYkEITxSQJBhvLLjJLj3v7GwSnveKPPKuUri9zrIJq9Fce8f
 ft2A0P3fXtyNeK5LEtYG8m9OCHgLoUJzy6tsNUzmuWEXWqv4hJARebHtKnDH58KdulmI
 xsc9f1Z3wmGiXcn/cabmLbdspuQlyzUQ8hLEJ8zOErqTUewFGZG1R01BQ3DDpXNts9CW
 tfSW5Hw7Ts2Bv/Gf52gbUUBcs0DKatVCCdOFHtrmWFDqsALuJy7WgxFcZQIufrrtwJFM
 cNqVyFmmPB63Mux3a6AgyLhJ78xBxY1+9W97I/dcjmCJxzyrcZzR+5WxFiGvRE8EUXxs
 tnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oKD/C7wjIjDJYk8HQQyKcIQhAW36scXHc1YW7sGgnZ8=;
 b=r+uuvX6mWv3BdtDTb8t8d8hm8fd9VGZyCk/6ch9sRAMpC2bXOv7GXKPq1yNWk64UP+
 /jYhBfIVEIjZo8eAkyEueWVwxxlYAa8ludhhmH4dUnvqX122uWL+BvMHNr+V10c9ZQRo
 jCS11s/ngg4FjH/m9CkbG9/QzeIptUUHBiJhTLogczcCj16CxK9uYpkV6unD5EsvvCYH
 EJTUbiPJ6nl84FHoHYUQqrvlEx0Eyc1rlu3qNeZHabWIaw25wVf4wVGtqxegs4KOV3o4
 kHiByffjZtoMWKp/d6Z6fX1a1gBJ397KRVvdBkI6z8lsJZ2FLGByQDXC/MV0f9mFIk+9
 ZjCg==
X-Gm-Message-State: AOAM531S3BW9rR4DIBoO7VEJX7coQzPsuLFPC0/7FvqS0PlNNodRLi7l
 6YU1jDhYPP2zxxinTujyhrZgaG0noGM=
X-Google-Smtp-Source: ABdhPJyV97D7S3Cnf/ticF1TKmLITahzEwrvtNy5AQyyS5EXqxXRCODutTi9HwqUSU2dCtvXMamE3w==
X-Received: by 2002:aca:bd87:0:b0:2cf:4801:c2b5 with SMTP id
 n129-20020acabd87000000b002cf4801c2b5mr11457952oif.104.1646070637471; 
 Mon, 28 Feb 2022 09:50:37 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a9d5c8c000000b005ad51592bd8sm5368481oti.49.2022.02.28.09.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:50:37 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/14] hw/ppc/spapr_drc.c: use g_autofree in
 spapr_dr_connector_new()
Date: Mon, 28 Feb 2022 14:49:59 -0300
Message-Id: <20220228175004.8862-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228175004.8862-1-danielhb413@gmail.com>
References: <20220228175004.8862-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
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

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index b2a365baf1..ac4067625e 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -557,7 +557,7 @@ SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
                                          uint32_t id)
 {
     SpaprDrc *drc = SPAPR_DR_CONNECTOR(object_new(type));
-    char *prop_name;
+    g_autofree char *prop_name = NULL;
 
     drc->id = id;
     drc->owner = owner;
@@ -566,7 +566,6 @@ SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
     object_property_add_child(owner, prop_name, OBJECT(drc));
     object_unref(OBJECT(drc));
     qdev_realize(DEVICE(drc), NULL, NULL);
-    g_free(prop_name);
 
     return drc;
 }
-- 
2.35.1


