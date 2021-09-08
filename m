Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCDA403392
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 07:00:23 +0200 (CEST)
Received: from localhost ([::1]:58788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNph8-0002HI-QW
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 01:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNpbe-0007GN-4t
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:54:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNpba-0003nV-2d
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631076876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LYU8W9SsxO3bkQBNNpl74rSp1RhnXVYt9a4EiV78d6c=;
 b=UBmOXShEVZwSemKUOL4geJS9viixvAc31AokRg+H7r2mws2RET2DV/FhtgnYKYWNJ8sQAH
 SWZZCotvXOlvDljzU1Mj8N0Bwfdqp68fXzqp5n6wKQKcMRwAleW5DGQ4jD+koHiKstEP+l
 4RyL3Xjjo3of1JiOk4cue0kcwwnU1Jg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-SwruMeM-Ov2a41oL006dbA-1; Wed, 08 Sep 2021 00:54:35 -0400
X-MC-Unique: SwruMeM-Ov2a41oL006dbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36205180FD8E;
 Wed,  8 Sep 2021 04:54:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F5AD5D9DC;
 Wed,  8 Sep 2021 04:54:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CD54C1138606; Wed,  8 Sep 2021 06:54:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] qapi: Another round of minor fixes and cleanups
Date: Wed,  8 Sep 2021 06:54:23 +0200
Message-Id: <20210908045428.2689093-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster (5):
  qapi: Fix a botched type annotation
  qapi: Drop Indentation.__bool__()
  qapi: Bury some unused code in class Indentation
  tests/qapi-schema: Cover 'not' condition with empty argument
  qapi: Fix bogus error for 'if': { 'not': '' }

 scripts/qapi/common.py            | 19 ++++++-------------
 scripts/qapi/expr.py              | 21 +++++++++++++--------
 tests/qapi-schema/bad-if-not.err  |  2 ++
 tests/qapi-schema/bad-if-not.json |  3 +++
 tests/qapi-schema/bad-if-not.out  |  0
 tests/qapi-schema/meson.build     |  1 +
 6 files changed, 25 insertions(+), 21 deletions(-)
 create mode 100644 tests/qapi-schema/bad-if-not.err
 create mode 100644 tests/qapi-schema/bad-if-not.json
 create mode 100644 tests/qapi-schema/bad-if-not.out

-- 
2.31.1


