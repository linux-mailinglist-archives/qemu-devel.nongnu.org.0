Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B97568F03B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 14:59:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPkx5-0003g3-LP; Wed, 08 Feb 2023 08:57:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPkx2-0003fT-Ok
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:57:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPkx0-0003ML-RD
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675864650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JjCu2xpwT18X5/UIfNy3jIVh39AugW8dW9CWrAdCgV8=;
 b=IR5Z8hH4S11tQylO8q6S6vW4QXtMgpbFEzqyy5czg4eKsLD0bjrGCntNIIJGRokZ7xYKBf
 dNB00tCZm55N7tb6fvM1yRNz7hkzs14Yu6TDMBTwfXFJa0rYe4m5XGJudO+T0emkkGEkHo
 gViuhJHP2IwIY2XUpJR8EAbqvhywH5E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-nmv-1qfmO3GNwlfZb_Szwg-1; Wed, 08 Feb 2023 08:57:26 -0500
X-MC-Unique: nmv-1qfmO3GNwlfZb_Szwg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EC1A833941;
 Wed,  8 Feb 2023 13:57:24 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC58E1121314;
 Wed,  8 Feb 2023 13:57:20 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-block@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 0/3] Remove res_compatible parameter
Date: Wed,  8 Feb 2023 14:57:16 +0100
Message-Id: <20230208135719.17864-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

This series are the redo of the series from vfio.  Vladimir
Sementsov-Ogievskiy <vsementsov@yandex-team.ru> asked that I split the
change in ram.c (only place that set res_compatible), and the rest of
the patches.
So I ended:
- change ram.c to put the memory in res_postcopy
- remove res_compatible
- rename res_postcopy/precopy_only to not have the _only suffix.

Please review.

Juan Quintela (3):
  migration: In case of postcopy, the memory ends in res_postcopy_only
  migration: Remove unused res_compatible
  migration: Remove _only suffix for res_postcopy/precopy

 include/migration/register.h   | 21 ++++++++-------------
 migration/savevm.h             | 10 ++++------
 hw/s390x/s390-stattrib.c       |  8 +++-----
 hw/vfio/migration.c            | 11 ++++-------
 migration/block-dirty-bitmap.c |  7 +++----
 migration/block.c              |  8 +++-----
 migration/migration.c          | 18 ++++++++----------
 migration/ram.c                | 20 ++++++++------------
 migration/savevm.c             | 28 ++++++++++------------------
 hw/vfio/trace-events           |  2 +-
 migration/trace-events         |  4 ++--
 11 files changed, 54 insertions(+), 83 deletions(-)

-- 
2.39.1


