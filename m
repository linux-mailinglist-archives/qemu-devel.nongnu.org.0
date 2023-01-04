Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4D265DFAB
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:12:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBuF-0001fO-QJ; Wed, 04 Jan 2023 17:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pDBuC-0001XA-Dv
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:06:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pDBu9-00066m-MT
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672869996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FhKIZhVzza3xSjAB3W7kLCE5vEUrFQVQmdgC81/IBlI=;
 b=eY3JZY7z98pnBhIXYPf2k8m7d9rMPWztC+cvfsK8lTdjsOOm8+Py+TL3Qg1oH5HF0btwhN
 b7YZb1w7XrWD7OaJfcR/8YB8FF49TehOlICWgwItmmkqzztD9/v3iAw9JtgNrmKP4q4Ceu
 Y6J2zmx2NW5Y5JJDTZnLO89P5eDua60=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-F8wgi7DtMUynYt8lNCjp6w-1; Wed, 04 Jan 2023 17:06:33 -0500
X-MC-Unique: F8wgi7DtMUynYt8lNCjp6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DAEA185A78B;
 Wed,  4 Jan 2023 22:06:33 +0000 (UTC)
Received: from localhost (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6B5F1121315;
 Wed,  4 Jan 2023 22:06:32 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 0/3] block-ram-registrar: reset when the graph changes
Date: Wed,  4 Jan 2023 17:06:28 -0500
Message-Id: <20230104220631.110321-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

Kevin pointed out that block-ram-registrar doesn't handle graph changes. New
nodes must have all of guest RAM registered before they can process I/O
requests with BDRV_REQ_REGISTERED_BUF.

These patches add a mechanism for monitoring graph changes and use it to
refresh registered buffers in block-ram-registrar.

Stefan Hajnoczi (3):
  block: add BdrvChildClass->pre_detach() and ->post_attach()
  block-backend: add graph change notifier API
  block-ram-registrar: reset when the graph changes

 include/block/block_int-common.h            |  8 +++
 include/sysemu/block-backend-global-state.h | 10 +++
 block.c                                     | 34 +++++++++
 block/block-backend.c                       | 79 +++++++++++++++++++++
 block/block-ram-registrar.c                 | 40 +++++++++--
 block/trace-events                          |  2 +
 6 files changed, 168 insertions(+), 5 deletions(-)

-- 
2.39.0


