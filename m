Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF6D490C8C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 17:34:54 +0100 (CET)
Received: from localhost ([::1]:43184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Uy5-0000wb-PT
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 11:34:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n9Uqc-0000dI-Ac
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 11:27:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n9UqW-000122-DF
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 11:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642436815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G4DB0TuvfMJwAgakxbv8Hk3vRzmHvjQV5TRpFV2qXTQ=;
 b=PhKX3UEnIg8RBBGt3MOYy3kpW5U5btn9WV1XAWMCZdBTpxK4fAOPGqbUHCa+TZbbdWK6pS
 YR+o7pv8JLwzAAhwlZnr3TMMplSrLqC6BxaAtnS+IHI0ck6qOE22VM73uRFKd3kXl2c2AS
 zU0hKFL/nlwTxf2ubsWHdAlUEdMFNKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-bqJX1-aOP22tJVwVdKtX6A-1; Mon, 17 Jan 2022 11:26:53 -0500
X-MC-Unique: bqJX1-aOP22tJVwVdKtX6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2035874980;
 Mon, 17 Jan 2022 16:26:51 +0000 (UTC)
Received: from localhost (unknown [10.39.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96E755B93F;
 Mon, 17 Jan 2022 16:26:51 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] block/io: Update BSC only if want_zero is true
Date: Mon, 17 Jan 2022 17:26:47 +0100
Message-Id: <20220117162649.193501-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

As reported by Nir
(https://lists.nongnu.org/archive/html/qemu-block/2022-01/msg00292.html)
there’s a problem with the block-status cache, namely that it is updated
when want_zero is false, but we return the result later even when the
caller now passes want_zero=true.  In the worst case, the
want_zero=false call may have resulted in the cache containing an entry
describing the whole image to contain data, and then all future requests
will be served from that cache entry.

There are a couple ways this could be fixed (e.g. one cache per
want_zero mode, or storing want_zero in the cache and comparing it when
the cached data is fetched), but I think the simplest way is to only
store want_zero=true block-status results in the cache.  (This way, the
cache will not work with want_zero=false, but the want_zero=true case is
the one for which we introduced the cache in the first place.  I think
want_zero=false generally is fast enough(tm), that’s why we introduced
want_zero after all.)

Patch 1 is the fix, patch 2 a regression test.


Hanna Reitz (2):
  block/io: Update BSC only if want_zero is true
  iotests/block-status-cache: New test

 block/io.c                                    |   6 +-
 tests/qemu-iotests/tests/block-status-cache   | 130 ++++++++++++++++++
 .../qemu-iotests/tests/block-status-cache.out |   5 +
 3 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100755 tests/qemu-iotests/tests/block-status-cache
 create mode 100644 tests/qemu-iotests/tests/block-status-cache.out

-- 
2.33.1


