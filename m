Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB604C75A1
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 18:55:23 +0100 (CET)
Received: from localhost ([::1]:45154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkF0-0003TQ-CV
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 12:55:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAO-0002PW-9N; Mon, 28 Feb 2022 12:50:36 -0500
Received: from [2607:f8b0:4864:20::22d] (port=43527
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAM-0007x7-RZ; Mon, 28 Feb 2022 12:50:35 -0500
Received: by mail-oi1-x22d.google.com with SMTP id s5so13902425oic.10;
 Mon, 28 Feb 2022 09:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JbJ9Jy11cDYW/fcjCdWMlx85wNlNZDPtHScmitgTyE0=;
 b=U/t8oyEtXHt5l7QZwUadX5cEP+exsVAiknjC2aTH3ol2NPSLnVqL3pFYQa5Ps5PX3F
 VjhT3SG0g31/MMqhmaBgn/Qv8I0vFUIMebMvWQ1Lkhb1PoNwYVeBtBjvuQjygeXBUYJO
 nD4XlZFsjjkMtkP5msI6OWDcM7YcombnSiZsECMAF8gaVX8+3/gxjUmciuh2f5eaWrmx
 6tsa7kyNi0DyoPrlpTMjs0tUm0FGFKjO89mlCykNNyiTEw5gV8/x+snEccd5XDYGHqUN
 yL4zmyKnXeGHYXNbQEndgDJ5maRGtuleYokWFhDDXGBgXjVeUMOO7w0sWQcx1cxWXLy3
 gCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JbJ9Jy11cDYW/fcjCdWMlx85wNlNZDPtHScmitgTyE0=;
 b=TXzTtfKKU5QkhzgzNAtFq5J2vosmlOkZRpRFhExR98QWV6un3NfseOL66WCaP2CoYY
 niUsjdKrJuRv37cK3+DQvk58DcxwxLjPZm5wxa1oMPBH1FzX1uzin/GTGPdeKmYN8uU+
 KwjcIjL6g0k+mmbixG6M0OAWfdCT23nxWKkRb5a3qfxKcRmWZcPKoxnE4K+2K/v1R6gq
 jEXSrRoZAdkPSTIV0IHqNY8PiE0ys/lIfYJgGCPa4rHOPl6PHcSUpPhGYJFJsEligtND
 6i28mK5hrWd4lxllQwHhl+oW/zqSyJdn2pE52Du00kdKLb72gUhMOZABZ4IOp7hpMwKP
 /cog==
X-Gm-Message-State: AOAM533YoMbliJ0SOUu+9RaZbppSEOpwKif6IywAEMYnxKLJO6w8eA3W
 kOm94wxAb1l1VHlT0GcsU6o5kxhLWqo=
X-Google-Smtp-Source: ABdhPJz6mi76U1O51/0s0vvnKcvstEpQC0HazupyNtZzyC3LPx/xmfktbYx6eL8+gaYIhcPhKoMmEQ==
X-Received: by 2002:a05:6808:138b:b0:2d5:1fc2:b718 with SMTP id
 c11-20020a056808138b00b002d51fc2b718mr11384086oiw.119.1646070633449; 
 Mon, 28 Feb 2022 09:50:33 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a9d5c8c000000b005ad51592bd8sm5368481oti.49.2022.02.28.09.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:50:33 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/14] hw/ppc/spapr_drc.c: use g_autofree in drc_realize()
Date: Mon, 28 Feb 2022 14:49:57 -0300
Message-Id: <20220228175004.8862-8-danielhb413@gmail.com>
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

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 0ba84063aa..251201fab3 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -519,8 +519,8 @@ static const VMStateDescription vmstate_spapr_drc = {
 static void drc_realize(DeviceState *d, Error **errp)
 {
     SpaprDrc *drc = SPAPR_DR_CONNECTOR(d);
+    g_autofree gchar *link_name = g_strdup_printf("%x", spapr_drc_index(drc));
     Object *root_container;
-    gchar *link_name;
     const char *child_name;
 
     trace_spapr_drc_realize(spapr_drc_index(drc));
@@ -532,12 +532,10 @@ static void drc_realize(DeviceState *d, Error **errp)
      * existing in the composition tree
      */
     root_container = container_get(object_get_root(), DRC_CONTAINER_PATH);
-    link_name = g_strdup_printf("%x", spapr_drc_index(drc));
     child_name = object_get_canonical_path_component(OBJECT(drc));
     trace_spapr_drc_realize_child(spapr_drc_index(drc), child_name);
     object_property_add_alias(root_container, link_name,
                               drc->owner, child_name);
-    g_free(link_name);
     vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate_spapr_drc,
                      drc);
     trace_spapr_drc_realize_complete(spapr_drc_index(drc));
-- 
2.35.1


