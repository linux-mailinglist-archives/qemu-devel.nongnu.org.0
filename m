Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDCB40488D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:36:54 +0200 (CEST)
Received: from localhost ([::1]:45070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHQL-0007eV-Ej
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOHNX-0002wD-Fj
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:33:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOHNU-0002uI-CX
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:33:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631183635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=loashz0+j0OcIJRCFBlcKJzh8A8l4zO8lqCJ5F9pqk4=;
 b=LWE/HlvRNy5ThTpC2X7g5Y6vWzQbIf0z+zqmfMwjmuH76ZRfxRE31XXBw7/xbujHqbmrhj
 Qz6Jkod2Qv04FNEC+gKE0x8lI1eQsdvBZB0tPC43FX0i93Aptq1HXKzIO4s1KJIj52qCev
 qJ6+9d5mKMXVGppreQjoGgPlISSx+ps=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-zqS2sJayNFiy8xHH1kRg3g-1; Thu, 09 Sep 2021 06:33:51 -0400
X-MC-Unique: zqS2sJayNFiy8xHH1kRg3g-1
Received: by mail-wr1-f70.google.com with SMTP id
 z1-20020adfec81000000b0015b085dbde3so363875wrn.14
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 03:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=loashz0+j0OcIJRCFBlcKJzh8A8l4zO8lqCJ5F9pqk4=;
 b=6abU3KizNPXoMKgMgShxDC3GnPuTeWzUlAnbSSf5olc4jKD35zSqWDKJanXFkU/brx
 dY/kmwWPxHkmJE7xUpytELtnnuim9HnAfOdkpPbIghtFl18AsZQbfGSwb72zhoc8G2O3
 7iY/4lPSEbn+T2iz5v9+P3jZL0qPpfvPZSAUrGyigkQPTw/NQbzQXt9ZbeRQxaRGirxL
 7UCYH9uesPtD5YksyvGQX2wGdqOvSxocC+EmtoV2St1OLoFhqMI11r4b5FfrIhRE6abR
 VKqkdVdZpUO+K81AThOV2xzyRw/Yel7L4Omzs/A8LtAJcuzYY3EG4BP+Djrb4bGx42z7
 PAhg==
X-Gm-Message-State: AOAM531S1VGcOlHdDp6BP+dPhcCmSTOeMWNtulcHyVG4swyysbywsL3Q
 BVSsZ/1N0t5uWQShRQMe/kRmvZJKBnz2t4L50AwxNmZfrZ+3Z1ooH4tGWGRB6fL3Rk880QDyJcu
 r0iSFV3fQNFGN10j40GYW2/xKVqB0UyJyDv2mrffNMyMLPulxxJHtsEP31Ut2L6hbUCI=
X-Received: by 2002:a05:600c:230c:: with SMTP id
 12mr2193101wmo.41.1631183630499; 
 Thu, 09 Sep 2021 03:33:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGU/FPnT7YcwRvgkNRSAdcMugDOdUDjTf1WOdZt80KSEd45e/t4A75l0dplI4Ok2RlIWls+A==
X-Received: by 2002:a05:600c:230c:: with SMTP id
 12mr2193077wmo.41.1631183630265; 
 Thu, 09 Sep 2021 03:33:50 -0700 (PDT)
Received: from localhost (static-201-64-63-95.ipcom.comunitel.net.
 [95.63.64.201])
 by smtp.gmail.com with ESMTPSA id k17sm1176071wmj.0.2021.09.09.03.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 03:33:49 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] multifd: Unconditionally unregister yank function
Date: Thu,  9 Sep 2021 12:33:41 +0200
Message-Id: <20210909103346.1990-3-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909103346.1990-1-quintela@redhat.com>
References: <20210909103346.1990-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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


