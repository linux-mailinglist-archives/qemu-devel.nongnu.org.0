Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BDF698198
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:06:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLDg-0002Yl-3Q; Wed, 15 Feb 2023 12:05:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSLDd-0002WJ-28
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:05:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSLDb-0003o2-HV
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:05:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676480718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ychLMU211gT4xaEKekwRfe2wButouuYEnH0vmfcadpw=;
 b=bHI4OmqR39FPlFVNDcPkVYvGuEwFptGPxaOQbwsi1yv56jyjpmKBgGkUsVWsAkdumn7ZOm
 ZuSnJAaGiRmsBFUq+mqYFPXR/o9l+G11rBVLY/zEU6znBEvRu1VMoTCwpm5hF+ms+nm0wv
 3M04S3BAgxf25Rak2UWKpTSkCL3TBxw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-eEP4s6PsOyaKcftScqQpCQ-1; Wed, 15 Feb 2023 12:05:04 -0500
X-MC-Unique: eEP4s6PsOyaKcftScqQpCQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B957D803DC4;
 Wed, 15 Feb 2023 17:03:49 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 768F4140EBF4;
 Wed, 15 Feb 2023 17:03:46 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Juan Quintela <quintela@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 0/3] Remove res_compatible parameter
Date: Wed, 15 Feb 2023 18:03:42 +0100
Message-Id: <20230215170345.6220-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In this v2:
- rename res_postocopy_only ->can_postcopy
- rename res_precopy_only -> must_precopy
- Rewrite comments after discussions with Vladimir.
- 2nd patch is reviewd-by Vladimir.

Please, review.

[v1]
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
  migration: Rename res_{postcopy,precopy}_only

 include/migration/register.h   | 30 +++++++++++++++---------------
 migration/savevm.h             | 10 ++++------
 hw/s390x/s390-stattrib.c       |  8 +++-----
 hw/vfio/migration.c            | 11 ++++-------
 migration/block-dirty-bitmap.c |  7 +++----
 migration/block.c              |  8 +++-----
 migration/migration.c          | 20 +++++++++-----------
 migration/ram.c                | 20 ++++++++------------
 migration/savevm.c             | 28 ++++++++++------------------
 hw/vfio/trace-events           |  2 +-
 migration/trace-events         |  4 ++--
 11 files changed, 62 insertions(+), 86 deletions(-)

-- 
2.39.1


