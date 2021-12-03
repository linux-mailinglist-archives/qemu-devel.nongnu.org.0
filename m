Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D78468040
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:21:02 +0100 (CET)
Received: from localhost ([::1]:55786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtHrR-0006By-Do
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:21:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHmW-0007EK-KG
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHmT-0002zw-0x
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H/swSY4aIRFkW/igmZfIQDRtVC1IDKdCkhFXOOYZMe8=;
 b=LCgaIcTfs3Yj21w3EsqWAtIBV5cP+w5N+2tPNjG0UVcfogtKiUzNML0KPb72V0hhVP3YKv
 zCzOdrZzcSv5xQVSmF3QJ8jnw3Ro7Af7psqj6XzVu4wfcVQNCKOmIZ8nQHjEe3vGc1LrrK
 0S+0F4fGbqbS6wVFZqNVdSyzDu8LSAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-m1WECe-oNlOg2w4LdB2Y4A-1; Fri, 03 Dec 2021 18:15:49 -0500
X-MC-Unique: m1WECe-oNlOg2w4LdB2Y4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8788285EE62;
 Fri,  3 Dec 2021 23:15:48 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65EE55D9D5;
 Fri,  3 Dec 2021 23:15:40 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/14] qemu patches for NBD_OPT_EXTENDED_HEADERS
Date: Fri,  3 Dec 2021 17:15:25 -0600
Message-Id: <20211203231539.3900865-1-eblake@redhat.com>
In-Reply-To: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: nsoffer@redhat.com, vsementsov@virtuozzo.com, libguestfs@redhat.com,
 qemu-block@nongnu.org, nbd@other.debian.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Available at https://repo.or.cz/qemu/ericb.git/shortlog/refs/tags/exthdr-v1

Patch 14 is optional; I'm including it now because I tested with it,
but I'm also okay with dropping it based on RFC discussion.

Eric Blake (14):
  nbd/server: Minor cleanups
  qemu-io: Utilize 64-bit status during map
  qemu-io: Allow larger write zeroes under no fallback
  nbd/client: Add safety check on chunk payload length
  nbd/server: Prepare for alternate-size headers
  nbd: Prepare for 64-bit requests
  nbd: Add types for extended headers
  nbd/server: Initial support for extended headers
  nbd/server: Support 64-bit block status
  nbd/client: Initial support for extended headers
  nbd/client: Accept 64-bit hole chunks
  nbd/client: Accept 64-bit block status chunks
  nbd/client: Request extended headers during negotiation
  do not apply: nbd/server: Send 64-bit hole chunk

 docs/interop/nbd.txt                          |   1 +
 include/block/nbd.h                           |  94 +++++--
 nbd/nbd-internal.h                            |   8 +-
 block/nbd.c                                   | 102 +++++--
 nbd/client-connection.c                       |   1 +
 nbd/client.c                                  | 150 +++++++---
 nbd/common.c                                  |  10 +-
 nbd/server.c                                  | 262 +++++++++++++-----
 qemu-io-cmds.c                                |  16 +-
 qemu-nbd.c                                    |   2 +
 block/trace-events                            |   1 +
 nbd/trace-events                              |   9 +-
 tests/qemu-iotests/223.out                    |   4 +
 tests/qemu-iotests/233.out                    |   1 +
 tests/qemu-iotests/241                        |   8 +-
 tests/qemu-iotests/307                        |   2 +-
 tests/qemu-iotests/307.out                    |   5 +
 .../tests/nbd-qemu-allocation.out             |   1 +
 18 files changed, 486 insertions(+), 191 deletions(-)

-- 
2.33.1


