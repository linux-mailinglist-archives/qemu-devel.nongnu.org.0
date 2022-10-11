Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958615FBDA3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:07:48 +0200 (CEST)
Received: from localhost ([::1]:58484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNPf-0004bW-NC
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNER-0001aA-Jq
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEK-0003UL-S6
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665525363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=R4UrIbXSg1r3x8wO6+5lUmJEbkUz5P74XSUSIdHf8qk=;
 b=FRjrbS0JNOsxQzvOY6XFS61ziVQwU98iVit4E37a0MezcxTS09mhckLEm/32W4Bju+/Ky0
 qPp7COfbuSWeo3K4bXHt7jYxelfzj6w+8/NduqAaTG1gErIh+TauKhTuiE6qotUhnL/UXZ
 9LdmLyD+KMsvs0cqwptmFIgSoI8HJGI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-8DtSFwdVOuus_ANinJBZYQ-1; Tue, 11 Oct 2022 17:56:02 -0400
X-MC-Unique: 8DtSFwdVOuus_ANinJBZYQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 n11-20020ac8674b000000b0039c9e248175so1704840qtp.14
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 14:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R4UrIbXSg1r3x8wO6+5lUmJEbkUz5P74XSUSIdHf8qk=;
 b=oGAYiLpibohqPp9hIXWE1GbTedAXRlJn/f0s20ZDcm+spRws2R76UCUzZjuyPf4IcB
 8xcvnHr3aioEw1uT2+l+wrPRTcJ9OXT2EBaWc4fAij/nYVT/Uf9NAM5+XCfoh5jLzcoI
 5x4VbzOg9CCRkwnCAyRUw/DdsCZtFoS7UfzdGOch9yEeUy7yZRXeVMK5+Gb2LGxbjXUH
 ZpTz/IecmMTR7Ox5TWF0x3hRKYh92iTMixoVELlj8kU1dxaVwkcwuigKVgbhD0dSRolw
 zO4qo3T5vFfFJqzGyV3uaXGsz0aV2tg9QOCW9+RJKZEipElTykeG0piKGjbRt6l35k1f
 U0nA==
X-Gm-Message-State: ACrzQf2C4w3AzdpVxvlu4A0UtkTvRltskEizooci8bwkCw6Sb3kJoJa/
 fvdVKZwpRC9o/5VH6WL6eTAQihq7zc/YjKPYVaK0jA50rmncmaN40RGNXuIqCtCpJ3kSfCkV5E2
 quqsdxmKHLYeWeyETxGjq3qfBHYK7gaIqN3foKFrv4Mbu4xPoSJrzPNkfCuyb5p1n
X-Received: by 2002:ad4:5ca2:0:b0:4b1:91d7:3d35 with SMTP id
 q2-20020ad45ca2000000b004b191d73d35mr20820642qvh.34.1665525361837; 
 Tue, 11 Oct 2022 14:56:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7iOGE7sovRMys+4HeHVmmbjG7UkbQMyx93sFy7xq0JGK+7otzTUoy8J8kwUXhEm0wNUNwblA==
X-Received: by 2002:ad4:5ca2:0:b0:4b1:91d7:3d35 with SMTP id
 q2-20020ad45ca2000000b004b191d73d35mr20820620qvh.34.1665525361559; 
 Tue, 11 Oct 2022 14:56:01 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a430a00b006ce7cd81359sm13863230qko.110.2022.10.11.14.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:56:01 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 00/15] migration: Postcopy Preempt-Full
Date: Tue, 11 Oct 2022 17:55:44 -0400
Message-Id: <20221011215559.602584-1-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20221004182430.97638-1-peterx@redhat.com>
  [PATCH v2 0/5] migration: Bug fixes (prepare for preempt-full)

Tree is here:
  https://github.com/xzpeter/qemu/tree/preempt-full

RFC: https://lore.kernel.org/r/20220829165659.96046-1-peterx@redhat.com
v1:  https://lore.kernel.org/r/20220920225106.48451-1-peterx@redhat.com

This patchset is v2 version of preempt-full series.

v2 changelog:
- Add r-bs
- Rename release_lock to preempt_active [Dave]
- Create MigrationAtomicStats structure, maintaining the 4 stats fields
  that may need atomic access since they'll be accessed by multiple
  threads. define them with Stat64.  Add rich comment. [Dave]
- One more patch added (patch 1) to fix another deadlock; not easy to
  reproduce but actually quite obvious..

The existing preempt code has reduced ramdom page req latency over 10Gbps
network from ~12ms to ~500us which has already landed.

This preempt-full series can further reduces that ~500us to ~230us per my
initial test.

Note that no new capability is needed, IOW it's fully compatible with the
existing preempt mode.  So the naming is actually not important but just to
identify the difference on the binaries.

The logic of the series is simple: send urgent pages in rp-return thread
rather than migration thread.  It also means rp-thread will take over the
ownership of the newly created preempt channel.  It can slow down rp-return
thread on receiving page requests, but I don't really see a major issue
with it so far but only benefits.

For detailed performance numbers, please refer to the rfc cover letter.

Please have a look, thanks.

Peter Xu (15):
  migration: Take bitmap mutex when completing ram migration
  migration: Add postcopy_preempt_active()
  migration: Cleanup xbzrle zero page cache update logic
  migration: Trivial cleanup save_page_header() on same block check
  migration: Remove RAMState.f references in compression code
  migration: Yield bitmap_mutex properly when sending/sleeping
  migration: Use atomic ops properly for page accountings
  migration: Teach PSS about host page
  migration: Introduce pss_channel
  migration: Add pss_init()
  migration: Make PageSearchStatus part of RAMState
  migration: Move last_sent_block into PageSearchStatus
  migration: Send requested page directly in rp-return thread
  migration: Remove old preempt code around state maintainance
  migration: Drop rs->f

 migration/migration.c |  47 +--
 migration/migration.h |   7 -
 migration/multifd.c   |   4 +-
 migration/ram.c       | 720 +++++++++++++++++++-----------------------
 migration/ram.h       |  20 ++
 5 files changed, 379 insertions(+), 419 deletions(-)

-- 
2.37.3


