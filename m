Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1349433251
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:35:07 +0200 (CEST)
Received: from localhost ([::1]:47852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mclWU-0003Lg-Np
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mclQt-0003fx-La
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mclQr-0005cq-2W
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634635755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=loashz0+j0OcIJRCFBlcKJzh8A8l4zO8lqCJ5F9pqk4=;
 b=gYYQQgyQIoYht2j9YBnKBshzAE6V5AmA/4D8ylO/dyKwuCpAKfQIpQwUAuxzU6Eail6BD0
 AYLk/BoQm/WqC1P/FeuD9FgZDHVWOXpGbColIyoHvvSYIXA9Bj3qJI9uKUITyKL3MHTCFp
 6NOW7ciJVUpYTgvHl1tNZisuhqp7bq8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-oMp63k84Mf27oS4WNamWOw-1; Tue, 19 Oct 2021 05:29:14 -0400
X-MC-Unique: oMp63k84Mf27oS4WNamWOw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n9-20020a1c7209000000b0030da7d466b8so912376wmc.5
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 02:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=loashz0+j0OcIJRCFBlcKJzh8A8l4zO8lqCJ5F9pqk4=;
 b=vc8nloWYN+DpRDMog+DqB+GqP6YfYoIDHAVk4MQDLl7/a5HbyjAmW/1/8DaFvNpigW
 JAw9sN9pr3aQhSQ3zgLXhRMvH2Ils+mtIBLiHLHOpf09KQt8ao/57j8ht19bSx7tBCRF
 62IMC1tXt/DSxlZuSFjnfyl5cqB1gkAufaT7c90btLfoXDvD8VYUhOgwpODtYvArI3i4
 7N6uUCwDHY0wh8AuzEOnjw4DWl67AHIFuTenF9IXIMiEB9OP2w6dn6zk+F/87klcQwqv
 E691yClUM3BuFtwt3RigrIP1VP0NDkie7YG2UAVN3wrcSLUWiYoQZvUDKamd/9j+SsAE
 2jOg==
X-Gm-Message-State: AOAM532XWDKScz6FNzTl2AfuMSpiU8FZkcx4//KuLVkVKT281uoHAJYe
 Yx2cBSDn0pn5oCO4zyaiv2uE4fO/s21sx8iW3ACXLhV76/wQpfk44WubHebq8lzDMKljQ8qzRIA
 ML7Wx+iLbLPopdbTw48UF7EvASaCKg5vvhxrbI+/yZqNFUbLRPPfh5y/vu2FZBFug8d8=
X-Received: by 2002:adf:d1c9:: with SMTP id b9mr43372917wrd.426.1634635752864; 
 Tue, 19 Oct 2021 02:29:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaIQbT8pVgzX7S3gPoba7EXVmfLRi/jYrziEaoQg1DUbL6+eWZxFMnXXzX3zrb7i3NkBGJ4Q==
X-Received: by 2002:adf:d1c9:: with SMTP id b9mr43372895wrd.426.1634635752690; 
 Tue, 19 Oct 2021 02:29:12 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id s186sm2145799wme.14.2021.10.19.02.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:29:12 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] multifd: Unconditionally unregister yank function
Date: Tue, 19 Oct 2021 11:29:02 +0200
Message-Id: <20211019092907.5255-3-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211019092907.5255-1-quintela@redhat.com>
References: <20211019092907.5255-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Leonardo Bras Soares
 Passos <lsoaresp@redhat.com>
Date: Wed, 4 Aug 2021 21:26:32 +0200 (5 weeks, 11 hours, 52 minutes ago)

[[PGP Signed Part:No public key for 35AB0B289C5DB258 created at 2021-08-04T21:26:32+0200 using RSA]]
Unconditionally unregister yank function in multifd_load_cleanup().
If it is not unregistered here, it will leak and cause a crash
in yank_unregister_instance(). Now if the ioc is still in use
afterwards, it will only lead to qemu not being able to recover
from a hang related to that ioc.

After checking the code, i am pretty sure that ref is always 1
when arriving here. So all this currently does is remove the
unneeded check.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 5a4f158f3c..efd424bc97 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -991,10 +991,7 @@ int multifd_load_cleanup(Error **errp)
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
-        if (OBJECT(p->c)->ref == 1) {
-            migration_ioc_unregister_yank(p->c);
-        }
-
+        migration_ioc_unregister_yank(p->c);
         object_unref(OBJECT(p->c));
         p->c = NULL;
         qemu_mutex_destroy(&p->mutex);
-- 
2.31.1


