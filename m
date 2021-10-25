Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212A3438E4C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 06:26:32 +0200 (CEST)
Received: from localhost ([::1]:58352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1merZ9-0008TP-6u
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 00:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1merXE-0005ts-QB
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 00:24:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1merXB-0005xU-1J
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 00:24:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635135868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C1bxXssOZUTyqyw1pJwH6+YUie+Eu2DIfKgiO11kqnI=;
 b=Xd2WuhtQ20c44Wp5sf6gqm91U/Xr7jhlPp1HL+5gRXX3pdGrKbgdFfz51ZD/z0a74FXJje
 tnuHC+WePwe5aJPWS9hWRkCAARNptHHImns/C6/tBf1zHeE6vVNXk/ADN3kI4Yp8J4Ai8o
 LwfYnnOFB3tDAV7C5aPMTnF/iOwFWhk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-MIUoVf69MI6Bkz9AX9uiqQ-1; Mon, 25 Oct 2021 00:24:26 -0400
X-MC-Unique: MIUoVf69MI6Bkz9AX9uiqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4BF1806688;
 Mon, 25 Oct 2021 04:24:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABB9460BF4;
 Mon, 25 Oct 2021 04:24:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F2A4911380A7; Mon, 25 Oct 2021 06:24:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/5] qapi: Add feature flags to enum members
Date: Mon, 25 Oct 2021 06:24:00 +0200
Message-Id: <20211025042405.3762351-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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

v4:
* PATCH 1: Deprecate SchemaInfoEnum member @values.
* PATCH 2: Doc tweak

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

 docs/about/deprecated.rst                     |  6 ++++
 docs/devel/qapi-code-gen.rst                  | 29 ++++++++++++++-----
 qapi/compat.json                              |  3 ++
 qapi/introspect.json                          | 28 ++++++++++++++++--
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
 25 files changed, 174 insertions(+), 62 deletions(-)

-- 
2.31.1


