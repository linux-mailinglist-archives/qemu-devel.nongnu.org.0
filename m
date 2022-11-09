Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAEA6230CC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:56:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osoM7-0005hL-QD; Wed, 09 Nov 2022 11:55:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1osoM5-0005eW-Tg
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:55:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1osoM3-0007An-Al
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668012907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zTvrYg3rh5/mVJMdFO/l5GUK+ojj5312AU7vTsSskak=;
 b=Qcshx/daeymVuBYTJOgXp4VQpQJU/s/DVAxEB7aSs5MJLZv0IHJEYPwPBcg1UN679noodU
 WYwO3IDgSV2Ua2gtHsJEtPpTL/GZ7RJ3JvRz+mRPqek+JUUiz61VFDvpjMYEUi5hx6Euoc
 jREMctEe1LXPWxZKucjxJhtRseNT1YM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-fDMtjZj3NfyTq8f1vuIUzQ-1; Wed, 09 Nov 2022 11:55:03 -0500
X-MC-Unique: fDMtjZj3NfyTq8f1vuIUzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F2D41991C5E;
 Wed,  9 Nov 2022 16:54:54 +0000 (UTC)
Received: from localhost (unknown [10.39.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FEFFC4C9D3;
 Wed,  9 Nov 2022 16:54:54 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH for-7.2 0/5] block/mirror: Do not wait for active writes
Date: Wed,  9 Nov 2022 17:54:47 +0100
Message-Id: <20221109165452.67927-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

For some reason(TM), the mirror job, when in write-blocking mode, has
decided not to issue background requests while active writes are in
flight.  (Or rather, it was probably me who decided that.)

The problem is that only background requests can really reliably help
you make progress.  When all the mirror job does is to mirror guest
writes to the target, but not copy anything else that remains to be
copied in the disk, it will not make converge.

It is unclear why it is that way, so patch 1 simply drops that
dependency, and attempts to better explain the remaining
wait-dependencies we have between requests (i.e. why active requests
must wait on all overlapping requests for the whole range, but
background requests only wait on any conflicts that concern the
beginning of the range they want to copy).

Patch 2 is clean-up, patch 3 fixes another bug I found while trying to
come up with a working test case.

Patch 4 is that test case (I hope it works on your end, too), and patch
5 is a test case for the fix in patch 3.


Hanna Reitz (5):
  block/mirror: Do not wait for active writes
  block/mirror: Drop mirror_wait_for_any_operation()
  block/mirror: Fix NULL s->job in active writes
  iotests/151: Test that active mirror progresses
  iotests/151: Test active requests on mirror start

 block/mirror.c             |  78 ++++++++-----
 tests/qemu-iotests/151     | 227 ++++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/151.out |   4 +-
 3 files changed, 278 insertions(+), 31 deletions(-)

-- 
2.36.1


