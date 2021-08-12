Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493D13EA853
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 18:15:22 +0200 (CEST)
Received: from localhost ([::1]:48938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEDMX-0002Q8-BY
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 12:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mEDJ8-0005DI-EZ
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:11:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mEDJ3-0001NO-AG
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:11:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628784704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EL2VsEhR1j0lsjc5jjsBQpwoGvLGxO5iSbxdfeEUt4k=;
 b=YAkJoVa/+80SkRtDbjni3sF1JH87HO9Yib7PGN+UEaUxgkZi3dGHc0h0SrPhtMiMgorySC
 KOUey13+3irrGW9FecFKK8bV8RXo1BPuGBHNg3590B2SoFfyZjfNZrFnRW8NbSeXfoqPR7
 e+xPqjDZKfms7HGnNgnUQQr1VTFRGaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-5q4Ubgu0PIOYoIzm0_fQUw-1; Thu, 12 Aug 2021 12:11:40 -0400
X-MC-Unique: 5q4Ubgu0PIOYoIzm0_fQUw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D834618C8C01
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 16:11:38 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4B3B5C23A;
 Thu, 12 Aug 2021 16:11:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] qapi: Add support for aliases
Date: Thu, 12 Aug 2021 18:11:25 +0200
Message-Id: <20210812161131.92017-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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

    https://repo.or.cz/qemu/kevin.git qapi-alias-chardev-v3

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


Kevin Wolf (6):
  qapi: Add interfaces for alias support to Visitor
  qapi: Remember alias definitions in qobject-input-visitor
  qapi: Simplify full_name_nth() in qobject-input-visitor
  qapi: Apply aliases in qobject-input-visitor
  qapi: Add support for aliases
  tests/qapi-schema: Test cases for aliases

 docs/devel/qapi-code-gen.rst                  | 104 ++++-
 docs/sphinx/qapidoc.py                        |   2 +-
 include/qapi/visitor-impl.h                   |  12 +
 include/qapi/visitor.h                        |  59 ++-
 qapi/qapi-visit-core.c                        |  22 +
 qapi/qobject-input-visitor.c                  | 417 ++++++++++++++++--
 tests/unit/test-qobject-input-visitor.c       | 218 +++++++++
 scripts/qapi/expr.py                          |  47 +-
 scripts/qapi/schema.py                        | 116 ++++-
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
 tests/qapi-schema/double-type.err             |   2 +-
 tests/qapi-schema/meson.build                 |  16 +
 tests/qapi-schema/qapi-schema-test.json       |  26 ++
 tests/qapi-schema/qapi-schema-test.out        |  31 ++
 tests/qapi-schema/unknown-expr-key.err        |   2 +-
 65 files changed, 1163 insertions(+), 53 deletions(-)
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


