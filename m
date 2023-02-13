Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C2E694032
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 09:59:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRUeq-0000Nz-QI; Mon, 13 Feb 2023 03:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRUen-0000NO-UK
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:57:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRUem-0002qq-D9
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676278671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8w57NLthSn6XL5zpbmtebVP8T+oYfkm90MeU7l5vgGA=;
 b=B2YcOCeGd2uf7Bk2ASOnmKqWQIPiKiI1Sp0Ih/5AQEzlidl9UFvyIYt/K4giEfCZlUzZeu
 wEh6Uh+ZqJlKv5vYgYtnqmOpmCucjDQmqBIWO5ZHJ5GDCC46ngcNlfOu7Ng1llUL+qRlKA
 a47JtkZdFi142mOLCabFF6/0SjprSZo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-nWzBS4F6MNWmK1OTYmADvw-1; Mon, 13 Feb 2023 03:57:50 -0500
X-MC-Unique: nWzBS4F6MNWmK1OTYmADvw-1
Received: by mail-wm1-f72.google.com with SMTP id
 d14-20020a05600c34ce00b003dd07ce79c8so6487842wmq.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 00:57:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8w57NLthSn6XL5zpbmtebVP8T+oYfkm90MeU7l5vgGA=;
 b=PZ965mDtZ984goXMmgriacrLPkjClQQab1tZQ3/atqnqOFp7x8S8R5h8DN3dRIhrue
 HV0KNEIZ5WLfD/tub22jsI0s8KyPZRIqSBN2vnUMknWY6iRc9IQRKRTJPobgwUNV6OL1
 T5Bo4Inp6BBAiC4AQCf2iIFjjYanYRUsR9g3UGjapnWdA1FBo9QGdI+B+2va441MjDi3
 18NKslLRfVlUKocwQXbfx30O1lyolki28U7ANVvDZ5HljLN6X06EeQUNKlp27fWeixnL
 o8cxhsujyLoibSFnniBY9+WKANFZNS0BLl5cbAeCnlxrAWKgiosPeY/CuC4CT19MRAH1
 sFWQ==
X-Gm-Message-State: AO0yUKVr82oJXeE0/j+lP571/hzr8UU6KcNwuZjnmG/MzjINfuBCmlkh
 69+sc5wei26YXm1Ukx7zgPJKwv6Q1NcPFMrVr/V5gC10JZjkDZk06T/56pPfzTd6HAwd177fA7C
 LKpqG3yNqhc5vDZUBbazdl2uBqoMlSNgzuIzN+oZJ0C5RpD8s+FZl/8/AI9kGBM+pJH2ZavZGa1
 Q=
X-Received: by 2002:a5d:50cf:0:b0:2c3:eccf:a65d with SMTP id
 f15-20020a5d50cf000000b002c3eccfa65dmr19606440wrt.8.1676278668304; 
 Mon, 13 Feb 2023 00:57:48 -0800 (PST)
X-Google-Smtp-Source: AK7set9KZ3xKPFkVNQ9dvUK9JADQdV2IMZQ7VyWG01XHYku2hoavA7DI/M/UK5uToAX0Y9mtoWNd5Q==
X-Received: by 2002:a5d:50cf:0:b0:2c3:eccf:a65d with SMTP id
 f15-20020a5d50cf000000b002c3eccfa65dmr19606422wrt.8.1676278667977; 
 Mon, 13 Feb 2023 00:57:47 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 o41-20020a05600c512900b003dc4aae4739sm18328794wms.27.2023.02.13.00.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 00:57:47 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v5 0/8] Eliminate multifd flush
Date: Mon, 13 Feb 2023 09:57:38 +0100
Message-Id: <20230213085746.75586-1-quintela@redhat.com>
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

Juan Quintela (4):
  ram: Document migration ram flags
  multifd: Create property multifd-sync-after-each-section
  multifd: Protect multifd_send_sync_main() calls
  multifd: Only sync once each full round of memory

Leonardo Bras (4):
  migration/multifd: Change multifd_load_cleanup() signature and usage
  migration/multifd: Remove unnecessary assignment on
    multifd_load_cleanup()
  migration/multifd: Join all multifd threads in order to avoid leaks
  migration/multifd: Move load_cleanup inside incoming_state_destroy

 qapi/migration.json   | 10 +++++++-
 migration/migration.h |  1 +
 migration/multifd.h   |  3 ++-
 hw/core/machine.c     |  1 +
 migration/migration.c | 29 ++++++++++++---------
 migration/multifd.c   | 17 +++++++-----
 migration/ram.c       | 60 ++++++++++++++++++++++++++++++++++---------
 7 files changed, 89 insertions(+), 32 deletions(-)

-- 
2.39.1


