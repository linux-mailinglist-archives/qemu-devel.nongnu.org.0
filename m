Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6542B2D6216
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:38:10 +0100 (CET)
Received: from localhost ([::1]:41050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOxF-000389-DC
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:38:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knObF-00053S-6i
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:15:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOb8-0001BU-1D
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:15:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607616917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A41DWRBo+5HnRPqleia0WdszhYBjKwJp6t+0HzVqi4k=;
 b=UBV5J9WWTAkzfYRUHnyl90kkxgMg6/ZMKA5iIOq+NxAdMTa+ek4WLVY5hsVV8Gh2IxF7I7
 kM5KzgiSJuzpJLvn872MCMC4KJT2n/fLcl716i0sB/f8rViD2VupmIOnkypCHvlByqYhsR
 zzCqbybq+ZmBhaxYWNtJdpMSP1ekf2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-HCzzlOEsMpuHZCOcoAvbAQ-1; Thu, 10 Dec 2020 11:14:55 -0500
X-MC-Unique: HCzzlOEsMpuHZCOcoAvbAQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 363AF10151ED;
 Thu, 10 Dec 2020 16:14:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05EB360862;
 Thu, 10 Dec 2020 16:14:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 71A9011336D6; Thu, 10 Dec 2020 17:14:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/10] Fix floating-point -> text conversion precision
Date: Thu, 10 Dec 2020 17:14:42 +0100
Message-Id: <20201210161452.2813491-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This takes care of ancient FIXMEs, mostly because a future series will
rework the code, and I can't bring myself tiptoeing around these bugs.

Markus Armbruster (10):
  tests/check-qjson: Don't skip funny QNumber to JSON conversions
  tests/check-qjson: Examine QNum more thoroughly
  tests/check-qjson: Cover number 2^63
  tests/check-qjson: Replace redundant large_number()
  tests/check-qnum: Cover qnum_to_string() for "unround" argument
  qobject: Fix qnum_to_string() to use sufficient precision
  test-string-output-visitor: Cover "unround" number
  string-output-visitor: Fix to use sufficient precision
  test-visitor-serialization: Drop insufficient precision workaround
  test-visitor-serialization: Clean up test_primitives()

 qapi/string-output-visitor.c       |   2 +-
 qobject/qnum.c                     |  24 +----
 tests/check-qjson.c                | 146 +++++++++++++++--------------
 tests/check-qnum.c                 |   8 +-
 tests/test-string-output-visitor.c |   4 +-
 tests/test-visitor-serialization.c |  62 +++++++-----
 6 files changed, 127 insertions(+), 119 deletions(-)

-- 
2.26.2


