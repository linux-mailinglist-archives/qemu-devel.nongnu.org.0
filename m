Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAD16E9027
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:27:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRUm-0008LQ-QQ; Thu, 20 Apr 2023 06:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppRUk-0008Jn-Db
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:26:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppRUh-00046J-PG
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:26:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681986385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=B0fOMvg+2biPB6y5D8YV+LZO48Ztoi7Rb0OWDrKCxq4=;
 b=SA6NnurbKme+vRPsYgb/gRbnrl4hZcO2yO8SAvg4jpa/0tWh8cfGPsi+YMtz3OLFtPgOvO
 /Cb+FFcepRPPnADaRkQlRNVL1Hm2QRxLY2RV7T8n0HOVQ0jG9pQgit1iJJ8GVg4+gZIJ1h
 HBF3rh9i0oz9nfQlz6tlWG0BK8VByi8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-njdGCHpDM-iifD-JdZRsEA-1; Thu, 20 Apr 2023 06:26:22 -0400
X-MC-Unique: njdGCHpDM-iifD-JdZRsEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDDA1185A78F;
 Thu, 20 Apr 2023 10:26:21 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.42.28.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEAB42166B33;
 Thu, 20 Apr 2023 10:26:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Het Gala <het.gala@nutanix.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 0/3] qapi: allow unions to contain further unions
Date: Thu, 20 Apr 2023 11:26:16 +0100
Message-Id: <20230420102619.348173-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In v3:

  * Use markus' suggestion for improved error messages
  * Set env var default in argparse directly

In v2:

  * Improve specificity of type/members descriptions for
    error reporting scenarios
  * Make it easier to regenerate qapi test output
  * Move expected "good data" into qapi-schema-test.json
  * Add description to "bad data" test files
  * Add unit tests to cover union-in-union serialization
    / deserialization to/from JSON

Daniel P. Berrangé (3):
  qapi: support updating expected test output via make
  qapi: improve specificity of type/member descriptions
  qapi: allow unions to contain further unions

 scripts/qapi/schema.py                        | 15 +++--
 tests/qapi-schema/meson.build                 |  2 +
 tests/qapi-schema/qapi-schema-test.json       | 32 ++++++++++
 tests/qapi-schema/qapi-schema-test.out        | 29 ++++++++++
 tests/qapi-schema/test-qapi.py                |  1 +
 .../union-invalid-union-subfield.err          |  2 +
 .../union-invalid-union-subfield.json         | 30 ++++++++++
 .../union-invalid-union-subfield.out          |  0
 .../union-invalid-union-subtype.err           |  2 +
 .../union-invalid-union-subtype.json          | 29 ++++++++++
 .../union-invalid-union-subtype.out           |  0
 tests/unit/test-qobject-input-visitor.c       | 47 +++++++++++++++
 tests/unit/test-qobject-output-visitor.c      | 58 +++++++++++++++++++
 13 files changed, 242 insertions(+), 5 deletions(-)
 create mode 100644 tests/qapi-schema/union-invalid-union-subfield.err
 create mode 100644 tests/qapi-schema/union-invalid-union-subfield.json
 create mode 100644 tests/qapi-schema/union-invalid-union-subfield.out
 create mode 100644 tests/qapi-schema/union-invalid-union-subtype.err
 create mode 100644 tests/qapi-schema/union-invalid-union-subtype.json
 create mode 100644 tests/qapi-schema/union-invalid-union-subtype.out

-- 
2.40.0


