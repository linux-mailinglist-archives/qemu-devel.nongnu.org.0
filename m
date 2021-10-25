Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161A5438EE6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 07:36:12 +0200 (CEST)
Received: from localhost ([::1]:52412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meseZ-0003fP-6q
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 01:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesUn-0005Ww-01
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:26:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesUk-0005PD-Jq
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:26:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635139561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ERPJI+ctZMe1D31eeMS3sZMnKNS4FBFxOKzle7dUG4M=;
 b=cVeButSRbdMNcPYSSMT8/2xzvob0Rzjn0uVIgafsR7/C0Z6TQ4SZrujLQpEXZnzNYmJ4nX
 uHn4JQsW8A2wGRtF8pKCIhXbDWQUeJJMZVSLlByJS+COUDm1kSfwJs/WGPlltPQHUHMOZp
 F4GrK3Dvi82UPJpIoDSZrkKHyZJQbiI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-k_Wx3ZqeMZuANbVySvH_ug-1; Mon, 25 Oct 2021 01:25:57 -0400
X-MC-Unique: k_Wx3ZqeMZuANbVySvH_ug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8371D8066F5;
 Mon, 25 Oct 2021 05:25:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6994B5D9D5;
 Mon, 25 Oct 2021 05:25:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CF1BC11380A7; Mon, 25 Oct 2021 07:25:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] Configurable policy for handling unstable interfaces
Date: Mon, 25 Oct 2021 07:25:23 +0200
Message-Id: <20211025052532.3859634-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 dgilbert@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Option -compat lets you configure what to do when deprecated
interfaces get used.  This series extends this to unstable interfaces.
Works the same way.  Intended for testing users of the management
interfaces.  It is experimental.

To make it possible, I replace the "x-" naming convention by special
feature flag "unstable".  See PATCH 1 for rationale.

Based on my "[PATCH v4 0/5] qapi: Add feature flags to enum members"

Based-on: Message-Id: <20211025042405.3762351-1-armbru@redhat.com>

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
 scripts/qapi/gen.py                     |  13 +++
 scripts/qapi/schema.py                  |  11 ++-
 scripts/qapi/types.py                   |  22 +++--
 scripts/qapi/visit.py                   |  14 +--
 tests/qapi-schema/qapi-schema-test.json |   7 +-
 tests/qapi-schema/qapi-schema-test.out  |   5 +
 29 files changed, 353 insertions(+), 162 deletions(-)

-- 
2.31.1


