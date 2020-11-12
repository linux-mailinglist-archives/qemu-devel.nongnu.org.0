Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797A12B0B4A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 18:30:59 +0100 (CET)
Received: from localhost ([::1]:43042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdGQz-0002gE-Vd
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 12:30:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGPD-00018D-9A
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:29:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGP9-0006oW-NQ
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605202142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=94IXsN9epDb2wctBrxLYMXGggDhmsvej44YMXMsJExk=;
 b=SF6Ij/7KqtOKT5E61cIMjCUaSIKK1a4NfS4A2Xrhx2vPXu5BOkHV0kR36ts0rDom+jicoU
 xSt1/8oQyMS+77ElrdR8hukLZzWPpkVuX9AOTu+rpOcToIQk8H0ha55m5UOAyZLyR5KIXy
 Won3AG5jYQYEJnMTDLM56fG2Znkw2cs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-MpaIFR_ENm27TgDUyZhbDQ-1; Thu, 12 Nov 2020 12:28:59 -0500
X-MC-Unique: MpaIFR_ENm27TgDUyZhbDQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C63B186DD44
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:28:58 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DE005D9E4;
 Thu, 12 Nov 2020 17:28:57 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] qapi: Add support for aliases
Date: Thu, 12 Nov 2020 18:28:44 +0100
Message-Id: <20201112172850.401925-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

    https://repo.or.cz/qemu/kevin.git qapi-alias-chardev-v1

Kevin Wolf (6):
  qapi: Add interfaces for alias support to Visitor
  qapi: Remember alias definitions in qobject-input-visitor
  qapi: Simplify full_name_nth() in qobject-input-visitor
  qapi: Apply aliases in qobject-input-visitor
  qapi: Add support for aliases
  tests/qapi-schema: Test cases for aliases

 docs/devel/qapi-code-gen.txt                  |  37 +-
 docs/sphinx/qapidoc.py                        |   2 +-
 include/qapi/visitor-impl.h                   |  12 +
 include/qapi/visitor.h                        |  37 ++
 qapi/qapi-visit-core.c                        |  21 ++
 qapi/qobject-input-visitor.c                  | 322 ++++++++++++++++--
 scripts/qapi/expr.py                          |  34 +-
 scripts/qapi/schema.py                        |  27 +-
 scripts/qapi/types.py                         |   4 +-
 scripts/qapi/visit.py                         |  33 +-
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
 tests/qapi-schema/alias-source-bad-type.err   |   2 +
 tests/qapi-schema/alias-source-bad-type.json  |   3 +
 tests/qapi-schema/alias-source-bad-type.out   |   0
 .../alias-source-elem-bad-type.err            |   2 +
 .../alias-source-elem-bad-type.json           |   3 +
 .../alias-source-elem-bad-type.out            |   0
 tests/qapi-schema/alias-source-empty.err      |   2 +
 tests/qapi-schema/alias-source-empty.json     |   3 +
 tests/qapi-schema/alias-source-empty.out      |   0
 tests/qapi-schema/alias-unknown-key.err       |   3 +
 tests/qapi-schema/alias-unknown-key.json      |   3 +
 tests/qapi-schema/alias-unknown-key.out       |   0
 tests/qapi-schema/aliases-bad-type.err        |   2 +
 tests/qapi-schema/aliases-bad-type.json       |   3 +
 tests/qapi-schema/aliases-bad-type.out        |   0
 tests/qapi-schema/double-type.err             |   2 +-
 tests/qapi-schema/meson.build                 |   8 +
 tests/qapi-schema/qapi-schema-test.json       |  24 ++
 tests/qapi-schema/qapi-schema-test.out        |  29 ++
 tests/qapi-schema/unknown-expr-key.err        |   2 +-
 40 files changed, 596 insertions(+), 46 deletions(-)
 create mode 100644 tests/qapi-schema/alias-bad-type.err
 create mode 100644 tests/qapi-schema/alias-bad-type.json
 create mode 100644 tests/qapi-schema/alias-bad-type.out
 create mode 100644 tests/qapi-schema/alias-missing-source.err
 create mode 100644 tests/qapi-schema/alias-missing-source.json
 create mode 100644 tests/qapi-schema/alias-missing-source.out
 create mode 100644 tests/qapi-schema/alias-name-bad-type.err
 create mode 100644 tests/qapi-schema/alias-name-bad-type.json
 create mode 100644 tests/qapi-schema/alias-name-bad-type.out
 create mode 100644 tests/qapi-schema/alias-source-bad-type.err
 create mode 100644 tests/qapi-schema/alias-source-bad-type.json
 create mode 100644 tests/qapi-schema/alias-source-bad-type.out
 create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.err
 create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.json
 create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.out
 create mode 100644 tests/qapi-schema/alias-source-empty.err
 create mode 100644 tests/qapi-schema/alias-source-empty.json
 create mode 100644 tests/qapi-schema/alias-source-empty.out
 create mode 100644 tests/qapi-schema/alias-unknown-key.err
 create mode 100644 tests/qapi-schema/alias-unknown-key.json
 create mode 100644 tests/qapi-schema/alias-unknown-key.out
 create mode 100644 tests/qapi-schema/aliases-bad-type.err
 create mode 100644 tests/qapi-schema/aliases-bad-type.json
 create mode 100644 tests/qapi-schema/aliases-bad-type.out

-- 
2.28.0


