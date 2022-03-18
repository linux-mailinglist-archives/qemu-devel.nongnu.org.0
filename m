Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C644DDA03
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 13:56:27 +0100 (CET)
Received: from localhost ([::1]:57508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVC9a-0007B7-2D
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 08:56:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nVC6U-0004wG-Uv
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:53:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nVC6R-0005C9-UM
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647607990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w7LqfPU6zV57eJut2Md6ux7ZtNzEPuSruiRR6V/u1zQ=;
 b=VhLuP1R0Shua+REydpWdeAG5oqmrC4aHZ1Gk4728buDtgQ0O6YqpV3kuJdJoD21xbgvnSO
 pZepaSWyzJEBI2aUVU/IcmmG9fjtdH8hoztQe8pDcsdSmC9UncbnkQExSzljPjFz5s9bWk
 Htm5P5EY7uHNqQa3+/13dIDO1B1fPwg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-7MvS4BO8NHeX4QjeMDH1-g-1; Fri, 18 Mar 2022 08:53:06 -0400
X-MC-Unique: 7MvS4BO8NHeX4QjeMDH1-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F0B3802A5E;
 Fri, 18 Mar 2022 12:53:06 +0000 (UTC)
Received: from localhost (unknown [10.39.193.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEA9941136E2;
 Fri, 18 Mar 2022 12:53:05 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] iotests/207: Filter host fingerprint
Date: Fri, 18 Mar 2022 13:53:02 +0100
Message-Id: <20220318125304.66131-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Commit e3296cc796aeaf (“block: print the server key type and fingerprint
on failure”) improved the verbosity of our ssh block driver's error
messages for fingerprint mismatches.  However, iotest 207, which tests
such errors, has not been adjusted accordingly.

Since the fingerprint will differ between hosts, we need to filter it
(and can’t just statically adjust the reference output).  The problem is
that the error condition is printed by iotest.py’s VM.run_job(), so we
need to pass the filter to that function.  Right now, VM.run_job()
doesn’t support any filters, though, so patch 1 adds a filter parameter
and makes VM.run_job() use it.

Patch 2 then has the fix for iotest 207.


Hanna Reitz (2):
  iotests.py: Filters for VM.run_job()
  iotests/207: Filter host fingerprint

 tests/qemu-iotests/207        |  7 ++++++-
 tests/qemu-iotests/207.out    |  6 +++---
 tests/qemu-iotests/iotests.py | 26 ++++++++++++++++----------
 3 files changed, 25 insertions(+), 14 deletions(-)

-- 
2.35.1


