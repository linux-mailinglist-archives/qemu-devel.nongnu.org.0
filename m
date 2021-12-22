Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E279847D13F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 12:46:41 +0100 (CET)
Received: from localhost ([::1]:50788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n004v-0000Nj-1D
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 06:46:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n000R-0003y2-96
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:42:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n000P-00084N-M9
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640173317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gwczaIFchjInhSBw8V+mBpOW1RyV5LkeWtC81/5aAA0=;
 b=FUNhHFXgSVywLGBfMQJFLeBu4IQi/UpwewUempG1VRHnf0OR+oWPJfqRh1azn84Af++Zxx
 MUNHtLEb8N1C//jsSMB730mHUDcqNv3yrTC1Yb6ptcxPPBxPoUTTUY6hcFSOLq4BfYPD49
 dasjwELyD1AF9zFjr+AUdtLdz8I1IA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-ZSmdvgx_NAO_Mec1BUl2kA-1; Wed, 22 Dec 2021 06:41:56 -0500
X-MC-Unique: ZSmdvgx_NAO_Mec1BUl2kA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0F8664145;
 Wed, 22 Dec 2021 11:41:55 +0000 (UTC)
Received: from localhost (unknown [10.39.194.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 533C95BD25;
 Wed, 22 Dec 2021 11:41:55 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/3] qsd: Add --daemonize; and add job quit tests
Date: Wed, 22 Dec 2021 12:41:50 +0100
Message-Id: <20211222114153.67721-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series began as an attempt to write a reproducer for the following
case:

  You have a mirror job in READY state with a target that’s slow.  There
  is still a lot of data to be written (because of active I/O in the
  guest).  You quit qemu, and you expect quitting to be reasonably
  quick.
  Old qemu used to still complete the job, which may take forever, new
  qemu cancels the job, which is better.

That’s basically patch 3 in this series, which tests this behavior once
for mirror and once for active commit.

Problem is, how to simulate a slow target for this; if you use a
throttle node in the same qemu process that you’re trying to test, qemu
will just drain it when quitting, and so the supposedly slow target
becomes very fast.

So we need an external instance, and what better to use but the storage
daemon.  I found that it would be nice if for this it had a --daemonize
option (well, it would be nice in general), and so the first two patches
implement that.


Hanna Reitz (3):
  qsd: Add pre-init argument parsing pass
  qsd: Add --daemonize
  iotests/185: Add post-READY quit tests

 docs/tools/qemu-storage-daemon.rst   |   7 +
 storage-daemon/qemu-storage-daemon.c | 188 +++++++++++++++++++++++++-
 tests/qemu-iotests/185               | 190 ++++++++++++++++++++++++++-
 tests/qemu-iotests/185.out           |  48 +++++++
 4 files changed, 430 insertions(+), 3 deletions(-)

-- 
2.33.1


