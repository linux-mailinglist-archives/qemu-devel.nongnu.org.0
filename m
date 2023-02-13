Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC94A693CB3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:58:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRP2c-0000us-Cy; Sun, 12 Feb 2023 21:58:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRP2b-0000uV-2p
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:58:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRP2Z-0007ha-DS
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:58:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676257082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nWhoZvQXwpek6MRzDbzXaJKp87waVT0jUTHO9m0cu6A=;
 b=aSh+XZOv+O7FQVlWSTlJfxx1Eg424lrIePezjMutF+0LHIKWyQ4wtAVg0draApGXTeu8mY
 Egs9dyhG8OfAeWpbhTp900iHrnVe/dNUsfHutqGS18CDCiXUlcecAEQ0fZsJMi8793EQqR
 1DXcZtkBNyzdaPOL+MwRlxc+jvoBOi4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-496-Y2kDmgN1NHKHjqVAkntmgQ-1; Sun, 12 Feb 2023 21:58:01 -0500
X-MC-Unique: Y2kDmgN1NHKHjqVAkntmgQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r14-20020a05600c35ce00b003e10bfcd160so6062090wmq.6
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nWhoZvQXwpek6MRzDbzXaJKp87waVT0jUTHO9m0cu6A=;
 b=uek+us7qEjxqPQ9IHbP+4yTaXjSACCGozQ5x4icBgrFgEieqU8TTGuodIU9TlYPJd6
 S/m34QIlVkQGUyqSkDjaAjdDBL0sRPTtJrbTb5u+1w4GVqqcmJMMF3qmUyHERUa9n5vA
 7AzgB99+DroT4PncQTNXLH1F1wKOltHdwRb8/iZOULlJ1PELT9+t7Y1Q/c6lYvuQdyFm
 /IhcldltlI//geNxrYwTN4xRDse0HQLEeP5++ovVwAihduQ1nGzt+1KWV1CQ6Rg10CPT
 xPr42fmj1hh5pSv0EJJiwpu2/pXyenU9ySczIQMJA/JGRKVLloQ6hqTdI5wwBMt5dEe1
 1Ytw==
X-Gm-Message-State: AO0yUKWHroi9KaVzj9+RzbUkV2h04rhx7NiY1V7u7X7r3+WarVq9seRo
 eLGtbOtMotmNBbaEDZnvtxtzaCwaF59kwgVDNd43vAWIqTKpV4GN4wWZhvUi/qh1VQuA+g7GWbL
 OStD+b8Cx4pInAtv/RRVXEnar1cMF5EQg+BxrtjBT4gNnPz47nZlkOUxXVST9Jqsp2emQTewK
X-Received: by 2002:a5d:4912:0:b0:2c5:4ea0:6121 with SMTP id
 x18-20020a5d4912000000b002c54ea06121mr4633040wrq.26.1676257079876; 
 Sun, 12 Feb 2023 18:57:59 -0800 (PST)
X-Google-Smtp-Source: AK7set8V9lXPXWUWTPLXZgJCaB3kyk7BSQOnb/7TyAb8s7rNPxsACfk0rxUtzMgrZdpopwJFRd8vXA==
X-Received: by 2002:a5d:4912:0:b0:2c5:4ea0:6121 with SMTP id
 x18-20020a5d4912000000b002c54ea06121mr4633027wrq.26.1676257079612; 
 Sun, 12 Feb 2023 18:57:59 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 a9-20020a056000100900b002c5598c14acsm827983wrx.6.2023.02.12.18.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:57:59 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v5 0/3] Eliminate multifd flush
Date: Mon, 13 Feb 2023 03:57:55 +0100
Message-Id: <20230213025758.72353-1-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

In this v5:
- Remove RAM Flags documentation (already on PULL request)
- rebase on top of PULL request.

Please review.

Based-on: <20230213025150.71537-1-quintela@redhat.com>
          Migration 20230213 patches

In this v4:
- Rebased on top of migration-20230209 PULL request
- Integrate two patches in that pull request
- Rebase
- Address Eric reviews.

Please review.

In this v3:
- update to latest upstream.
- fix checkpatch errors.

Please, review.

In this v2:
- update to latest upstream
- change 0, 1, 2 values to defines
- Add documentation for SAVE_VM_FLAGS
- Add missing qemu_fflush(), it made random hangs for migration test
  (only for tls, no clue why).

Please, review.

[v1]
Upstream multifd code synchronize all threads after each RAM section.  This is suboptimal.
Change it to only flush after we go trough all ram.

Preserve all semantics for old machine types.

Juan Quintela (3):
  multifd: Create property multifd-sync-after-each-section
  multifd: Protect multifd_send_sync_main() calls
  multifd: Only sync once each full round of memory

 qapi/migration.json   | 10 +++++++++-
 migration/migration.h |  1 +
 hw/core/machine.c     |  1 +
 migration/migration.c | 13 +++++++++++--
 migration/ram.c       | 44 +++++++++++++++++++++++++++++++++++++------
 5 files changed, 60 insertions(+), 9 deletions(-)

-- 
2.39.1


