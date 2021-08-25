Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B185F3F6CBF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 02:51:09 +0200 (CEST)
Received: from localhost ([::1]:36404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIh8G-0005G7-O8
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 20:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIh6H-0001cZ-KN; Tue, 24 Aug 2021 20:49:05 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:36785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIh6G-0006zG-8W; Tue, 24 Aug 2021 20:49:05 -0400
Received: by mail-qt1-x82d.google.com with SMTP id t32so3195989qtc.3;
 Tue, 24 Aug 2021 17:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jCpu7i6IKjzlWeVa/RvnCa9y/V1BQb3hcKrGSlD9n/E=;
 b=Gy6DaMAm5R0626UJwOKkoAZyvskYS+5ibh9LzjJPpmVCMFRASZRHQWvgp0bxyEaZVN
 6aFHBJ/CzETKAEjW2V9SsMzhE458qvAwS/kb5jqmMuQU1otNHDWXhE8BgKn43EhEi9DO
 fc3obw1UJPUEeXPMMgM5jpIC7aa/mkH9NoLaFkF2SYWG1eTsvFbpgKvMKFw0BfEehrb+
 unCBY+TS7CBXY9SHTX5/56cyfIibr6modQiiUujM0qmC9Xnqpy34OhYSFrxD8laRDE1B
 YAvy/J/vWJO1rAkkt/y1K0oQZSYcfMKw00dxwwemjUbyTixSoSIY/Xw7umWn1ic4S05v
 gkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jCpu7i6IKjzlWeVa/RvnCa9y/V1BQb3hcKrGSlD9n/E=;
 b=Opgf/2sZRTceWAjJWPdJ9pgstkLNMzDinoNqK5OkE7Xy9i5D489+fjWhcGZOsAP2qZ
 kxf+urkjwNRsTXCA0PxruR0QiUhRUydt0dAGZoC8v3uG3VQJ7Vj79F6aqY4ziPLU+CIe
 p9qdEu5RyGk1sD3oWsQabqf14yFMG0tuVRxMUlAUKvewM5LIS2Nka5aJCZ+mP+HLjdKb
 b5Rqhei65q529GaEIov7LhzdSsxNYPRGwR8YWiEr7V/6oVyGYFkt5Obwd5O62rUbkryx
 SuZagCDSQ3ng5IFQ8Xc7LvZZ+ICf7l5IVXhEgX65RrnQxY7IDFJvTBS6/xpAESm4ON5R
 dMYw==
X-Gm-Message-State: AOAM530ASy6baeWOMW/g3F85iK/nUyYb03OMAdwhVbgcXaxfyhMug9MQ
 XqWs3X4bVz/1JNdRgBEMjGNa8OFRXFc=
X-Google-Smtp-Source: ABdhPJzyEL5B12BUSZCAceMBksmfO30ap9o5AclKfyx4jqqIUF2jpHtaQUISRzhQ7j7I10megKloQg==
X-Received: by 2002:a05:622a:1486:: with SMTP id
 t6mr36579032qtx.47.1629852542875; 
 Tue, 24 Aug 2021 17:49:02 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id x10sm1515266qto.41.2021.08.24.17.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 17:49:02 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 3/7] spapr_drc.c: do not error_report() when drc->dev->id
 == NULL
Date: Tue, 24 Aug 2021 21:48:31 -0300
Message-Id: <20210825004835.472919-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825004835.472919-1-danielhb413@gmail.com>
References: <20210825004835.472919-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82d.google.com
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

The error_report() call in drc_unisolate_logical() is not considering
that drc->dev->id can be NULL, and the underlying functions error_report()
calls to do its job (vprintf(), g_strdup_printf() ...) has undefined
behavior when trying to handle "%s" with NULL arguments.

Besides, there is no utility into reporting that an unknown device was
rejected by the guest.

Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index a2f2634601..a4d9496f76 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -167,8 +167,11 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
             }
 
             drc->unplug_requested = false;
-            error_report("Device hotunplug rejected by the guest "
-                         "for device %s", drc->dev->id);
+
+            if (drc->dev->id) {
+                error_report("Device hotunplug rejected by the guest "
+                             "for device %s", drc->dev->id);
+            }
 
             /*
              * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
-- 
2.31.1


