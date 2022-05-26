Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FD0534D99
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 12:54:06 +0200 (CEST)
Received: from localhost ([::1]:52654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuB81-0003IV-F2
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 06:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuB00-000056-Nf
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:45:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuAzy-0007xt-4Z
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:45:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653561944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zTjiQ6JdEeDyZ8dOOmhppWoyrOBa2jpcvUBkFzrNx6A=;
 b=SnNtjXLJy0ObnGi3/TiVuyQgsA6GrDCJzr30UAx/1D4rik8emjySj/H7s+nja73xVeY+bv
 HYepWt16AdKZMMj8sPrV+ZYjESK+YvCEfefSI8XNV71AdIK6eqYZtr+DNnFnCBmCQv4/fc
 RsiYVf2y4WPXyy5ukQBYxuihsfUd/wE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-Qc-lFnDdN6K4R-ipyqjifQ-1; Thu, 26 May 2022 06:45:43 -0400
X-MC-Unique: Qc-lFnDdN6K4R-ipyqjifQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B2A43C10236
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 10:45:43 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCF3F2166B29;
 Thu, 26 May 2022 10:45:42 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PULL 0/7] crypto asymmetric cipher patches
Date: Thu, 26 May 2022 11:45:34 +0100
Message-Id: <20220526104541.492781-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 58b53669e87fed0d70903e05cd42079fbbdbc195=
:=0D
=0D
  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging =
(2022-05-25 13:46:29 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/berrange/qemu tags/ak-pull-request=0D
=0D
for you to fetch changes up to f0cfb761bc6e590d648b759e6bdb8c946062b5f5:=0D
=0D
  tests/crypto: Add test suite for RSA keys (2022-05-26 11:41:56 +0100)=0D
=0D
----------------------------------------------------------------=0D
Merge asymmetric cipher crypto support=0D
=0D
This extends the internal crypto APIs to support the use of asymmetric=0D
ciphers.=0D
=0D
----------------------------------------------------------------=0D
=0D
Lei He (6):=0D
  qapi: crypto-akcipher: Introduce akcipher types to qapi=0D
  crypto: add ASN.1 DER decoder=0D
  crypto: Implement RSA algorithm by hogweed=0D
  crypto: Implement RSA algorithm by gcrypt=0D
  test/crypto: Add test suite for crypto akcipher=0D
  tests/crypto: Add test suite for RSA keys=0D
=0D
Zhenwei Pi (1):=0D
  crypto: Introduce akcipher crypto class=0D
=0D
 crypto/akcipher-gcrypt.c.inc            | 595 ++++++++++++++=0D
 crypto/akcipher-nettle.c.inc            | 451 +++++++++++=0D
 crypto/akcipher.c                       | 108 +++=0D
 crypto/akcipherpriv.h                   |  55 ++=0D
 crypto/der.c                            | 189 +++++=0D
 crypto/der.h                            |  81 ++=0D
 crypto/meson.build                      |   6 +=0D
 crypto/rsakey-builtin.c.inc             | 200 +++++=0D
 crypto/rsakey-nettle.c.inc              | 158 ++++=0D
 crypto/rsakey.c                         |  44 ++=0D
 crypto/rsakey.h                         |  92 +++=0D
 include/crypto/akcipher.h               | 158 ++++=0D
 meson.build                             |  11 +=0D
 qapi/crypto.json                        |  64 ++=0D
 tests/bench/benchmark-crypto-akcipher.c | 137 ++++=0D
 tests/bench/meson.build                 |   1 +=0D
 tests/bench/test_akcipher_keys.inc      | 537 +++++++++++++=0D
 tests/unit/meson.build                  |   2 +=0D
 tests/unit/test-crypto-akcipher.c       | 990 ++++++++++++++++++++++++=0D
 tests/unit/test-crypto-der.c            | 290 +++++++=0D
 20 files changed, 4169 insertions(+)=0D
 create mode 100644 crypto/akcipher-gcrypt.c.inc=0D
 create mode 100644 crypto/akcipher-nettle.c.inc=0D
 create mode 100644 crypto/akcipher.c=0D
 create mode 100644 crypto/akcipherpriv.h=0D
 create mode 100644 crypto/der.c=0D
 create mode 100644 crypto/der.h=0D
 create mode 100644 crypto/rsakey-builtin.c.inc=0D
 create mode 100644 crypto/rsakey-nettle.c.inc=0D
 create mode 100644 crypto/rsakey.c=0D
 create mode 100644 crypto/rsakey.h=0D
 create mode 100644 include/crypto/akcipher.h=0D
 create mode 100644 tests/bench/benchmark-crypto-akcipher.c=0D
 create mode 100644 tests/bench/test_akcipher_keys.inc=0D
 create mode 100644 tests/unit/test-crypto-akcipher.c=0D
 create mode 100644 tests/unit/test-crypto-der.c=0D
=0D
-- =0D
2.36.1=0D
=0D


