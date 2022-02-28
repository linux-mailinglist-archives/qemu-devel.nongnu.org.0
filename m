Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9134C7640
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:01:44 +0100 (CET)
Received: from localhost ([::1]:60394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkL9-0005Ts-Ot
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:01:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAQ-0002Xp-9h; Mon, 28 Feb 2022 12:50:38 -0500
Received: from [2607:f8b0:4864:20::22a] (port=40790
 helo=mail-oi1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAO-0007xU-Rb; Mon, 28 Feb 2022 12:50:37 -0500
Received: by mail-oi1-x22a.google.com with SMTP id j2so13889194oie.7;
 Mon, 28 Feb 2022 09:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ff+w9iWXeiR1/IzEOsrDIWGlDl1RPZPJn7h1o/fwJG0=;
 b=FxDyPzaKQZ2HSryrJ/Tl+lV42z78KJGfikTsVC3yZTO75B4xUHRMv7jKCAHxP8G2UR
 8UisTTaZi6Mt+gnt1uuLal5Usb1jIFzsVeaYhEMuevl6RxXeus6MIk/sIVKEQ1kx3GvD
 LI02cbu+pzL6FXjQIjLbXUoTC9xswkWR0yKhFE5+9hB59dP6wWdR4c1n1zEoH/KSgTYx
 49iSofAycrJYQ0vq7PP91EIwvViIZ7MQ1GipqrJWpDFuWK+GrUeqMhCuxNOFO5NgdIL7
 wEclOmCyxyM32k/e0zIE89tNuZGwshHTgXpTCFzmCjbMcMfzPPctPtnTb78NqkD7Vmkx
 cXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ff+w9iWXeiR1/IzEOsrDIWGlDl1RPZPJn7h1o/fwJG0=;
 b=hpfubbv7ICvThaGfQTSqK3zql6MeeDwakbEH48OKjg6VcrsHFsuhzIb9Mn0oX7kH0b
 OvT/jDC3UyOgdwEM84W2r31x95exBeHxWoadWQB/ntZ8163ne9t59AQqg9YOHGH4q2JF
 hz8akSFJ0wMtLDzo9KXOAjGpRZyaz11QQD9wErYLoprbeCSufhd3lJ9DeushMyWHvmZP
 AgRFj27cWTkhFOa19B3doHPk+nVpmN+3UBK+GaUGb9mzHPOkiliEnUH/BJNQUoZpqS8r
 y5T9/+ad7dJYiMcUqI64T8wvHWTFPgMfCpa5oJkaKigHanLqvRv3OQSbrNckbDkAmoGa
 wdXQ==
X-Gm-Message-State: AOAM533plhKEWziEByw+8mXo/w197d647nCatHJoE2SZwgThfAKKdytO
 +3KBBRbTvAhZPJUpE4BJ924aXnIOsVY=
X-Google-Smtp-Source: ABdhPJxSEw5JCXga24qkcaRH7VbDCTw5jbpHF1b2PV9Ygg4OY9TsZDCL45ytRpRURQJFAjhB8b3ktg==
X-Received: by 2002:a05:6808:1884:b0:2d5:1d96:deed with SMTP id
 bi4-20020a056808188400b002d51d96deedmr9551651oib.95.1646070635479; 
 Mon, 28 Feb 2022 09:50:35 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a9d5c8c000000b005ad51592bd8sm5368481oti.49.2022.02.28.09.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:50:35 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/14] hw/ppc/spapr_drc.c: use g_autofree in drc_unrealize()
Date: Mon, 28 Feb 2022 14:49:58 -0300
Message-Id: <20220228175004.8862-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228175004.8862-1-danielhb413@gmail.com>
References: <20220228175004.8862-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
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
index 251201fab3..b2a365baf1 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -544,15 +544,13 @@ static void drc_realize(DeviceState *d, Error **errp)
 static void drc_unrealize(DeviceState *d)
 {
     SpaprDrc *drc = SPAPR_DR_CONNECTOR(d);
+    g_autofree gchar *name = g_strdup_printf("%x", spapr_drc_index(drc));
     Object *root_container;
-    gchar *name;
 
     trace_spapr_drc_unrealize(spapr_drc_index(drc));
     vmstate_unregister(VMSTATE_IF(drc), &vmstate_spapr_drc, drc);
     root_container = container_get(object_get_root(), DRC_CONTAINER_PATH);
-    name = g_strdup_printf("%x", spapr_drc_index(drc));
     object_property_del(root_container, name);
-    g_free(name);
 }
 
 SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
-- 
2.35.1


