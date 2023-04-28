Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A7F6F162D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:57:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLkN-0008Im-Ij; Fri, 28 Apr 2023 06:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLkK-0008Hm-T3
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:54:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLkI-0003wU-Pg
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682679273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CkTMyBVD7ZOUAu6PEn2J4giOgZdzi4UNeyk3DnuMoMU=;
 b=RDx9xzDANMdSrU3FB51Cba+llhVoBuZvBuTds4+Mp6MKdzCdx3uC9KV+ch8DTfQ+bzDXtI
 0hDu50+VrT9LGnsC3T/w9iIlK+Ee1v20WLViEv4dGA0o7CrGqtOyjxOycSGifp6dMt3V6B
 JKzJXGFLfpRoDlFh0S/5ovM5DgL3+VE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-wV36Zn74OseB_cH0EUkMHQ-1; Fri, 28 Apr 2023 06:54:32 -0400
X-MC-Unique: wV36Zn74OseB_cH0EUkMHQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C22B918E524F;
 Fri, 28 Apr 2023 10:54:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8237340F177;
 Fri, 28 Apr 2023 10:54:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7477421E66EF; Fri, 28 Apr 2023 12:54:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, eblake@redhat.com, kraxel@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, arei.gonglei@huawei.com,
 pizhenwei@bytedance.com, jsnow@redhat.com, vsementsov@yandex-team.ru,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
 jasowang@redhat.com, yuval.shaia.ml@gmail.com, pavel.dovgaluk@ispras.ru,
 jiri@resnulli.us, stefanb@linux.vnet.ibm.com, stefanha@redhat.com,
 lukasstraub2@web.de, kkostiuk@redhat.com, qemu-block@nongnu.org,
 victortoso@redhat.com
Subject: [PATCH 00/17] qapi: Reformat doc comments
Date: Fri, 28 Apr 2023 12:54:12 +0200
Message-Id: <20230428105429.1687850-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

This series improves the doc comment formatting rules, then reformats
doc comments to conform to them.

I don't like reformatting code.  But I'm tired of looking at ugly doc
comments.  People imitate them in new work (not blaming them for
that), which leads to tiresome arguments about style.  I've come to
the conclusion that reformatting them is the lesser evil.

Prior discussion:
    qapi: [RFC] Doc comment convention for @arg: sections
    Message-ID: <87v8irv7zq.fsf@pond.sub.org>
    https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg05921.html

PATCH 01-12 are preliminary fixes, cleanups and test improvements,
ranging from losely related to not related at all.

PATCH 13-14 improve the QAPI generator to support the style I want.

PATCH 15 writes it down.

PATCH 16-17 reformat the doc comments to conform to it.

Markus Armbruster (17):
  docs/devel/qapi-code-gen: Clean up use of quotes a bit
  docs/devel/qapi-code-gen: Turn FIXME admonitions into comments
  qapi: Fix crash on stray double quote character
  meson: Fix to make QAPI generator output depend on main.py
  Revert "qapi: BlockExportRemoveMode: move comments to TODO"
  sphinx/qapidoc: Do not emit TODO sections into user manuals
  qapi: Tidy up a slightly awkward TODO comment
  qapi/dump: Indent bulleted lists consistently
  tests/qapi-schema/doc-good: Improve a comment
  tests/qapi-schema/doc-good: Improve argument description tests
  qapi: Fix argument description indentation stripping
  qapi: Rewrite parsing of doc comment section symbols and tags
  qapi: Relax doc string @name: description indentation rules
  qapi: Section parameter @indent is no longer used, drop
  docs/devel/qapi-code-gen: Update doc comment conventions
  qga/qapi-schema: Reformat doc comments to conform to current
    conventions
  qapi: Reformat doc comments to conform to current conventions

 docs/devel/qapi-code-gen.rst          |   74 +-
 docs/sphinx/qapidoc.py                |    3 +
 meson.build                           |    2 +-
 qapi/acpi.json                        |   50 +-
 qapi/audio.json                       |   85 +-
 qapi/authz.json                       |   29 +-
 qapi/block-core.json                  | 2801 +++++++++++++------------
 qapi/block-export.json                |  244 ++-
 qapi/block.json                       |  214 +-
 qapi/char.json                        |  134 +-
 qapi/common.json                      |   19 +-
 qapi/compat.json                      |   13 +-
 qapi/control.json                     |   59 +-
 qapi/crypto.json                      |  261 ++-
 qapi/cryptodev.json                   |    3 +
 qapi/cxl.json                         |   74 +-
 qapi/dump.json                        |   78 +-
 qapi/error.json                       |    6 +-
 qapi/introspect.json                  |   89 +-
 qapi/job.json                         |  139 +-
 qapi/machine-target.json              |  303 +--
 qapi/machine.json                     |  389 ++--
 qapi/migration.json                   | 1120 +++++-----
 qapi/misc-target.json                 |   67 +-
 qapi/misc.json                        |  180 +-
 qapi/net.json                         |  260 ++-
 qapi/pci.json                         |   35 +-
 qapi/qapi-schema.json                 |   25 +-
 qapi/qdev.json                        |   63 +-
 qapi/qom.json                         |  404 ++--
 qapi/rdma.json                        |    1 -
 qapi/replay.json                      |   48 +-
 qapi/rocker.json                      |   20 +-
 qapi/run-state.json                   |  215 +-
 qapi/sockets.json                     |   50 +-
 qapi/stats.json                       |   83 +-
 qapi/tpm.json                         |   20 +-
 qapi/trace.json                       |   34 +-
 qapi/transaction.json                 |   87 +-
 qapi/ui.json                          |  435 ++--
 qapi/virtio.json                      |   84 +-
 qapi/yank.json                        |   42 +-
 qga/qapi-schema.json                  |  668 +++---
 scripts/qapi/parser.py                |  137 +-
 tests/qapi-schema/doc-bad-indent.err  |    2 +-
 tests/qapi-schema/doc-bad-indent.json |    3 +-
 tests/qapi-schema/doc-good.json       |   20 +-
 tests/qapi-schema/doc-good.out        |   19 +-
 48 files changed, 4822 insertions(+), 4369 deletions(-)

-- 
2.39.2


