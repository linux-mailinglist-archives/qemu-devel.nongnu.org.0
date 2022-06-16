Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1879954DED2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:23:56 +0200 (CEST)
Received: from localhost ([::1]:39646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mfL-0001OB-3p
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mcA-0006tP-US
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:40 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:43835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mc6-0000VK-UQ
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:38 -0400
Received: by mail-lf1-x12f.google.com with SMTP id be31so1486052lfb.10
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tr3zUpzB0GffCzKr/MY5AoUXPXUzW4B6SXMURDobjpE=;
 b=U0NWxVVKjQBoPz+U1nhbBAWAlbVcmUNMRrBQWLIx8M9RXS3oZYWWuo5kftYCFymu3H
 Jy5bnJRjAXipQmCNhvWquLbxY/Vynbwlf6xBIDWzs0evOeimPRZEATDHvxfqrzi9Tlbi
 a16LwCO9eKoHQPF6B2drsv297aj1zoL3EuXoMo3YvPd9SuW1VfdWPZNcUups+2fgh+UL
 IfQe83hDiH/fI3FL6wvsGzyL5MVa0zUoEZKOuMAfJQB1NcmUo+D0mOGiFwCvDOC3+0sm
 y5k7pDt1ZMyz9G50f/vFZybdTjZO+AljtwGQMF9H56P+GpOuWIQURJx3jussltI6Jj6E
 i6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tr3zUpzB0GffCzKr/MY5AoUXPXUzW4B6SXMURDobjpE=;
 b=El4yiIuNRQfqSY6Frmup7/7Dn7JuiDzxn6SlSvpKovQnVjiRNNbeFfNfsnDWSxBHqT
 OKMuERZMToT/52vfq9mok2fIa3pkkiAP8E6NCXKpOKKnKdy6/0FH4DkdOc/4f/4eGjOx
 ePT8gti3dD/D9j5GY31VByLaHpK5F/KuJRosYXCH7KG7r9M24KM6wTNvMoXuI/bxXoLC
 olPbWYk+8PObLPeTM6k2BaQeg/u0hjlxEQTiBmKDcArRRnuJcO3SUPBYVFRwAPPGwD5A
 UPiKNSbMI0fJJZy6uRQIpjIKMDSknDSES2C1pSIqguGfpLMVBdiWUxsGgCE70n47Xzgq
 nThQ==
X-Gm-Message-State: AJIora+B3oVT/TAca6Nu1frr2+nGyh3Edzs9M8RtGzrkj4PMPvdMlkPt
 Qxz5z/iatldHHpnh2ccYl7O4Y4IN8A5WEUW2
X-Google-Smtp-Source: AGRyM1tu88visg4C6vHFU1mFFkzmNTbetIJpJGUGjTzul/o2I/22JdjmICAkl8i0CqrR63JnrsJflw==
X-Received: by 2002:a05:6512:3132:b0:478:f2f1:3a75 with SMTP id
 p18-20020a056512313200b00478f2f13a75mr2358432lfd.100.1655374831623; 
 Thu, 16 Jun 2022 03:20:31 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05651232b100b0047255d21166sm179014lfe.149.2022.06.16.03.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:20:31 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH 3/8] migration: Add vmstate part of migration stream
Date: Thu, 16 Jun 2022 13:19:59 +0300
Message-Id: <20220616102006.218693-4-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102006.218693-1-nikita.lapshin@openvz.org>
References: <20220616102006.218693-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nikita Lapshin <nikita.lapshin@openvz.org>

Now we can disable and enable vmstate part by stream_content parameter.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 migration/migration.c | 10 ++++++++--
 migration/savevm.c    | 15 +++++++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 4adcc87d1d..bbf9b6aad1 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1334,9 +1334,15 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
     }
 }
 
-static bool check_stream_parts(strList *stream_content_list)
+static bool check_stream_parts(strList *stream_list)
 {
-    /* To be implemented in ext commits */
+    for (; stream_list; stream_list = stream_list->next) {
+        if (!strcmp(stream_list->value, "vmstate")) {
+            continue;
+        }
+
+        return false;
+    }
     return true;
 }
 
diff --git a/migration/savevm.c b/migration/savevm.c
index c68f187ef7..48603517ba 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -949,6 +949,21 @@ static bool should_skip(SaveStateEntry *se)
         return true;
     }
 
+    /*
+     * Assume that any SaveStateEntry with non-null vmsd is
+     * part of vmstate.
+     *
+     *
+     * Vmstate is included by default so firstly check if
+     * stream-content-list is enabled.
+     */
+
+    if (se->vmsd &&
+        migrate_get_current()->parameters.has_stream_content_list &&
+        !migrate_find_stream_content("vmstate")) {
+        return true;
+    }
+
     return false;
 }
 
-- 
2.31.1


