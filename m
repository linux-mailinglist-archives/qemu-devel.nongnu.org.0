Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FD7340962
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:57:55 +0100 (CET)
Received: from localhost ([::1]:54350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMv21-0002fD-NN
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMuzq-0000uJ-35
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:55:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMuzk-0005kD-NA
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616082931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mWnzrWrc2qb7lwM6uWlnO1wwkzqPG4Wc6VXumJERwTQ=;
 b=YxaWSMBnShJSe3nz8Zc/b/C8N2AUiGn+m3+4aEzQQYcJpolZ+JrvaVWSLGxC0eLouTOeVv
 e7sS8p8aSkFH0h0uZ/Q7LB2s+/4Yr7ID8nkg/jZuxE+DFI4FOSw/LqXOZAcKM3cxrR5FXH
 ltjhDdJpfFKFM0BeBFQz104cIhlCGjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-nBtO-GvTMGWO7ZCCzAKZwQ-1; Thu, 18 Mar 2021 11:55:29 -0400
X-MC-Unique: nBtO-GvTMGWO7ZCCzAKZwQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2673410074BF;
 Thu, 18 Mar 2021 15:55:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4280D5C1D1;
 Thu, 18 Mar 2021 15:55:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B420111386A7; Thu, 18 Mar 2021 16:55:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/11] Configurable policy for handling deprecated
 interfaces
Date: Thu, 18 Mar 2021 16:55:08 +0100
Message-Id: <20210318155519.1224118-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Luk=C3=A1=C5=A1=20Doktor?= <ldoktor@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, libvir-list@redhat.com,
 mdroth@linux.vnet.ibm.com, marcandre.lureau@gmail.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New option -compat lets you configure what to do when deprecated
interfaces get used.  This is intended for testing users of the
management interfaces.  It is experimental.

-compat deprecated-input=<in-policy> configures what to do when
deprecated input is received.  Available policies:

* accept: Accept deprecated commands and arguments (default)
* reject: Reject them
* crash: Crash

-compat deprecated-output=<out-policy> configures what to do when
deprecated output is sent.  Available output policies:

* accept: Emit deprecated command results and events (default)
* hide: Suppress them

For now, -compat covers only deprecated syntactic aspects of QMP.  We
may want to extend it to cover semantic aspects, CLI, and experimental
features.

v7:
* Trivially rebased
* PATCH 01: New, bug fix from Paolo
* PATCH 02+11: Since: comments fixed, for real this time [Eric]
* PATCH 03+10: qobject_output_visitor_new_qmp() and
  qobject_input_visitor_new_qmp() moved to qmp-dispatch.c to not break
  --disable-system --disable-tools builds
* PATCH 05: Minor fallout from changed PATCH 03
* PATCH 06: Commit message typo fixed [Eric]

v6:
* Rebased, with straightforward conflicts
* PATCH 1: More verbose commit message, explaining intent, and the
  lack of introspection [Peter], comments updated for 6.0, Eric's R-by
  kept anyway
* PATCH 5+6: Split old PATCH 5 [Eric], Eric's R-by lept anyway
* PATCH 7: New, correcting a latent issue so it doesn't break PATCH 8
* PATCH 10: Doc fix [Eric]

v5:
* Old PATCH 01-26 merged in commit f57587c7d47.
* Rebased, non-trivial conflicts in PATCH 1 due to Meson, and in PATCH
  7 due to visitor changes
* PATCH 1: Comments updated for 5.2 [Eric]
* PATCH 2: Harmless missing initialization fixed [Eric]
* PATCH 3+4: Harmless missing has_FOO = true fixed [Eric]
* PATCH 6+7: Commit message tweaked

v4:
* PATCH 05+07: Temporary memory leak plugged [Marc-André]
* PATCH 23: Rewritten [Marc-André]
* PATCH 24: Comment typo [Marc-André]
* PATCH 30: Memory leaks plugged

