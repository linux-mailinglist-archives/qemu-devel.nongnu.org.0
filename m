Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE6936EEC1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 19:20:57 +0200 (CEST)
Received: from localhost ([::1]:47624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcALQ-0003l1-ET
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 13:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcAEB-0000vO-1o
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 13:13:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcAE8-0001GR-Hg
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 13:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619716403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LXe5jHmSwvVz73ufE3cE3JRm4/lBwtTBoV05hf0+/ZM=;
 b=YOz891hCef2gXc2tOU1gRLi2RmLR1wvWeaYFLckU8Z5fyjcMTArXZA9TdP+KBBL95QA822
 /SkXWew4A+lrnRvQRiXIMy/RoL2l+SFLsINQeaRs11PpOFhAFuBTj8RIe5oyIM1qDRUgXY
 Sd3PaKoThJrTDCsf1lVy/98DZ2T8Hvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-_hu_z8V0NImeX-XtQgnVZA-1; Thu, 29 Apr 2021 13:13:20 -0400
X-MC-Unique: _hu_z8V0NImeX-XtQgnVZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75C9E80ED91;
 Thu, 29 Apr 2021 17:13:19 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-217.ams2.redhat.com [10.36.114.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C1B0100164C;
 Thu, 29 Apr 2021 17:13:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/6] vhost-user-blk: Error handling fixes during
 initialistion
Date: Thu, 29 Apr 2021 19:13:10 +0200
Message-Id: <20210429171316.162022-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, den-plotnikov@yandex-team.ru, mst@redhat.com,
 qemu-devel@nongnu.org, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost-user-blk neglects for several properties to check whether the
configured value is even compatible with the backend. This results
sometimes in crashes because of buggy error handling code, and sometimes
in devices that are presented differently to the guest than the backend
would expect and that don't work properly therefore.

This series fixes some of these bugs.

v2:
- Fix error paths in realize() that didn't set errp
- Added vhost_dev_cleanup() back in the error path (more faithful revert
  of 77542d43149)

Kevin Wolf (6):
  vhost-user-blk: Make sure to set Error on realize failure
  vhost-user-blk: Don't reconnect during initialisation
  vhost-user-blk: Improve error reporting in realize
  vhost-user-blk: Get more feature flags from vhost device
  virtio: Fail if iommu_platform is requested, but unsupported
  vhost-user-blk: Check that num-queues is supported by backend

 include/hw/virtio/vhost.h |  2 +
 hw/block/vhost-user-blk.c | 85 ++++++++++++++-------------------------
 hw/virtio/vhost-user.c    |  5 +++
 hw/virtio/virtio-bus.c    |  5 +++
 4 files changed, 42 insertions(+), 55 deletions(-)

-- 
2.30.2


