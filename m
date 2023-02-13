Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E74693CAE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:57:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRP1n-0007Yx-ET; Sun, 12 Feb 2023 21:57:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRP1m-0007Yh-6U
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:57:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRP1k-0007eG-IF
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676257031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nWhoZvQXwpek6MRzDbzXaJKp87waVT0jUTHO9m0cu6A=;
 b=iPEka2jkJ1oVqQVTTo3CzoLaOnwcZxDhKHWo4IYs5LyjuB+mH25aSFK2orBBlS+//hz0Wc
 hDxQGjEyXyp7I5Kv3xLSZb3p4kdV2KHwGcPbudrgYe33hl5CdRNtFKevdoZyj7I+//a5qf
 38QY+75UToPZPfq1ZNYH9/h7AnfTAnQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-231-IlmXlot0MPuiNhXoUfbJpA-1; Sun, 12 Feb 2023 21:57:10 -0500
X-MC-Unique: IlmXlot0MPuiNhXoUfbJpA-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay19-20020a05600c1e1300b003dc54daba42so5440107wmb.7
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:57:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nWhoZvQXwpek6MRzDbzXaJKp87waVT0jUTHO9m0cu6A=;
 b=bXhvSsOEyR71UAeEBawNmphOWRbKd6zHoGu73Z5ZEI9cFN4VLxg8X9EQtqmy5reiXv
 IHM9mpiZl11fXQIzQJoyD39I7NinZh9hzvmfitYQS+XkZvOQXy3EQTpDnEvEreXZSR+o
 WSw8Pz9+3SH+u/b4QG67Q8pGFmx7aY5lAuLwj2D6xj61Nmkyjwm1b/G+7Qnux020xGP8
 Jsh5IiV/boUiqU4+T0Z+sxtQx6Ky9roSvRJAXdGa1YouDZQTQwqh7M8vLKpy/bEL5C7V
 bhoM/2TrFHu3u9+i1elx2bFR2GMeHqPA1XfaW/TdVYCbsaBC/qvw/HPkswjmYw0YwCNS
 2oSQ==
X-Gm-Message-State: AO0yUKVfc6yOtXs8e4xGKM7UU821n0ZXwwcmnOcvJoaCT0e0ZXhwLGZc
 Th/27Q2wSO09SD9p6cOCuAuMz+L8WJnAL+knyiWQpd239xKUfKbRhJRKEIm70eZ22JHkzhJcuI/
 LdXXn9Vok/KwCz/IJgPXMOwwI1TpwuPC3v/7U5C5ypjeH8qUlT/nNQdEBRzSZdlVnHt9TDAf2
X-Received: by 2002:a05:600c:4d90:b0:3de:1d31:1042 with SMTP id
 v16-20020a05600c4d9000b003de1d311042mr22198974wmp.23.1676257029151; 
 Sun, 12 Feb 2023 18:57:09 -0800 (PST)
X-Google-Smtp-Source: AK7set8AobCcIBWolTaervOiO4Y+BjG8F0oxvaq2PxCW5ODPP4qb5AAJ5ijFhWmRZx8Un1hLumO6ww==
X-Received: by 2002:a05:600c:4d90:b0:3de:1d31:1042 with SMTP id
 v16-20020a05600c4d9000b003de1d311042mr22198961wmp.23.1676257028839; 
 Sun, 12 Feb 2023 18:57:08 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 n6-20020a7bcbc6000000b003dfe57f6f61sm11780243wmi.33.2023.02.12.18.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:57:08 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v5 0/3] Eliminate multifd flush
Date: Mon, 13 Feb 2023 03:57:04 +0100
Message-Id: <20230213025707.72229-1-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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