v3:
* Rebased, non-trivial conflicts in PATCH 01+26+27+34 due to RST
  conversion and code motion
* PATCH 28-29: Old PATCH 28 split up to ease review
* PATCH 30-31: New
* PATCH 32-33: Old PATCH 29 split up to ease review

Comparison to RFC (24 Oct 2019):
* Cover arguments and results in addition to commands and events
* Half-baked "[RFC PATCH 18/19] qapi: Include a warning in the
  response to a deprecated command" dropped

See also last item of
    Subject: Minutes of KVM Forum BoF on deprecating stuff
    Date: Fri, 26 Oct 2018 16:03:51 +0200
    Message-ID: <87mur0ls8o.fsf@dusky.pond.sub.org>
    https://lists.nongnu.org/archive/html/qemu-devel/2018-10/msg05828.html

Cc: Lukáš Doktor <ldoktor@redhat.com>
Cc: libguestfs@redhat.com
Cc: libvir-list@redhat.com
Cc: Daniel P. Berrange <berrange@redhat.com>
Cc: Peter Krempa <pkrempa@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>

Markus Armbruster (10):
  qemu-options: New -compat to set policy for deprecated interfaces
  qapi: Implement deprecated-output=hide for QMP command results
  qapi: Implement deprecated-output=hide for QMP events
  qapi: Implement deprecated-output=hide for QMP event data
  monitor: Drop query-qmp-schema 'gen': false hack
  qapi: Implement deprecated-output=hide for QMP introspection
  test-util-sockets: Add stub for monitor_set_cur()
  qapi: Implement deprecated-input=reject for QMP commands
  qapi: Implement deprecated-input=reject for QMP command arguments
  qapi: New -compat deprecated-input=crash

Paolo Bonzini (1):
  qemuutil: remove qemu_set_fd_handler duplicate symbol

 qapi/compat.json                        |  52 ++++++++++++
 qapi/introspect.json                    |   2 +-
 qapi/qapi-schema.json                   |   1 +
 include/qapi/compat-policy.h            |  38 +++++++++
 include/qapi/qmp/dispatch.h             |   1 +
 include/qapi/qobject-input-visitor.h    |   4 +
 include/qapi/qobject-output-visitor.h   |   4 +
 include/qapi/visitor-impl.h             |   6 ++
 include/qapi/visitor.h                  |  18 +++++
 monitor/monitor-internal.h              |   3 -
 monitor/misc.c                          |   2 -
 monitor/qmp-cmds-control.c              | 100 +++++++++++++++++++++---
 qapi/qapi-visit-core.c                  |  18 +++++
 qapi/qmp-dispatch.c                     |  35 +++++++++
 qapi/qobject-input-visitor.c            |  29 +++++++
 qapi/qobject-output-visitor.c           |  19 +++++
 softmmu/vl.c                            |  17 ++++
 storage-daemon/qemu-storage-daemon.c    |   2 -
 stubs/set-fd-handler.c                  |  10 ---
 tests/unit/test-qmp-cmds.c              |  91 +++++++++++++++++++--
 tests/unit/test-qmp-event.c             |  41 ++++++++++
 tests/unit/test-util-sockets.c          |   1 +
 qapi/meson.build                        |   1 +
 qapi/trace-events                       |   2 +
 qemu-options.hx                         |  22 ++++++
 scripts/qapi/commands.py                |  17 ++--
 scripts/qapi/events.py                  |  21 ++++-
 scripts/qapi/visit.py                   |  15 ++++
 stubs/meson.build                       |   1 -
 tests/qapi-schema/qapi-schema-test.json |  20 +++--
 tests/qapi-schema/qapi-schema-test.out  |  20 ++---
 31 files changed, 549 insertions(+), 64 deletions(-)
 create mode 100644 qapi/compat.json
 create mode 100644 include/qapi/compat-policy.h
 delete mode 100644 stubs/set-fd-handler.c

-- 
2.26.3


