Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE673FC7DF
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:07:35 +0200 (CEST)
Received: from localhost ([::1]:56892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3UD-0003Y3-V2
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL322-0006IZ-OJ
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL31y-0005IX-7G
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630413501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1dFebuPh6IujlPk66tnszfdy0uIVNk2vs4kZ7HQD4hg=;
 b=ZS/VxYPOhgGeBSkIQMXD110AodP3Wao+5jlpyRsoQigGWvKPlvT983mJFQdia1GQd/nUSv
 dhFq9kayNjPmnuBbMY/dpm6MmetmmoVqc9GG/WPRuLDr1zwsdR895lJ5jUvk56n2/oBUR4
 pn7li4gNzAii2LaZAvdfgxzBnsIpx1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-CHKwPU8POS6jajerPvLlnA-1; Tue, 31 Aug 2021 08:38:19 -0400
X-MC-Unique: CHKwPU8POS6jajerPvLlnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE02F92500;
 Tue, 31 Aug 2021 12:38:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1BF1226E9;
 Tue, 31 Aug 2021 12:38:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 57E0C11380A9; Tue, 31 Aug 2021 14:38:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/12] qapi: Fixes and cleanups for recent work (mostly)
Date: Tue, 31 Aug 2021 14:37:57 +0200
Message-Id: <20210831123809.1107782-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Markus Armbruster (12):
  qapi: Simplify QAPISchemaIfCond's interface for generating C
  qapi: Simplify how QAPISchemaIfCond represents "no condition"
  tests/qapi-schema: Correct two 'if' conditionals
  tests/qapi-schema: Demonstrate broken C code for 'if'
  qapi: Fix C code generation for 'if'
  qapi: Factor common recursion out of cgen_ifcond(), docgen_ifcond()
  qapi: Avoid redundant parens in code generated for conditionals
  qapi: Use "not COND" instead of "!COND" for generated documentation
  qapi: Use re.fullmatch() where appropriate
  tests/qapi-schema: Hide OrderedDict in test output
  qapi: Tweak error messages for missing / conflicting meta-type
  qapi: Tweak error messages for unknown / conflicting 'if' keys

 scripts/qapi/common.py                  | 51 ++++++++++++++-----------
 scripts/qapi/expr.py                    | 32 +++++++---------
 scripts/qapi/gen.py                     |  6 +--
 scripts/qapi/introspect.py              |  6 +--
 scripts/qapi/schema.py                  | 12 +++++-
 scripts/qapi/types.py                   | 22 +++++------
 scripts/qapi/visit.py                   | 14 +++----
 tests/qapi-schema/bad-if-key.err        |  2 +-
 tests/qapi-schema/bad-if-keys.err       |  2 +-
 tests/qapi-schema/doc-good.json         |  2 +-
 tests/qapi-schema/doc-good.out          |  6 +--
 tests/qapi-schema/doc-good.txt          |  8 ++--
 tests/qapi-schema/double-type.err       |  4 +-
 tests/qapi-schema/enum-if-invalid.err   |  2 +-
 tests/qapi-schema/missing-type.err      |  2 +-
 tests/qapi-schema/qapi-schema-test.json |  9 +++--
 tests/qapi-schema/qapi-schema-test.out  | 31 ++++++++-------
 tests/qapi-schema/test-qapi.py          | 11 +++++-
 18 files changed, 118 insertions(+), 104 deletions(-)

-- 
2.31.1


