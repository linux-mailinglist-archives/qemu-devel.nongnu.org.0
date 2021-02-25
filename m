Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA535325420
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 17:57:24 +0100 (CET)
Received: from localhost ([::1]:49614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFJx5-00018T-4V
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 11:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lFJv6-0008Ll-U8
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 11:55:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lFJv5-0004J9-6H
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 11:55:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614272118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=B/FbS2zldshjfKI0WGy78HXxu6NQlJob1/vu3wcFVec=;
 b=bZkLNcNuFxWXmfJ9xAu+eUp6s+jh0HQcOZLPeNkli0Af0zFiQYAiRKxTcjODbBE6b/krzg
 pX0Xkx6F33GBrYFX1t/t3JTCKGAOEZlXpZ8QJwhOScICgpZV0BIz1d4FsjUjHx7nKNClY2
 8N1K5cTMtVSPjd6ore1Sj1X+TUtfwdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-jiSDFap6PASZZyVHKSI8VQ-1; Thu, 25 Feb 2021 11:55:16 -0500
X-MC-Unique: jiSDFap6PASZZyVHKSI8VQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E15E3107ACE3
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 16:55:14 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-46.pek2.redhat.com [10.72.12.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ACA860C5A;
 Thu, 25 Feb 2021 16:55:09 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v5 0/1] virtio-net: Add check for mac address while peer is
 vdpa
Date: Fri, 26 Feb 2021 00:55:05 +0800
Message-Id: <20210225165506.18321-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: eperezma@redhat.com, amorenoz@redhat.com, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add check for mac address while peer is vdpa
Change from v4->v5
1. Add comment for this work around
2. while copy the netconfig, only overwrite the mac address


Cindy Lu (1):
  virtio-net: Add check for mac address while peer is vdpa

 hw/net/virtio-net.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.21.3


