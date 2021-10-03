Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C16420095
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:56:28 +0200 (CEST)
Received: from localhost ([::1]:51862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwMF-0006Vh-NE
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9K-0003bg-Ut
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:06 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:37824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9I-0000t4-Vb
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:06 -0400
Received: by mail-ed1-x52a.google.com with SMTP id ba1so51823516edb.4
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kxJKQjT+RSitACC85MwIyDhGgyneKK19VDnydBrIezo=;
 b=fiMnr6QD+n0arIU5h7hGN0n+veU92PSeji6sLmPv6nSIPcPE1E8ywBz3BG7H5NwRQV
 zwya2E/lKLsw628WhId2KUNnd0HIw8OHNJEVoyf2t4+qcjtqNPuDJWXsxZfCwdWQbt/v
 2CSwWOji065GyjpOc9UBk6gjgfY2XimL7DVTM7iwX6P7phMX+n58zYq1e3qiiOxzqjgJ
 ecrIZloMqE4SB2hwXVOBlpukguAmXqNu0+3ynZoKG9jHYgpxXaZMunJDl5QLgaJycWPN
 H4YM9cnB6NaZw7sOr+N1PKHqmFnvPZlvM5Ps+uW+u5v7aOznslEtQBByglD03VypHuaJ
 2y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kxJKQjT+RSitACC85MwIyDhGgyneKK19VDnydBrIezo=;
 b=aX/4B3gxEznlqHMjspc7syGpNFiQzQUJI57NQnre4ZxDQYPYXtz2tkzMHqM7IzDW6A
 qnRcVxxQjS+Bp9irWkdjEveIke9ANgQO6FWZrzG1wMur/cg+VIprWYdzCXt9JkLjblrC
 QklG4fklBuP//+8AfxcfEolqyqQdQ3TK+CchbDolArRYelYZZJTRn2hm+jjY7YLidorL
 8oAS7ZExWQ9xkvZL+AJX7C0RapPfbilWBoVK71H6wOgY1TRMdjqcqxjh5MOrzTJX9yXB
 Y+cCzQUvPV9i2MRTXdbm3GTckOf1yMdKDJkOlti4ZtKpUUwNVnBrlbmoeveercxzIBg6
 X5uA==
X-Gm-Message-State: AOAM533whVEPi8YB6vlMkvqI0aRhVYTdiK6XijZFenefJnz9l8fOdrh7
 Fc9KF/dFDPg9/G7ho5wg5mUiniTnhCk=
X-Google-Smtp-Source: ABdhPJzOX5tq2IA7bm3E5uUagujT9MVN0/e6QKuSv6sNGggjUlZTWfNncDvLLPeJ1hJ8bUiz6zjINA==
X-Received: by 2002:a05:6402:3088:: with SMTP id
 de8mr9561706edb.76.1633246983774; 
 Sun, 03 Oct 2021 00:43:03 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/30] machine: Use g_autoptr in machine_set_smp
Date: Sun,  3 Oct 2021 09:42:35 +0200
Message-Id: <20211003074250.60869-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 54f04a5ac6..d49ebc24e2 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -897,7 +897,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
 {
     MachineClass *mc = MACHINE_GET_CLASS(obj);
     MachineState *ms = MACHINE(obj);
-    SMPConfiguration *config;
+    g_autoptr(SMPConfiguration) config = NULL;
     ERRP_GUARD();
 
     if (!visit_type_SMPConfiguration(v, name, &config, errp)) {
@@ -920,7 +920,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
 
     smp_parse(ms, config, errp);
     if (*errp) {
-        goto out_free;
+        return;
     }
 
     /* sanity-check smp_cpus and max_cpus against mc */
@@ -935,9 +935,6 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
                    ms->smp.max_cpus,
                    mc->name, mc->max_cpus);
     }
-
-out_free:
-    qapi_free_SMPConfiguration(config);
 }
 
 static void machine_class_init(ObjectClass *oc, void *data)
-- 
2.31.1



