Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0456587F8B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 17:57:41 +0200 (CEST)
Received: from localhost ([::1]:39860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIuH6-0008Bh-74
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 11:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIuEV-00046c-RT
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:54:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIuES-00023p-9G
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:54:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659455695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+X5HMmbtvaT9N95oKORPbYSK2p4NMROAGBGUuax4X58=;
 b=KWmZlSX+OLewhgRzgvPwtEWD/HXYiHLsIcdjzoft7F4fb8ahO0cHt2Q1BXZ2oaJ6diYvzn
 Z3LPmaBzRFXc2jnGqu/VIf2IEnB2EoHYAg7SwvU8Iqeyufdn5Z5XbIdV9NRVaIzSxoQXy6
 th5eYJ9IS6SnCogejPvBbTh56KTCgEU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-8b4809mDNXuSkKOn2QiXWw-1; Tue, 02 Aug 2022 11:54:54 -0400
X-MC-Unique: 8b4809mDNXuSkKOn2QiXWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDDEF2800480;
 Tue,  2 Aug 2022 15:54:53 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4A8814152E1;
 Tue,  2 Aug 2022 15:54:52 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, leobras@redhat.com, thuth@redhat.com,
 peter.maydell@linaro.org, vgoyal@redhat.com
Cc: peterx@redhat.com,
	quintela@redhat.com
Subject: [PULL 0/5] migration queue
Date: Tue,  2 Aug 2022 16:54:42 +0100
Message-Id: <20220802155447.216018-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 0399521e53336bd2cdc15482bca0ffd3493fdff6:

  Merge tag 'for-upstream' of git://repo.or.cz/qemu/kevin into staging (2022-08-02 06:52:05 -0700)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220802c

for you to fetch changes up to a21ba54dd5ca38cd05da9035fc65374d7af54f13:

  virtiofsd: Disable killpriv_v2 by default (2022-08-02 16:46:52 +0100)

----------------------------------------------------------------
Migration fixes pull 2022-08-02

Small migration (and virtiofsd) fixes.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Leonardo Bras (1):
      migration: add remaining params->has_* = true in migration_instance_init()

Peter Maydell (2):
      migration: Assert that migrate_multifd_compression() returns an in-range value
      migration: Define BLK_MIG_BLOCK_SIZE as unsigned long long

Thomas Huth (1):
      Revert "migration: Simplify unqueue_page()"

Vivek Goyal (1):
      virtiofsd: Disable killpriv_v2 by default

 migration/block.c                |  2 +-
 migration/migration.c            |  5 +++++
 migration/ram.c                  | 37 ++++++++++++++++++++++++++-----------
 migration/trace-events           |  3 ++-
 tools/virtiofsd/passthrough_ll.c | 13 ++-----------
 5 files changed, 36 insertions(+), 24 deletions(-)


