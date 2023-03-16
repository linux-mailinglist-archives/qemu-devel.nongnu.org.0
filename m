Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252396BC6DC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:15:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pchoE-0003rg-EL; Thu, 16 Mar 2023 03:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchnw-0003lr-HE
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchnq-0004Y9-1T
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678950809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zDO0mm1C5rACLO6JHyICYOAPeFWd5Zwv3j7fmCaUXYY=;
 b=dmx723bcrMbjCqtb+Y9BgsPckaCBrHIHte/Jj2ngAXvt7LSnJYHxyM4k+gTHYO0X6+LQZS
 GTnRK03bmGvg2SOXOyWBYbclkltuEViS0znBCs2nj2WhMxsGIFC9q93Hi6V1jQJIzgR1Jm
 bsKRvuMhsKWE+EeoOn4u5hCgwwxqbe0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-GR67GZrbNIeWyFG9Pedc1A-1; Thu, 16 Mar 2023 03:13:27 -0400
X-MC-Unique: GR67GZrbNIeWyFG9Pedc1A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AD371C0758A;
 Thu, 16 Mar 2023 07:13:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE251140E95F;
 Thu, 16 Mar 2023 07:13:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E712C21E6806; Thu, 16 Mar 2023 08:13:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 eblake@redhat.com, jsnow@redhat.com
Subject: [PATCH 00/14] qapi: Fix minor bugs,
 require boxed for conditional arguments
Date: Thu, 16 Mar 2023 08:13:11 +0100
Message-Id: <20230316071325.492471-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

PATCH 01-08 fix a few minor bugs I found on the way.  Could be a
separate series, but keeping them here seems simpler.

PATCH 09-12 improve tests for 'if' conditionals.

PATCH 13 fixes a code generation regression, and PATCH 14 rejects uses
conditionals that never worked and aren't worth fixing.

Markus Armbruster (14):
  qapi: Fix error message format regression
  qapi/schema: Use super()
  qapi: Clean up after removal of simple unions
  qapi: Split up check_type()
  qapi: Improve error message for unexpected array types
  qapi: Simplify code a bit after previous commit
  qapi: Fix error message when type name or array is expected
  qapi: Fix to reject 'data': 'mumble' in struct
  tests/qapi-schema: Improve union discriminator coverage
  tests/qapi-schema: Rename a few conditionals
  tests/qapi-schema: Clean up positive test for conditionals
  tests/qapi-schema: Cover optional conditional struct member
  qapi: Fix code generated for optional conditional struct member
  qapi: Require boxed for conditional command and event arguments

 docs/devel/qapi-code-gen.rst                  |   5 +-
 scripts/qapi/commands.py                      |   1 +
 scripts/qapi/expr.py                          | 115 ++++++++++--------
 scripts/qapi/gen.py                           |   1 +
 scripts/qapi/main.py                          |   2 +-
 scripts/qapi/schema.py                        |  16 ++-
 scripts/qapi/visit.py                         |   2 +
 tests/qapi-schema/args-if-implicit.err        |   2 +
 tests/qapi-schema/args-if-implicit.json       |   4 +
 tests/qapi-schema/args-if-implicit.out        |   0
 tests/qapi-schema/args-if-unboxed.err         |   2 +
 tests/qapi-schema/args-if-unboxed.json        |   6 +
 tests/qapi-schema/args-if-unboxed.out         |   0
 tests/qapi-schema/bad-data.err                |   2 +-
 tests/qapi-schema/event-args-if-unboxed.err   |   2 +
 tests/qapi-schema/event-args-if-unboxed.json  |   4 +
 tests/qapi-schema/event-args-if-unboxed.out   |   0
 tests/qapi-schema/event-nest-struct.err       |   2 +-
 tests/qapi-schema/meson.build                 |   3 +
 tests/qapi-schema/nested-struct-data.err      |   2 +-
 tests/qapi-schema/qapi-schema-test.json       |  20 +--
 tests/qapi-schema/qapi-schema-test.out        |  32 ++---
 tests/qapi-schema/returns-dict.err            |   2 +-
 tests/qapi-schema/struct-data-typename.err    |   2 +
 tests/qapi-schema/struct-data-typename.json   |   2 +
 tests/qapi-schema/struct-data-typename.out    |   0
 tests/qapi-schema/struct-member-invalid.err   |   2 +-
 tests/qapi-schema/union-array-branch.err      |   2 +-
 .../union-invalid-discriminator.err           |   2 +-
 .../union-invalid-discriminator.json          |   4 +-
 30 files changed, 141 insertions(+), 98 deletions(-)
 create mode 100644 tests/qapi-schema/args-if-implicit.err
 create mode 100644 tests/qapi-schema/args-if-implicit.json
 create mode 100644 tests/qapi-schema/args-if-implicit.out
 create mode 100644 tests/qapi-schema/args-if-unboxed.err
 create mode 100644 tests/qapi-schema/args-if-unboxed.json
 create mode 100644 tests/qapi-schema/args-if-unboxed.out
 create mode 100644 tests/qapi-schema/event-args-if-unboxed.err
 create mode 100644 tests/qapi-schema/event-args-if-unboxed.json
 create mode 100644 tests/qapi-schema/event-args-if-unboxed.out
 create mode 100644 tests/qapi-schema/struct-data-typename.err
 create mode 100644 tests/qapi-schema/struct-data-typename.json
 create mode 100644 tests/qapi-schema/struct-data-typename.out

-- 
2.39.2


