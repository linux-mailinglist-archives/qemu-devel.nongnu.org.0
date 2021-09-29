Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C65141CA14
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 18:27:41 +0200 (CEST)
Received: from localhost ([::1]:37122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVcQm-0002Oc-GR
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 12:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVcOA-000823-Kl
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 12:24:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVcO5-0007uc-BJ
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 12:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632932690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PvidmhyegTZ6TOHIrij7jQy8l4ctD80uNlNwySvqx7c=;
 b=L2BA4xhiM1vfrRjS0WrsJKL3mRa90BzFbB/3XQcYyiB+skWEnIDVejEY7qYxCMGwIl+GlG
 +Q8WkGRCpRurzaGEyNNzKSL5Bz/3APG1Igj0a6GEVlUzUjnjSvJjsD3A3hRivFOTtKCkRA
 NiAgT7h7Z4Ukr6QEQ098jxr3N85WHIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-nx8nlIGSP1OXggrcfcM-Xw-1; Wed, 29 Sep 2021 12:24:49 -0400
X-MC-Unique: nx8nlIGSP1OXggrcfcM-Xw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4961C10168C4
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 16:24:48 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 355B119C59;
 Wed, 29 Sep 2021 16:24:46 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] monitor: Rate-limit MEMORY_DEVICE_SIZE_CHANGE qapi
 events per device
Date: Wed, 29 Sep 2021 18:24:42 +0200
Message-Id: <20210929162445.64060-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some fixes for virtio-mem-pci, to properly handle MEMORY_DEVICE_SIZE_CHANGE
events, especially not dropping events of some devices when rate-limiting.

v2 -> v3:
- Split up into two patches
- "const char * qom_path" -> "char *qom_path"
- Fix existing memory leak and avoid a new memory leak when creating the
  event

v1 -> v2:
- Add the qom-path and use that identifier to rate-limit per device
- Rephrase subject/description

Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>

David Hildenbrand (3):
  virtio-mem-pci: Fix memory leak when creating
    MEMORY_DEVICE_SIZE_CHANGE event
  qapi: Include qom-path in MEMORY_DEVICE_SIZE_CHANGE qapi events
  monitor: Rate-limit MEMORY_DEVICE_SIZE_CHANGE qapi events per device

 hw/virtio/virtio-mem-pci.c | 10 ++++------
 monitor/monitor.c          |  9 +++++++++
 qapi/machine.json          |  5 ++++-
 3 files changed, 17 insertions(+), 7 deletions(-)

-- 
2.31.1


