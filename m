Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4624D360EE6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 17:24:31 +0200 (CEST)
Received: from localhost ([::1]:41780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX3r4-0005fF-9Y
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 11:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lX3pO-0004NF-TU
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:22:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lX3pB-00089j-Bp
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:22:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618500149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GKk/dW4kG4eG02+rfklR9WWtwJ5o135CqC7RV0u1M0c=;
 b=Hpn/oGGB6gl3z91o/39oBQZ5pTmzdGpQi/Dps7Twl+c0GYHZ7132p5yE2tnS3EyokoaaF3
 +XI1nTZRH/5nKHiVrGB5tqpOQhWlNFWWMM39xUxbilEfQipHTyECobg2qc1C3LOH/ED/wf
 COBTOV0J1lyMwC5uVvODteiHYtoVqxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-XcOYGeK5MeioKrPOwTm30g-1; Thu, 15 Apr 2021 11:22:27 -0400
X-MC-Unique: XcOYGeK5MeioKrPOwTm30g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01021801814;
 Thu, 15 Apr 2021 15:22:26 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-169.ams2.redhat.com [10.36.113.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 432586064B;
 Thu, 15 Apr 2021 15:22:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 0/2] qemu-img convert: Fix sparseness detection
Date: Thu, 15 Apr 2021 17:22:12 +0200
Message-Id: <20210415152214.279844-1-kwolf@redhat.com>
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
Cc: kwolf@redhat.com, pl@kamp.de, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter, three years ago you changed 'qemu-img convert' to sacrifice some
sparsification in order to get aligned requests on the target image. At
the time, I thought the impact would be small, but it turns out that
this can end up wasting gigabytes of storagee (like converting a fully
zeroed 10 GB image taking 2.8 GB instead of a few kilobytes).

https://bugzilla.redhat.com/show_bug.cgi?id=1882917

I'm not entirely sure how to attack this best since this is a tradeoff,
but maybe the approach in this series is still good enough for the case
that you wanted to fix back then?

Of course, it would be possible to have a more complete fix like looking
forward a few blocks more before writing data, but that would probably
not be entirely trivial because you would have to merge blocks with ZERO
block status with DATA blocks that contain only zeros. I'm not sure if
it's worth this complication of the code.

Kevin Wolf (2):
  iotests: Test qemu-img convert of zeroed data cluster
  qemu-img convert: Fix sparseness detection

 qemu-img.c                 | 18 ++++--------------
 tests/qemu-iotests/122     |  1 +
 tests/qemu-iotests/122.out |  6 ++++--
 3 files changed, 9 insertions(+), 16 deletions(-)

-- 
2.30.2


