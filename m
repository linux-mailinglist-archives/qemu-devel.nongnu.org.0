Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CD6650C5F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 14:04:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Fn1-0004Ze-Hf; Mon, 19 Dec 2022 08:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7Fmf-0004UI-GI
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:02:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7Fmd-0007Ax-St
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:02:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671454935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QVqSB9wB2qrALRQPMZT6ihrQ0/2mf+IxHI35zGJFZFg=;
 b=cM0IpFyykyiogLFLz6X7DZRdy6Rkqu+QfPQjgUCx9xBbZVTgJoGMx9k5cgZXKboe2dnuyi
 56B5U04gKL7sA5azsgFCrSZn1/TTmT5+3wtHdCS2xlZ+f0PKtWRhxtyy1iYhjRmcstV8qd
 IYpxawX7T5FuH/BeigSXTFOzPlhFhks=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-8JV0muoNMwyA4rcqg3b1mQ-1; Mon, 19 Dec 2022 08:02:07 -0500
X-MC-Unique: 8JV0muoNMwyA4rcqg3b1mQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F26F7810BD2;
 Mon, 19 Dec 2022 13:02:06 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FEE114152F6;
 Mon, 19 Dec 2022 13:02:06 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, virtio-fs@redhat.com,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/6] enforce use of G_GNUC_PRINTF annotations
Date: Mon, 19 Dec 2022 08:01:59 -0500
Message-Id: <20221219130205.687815-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We've been very gradually adding G_GNUC_PRINTF annotations
to functions over years. This has been useful in detecting
certain malformed printf strings, or cases where we pass
user data as the printf format which is a potential security
flaw.

Given the inherant memory corruption danger in use of format
strings vs mis-matched variadic arguments, it is worth applying
G_GNUC_PRINTF to all functions using printf, even if we know
they are safe.

The compilers can reasonably reliably identify such places
with the -Wsuggest-attribute=format / -Wmissing-format-attribute
flags.

This series adds G_GNUC_PRINTF / G_GNUC_SCANF to allow the code
locations that the compilers highlight. Then it adds the above
warning flags to the build flags, to catch any future additions
of functions that take printf/scanf format strings.

Daniel P. Berrangé (6):
  disas: add G_GNUC_PRINTF to gstring_printf
  hw/xen: use G_GNUC_PRINTF/SCANF for various functions
  tools/virtiofsd: add G_GNUC_PRINTF for logging functions
  util/error: add G_GNUC_PRINTF for various functions
  tests: add G_GNUC_PRINTF for various functions
  enforce use of G_GNUC_PRINTF attributes

 configure                         |  2 ++
 disas.c                           |  1 +
 hw/xen/xen-bus.c                  |  1 +
 hw/xen/xen_pvdev.c                |  1 +
 include/hw/xen/xen-bus-helper.h   |  6 ++++--
 include/hw/xen/xen-bus.h          |  3 ++-
 tests/qtest/ahci-test.c           |  3 +++
 tests/qtest/arm-cpu-features.c    |  1 +
 tests/qtest/erst-test.c           |  2 +-
 tests/qtest/ide-test.c            |  3 ++-
 tests/qtest/ivshmem-test.c        |  4 ++--
 tests/qtest/libqmp.c              |  2 +-
 tests/qtest/libqos/libqos-pc.h    |  6 ++++--
 tests/qtest/libqos/libqos-spapr.h |  6 ++++--
 tests/qtest/libqos/libqos.h       |  6 ++++--
 tests/qtest/libqos/virtio-9p.c    |  1 +
 tests/qtest/migration-helpers.h   |  1 +
 tests/qtest/rtas-test.c           |  2 +-
 tests/qtest/usb-hcd-uhci-test.c   |  4 ++--
 tests/unit/test-qmp-cmds.c        | 13 +++++++++----
 tools/virtiofsd/fuse_log.c        |  1 +
 tools/virtiofsd/fuse_log.h        |  6 ++++--
 tools/virtiofsd/passthrough_ll.c  |  1 +
 util/error-report.c               |  1 +
 util/error.c                      |  1 +
 25 files changed, 55 insertions(+), 23 deletions(-)

-- 
2.38.1


