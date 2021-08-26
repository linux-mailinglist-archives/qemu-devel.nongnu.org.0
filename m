Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C21C3F905C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:55:21 +0200 (CEST)
Received: from localhost ([::1]:41736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJNKz-0001u2-JF
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mJMnG-00069i-PX
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:20:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mJMnD-00038C-PN
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630012809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h2XS/WBouRtovjtFrO6k82u1/zy7C5hiGE6W18uT44A=;
 b=Cg8TaXbaseCnMf8hG+O2p01qRc1AwEG994tX589Abu4fiH9Q0Kko9Hzuc2beHUqzO/0sML
 r5uxs+DKh4X36+8NEx4AjcnZ3UZXTUQVGqjJhr/DlK9MBSR3xwd5d+OROpjD3cnw0+sFR6
 HAymujcjKuN8HeezZYd/ZzlLjr3Bl6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-D5qtFONuNd2aRl3rQzv5sw-1; Thu, 26 Aug 2021 17:20:08 -0400
X-MC-Unique: D5qtFONuNd2aRl3rQzv5sw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AB51824F8C
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 21:19:47 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.17.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1BA460C04;
 Thu, 26 Aug 2021 21:19:46 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 7C947223EA7; Thu, 26 Aug 2021 17:19:46 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 0/2] virtiofsd: Add capability to block xattrs
Date: Thu, 26 Aug 2021 17:19:35 -0400
Message-Id: <20210826211937.317558-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: dgilbert@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of now we have a knob "-o xattr/no_xattr" which either enables
all xattrs or disables all xattrs.

We need something more fine grained where we can selectively disable
only certain xattrs (and not all).

For example, in some cases we want to disable "security.selinux"
xattr. This is equivalent to virtiofs not supporting security.selinux
and guest kernel will fallback to a single label for whole fs
(virtiofs_t).

So add an option "-o block_xattr=<list-of-xattrs>" which will allow
specifying a list of xattrs to block.

Vivek Goyal (2):
  virtiofsd: Add an array to keep track of blocked xattrs
  virtiofsd: Add option "block_xattr=" to block certain xattrs

 docs/tools/virtiofsd.rst         |  17 ++++
 tools/virtiofsd/helper.c         |   3 +
 tools/virtiofsd/passthrough_ll.c | 166 ++++++++++++++++++++++++++++---
 3 files changed, 171 insertions(+), 15 deletions(-)

-- 
2.31.1


