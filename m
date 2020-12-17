Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B232E2DD52B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 17:27:02 +0100 (CET)
Received: from localhost ([::1]:39634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpw7J-0003Dn-OQ
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 11:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpw0p-0002Gs-ND
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:20:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpw0o-0005Qp-9d
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608222016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K9y1yCNgVhBH7ZhjJyUQa31+FnoEBe5EPWH7ch2zC7k=;
 b=WAvDctkuXp8YCGldY4rSdsF44A9dcTrL1WceokUqxoczWIDsXFh2h9yQxIGAF9omEwopRC
 3ErbmkE1bPTe6MERwIbIgFMQ/xFkENkL1ESCFWAiDQYO8BeqYdY4iWPCh5mRprj1mF3Ocm
 UTPnyhaaEnRjkhyFzkhgyTgvZCvwgT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-JeXnpr1PPJKQJsaAGm1GVQ-1; Thu, 17 Dec 2020 11:20:06 -0500
X-MC-Unique: JeXnpr1PPJKQJsaAGm1GVQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05F9A107ACE6;
 Thu, 17 Dec 2020 16:20:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCD3D1ACC7;
 Thu, 17 Dec 2020 16:20:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5F4A21130358; Thu, 17 Dec 2020 17:20:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] block/vpc: Clean up some buffer abuse
Date: Thu, 17 Dec 2020 17:19:54 +0100
Message-Id: <20201217162003.1102738-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, mrezanin@redhat.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster (9):
  block/vpc: Make vpc_open() read the full dynamic header
  block/vpc: Don't abuse the footer buffer as BAT sector buffer
  block/vpc: Don't abuse the footer buffer for dynamic header
  block/vpc: Make vpc_checksum() take void *
  block/vpc: Pad VHDDynDiskHeader, replace uint8_t[] buffers
  block/vpc: Use sizeof() instead of 1024 for dynamic header size
  block/vpc: Pad VHDFooter, replace uint8_t[] buffers
  block/vpc: Pass footer buffers as VHDFooter * instead of uint8_t *
  block/vpc: Use sizeof() instead of HEADER_SIZE for footer size

 block/vpc.c | 146 ++++++++++++++++++++++++++--------------------------
 1 file changed, 72 insertions(+), 74 deletions(-)

-- 
2.26.2


