Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5956AF72B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:05:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZeUC-00087X-EB; Tue, 07 Mar 2023 16:04:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZeU9-000876-CO
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:04:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZeU7-0002h7-FI
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678223074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DGFlRYFse81y+NjAZOVSKqcFfBmW7GTHM6RiEeSm23M=;
 b=JCy179LBUw7mwqxE0c/JElJMWvc+4G2UQIRABUHyNCZt7yAPwseUJ3aJ0RLP1E2SIFXnzB
 W2XnZtUS8afxyNjOZ7M41EUeiQ+uSlfccLYZUlzc26jTXoAJDt0JECuwzbwPSbc1z0nQ1C
 yCsS5Ne53OV1S5J5XnXPZQHfiBFvDJk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-f7TkeZKvNvK80PwMB9Z7vQ-1; Tue, 07 Mar 2023 16:04:30 -0500
X-MC-Unique: f7TkeZKvNvK80PwMB9Z7vQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D45880D181;
 Tue,  7 Mar 2023 21:04:30 +0000 (UTC)
Received: from localhost (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D756A492C3E;
 Tue,  7 Mar 2023 21:04:29 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 0/3] block: protect BlockBackend->queued_requests with a
 lock
Date: Tue,  7 Mar 2023 16:04:24 -0500
Message-Id: <20230307210427.269214-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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

v2:
- Use qatomic_fetch_inc/dec() for readability in Patch 1 [Hanna]

QEMU block layer multi-queue support involves running I/O requests from
multiple threads. Shared state must be protected somehow to avoid thread-safety
issues.

The BlockBackend->queued_requests CoQueue is accessed without a lock and will
likely be corrupted when multiple threads queue requests at the same time.

This patch series make BlockBackend->queued_requests thread-safe.

Stefan Hajnoczi (3):
  block: make BlockBackend->quiesce_counter atomic
  block: make BlockBackend->disable_request_queuing atomic
  block: protect BlockBackend->queued_requests with a lock

 block/block-backend.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

-- 
2.39.2


