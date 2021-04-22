Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9490836856D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 19:05:16 +0200 (CEST)
Received: from localhost ([::1]:41852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZclP-0003kV-83
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 13:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZcj0-00024R-51
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 13:02:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZciy-0001SA-KI
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 13:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619110963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=B2lZw0pyz3GJCTZuXOuKMMzTSZouXLYtii4EUwE451M=;
 b=aF0cCfeKSQ2ide5zISGPRosirPvsbf+m0v05sSoQj/mlBjHKROI7fOrENVP7ngrrl47CLh
 BXnrqOacwx2L+uaX538MA/+7jwmd7UqJQ6/n5TdOa1LFRdm8oxYBysiVQOyRB63+CUjwGl
 ZX5lwxvnEbGW5aabas2JvlhFdxCRMHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-x140MWK2MD2E9gq1T_r5SA-1; Thu, 22 Apr 2021 13:02:39 -0400
X-MC-Unique: x140MWK2MD2E9gq1T_r5SA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E87C18397A3;
 Thu, 22 Apr 2021 17:02:37 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-159.ams2.redhat.com [10.36.112.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D1E119C45;
 Thu, 22 Apr 2021 17:02:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/5] vhost-user-blk: Error handling fixes during initialistion
Date: Thu, 22 Apr 2021 19:02:16 +0200
Message-Id: <20210422170221.285006-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Kevin Wolf (5):
  vhost-user-blk: Don't reconnect during initialisation
  vhost-user-blk: Use Error more consistently
  vhost-user-blk: Get more feature flags from vhost device
  virtio: Fail if iommu_platform is requested, but unsupported
  vhost-user-blk: Check that num-queues is supported by backend

 include/hw/virtio/vhost.h |  2 +
 hw/block/vhost-user-blk.c | 77 +++++++++++++--------------------------
 hw/virtio/vhost-user.c    |  5 +++
 hw/virtio/virtio-bus.c    |  5 +++
 4 files changed, 38 insertions(+), 51 deletions(-)

-- 
2.30.2


