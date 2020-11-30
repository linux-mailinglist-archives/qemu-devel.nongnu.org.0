Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EAE2C82B3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 11:59:27 +0100 (CET)
Received: from localhost ([::1]:56064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjgty-0007bL-2f
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 05:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjgro-0006eN-GH
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:57:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjgrl-00062x-AR
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:57:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606733827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/8CvmFTyJoUcAhiRHx8NUxPBBGQU2g7ako3PKYb9C4Q=;
 b=IM6X4ZuJ39DeiHdk5T+k1AsBMJBCSQto8V0vzZZX4S37ORnk7lv2LOeUO5na8jaOQu6+X5
 qpbCu+EP8R+lvBFH21HCdxXcZaxTStFB9Ol7Q7frIBu7ufpz423iJYzyt3YRN09Ajy1fcI
 eLaisnmgSDf6ytjKK5ZA+1L3NCn4BxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-wAPjwFLAM_-V6mDihkOX_g-1; Mon, 30 Nov 2020 05:57:05 -0500
X-MC-Unique: wAPjwFLAM_-V6mDihkOX_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5661B612C0;
 Mon, 30 Nov 2020 10:57:04 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 807301346F;
 Mon, 30 Nov 2020 10:57:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] User creatable object property setting fixes
Date: Mon, 30 Nov 2020 11:56:11 +0100
Message-Id: <20201130105615.21799-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kwolf@redhat.com, jasowang@redhat.com, fnu.vikram@xilinx.com,
 berrange@redhat.com, pisa@cmp.felk.cvut.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While writing a QAPI schema for all user creatable QOM objects, I found
a few problems in the existing property setting code of objects.

This series fixes some crashes and memory leaks related to property
setting in user creatable objects.

There are many more problems of the sort that updating a property at
runtime is allowed by most objects, but they aren't actually prepared to
handle the update, so it doesn't result in the expected behaviour. I'm
not trying to fix bugs of this class in this series.

Kevin Wolf (4):
  crypto: Move USER_CREATABLE to secret_common base class
  crypto: Forbid broken unloading of secrets
  crypto: Fix memory leaks in set_loaded for tls-*
  can-host: Fix crash when 'canbus' property is not set

 crypto/secret.c         | 14 --------------
 crypto/secret_common.c  | 21 ++++++++++++++++++---
 crypto/secret_keyring.c | 14 --------------
 crypto/tlscredsanon.c   |  3 +--
 crypto/tlscredspsk.c    |  3 +--
 crypto/tlscredsx509.c   |  3 +--
 net/can/can_host.c      |  5 +++++
 7 files changed, 26 insertions(+), 37 deletions(-)

-- 
2.28.0


