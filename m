Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45974CA628
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:38:32 +0100 (CET)
Received: from localhost ([::1]:49890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPBX-0005Tq-Cy
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:38:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPOMa-0001A7-CL
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:45:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPOMX-0004S5-2V
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646225147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DDHozr+KQImtcihdrhHCm/oynBM3I9i5H16woEYZVOo=;
 b=BLL6uEDQ4tzuSwcG2WjZSCqcHeOnptX6znSDN78BzQp4W8tDMSP4c/Z5yOfY+hG60fBv2e
 exNcqtTJCeZLzJuqi2CM1h/peJkYuylRXDpGewQdRMRxw8RqWy9MtL7FEmxPszyNAlbIiR
 LIFurgK9c7ZqaRo0i4WGezMDZuGjf6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-TMXCAX7mMKe5iJEgPhLQLA-1; Wed, 02 Mar 2022 07:45:44 -0500
X-MC-Unique: TMXCAX7mMKe5iJEgPhLQLA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4652824FA7;
 Wed,  2 Mar 2022 12:45:43 +0000 (UTC)
Received: from localhost (unknown [10.39.194.228])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 817697B609;
 Wed,  2 Mar 2022 12:45:42 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/3] iotests: Check for zstd support
Date: Wed,  2 Mar 2022 13:45:37 +0100
Message-Id: <20220302124540.45083-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

v1 cover letter:

https://lists.nongnu.org/archive/html/qemu-devel/2022-02/msg04592.html

We have two tests (as far as I know) that use compression_type=zstd for
qcow2 but do not check whether that is actually supported.  Thomas
reported this for 065, but it’s also the case for 303.

This series makes 303 be skipped when zstd is not compiled in, and has
065 use zlib for each of its test cases then (it was made to use zstd
just to improve on coverage, so using zlib as a fallback is perfectly
fine).

v2:
- Add the first patch so that 065 and 303 can use these new iotests.py
  functions to check for zstd support instead of checking for their own
  qemu-img create’s output
- Have 065 fall back to zlib instead of skipping zstd test cases


Hanna Reitz (3):
  iotests.py: Add supports_qcow2_zstd_compression()
  iotests/065: Check for zstd support
  iotests/303: Check for zstd support

 tests/qemu-iotests/065        | 24 ++++++++++++++++++------
 tests/qemu-iotests/303        |  4 +++-
 tests/qemu-iotests/iotests.py | 21 +++++++++++++++++++++
 3 files changed, 42 insertions(+), 7 deletions(-)

-- 
2.34.1


