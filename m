Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44E635892D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:02:30 +0200 (CEST)
Received: from localhost ([::1]:40770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUX6x-0004U0-SZ
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUX41-0002gy-76
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:59:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUX3y-0006ro-MV
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617897561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6nVQM9KSbB5wNBR62KPFq+xx6HkOuLewm+uCVTwrcew=;
 b=FjH/Uzs3RvL3GY+x3r+64VPWKqjfx7ZE+3bRdRB4mZbMLUHdoGrzMbjzSOe0gPLzhTWhU7
 Inqkgn85azYTkMK6tyRzFZxBB4d0bAzTmc749+BXJaEf3eU+iVVteM3LCOje5saiiWgWoS
 YFmU7GDqlKEyHzbPSznCrny7yyfKHNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-KYX5rnj8OhqH_Zd-1I0X_g-1; Thu, 08 Apr 2021 11:59:19 -0400
X-MC-Unique: KYX5rnj8OhqH_Zd-1I0X_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 324631020C28;
 Thu,  8 Apr 2021 15:59:18 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-155.ams2.redhat.com
 [10.36.113.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DE005D6AC;
 Thu,  8 Apr 2021 15:59:15 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/5] blkdebug: fix racing condition when iterating on
Date: Thu,  8 Apr 2021 17:59:08 +0200
Message-Id: <20210408155913.53235-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When qemu_coroutine_enter is executed in a loop
(even QEMU_FOREACH_SAFE), the new routine can modify the list,
for example removing an element, causing problem when control
is given back to the caller that continues iterating on the same list. 

Patch 1 solves the issue in blkdebug_debug_resume by restarting
the list walk after every coroutine_enter if list has to be fully iterated.
Patches 2,3,4 aim to fix blkdebug_debug_event by gathering
all actions that the rules make in a counter and invoking 
the respective coroutine_yeld only after processing all requests.
Patch 5 adds a lock to protect rules and suspended_reqs.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Emanuele Giuseppe Esposito (5):
  blkdebug: refactor removal of a suspended request
  blkdebug: move post-resume handling to resume_req_by_tag
  blkdebug: track all actions
  blkdebug: do not suspend in the middle of QLIST_FOREACH_SAFE
  blkdebug: protect rules and suspended_reqs with a lock

 block/blkdebug.c | 113 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 79 insertions(+), 34 deletions(-)

-- 
2.30.2


