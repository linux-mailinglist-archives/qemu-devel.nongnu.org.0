Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B0A3194BA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:49:47 +0100 (CET)
Received: from localhost ([::1]:50914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAIuI-0001pI-7Q
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAIpS-0005kp-Kd
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:44:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAIpQ-0007OT-NO
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613076283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MjFZnxgCoMYNlPHgLstd4VGoy6l+EoU7UxrvRdo0Ne4=;
 b=b+No9QsuEXQcNkWwz4iXoqXOS4ZGSDX80APIYKm80itdGihtrPauj0UAAT+bxjiPbKpEbf
 oKVQboli7FTApmeUElE3xWzdeK9W+v9vtsPBFLCZVlQsIBpA64XxGsGpCJfV1Mv9PTlXpb
 EXdzFKuTAnun2h9hizHWtOiXoqC2xh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-TUmeDCiaPe2ePz1cSHzOjg-1; Thu, 11 Feb 2021 15:44:40 -0500
X-MC-Unique: TUmeDCiaPe2ePz1cSHzOjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78F8B80196E;
 Thu, 11 Feb 2021 20:44:39 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9635D10013D7;
 Thu, 11 Feb 2021 20:44:38 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] improve do_strtosz precision
Date: Thu, 11 Feb 2021 14:44:34 -0600
Message-Id: <20210211204438.1184395-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, qemu-block@nongnu.org,
 tao3.xu@intel.com, rjones@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Parsing sizes with only 53 bits of precision is surprising; it's time
to fix it to use a full 64 bits of precision.

v1 was here:
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg01800.html

Since then:
- split testsuite improvements from code changes [Vladimir]
- more tests for more corner cases [Vladimir, Rich, Dan]
- fix handling of '123-45' when endptr is non-NULL [Vladimir]
- fix handling of '1.k'
- actually enable deprecation of '0x1k' [Vladimir]
- include missing deprecation text for rounded fractions
- improved commit messages

I'm still not sure I like patch 4, but it's at least worth considering.

Eric Blake (4):
  utils: Enhance testsuite for do_strtosz()
  utils: Improve qemu_strtosz() to have 64 bits of precision
  utils: Deprecate hex-with-suffix sizes
  utils: Deprecate inexact fractional suffix sizes

 docs/system/deprecated.rst       |  17 ++++
 tests/test-cutils.c              | 168 ++++++++++++++++++++++++++-----
 tests/test-keyval.c              |  39 ++++---
 tests/test-qemu-opts.c           |  37 ++++---
 util/cutils.c                    | 103 +++++++++++++++----
 tests/qemu-iotests/049.out       |  14 ++-
 tests/qemu-iotests/178.out.qcow2 |   3 +-
 tests/qemu-iotests/178.out.raw   |   3 +-
 8 files changed, 305 insertions(+), 79 deletions(-)

-- 
2.30.1


