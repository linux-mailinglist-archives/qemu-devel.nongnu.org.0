Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DDA6A0AC6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:40:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBps-0002h9-BP; Thu, 23 Feb 2023 08:40:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVBpq-0002gH-E5
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:40:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVBpo-0008Dm-RN
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:40:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677159632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8liVE5mdqmFP58nMB1a9Gst/EK24HIgmPWc2MojNkks=;
 b=civM6T9UgfAn5n5Y3nX0kYUHNSi11dz6fnx5ojDC4H9ttN8rf3gyaE9KY76aZU9BPY0zKB
 YDSX+NqMK5hi5f7bZtyElnWcyuB4uEfssekKifyIw3ukt7vmOrix1NY2TA5m6FfapIjevR
 uypwTYYHT0qM9ODdozMSxbbPbDxGC3M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-E0k60GNRO5yqs_ASfdnvcQ-1; Thu, 23 Feb 2023 08:40:30 -0500
X-MC-Unique: E0k60GNRO5yqs_ASfdnvcQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 858603C025B4;
 Thu, 23 Feb 2023 13:40:30 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 732AF40C10FA;
 Thu, 23 Feb 2023 13:40:29 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Het Gala <het.gala@nutanix.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 0/3] qapi: allow unions to contain further unions
Date: Thu, 23 Feb 2023 13:40:24 +0000
Message-Id: <20230223134027.2294640-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

Currently it is not possible for a union type to contain a
further union as one (or more) of its branches. This relaxes
that restriction and adds the calls needed to validate field
name uniqueness as unions are flattened.

In v2:

  * Improve specificity of type/members descriptions for
    error reporting scenarios
  * Make it easier to regenerate qapi test output
  * Move expected "good data" into qapi-schema-test.json
  * Add description to "bad data" test files
  * Add unit tests to cover union-in-union serialization
    / deserialization to/from JSON

Daniel P. Berrangé (3):
  qapi: improve specificity of type/member descriptions
  qapi: use env var to trigger qapi test output updates
  qapi: allow unions to contain further unions

 scripts/qapi/schema.py                        | 11 ++--
 tests/qapi-schema/alternate-any.err           |  2 +-
 .../alternate-conflict-bool-string.err        |  2 +-
 tests/qapi-schema/alternate-conflict-dict.err |  2 +-
 .../alternate-conflict-enum-bool.err          |  2 +-
 .../alternate-conflict-enum-int.err           |  2 +-
 .../qapi-schema/alternate-conflict-lists.err  |  2 +-
 .../alternate-conflict-num-string.err         |  2 +-
 .../qapi-schema/alternate-conflict-string.err |  2 +-
 tests/qapi-schema/alternate-nested.err        |  2 +-
 tests/qapi-schema/alternate-unknown.err       |  2 +-
 tests/qapi-schema/args-member-unknown.err     |  2 +-
 tests/qapi-schema/enum-clash-member.err       |  2 +-
 tests/qapi-schema/features-duplicate-name.err |  2 +-
 tests/qapi-schema/meson.build                 |  2 +
 tests/qapi-schema/qapi-schema-test.json       | 32 ++++++++++
 tests/qapi-schema/qapi-schema-test.out        | 29 ++++++++++
 tests/qapi-schema/struct-base-clash-deep.err  |  2 +-
 tests/qapi-schema/struct-base-clash.err       |  2 +-
 .../qapi-schema/struct-member-name-clash.err  |  2 +-
 tests/qapi-schema/test-qapi.py                |  3 +-
 tests/qapi-schema/union-bad-base.err          |  2 +-
 tests/qapi-schema/union-int-branch.err        |  2 +-
 .../union-invalid-union-subfield.err          |  2 +
 .../union-invalid-union-subfield.json         | 30 ++++++++++
 .../union-invalid-union-subfield.out          |  0
 .../union-invalid-union-subtype.err           |  2 +
 .../union-invalid-union-subtype.json          | 29 ++++++++++
 .../union-invalid-union-subtype.out           |  0
 tests/qapi-schema/union-unknown.err           |  2 +-
 tests/unit/test-qobject-input-visitor.c       | 47 +++++++++++++++
 tests/unit/test-qobject-output-visitor.c      | 58 +++++++++++++++++++
 32 files changed, 257 insertions(+), 26 deletions(-)
 create mode 100644 tests/qapi-schema/union-invalid-union-subfield.err
 create mode 100644 tests/qapi-schema/union-invalid-union-subfield.json
 create mode 100644 tests/qapi-schema/union-invalid-union-subfield.out
 create mode 100644 tests/qapi-schema/union-invalid-union-subtype.err
 create mode 100644 tests/qapi-schema/union-invalid-union-subtype.json
 create mode 100644 tests/qapi-schema/union-invalid-union-subtype.out

-- 
2.39.2


