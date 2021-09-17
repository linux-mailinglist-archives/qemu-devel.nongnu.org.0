Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9046540FDEF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:31:23 +0200 (CEST)
Received: from localhost ([::1]:40488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGlm-0005yc-Kt
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mRGUh-0007QY-60
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:13:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mRGUc-0005rT-1L
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:13:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631895215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qdgu37w88DJMRPaklZUp1cwI02el6LlbveHWc9NkObM=;
 b=COkYbUORhr1eSr8jMiYw2SpCAoIK+LIC1P+JBe2jP6vyB4kwOBgqP0EK62X/2ohV99Iqgq
 Wr8AnUf5tJPfRiZk0QoNT8P6sBF2cE6s56VltYYYTpEBjlAHsZNVGVWYVsoqbdJHkA7MmL
 VepGrn4miAVT7xPnL5kfdrGiK6wwdwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-uPtpW-IXMDiB8Viw82-hcQ-1; Fri, 17 Sep 2021 12:13:32 -0400
X-MC-Unique: uPtpW-IXMDiB8Viw82-hcQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7631F10168C7
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 16:13:31 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F2F87A5C5;
 Fri, 17 Sep 2021 16:13:30 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/8] qapi: Add support for aliases
Date: Fri, 17 Sep 2021 18:13:12 +0200
Message-Id: <20210917161320.201086-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series introduces alias definitions for QAPI object types (structs
and unions).

This allows using the same QAPI type and visitor even when the syntax
has some variations between different external interfaces such as QMP
and the command line.

It also provides a new tool for evolving the schema while maintaining
backwards compatibility (possibly during a deprecation period).

The first user is intended to be a QAPIfied -chardev command line
option, for which I'll send a separate series. A git tag is available
that contains both this series and the chardev changes that make use of
it:

    https://repo.or.cz/qemu/kevin.git qapi-alias-chardev-v4

v4:
- Make sure to keep a defined order of aliases in StackObject.aliases
- Added patch 4 to allow for better error messages when wildcard aliases
  provide a second value for a member, which may or may not be consumed
  elsewhere.
- Resolve chained aliases only once instead of just checking that they
  can be resolved while looking for matching aliases, and actually
  resolving them at the end. This is not only a code simplification, but
  actually necessary for correct error messages on conflicts.
