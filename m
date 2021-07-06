Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720273BD924
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 16:55:53 +0200 (CEST)
Received: from localhost ([::1]:41166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mUK-0007wO-G7
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 10:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0mT0-0006cX-Ia
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:54:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0mSx-0007sq-De
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625583265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A/S6oBUmkto2ElyamNnjK7cg8rNTN0pyvtu/LQFozBI=;
 b=NaMBH0HZWEiArA8QvGwXecurt6yWfkD/BUyvyfkpXwMPmueWngVD/AvIOVYD9swSibvpLK
 U6eO5Hpas2RbnSAWyZvslWQLr4hOW7kSfxxjNwtp47nbHEQyrWNgE9dzdObHaF1DyU6jQj
 Ng9sPn6BDt44ei3h+oICKPcq/Ic4ysQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-z6iNZS-AOLGQTNVqEuYy1w-1; Tue, 06 Jul 2021 10:54:24 -0400
X-MC-Unique: z6iNZS-AOLGQTNVqEuYy1w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A838718BA2A5
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 14:54:23 +0000 (UTC)
Received: from thuth.com (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2C0B5D6A1;
 Tue,  6 Jul 2021 14:54:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/3] softmmu/vl: Deprecate old and crufty display options
Date: Tue,  6 Jul 2021 16:54:10 +0200
Message-Id: <20210706145413.1449571-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: libvir-list@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

-display sdl uses a hand-crafted parser in vl.c, which is quite ugly
since the other parts of -display have been QAPIfied already. A straight
conversion to QAPI is not advisable since the "alt_grab" and "ctrl_grab"
parameters are not the best solution anyway. So this patch series
introduces a new "grab-mod" parameter as replacement instead and then
deprecates the old and crufty options.

While we're at it, the third patch also suggests to deprecated the
old -sdl and -curses top-level options.

Thomas Huth (3):
  softmmu/vl: Add a "grab-mod" parameter to the -display sdl option
  softmmu/vl: Deprecate the old grab options
  softmmu/vl: Deprecate the -sdl and -curses option

 docs/system/deprecated.rst | 20 ++++++++++++++++++++
 qemu-options.hx            | 18 +++++++++++++-----
 softmmu/vl.c               | 24 +++++++++++++++++++++---
 3 files changed, 54 insertions(+), 8 deletions(-)

-- 
2.27.0


