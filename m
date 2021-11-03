Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29984444900
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 20:33:40 +0100 (CET)
Received: from localhost ([::1]:34012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miM0w-0002sK-QK
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 15:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miLz4-0001Hx-7t
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 15:31:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miLz0-00082X-2J
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 15:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635967894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qf82Wjugkt9BwFqJvMhUpxa7K1Cg/k7tOUcIiqPkxR0=;
 b=cfQ/QlZu9ShxDwEUx2Tv2IrVoByO8IKXEpG9gyK2Dm0nK6nxAyCHuu51mrMgkyzLUm23OU
 N31XmQX/d8bX/Ai3zvyFyjD83q9feJ4k2Qe3i5KagKAHkr1gzOUTOhRwJH5Z44kQDoNFL0
 dPk+9JdTixYdLDCTlXQ2++zQrrhvonw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554--MU-JemRM0GeYPLLxLtIrQ-1; Wed, 03 Nov 2021 15:31:34 -0400
X-MC-Unique: -MU-JemRM0GeYPLLxLtIrQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n189-20020a1c27c6000000b00322f2e380f2so3213924wmn.6
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 12:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qf82Wjugkt9BwFqJvMhUpxa7K1Cg/k7tOUcIiqPkxR0=;
 b=Ga+5JCMECT9UD7rgy1Gk3rzB2e+If0UhoMkigCKHF0o6zbK//vvdFDmxNO5jLJt7Bx
 d4zJbdjmNM/CGDADAwDGa1/DCTHsx1HTIWKetmKqxu5uYoguoi1hbHAxMXclc9U0UHZ3
 y1LInE127PJ5h4EWCqxF8fkfiKPgIxSF6CTriJwTwmT4BL15ooKdDYyl7AM5kd8VK/K/
 /9I99c9TzSLB5VVObdAHuwTM0HQfWGkDhKR2qyH0gCjESpVJRY/aOoG9YSdRhnWiOiGw
 XY2w5NvwtrPFG4ty8tKMAlbbQawtozbuUuUbBZkcQKUwe3IJYItYdh+HSOq6ofzONuTo
 hHMw==
X-Gm-Message-State: AOAM532VMzuG8yQviGq1AScesm7RwLM67YH6iRtseVdtnJhOjuxDASXP
 NP+vrYSZ5O1B3CyRTfHvkR0QEXOYX/Rz6VhsOLGqL3tMVOkDDKTymHakacgXp8Mbu9OSSiG7P4r
 lyGASAxH8S723eZrh2q/Od7KUs7OcTSwk0HZb24J1ps2/GJUtb8AJUnpHamdQ03WEB9g=
X-Received: by 2002:adf:ba0d:: with SMTP id o13mr58133332wrg.339.1635967892311; 
 Wed, 03 Nov 2021 12:31:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHkbFGZ+brVOb3DaFqOQNuruC27Dm+bzkI0R/tSxnjncsSEoKcpqunnCCmXbIB6i1nHSegKQ==
X-Received: by 2002:adf:ba0d:: with SMTP id o13mr58133289wrg.339.1635967891915; 
 Wed, 03 Nov 2021 12:31:31 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id s13sm6393636wmc.47.2021.11.03.12.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 12:31:30 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] postocpy: Check that postocpy fd's are not NULL
Date: Wed,  3 Nov 2021 20:31:29 +0100
Message-Id: <20211103193129.23930-1-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If postcopy has finished, it frees the array.
But vhost-user unregister it at cleanup time.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/postcopy-ram.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index e721f69d0f..d18b5d05b2 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1457,6 +1457,10 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
     MigrationIncomingState *mis = migration_incoming_get_current();
     GArray *pcrfds = mis->postcopy_remote_fds;
 
+    if (!pcrfds) {
+        /* migration has already finished and freed the array */
+        return;
+    }
     for (i = 0; i < pcrfds->len; i++) {
         struct PostCopyFD *cur = &g_array_index(pcrfds, struct PostCopyFD, i);
         if (cur->fd == pcfd->fd) {
-- 
2.33.1


