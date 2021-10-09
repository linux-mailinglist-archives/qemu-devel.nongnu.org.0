Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E814279FF
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 14:12:39 +0200 (CEST)
Received: from localhost ([::1]:60346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZBDQ-0001YN-SW
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 08:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZBB6-0007xo-N2
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 08:10:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZBB4-00075k-9m
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 08:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633781409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J+NpfGHIdZR/t2RNvfUt4V6WeWACP6/OZs62ORHwdb4=;
 b=EC35VfgfmJbo+7MoS+MEsDYDIThToPXFJnYnyNBAKIFU23q1/waJtB3RoMoXtPqXaJNOg+
 G0YqiEyrSn73vextYElK2GK89Dk06QubSAnxL4eojEa1LKdGmHFucxewueqiBmCTHsDR2W
 kQYqwmbu/MrAWA0jLJOYDoIpLETSkco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-wgYlxa26Pd-l_k0WBGuLjQ-1; Sat, 09 Oct 2021 08:10:08 -0400
X-MC-Unique: wgYlxa26Pd-l_k0WBGuLjQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27056801A93;
 Sat,  9 Oct 2021 12:10:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBED326E48;
 Sat,  9 Oct 2021 12:09:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 40AE7113865F; Sat,  9 Oct 2021 14:09:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] qapi: Add feature flags to enum members
Date: Sat,  9 Oct 2021 14:09:39 +0200
Message-Id: <20211009120944.2858887-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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

 docs/devel/qapi-code-gen.rst                  | 10 ++++---
 qapi/compat.json                              |  3 +++
 qapi/introspect.json                          | 24 +++++++++++++++--
 qapi/transaction.json                         |  5 +++-
 include/qapi/qobject-input-visitor.h          |  4 ---
 include/qapi/qobject-output-visitor.h         |  4 ---
 include/qapi/util.h                           |  6 ++++-
 include/qapi/visitor-impl.h                   |  3 +++
 include/qapi/visitor.h                        |  9 +++++++
 qapi/qapi-visit-core.c                        | 27 ++++++++++++++++---
 qapi/qmp-dispatch.c                           |  4 +--
 qapi/qobject-input-visitor.c                  | 14 +---------
 qapi/qobject-output-visitor.c                 | 14 +---------
 scripts/qapi/expr.py                          |  3 ++-
 scripts/qapi/introspect.py                    | 19 ++++++++++---
 scripts/qapi/schema.py                        | 22 +++++++++++++--
 scripts/qapi/types.py                         | 17 +++++++++++-
 tests/qapi-schema/doc-good.json               |  5 +++-
 tests/qapi-schema/doc-good.out                |  3 +++
 tests/qapi-schema/doc-good.txt                |  3 +++
 .../qapi-schema/enum-dict-member-unknown.err  |  2 +-
 tests/qapi-schema/qapi-schema-test.json       |  3 ++-
 tests/qapi-schema/qapi-schema-test.out        |  1 +
 tests/qapi-schema/test-qapi.py                |  1 +
 24 files changed, 149 insertions(+), 57 deletions(-)

-- 
2.31.1


