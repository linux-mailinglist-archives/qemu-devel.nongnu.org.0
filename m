Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14CA207C72
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 21:56:35 +0200 (CEST)
Received: from localhost ([::1]:36374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joBVb-0000tL-2Q
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 15:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1joBNd-0000Qk-I6
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 15:48:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47247
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1joBNb-0002Sw-NK
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 15:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593028099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eRdvmXqVejt1FVKWl/7McxoYxHEhIc5uzxpFg0oZVaM=;
 b=JvKBF3bqFG8/oLSDGPKAYBqili64s01utQfmtaQPAnRIjwIiiq1tknV4RIIlM1tO4IesBb
 fODN7jO6Eq8I30BUFbXHBCC+zx5U4CLGr6ktw8OWZC4wyDwakbjhMQdSFqQdNEVFPJWwT5
 DilOjtDJLdvTbgNxBadPZ5FuQjHAQFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-UA-6b_xzP6-0sgoxBAuJiQ-1; Wed, 24 Jun 2020 15:48:17 -0400
X-MC-Unique: UA-6b_xzP6-0sgoxBAuJiQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71EC0464;
 Wed, 24 Jun 2020 19:48:16 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E74ED2B4AF;
 Wed, 24 Jun 2020 19:48:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com
Subject: [PATCH v3 0/2] Avoid abort on QMP attempt to add an object with
 duplicate id
Date: Wed, 24 Jun 2020 21:48:07 +0200
Message-Id: <20200624194809.26600-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Attempting to add an object through QMP with an id that is
already used leads to a qemu abort. This is a regression since
d2623129a7de ("qom: Drop parameter @errp of object_property_add()
& friends").

The first patch fixes the issue and the second patch adds a test
to check the error is gracefully returned to the QMP client.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/qom-graceful-v3

History:
- v2 -> v3:
  - don't take the object reference on failure in
    object_property_try_add_child
  - add g_assert_nonnull(resp) in 2/2 while keeping
    Thomas A-b

- v1 -> v2:
  - use the try terminology.
  - turn object_property_try_add() into a non-static function
  - add the test


Eric Auger (2):
  qom: Introduce object_property_try_add_child()
  tests/qmp-cmd-test: Add qmp/object-add-duplicate-id

 include/qom/object.h       | 24 ++++++++++++++++++++++--
 qom/object.c               | 21 ++++++++++++++++-----
 qom/object_interfaces.c    |  7 +++++--
 tests/qtest/qmp-cmd-test.c | 19 +++++++++++++++++++
 4 files changed, 62 insertions(+), 9 deletions(-)

-- 
2.20.1


