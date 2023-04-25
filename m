Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB82F6EDBD3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 08:45:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCNp-0003oc-05; Tue, 25 Apr 2023 02:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNl-0003gx-UK
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNi-0004LA-Lv
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682404950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UiAwzFoNaN+JyiMMfp4hWwbPpJ3wW7FVWuC+Ec2DH9Y=;
 b=Jzzd/EQqSXzdzgBAPpojAU/F8ya+Y1JQezZVuncRF0k0xjmg6Pz2EfWWoYiG8czThTPMmf
 wkvHPdvEFzLHkmHSMEGon2NaSny4Wxcu1LGdzYlGWqA0yKIfpQgPrwNxKNuf+1JLYru7HQ
 S5f613pG2n82I1aIv5rtNo319vL1EqE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-okHEvVUnMhmC3zz-i-iTDA-1; Tue, 25 Apr 2023 02:42:25 -0400
X-MC-Unique: okHEvVUnMhmC3zz-i-iTDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44CD788606A;
 Tue, 25 Apr 2023 06:42:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF79840C2064;
 Tue, 25 Apr 2023 06:42:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B3C3821F1672; Tue, 25 Apr 2023 08:42:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, quintela@redhat.com, jasowang@redhat.com,
 yuval.shaia.ml@gmail.com, stefanha@redhat.com, kraxel@redhat.com,
 kkostiuk@redhat.com, qemu-block@nongnu.org, marcandre.lureau@gmail.com,
 david@redhat.com
Subject: [PATCH v2 00/16] qapi qga/qapi-schema: Doc fixes
Date: Tue, 25 Apr 2023 08:42:07 +0200
Message-Id: <20230425064223.820979-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Generated code does not change, except for the last patch, which moves
a bit of code without changing it.

v2:
* PATCH 07: Commit message typo corrected, and extra spaces deleted in
  two more examples
* PATCH 09: Also tidy up two indented bullet lists
* PATCH 10: Three more instances fixed; Fixes: tags
* PATCH 16: Commit message typo corrected [Eric]
* R-bys kept

Markus Armbruster (16):
  qga/qapi-schema: Tidy up documentation of guest-fsfreeze-status
  qga/qapi-schema: Fix a misspelled reference
  qapi: Fix misspelled references
  qapi: Fix up references to long gone error classes
  qapi/block-core: Clean up after removal of dirty bitmap @status
  qapi: @foo should be used to reference, not ``foo``
  qapi: Tidy up examples
  qapi: Delete largely misleading "Stability Considerations"
  qapi: Fix bullet list markup in documentation
  qapi: Fix unintended definition lists in documentation
  qga/qapi-schema: Fix member documentation markup
  qapi: Fix argument documentation markup
  qapi: Replace ad hoc "since" documentation by member documentation
  qapi: Fix misspelled section tags in doc comments
  qapi: Format since information the conventional way: (since X.Y)
  qapi storage-daemon/qapi: Fix documentation section structure

 docs/devel/qapi-code-gen.rst         |  8 ++-
 docs/interop/firmware.json           |  6 +-
 qapi/block-core.json                 | 82 ++++++++++++++--------------
 qapi/block-export.json               |  7 ++-
 qapi/block.json                      |  2 +-
 qapi/char.json                       |  4 +-
 qapi/control.json                    |  2 +-
 qapi/cryptodev.json                  |  4 ++
 qapi/job.json                        |  4 +-
 qapi/machine-target.json             |  2 +-
 qapi/machine.json                    | 30 ++++++----
 qapi/migration.json                  | 37 ++++++++-----
 qapi/misc.json                       | 13 ++---
 qapi/net.json                        | 27 ++++-----
 qapi/qapi-schema.json                | 24 +-------
 qapi/qdev.json                       |  2 +-
 qapi/qom.json                        |  4 +-
 qapi/rdma.json                       |  2 +-
 qapi/replay.json                     |  3 +
 qapi/run-state.json                  | 11 ++--
 qapi/stats.json                      |  3 +-
 qapi/tpm.json                        |  3 +-
 qapi/trace.json                      |  1 +
 qapi/ui.json                         | 12 ++--
 qapi/yank.json                       | 21 +++----
 qga/qapi-schema.json                 | 10 ++--
 storage-daemon/qapi/qapi-schema.json | 22 +++++---
 27 files changed, 177 insertions(+), 169 deletions(-)

-- 
2.39.2


