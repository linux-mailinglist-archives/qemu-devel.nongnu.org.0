Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94846502B59
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:56:00 +0200 (CEST)
Received: from localhost ([::1]:45018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfMQW-0003bW-60
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsl-0008IT-TH; Fri, 15 Apr 2022 09:21:03 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsj-0000Bb-TW; Fri, 15 Apr 2022 09:21:03 -0400
Received: by mail-ej1-x62e.google.com with SMTP id g18so15318880ejc.10;
 Fri, 15 Apr 2022 06:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ng/MMAsFc5CpeAXbm3bo8f/X5MEJRElx0xHJ1ZVX/1A=;
 b=KaS5u96kHa+YkVSUHJ10Vb0U5cpLxvgFWKbWfQ+4H6UKlZgfAGK+EdZNosn/lazQIq
 HHZLzvVj4w6P6iZftaScemiLXB9+I7+Bn1CQKm8zOABdKUjfdzvdPDPtfC684ggFtHms
 DYafNrALIvmr2ATjg+OC8RSasH42BnPJe6Lq2pqDLdeMQb5j3cznv7kCK4eq2oM5uet3
 aha2iSzi/TqMY7qGSvHQ0hry+qhLHRwq05z4g61jW+iRUXrq/q1lCPTW+DlxekJrjhVG
 XEZtTrFy3SVxPZ4oSEIkOUwr5YUubhlda8MZJwAUkkwEhaX9vLr5S2mxlVODe52bTnkg
 jJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ng/MMAsFc5CpeAXbm3bo8f/X5MEJRElx0xHJ1ZVX/1A=;
 b=W/3p6fKX09GgTqLu5EIq8hrgTypVAjg4ub/C3YCXqIfWyJT8+1HPGC4kTPrcly6Lox
 xt56RNM/gNWDJTl2ptSHjvmFXw5OJQCH3/x958McT0EKSOCuoPLDxp9uT0q9sNYcASTb
 ur4ntBl+vrJ4CDYMO3PwRsUmfjM+dFsEha7odn+LL6sloVfTrCFnnBPx6liusB7wyGg9
 bE4mzdpSA5BIxgSlH8nLh6UXfOeyCSJqWXNGqT8vv5I7TsODfGv1ocfEx3x0EmsXGMdS
 QA5jhJEzdHRoudKSdsp4QlG/LE0g6nVMMxT56kDShuUKexzWgal/wkbgHq5gEAnRk5ng
 gIOA==
X-Gm-Message-State: AOAM532pWD9skXvMqodpFvvS94Sui9OPAvKkqUTF85xHQJDmiiK1QKe9
 +sWnLesVbwK6Vv+rBa9Cg3sTaDZIR4veDw==
X-Google-Smtp-Source: ABdhPJzbCiTh/EnTD1hQQvj/pR+1uMNeqvhXSpcFoNqcFrVoHb3HFCMgiv05Ho4e+r24EieO92B8ng==
X-Received: by 2002:a17:907:e8b:b0:6ec:d4d:5534 with SMTP id
 ho11-20020a1709070e8b00b006ec0d4d5534mr4948997ejc.416.1650028860223; 
 Fri, 15 Apr 2022 06:21:00 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:20:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/26] migration: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:59 +0200
Message-Id: <20220415131900.793161-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, malureau@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 migration/migration.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 4dcb511bb6..23781f6277 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -553,7 +553,8 @@ static void process_incoming_migration_bh(void *opaque)
     migration_incoming_state_destroy();
 }
 
-static void process_incoming_migration_co(void *opaque)
+static void coroutine_fn
+process_incoming_migration_co(void *opaque)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     PostcopyState ps;
-- 
2.35.1



