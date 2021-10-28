Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E4343DF40
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 12:50:44 +0200 (CEST)
Received: from localhost ([::1]:36110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg2zb-0005fF-Ix
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 06:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mg2bh-0007OW-Ba
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 06:26:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mg2bb-000339-Ap
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 06:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635416753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PoTP/LPTbESfl2A0HZdIuXkVFqBre4CYbVJawJ+JiVs=;
 b=jLjaqz+lEy0/IhHBJEJ2xpQnNK39KxFtlKvU+Pof7muZwr/dF4AJRFjEd16/yf4L05TWMF
 c+e3omGad0CoTeLSKDyHoBELx/Y74vcM/4qVVrN3qL2JEbvQ4o0ZznFVQDJ+YDGSpDWtqi
 VGx1uc7+YlXznM3JUYLo7ODXT8TRg6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-W5c3rglsPR2-kd8uKAk1WA-1; Thu, 28 Oct 2021 06:25:50 -0400
X-MC-Unique: W5c3rglsPR2-kd8uKAk1WA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 749291808310;
 Thu, 28 Oct 2021 10:25:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12B4760C04;
 Thu, 28 Oct 2021 10:25:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 37E2811380A7; Thu, 28 Oct 2021 12:25:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] Configurable policy for handling unstable interfaces
Date: Thu, 28 Oct 2021 12:25:11 +0200
Message-Id: <20211028102520.747396-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, kchamart@redhat.com,
 mdroth@linux.vnet.ibm.com, dgilbert@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, philmd@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Option -compat lets you configure what to do when deprecated
interfaces get used.  This series extends this to unstable interfaces.
Works the same way.  Intended for testing users of the management
interfaces.  It is experimental.

To make it possible, I replace the "x-" naming convention by special
feature flag "unstable".  See PATCH 1 for rationale.

v2:
* Rebased
* PATCH 1: Commit message revamped [Kevin], R-bys kept
* PATCH 6: gen_special_features() rewritten [John]
* PATCH 7: disastrous typos fixed [Philippe]

Markus Armbruster (9):
  qapi: New special feature flag "unstable"
  qapi: Mark unstable QMP parts with feature 'unstable'
  qapi: Eliminate QCO_NO_OPTIONS for a slight simplification
  qapi: Tools for sets of special feature flags in generated code
  qapi: Generalize struct member policy checking
  qapi: Generalize command policy checking
  qapi: Generalize enum member policy checking
  qapi: Factor out compat_policy_input_ok()
  qapi: Extend -compat to set policy for unstable interfaces

 docs/devel/qapi-code-gen.rst            |   9 +-
 qapi/block-core.json                    | 123 +++++++++++++++++-------
 qapi/compat.json                        |   6 +-
 qapi/migration.json                     |  35 +++++--
 qapi/misc.json                          |   6 +-
 qapi/qom.json                           |  11 ++-
 include/qapi/compat-policy.h            |   7 ++
 include/qapi/qmp/dispatch.h             |   6 +-
 include/qapi/util.h                     |   8 +-
 include/qapi/visitor-impl.h             |   6 +-
 include/qapi/visitor.h                  |  17 +++-
 monitor/misc.c                          |   7 +-
 qapi/qapi-forward-visitor.c             |  16 +--
 qapi/qapi-visit-core.c                  |  41 ++++----
 qapi/qmp-dispatch.c                     |  57 ++++++++---
 qapi/qmp-registry.c                     |   4 +-
 qapi/qobject-input-visitor.c            |  22 ++---
 qapi/qobject-output-visitor.c           |  13 ++-
 storage-daemon/qemu-storage-daemon.c    |   3 +-
 qapi/trace-events                       |   4 +-
 qemu-options.hx                         |  20 +++-
 scripts/qapi/commands.py                |  12 +--
 scripts/qapi/events.py                  |  10 +-
 scripts/qapi/gen.py                     |   8 ++
 scripts/qapi/schema.py                  |  11 ++-
 scripts/qapi/types.py                   |  22 +++--
 scripts/qapi/visit.py                   |  14 +--
 tests/qapi-schema/qapi-schema-test.json |   7 +-
 tests/qapi-schema/qapi-schema-test.out  |   5 +
 29 files changed, 348 insertions(+), 162 deletions(-)

-- 
2.31.1


