Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEDA4C7691
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:04:55 +0100 (CET)
Received: from localhost ([::1]:40930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkOE-00032D-TC
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:04:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAc-0002uJ-If; Mon, 28 Feb 2022 12:50:50 -0500
Received: from [2607:f8b0:4864:20::329] (port=43883
 helo=mail-ot1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAa-00080w-TE; Mon, 28 Feb 2022 12:50:49 -0500
Received: by mail-ot1-x329.google.com with SMTP id
 j9-20020a9d7d89000000b005ad5525ba09so10075550otn.10; 
 Mon, 28 Feb 2022 09:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HWQSY6AW0ufVgup1Eft5QjjEIsECY/xMODO8cltOgnQ=;
 b=W78UuLO8f8eLcL0FNiORhlNX+c/GCBgVy97tmNpgg+HgAm+Hra1G0HIeajSXhztA+E
 F/EkDg1C+8pGv6COPRwQ15PdFbeSXRp0bLPHdnhDjlFjbPd7Wtsih6CLI8ItIHmJ1Bhv
 E30vq3+1VdexrXR+ZEfyhMbPjgpM0ewv/HS6obZgH2Dc7F+wOywaebednQbD3A5akfKh
 1SjVspIhzSPp7SQTarGhft0M3oMytqSsE9VMA1p64CG4aiCGG7TDz4MaIQDvC64lM/YS
 jHFDiI+ZMH6nHulvR7HatlbhYJIlzidN71KrsLmxT+a6F4lylkA+rnD/n++d9XCM4T0a
 ewUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HWQSY6AW0ufVgup1Eft5QjjEIsECY/xMODO8cltOgnQ=;
 b=B9RggYhP/sRnowIQPMbDQEo/E1NbsqZVTbodXWNkR0IEq51DaG1JVS7CNhW0O2v16V
 OOJTPTtqsSTy4Ekx4pymk7vF269HDLFtq0lMCURHZwzsKiBhEI8bN4xQctXlM1ni1g1c
 dDlx4e9k8IRh4B6Z05LxyPA4HDHzyD/HeIQuUK2YojHhwaIpAU6rNnWYsGT5dcWYuX4S
 LPivHaKpc064xqZRX/zvkWx8TwHDWYnF+pPtyZ17lTXlZgSqGdYQH0Oi8QR363Uql2iJ
 OUNgdt2vvDHXjBwTwXVHxl0qGFY6XnhQd6D+aLg8UCOuph/VDm98R+csHhPsLJjH5uKb
 iO1w==
X-Gm-Message-State: AOAM531MN0ijTwDB9GPERHTF1OlGmFsYcSUGlEWER0GQhF3rFiExSYub
 sKoAiVaMIdrfJ0lGUJ9Cr6lvJMlZoUU=
X-Google-Smtp-Source: ABdhPJzK3MZxsfj2LwNQBmCmjs8cq0jsuIEdSzIJY78L0w80BqBTc1O48RZmkP/3WGHzCrK0EK0Law==
X-Received: by 2002:a9d:714a:0:b0:5ad:f8f9:b50d with SMTP id
 y10-20020a9d714a000000b005adf8f9b50dmr9893011otj.47.1646070647456; 
 Mon, 28 Feb 2022 09:50:47 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a9d5c8c000000b005ad51592bd8sm5368481oti.49.2022.02.28.09.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:50:47 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/14] hw/ppc/spapr_vio.c: use g_autofree in spapr_dt_vdevice()
Date: Mon, 28 Feb 2022 14:50:04 -0300
Message-Id: <20220228175004.8862-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228175004.8862-1-danielhb413@gmail.com>
References: <20220228175004.8862-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::329
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
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

And return the result of g_strdup_printf() directly instead of using the
'path' var.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_vio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index b975ed29ca..9d4fec2c04 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -726,7 +726,7 @@ void spapr_dt_vdevice(SpaprVioBus *bus, void *fdt)
 gchar *spapr_vio_stdout_path(SpaprVioBus *bus)
 {
     SpaprVioDevice *dev;
-    char *name, *path;
+    g_autofree char *name = NULL;
 
     dev = spapr_vty_get_default(bus);
     if (!dev) {
@@ -734,8 +734,6 @@ gchar *spapr_vio_stdout_path(SpaprVioBus *bus)
     }
 
     name = spapr_vio_get_dev_name(DEVICE(dev));
-    path = g_strdup_printf("/vdevice/%s", name);
 
-    g_free(name);
-    return path;
+    return g_strdup_printf("/vdevice/%s", name);
 }
-- 
2.35.1


