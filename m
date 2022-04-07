Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87A64F80E2
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:44:02 +0200 (CEST)
Received: from localhost ([::1]:33608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncSQb-0004wM-Pq
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ncSKo-0001wq-2g
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:38:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ncSKj-0001Ba-LZ
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649338675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2WO45TExoMlaSZp+OLaTn6qwta0SRoBp4qb0/CpAlQ0=;
 b=KdbPJWqRE8QC9ESdKJYJEkDMZMrxSQRNl9faUbcBj70LdOi0pXqlHMhwjRNRo1uzieE8cs
 E1i7dy/11P8Okkpb1SHQ15/BLsdNMSSbQZ+GrTAblA/HMOwg7bsywu4rInjVpaR5nhf3Aj
 7bZ+dbqOTVXta1Y1uGbyGi5Ar/k+sw8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-ol7e_-DjNQG9SXFTI2bzGg-1; Thu, 07 Apr 2022 09:37:52 -0400
X-MC-Unique: ol7e_-DjNQG9SXFTI2bzGg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CCB6296A612;
 Thu,  7 Apr 2022 13:37:52 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D091482CD2;
 Thu,  7 Apr 2022 13:37:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] vhost-user: Fixes for VHOST_USER_ADD/REM_MEM_REG
Date: Thu,  7 Apr 2022 15:36:54 +0200
Message-Id: <20220407133657.155281-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, raphael.norwitz@nutanix.com, qemu-block@nongnu.org,
 stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While implementing a vhost-user-blk driver for libblkio, I found some
problems with VHOST_USER_ADD/REM_MEM_REG both in the spec and in the
implementations in QEMU and libvhost-user that this series addresses.

I also noticed that you can use REM_MEM_REG or SET_MEM_TABLE to unmap a
memory region that is still in use (e.g. a block I/O request using
addresses from the region has been started, but not completed yet),
which is not great. I'm not sure how to fix this best, though.

We would have to wait for these requests to complete (maybe introduce a
refcount and wait for it to drop to zero), but waiting seems impossible
in libvhost-user because it doesn't have any main loop integration. Just
failing the memory region removal would be safe, but potentially a
rather awkward interface because clients would have to implement some
retry logic.

Kevin Wolf (3):
  docs/vhost-user: Clarifications for VHOST_USER_ADD/REM_MEM_REG
  libvhost-user: Fix extra vu_add/rem_mem_reg reply
  vhost-user: Don't pass file descriptor for VHOST_USER_REM_MEM_REG

 docs/interop/vhost-user.rst               | 17 +++++++++++++++++
 hw/virtio/vhost-user.c                    |  2 +-
 subprojects/libvhost-user/libvhost-user.c | 17 +++++++----------
 3 files changed, 25 insertions(+), 11 deletions(-)

-- 
2.35.1


