Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27EE435EFB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:23:57 +0200 (CEST)
Received: from localhost ([::1]:48042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVEp-0006Pl-7n
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdVBY-0002zS-Fq
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:20:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdVBT-0002Cx-3T
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634811625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M5/xnV7Bw0FGlOwd/INg1rBChrPG0nqDdjABQNzVRPQ=;
 b=SfEU6ZrRqlipzGqZ6brZsrPXNAsp+SearL2x6OQQZRrGS3SlipkBtAz9/dS25xjFYDwG1n
 gL/vC7dv2alBJcEmI44aVPmvbGhGWaJSc8XfKxIMYw3IGrgksXNisMoP2UeATPct15vuPi
 CmyhkRIksi8lQEDUm2S/EmpO++Gygs4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-5gSryh-3M8WSXBL-6h7C7Q-1; Thu, 21 Oct 2021 06:20:24 -0400
X-MC-Unique: 5gSryh-3M8WSXBL-6h7C7Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C22421922960;
 Thu, 21 Oct 2021 10:20:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 088921346F;
 Thu, 21 Oct 2021 10:20:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5722111380A7; Thu, 21 Oct 2021 12:20:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] qapi: Add feature flags to enum members
Date: Thu, 21 Oct 2021 12:19:56 +0200
Message-Id: <20211021102001.803780-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PATCH 1+2 add feature flags to enum members.  Awkward due to an
introspection design mistake; see PATCH 1 for details.

PATCH 3+4 implement policy deprecated-input={reject,crash} for enum
values.

Policy deprecated-output=hide is not implemented, because we can't
hide a value without hiding the entire member, which is almost
certainly more than the requester of this policy bargained for.
Perhaps we want a new policy deprecated-output=hide-or-else-crash to
help us catch unwanted use of deprecated enum values.  Perhaps we want
deprecated-output=hide to behave that way together with
deprecated-input=crash.  Or even always.  Thoughts?

PATCH 5 puts the new feature flags to use.  It's RFC because it makes
sense only on top of Vladimir's deprecation of drive-backup.  See its
commit message for a reference.

I prefer to commit new features together with a use outside tests/.
PATCH 5 adds such a use, but it's RFC, because it depends on
Vladimir's work.  Perhaps another use pops up.  I can delay this work
in the hope of a use becoming ready, but the feature flags work I have
in the pipeline will eventually force my hand.

v3:
* PATCH 1+2: Update qapi-code-gen.rst [Kevin, Eric]
* PATCH 4: Commit message typo [Eric], doc update moved to PATCH 2
* PATCH 5: Doc comment FIXME resolved [Kevin]

v2:
* Rebased with straightforward conflicts.
* PATCH 1-4: No longer RFC.
* PATCH 1: "Since" information fixed [Eric].  Commit message updated
  to reflect feedback.
* PATCH 2: Commit message amended to point out special feature flag
 'deprecated' is ignored at this stage.
* PATCH 4: Documentation updated.  Commit message tweaked.

Markus Armbruster (5):
  qapi: Enable enum member introspection to show more than name
  qapi: Add feature flags to enum members
  qapi: Move compat policy from QObject to generic visitor
  qapi: Implement deprecated-input={reject,crash} for enum values
  block: Deprecate transaction type drive-backup

 docs/devel/qapi-code-gen.rst                  | 29 ++++++++++++++-----
 qapi/compat.json                              |  3 ++
 qapi/introspect.json                          | 24 +++++++++++++--
 qapi/transaction.json                         |  6 +++-
 include/qapi/qobject-input-visitor.h          |  4 ---
 include/qapi/qobject-output-visitor.h         |  4 ---
 include/qapi/util.h                           |  6 +++-
 include/qapi/visitor-impl.h                   |  3 ++
 include/qapi/visitor.h                        |  9 ++++++
 qapi/qapi-visit-core.c                        | 27 +++++++++++++++--
 qapi/qmp-dispatch.c                           |  4 +--
 qapi/qobject-input-visitor.c                  | 14 +--------
 qapi/qobject-output-visitor.c                 | 14 +--------
 scripts/qapi/expr.py                          |  3 +-
 scripts/qapi/introspect.py                    | 19 +++++++++---
 scripts/qapi/schema.py                        | 22 ++++++++++++--
 scripts/qapi/types.py                         | 17 ++++++++++-
 tests/qapi-schema/doc-good.json               |  5 +++-
 tests/qapi-schema/doc-good.out                |  3 ++
 tests/qapi-schema/doc-good.txt                |  3 ++
 .../qapi-schema/enum-dict-member-unknown.err  |  2 +-
 tests/qapi-schema/qapi-schema-test.json       |  3 +-
 tests/qapi-schema/qapi-schema-test.out        |  1 +
 tests/qapi-schema/test-qapi.py                |  1 +
 24 files changed, 164 insertions(+), 62 deletions(-)

-- 
2.31.1


