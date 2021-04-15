Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549EC3603E6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 10:08:00 +0200 (CEST)
Received: from localhost ([::1]:51752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWx2d-0005Y1-Cz
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 04:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lWwzh-0003zD-5s
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 04:04:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lWwzf-0000km-JQ
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 04:04:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618473894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8+u4p1EAD2LIjo2fTJY5EENEsS4no6xdl+eTYYu3u3A=;
 b=ek1IzvoXjWRkaAbDNkL+KhNAnLqLwAgCAWtXafOa0B+jelKKBaZayPk5sMsgftYvUzDk7u
 pZx6+2bZwGTqSXOwgUbnaNh9+4eMafO+5pIT+IXifuEqCli+TBtGgrXe0Yt5pYcFt57NfS
 +FNlY4v/hSFFlxLP7GKmKTSwCpA8lsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-caM-5f60P9-MTECusjIhbA-1; Thu, 15 Apr 2021 04:04:52 -0400
X-MC-Unique: caM-5f60P9-MTECusjIhbA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26DE283DD24;
 Thu, 15 Apr 2021 08:04:52 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-61.pek2.redhat.com [10.72.12.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E2F9104C475;
 Thu, 15 Apr 2021 08:04:46 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] vhost-vDPA: doorbell mapping support
Date: Thu, 15 Apr 2021 16:04:42 +0800
Message-Id: <20210415080444.44645-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elic@nvidia.com, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All:

This series tries to implement doorbell mapping support for
vhost-vDPA. Tested with virtio-pci vDPA driver.

Please review.

Jason Wang (2):
  vhost-vdpa: skip ram device from the IOTLB mapping
  vhost-vdpa: doorbell mapping support

 hw/virtio/vhost-vdpa.c         | 97 ++++++++++++++++++++++++++++++----
 include/hw/virtio/vhost-vdpa.h |  7 +++
 2 files changed, 94 insertions(+), 10 deletions(-)

-- 
2.25.1