- Separate schema.py cleanup patch by Markus ('qapi: Revert an
  accidental change from list to view object')
- Fixed alias name checks in the QAPI generator
- Changed check_path() to avoid modifying its 'path' parameter
- Some more test cases
- Coding style fixes
- Documentation improvements

v3:
- Mention the new functions in the big comment in visitor.h. However,
  since the comment is about users of the visitor rather than the
  generated code, it seems like to wrong place to go into details.
- Updated commit message for patch 3 ('Simplify full_name_nth() ...')
- Patch 4 ('qapi: Apply aliases in qobject-input-visitor'):
    - Multiple matching wildcard aliases are considered conflicting now
    - Improved comments for several functions
    - Renamed bool *implicit_object into *is_alias_prefix, which
      describes better what it is rather than what it is used for
    - Simplified alias_present() into input_present()
    - Fixed potential use of wrong StackObject in error message
- Patch 5 ('qapi: Add support for aliases'):
    - Made QAPISchemaAlias a QAPISchemaMember
    - Check validity of alias source paths (must exist in at least one
      variant, no optional objects in the path of a wildcard alias, no
      alias loops)
- Many new tests cases, both positive and negative, including unit tests
  of the generated visit functions
- Coding style changes
- Rebased documentation (.txt -> .rst conversion in master)

v2:
- Renamed 'alias' to 'name' in all data structures describing aliases
- Tons of new or changed comments and other documentation
- Be more explicit that empty 'source' is invalid and assert it
- Fixed full_name_so() for lists (added a parameter to tell the function
  whether the name of a list member or the list itself is meant)
- Changed some QAPI generator error messages
- Assert the type of parameters in QAPISchemaAlias.__init__()

Kevin Wolf (7):
  qapi: Add interfaces for alias support to Visitor
  qapi: Remember alias definitions in qobject-input-visitor
  qapi: Simplify full_name_nth() in qobject-input-visitor
  qapi: Store Error in StackObject.h for qobject-input-visitor
  qapi: Apply aliases in qobject-input-visitor
  qapi: Add support for aliases
  tests/qapi-schema: Test cases for aliases

Markus Armbruster (1):
  qapi: Revert an accidental change from list to view object

 docs/devel/qapi-code-gen.rst                  | 109 ++++-
 docs/sphinx/qapidoc.py                        |   2 +-
 include/qapi/visitor-impl.h                   |  12 +
 include/qapi/visitor.h                        |  59 ++-
 qapi/qapi-visit-core.c                        |  22 +
 qapi/qobject-input-visitor.c                  | 452 ++++++++++++++++--
 tests/unit/test-qmp-cmds.c                    |  10 +
 tests/unit/test-qobject-input-visitor.c       | 271 +++++++++++
 scripts/qapi/expr.py                          |  54 ++-
 scripts/qapi/schema.py                        | 117 ++++-
 scripts/qapi/types.py                         |   4 +-
 scripts/qapi/visit.py                         |  34 +-
 tests/qapi-schema/test-qapi.py                |   7 +-
 tests/qapi-schema/alias-bad-type.err          |   2 +
 tests/qapi-schema/alias-bad-type.json         |   3 +
 tests/qapi-schema/alias-bad-type.out          |   0
 tests/qapi-schema/alias-missing-source.err    |   2 +
 tests/qapi-schema/alias-missing-source.json   |   3 +
 tests/qapi-schema/alias-missing-source.out    |   0
 tests/qapi-schema/alias-name-bad-type.err     |   2 +
 tests/qapi-schema/alias-name-bad-type.json    |   3 +
 tests/qapi-schema/alias-name-bad-type.out     |   0
 tests/qapi-schema/alias-name-conflict.err     |   2 +
 tests/qapi-schema/alias-name-conflict.json    |   4 +
 tests/qapi-schema/alias-name-conflict.out     |   0
 tests/qapi-schema/alias-recursive.err         |   2 +
 tests/qapi-schema/alias-recursive.json        |   4 +
 tests/qapi-schema/alias-recursive.out         |   0
 tests/qapi-schema/alias-source-bad-type.err   |   2 +
 tests/qapi-schema/alias-source-bad-type.json  |   3 +
 tests/qapi-schema/alias-source-bad-type.out   |   0
 .../alias-source-elem-bad-type.err            |   2 +
 .../alias-source-elem-bad-type.json           |   3 +
 .../alias-source-elem-bad-type.out            |   0
 tests/qapi-schema/alias-source-empty.err      |   2 +
 tests/qapi-schema/alias-source-empty.json     |   3 +
 tests/qapi-schema/alias-source-empty.out      |   0
 .../alias-source-inexistent-variants.err      |   2 +
 .../alias-source-inexistent-variants.json     |  12 +
 .../alias-source-inexistent-variants.out      |   0
 tests/qapi-schema/alias-source-inexistent.err |   2 +
 .../qapi-schema/alias-source-inexistent.json  |   3 +
 tests/qapi-schema/alias-source-inexistent.out |   0
 .../alias-source-non-object-path.err          |   2 +
 .../alias-source-non-object-path.json         |   3 +
 .../alias-source-non-object-path.out          |   0
 .../alias-source-non-object-wildcard.err      |   2 +
 .../alias-source-non-object-wildcard.json     |   3 +
 .../alias-source-non-object-wildcard.out      |   0
 ...lias-source-optional-wildcard-indirect.err |   2 +
 ...ias-source-optional-wildcard-indirect.json |   6 +
 ...lias-source-optional-wildcard-indirect.out |   0
 .../alias-source-optional-wildcard.err        |   2 +
 .../alias-source-optional-wildcard.json       |   5 +
 .../alias-source-optional-wildcard.out        |   0
 tests/qapi-schema/alias-unknown-key.err       |   3 +
 tests/qapi-schema/alias-unknown-key.json      |   3 +
 tests/qapi-schema/alias-unknown-key.out       |   0
 tests/qapi-schema/aliases-bad-type.err        |   2 +
 tests/qapi-schema/aliases-bad-type.json       |   3 +
 tests/qapi-schema/aliases-bad-type.out        |   0
 tests/qapi-schema/meson.build                 |  16 +
 tests/qapi-schema/qapi-schema-test.json       |  35 ++
 tests/qapi-schema/qapi-schema-test.out        |  44 ++
 tests/qapi-schema/unknown-expr-key.err        |   2 +-
 65 files changed, 1290 insertions(+), 57 deletions(-)
 create mode 100644 tests/qapi-schema/alias-bad-type.err
 create mode 100644 tests/qapi-schema/alias-bad-type.json
 create mode 100644 tests/qapi-schema/alias-bad-type.out
 create mode 100644 tests/qapi-schema/alias-missing-source.err
 create mode 100644 tests/qapi-schema/alias-missing-source.json
 create mode 100644 tests/qapi-schema/alias-missing-source.out
 create mode 100644 tests/qapi-schema/alias-name-bad-type.err
 create mode 100644 tests/qapi-schema/alias-name-bad-type.json
 create mode 100644 tests/qapi-schema/alias-name-bad-type.out
 create mode 100644 tests/qapi-schema/alias-name-conflict.err
 create mode 100644 tests/qapi-schema/alias-name-conflict.json
 create mode 100644 tests/qapi-schema/alias-name-conflict.out
 create mode 100644 tests/qapi-schema/alias-recursive.err
 create mode 100644 tests/qapi-schema/alias-recursive.json
 create mode 100644 tests/qapi-schema/alias-recursive.out
 create mode 100644 tests/qapi-schema/alias-source-bad-type.err
 create mode 100644 tests/qapi-schema/alias-source-bad-type.json
 create mode 100644 tests/qapi-schema/alias-source-bad-type.out
 create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.err
 create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.json
 create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.out
 create mode 100644 tests/qapi-schema/alias-source-empty.err
 create mode 100644 tests/qapi-schema/alias-source-empty.json
 create mode 100644 tests/qapi-schema/alias-source-empty.out
 create mode 100644 tests/qapi-schema/alias-source-inexistent-variants.err
 create mode 100644 tests/qapi-schema/alias-source-inexistent-variants.json
 create mode 100644 tests/qapi-schema/alias-source-inexistent-variants.out
 create mode 100644 tests/qapi-schema/alias-source-inexistent.err
 create mode 100644 tests/qapi-schema/alias-source-inexistent.json
 create mode 100644 tests/qapi-schema/alias-source-inexistent.out
 create mode 100644 tests/qapi-schema/alias-source-non-object-path.err
 create mode 100644 tests/qapi-schema/alias-source-non-object-path.json
 create mode 100644 tests/qapi-schema/alias-source-non-object-path.out
 create mode 100644 tests/qapi-schema/alias-source-non-object-wildcard.err
 create mode 100644 tests/qapi-schema/alias-source-non-object-wildcard.json
 create mode 100644 tests/qapi-schema/alias-source-non-object-wildcard.out
 create mode 100644 tests/qapi-schema/alias-source-optional-wildcard-indirect.err
 create mode 100644 tests/qapi-schema/alias-source-optional-wildcard-indirect.json
 create mode 100644 tests/qapi-schema/alias-source-optional-wildcard-indirect.out
 create mode 100644 tests/qapi-schema/alias-source-optional-wildcard.err
 create mode 100644 tests/qapi-schema/alias-source-optional-wildcard.json
 create mode 100644 tests/qapi-schema/alias-source-optional-wildcard.out
 create mode 100644 tests/qapi-schema/alias-unknown-key.err
 create mode 100644 tests/qapi-schema/alias-unknown-key.json
 create mode 100644 tests/qapi-schema/alias-unknown-key.out
 create mode 100644 tests/qapi-schema/aliases-bad-type.err
 create mode 100644 tests/qapi-schema/aliases-bad-type.json
 create mode 100644 tests/qapi-schema/aliases-bad-type.out

-- 
2.31.1


