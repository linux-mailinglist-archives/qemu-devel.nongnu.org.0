Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C99063AAB3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 15:18:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozew2-0008Gy-NQ; Mon, 28 Nov 2022 09:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1ozevS-0008BL-C8
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:16:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1ozevQ-0005S5-H3
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:16:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669644959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N00j2k0vAfjNqhhnTkpkUVNzzmHHB16ysy6B8gSy8tM=;
 b=aeGC/k1izXz9PFXyAzj7KtdHf20HP8BSG5qgR4fzyoZtzCCP4fIUFqP56qD+DDJEsefnCz
 TYfi98soNspghYkTug+N5/O6DUu0UOVnzT4ZYSlKgtf9QC/GAWxckN7pajS3btY5PnTlsZ
 40hMKczoMtBlRLf0rbmnA/0qs53rPUg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-oDeBGwSRNqCUAn4zlTLTrA-1; Mon, 28 Nov 2022 09:15:55 -0500
X-MC-Unique: oDeBGwSRNqCUAn4zlTLTrA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 065143C3582F;
 Mon, 28 Nov 2022 14:15:17 +0000 (UTC)
Received: from loop.redhat.com (unknown [10.35.206.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECD322166BA0;
 Mon, 28 Nov 2022 14:15:14 +0000 (UTC)
From: Nir Soffer <nsoffer@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Subject: [PATCH v2 0/5] Add qemu-img checksum command using blkhash
Date: Mon, 28 Nov 2022 16:15:09 +0200
Message-Id: <20221128141514.388724-1-nsoffer@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsoffer@redhat.com;
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

Since blkhash is available only via copr now, the new command is added as
optional feature, built only if blkhash-devel package is installed.

Changes since v1 (Hanna):
- Move IO_BUF_SIZE to top of the file
- Extend TestFinder to support format or cache specific out files
- Improve online help (note about optimization and lint to blkhash project)
- Guard blkhash.h include with CONFIG_BLKHASH
- Using user_creatable_process_cmdline() instead of user_creatable_add_from_str()
- Rename ret to exit_code
- Add static assert to ensure that read buffer is algined to block size
- Drop unneeded pnum variable
- Change test to work like other tests; use iotest.imgfmt and iotest.cachemode
- Simplify test to test only raw and qcow2 format using file protocol
- Fix code style issues (multi-line comments, missing braces)
- Make error checking more clear (checksum_block_status(s) < 0)

v1:
https://lists.nongnu.org/archive/html/qemu-block/2022-09/msg00021.html

v1 discussion:
- https://lists.nongnu.org/archive/html/qemu-block/2022-10/msg00602.html
- https://lists.nongnu.org/archive/html/qemu-block/2022-10/msg00603.html
- https://lists.nongnu.org/archive/html/qemu-block/2022-10/msg00604.html
- https://lists.nongnu.org/archive/html/qemu-block/2022-11/msg00171.html
- https://lists.nongnu.org/archive/html/qemu-block/2022-11/msg00173.html

Nir Soffer (5):
  qemu-img.c: Move IO_BUF_SIZE to the top of the file
  Support format or cache specific out file
  qemu-img: Add checksum command
  iotests: Test qemu-img checksum
  qemu-img: Speed up checksum

 docs/tools/qemu-img.rst                       |  24 ++
 meson.build                                   |  10 +-
 meson_options.txt                             |   2 +
 qemu-img-cmds.hx                              |   8 +
 qemu-img.c                                    | 390 +++++++++++++++++-
 tests/qemu-iotests/findtests.py               |  10 +-
 tests/qemu-iotests/tests/qemu-img-checksum    |  63 +++
 .../tests/qemu-img-checksum.out.qcow2         |  11 +
 .../tests/qemu-img-checksum.out.raw           |  10 +
 9 files changed, 523 insertions(+), 5 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/qemu-img-checksum
 create mode 100644 tests/qemu-iotests/tests/qemu-img-checksum.out.qcow2
 create mode 100644 tests/qemu-iotests/tests/qemu-img-checksum.out.raw

-- 
2.38.1


