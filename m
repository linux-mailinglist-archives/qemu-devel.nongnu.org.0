Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B473C5D2D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:23:30 +0200 (CEST)
Received: from localhost ([::1]:36272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vuD-0004kX-NX
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vaH-0000BE-8p
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:02:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vaD-0005oh-Fb
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:02:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626094967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=k4XLfIqiVdXJLbKQBM5a3gaAh7ZeGGplI4xYbFrVd2E=;
 b=HTmbowgsHpR2rhFCzYDnCso1L7kBx4jdpzBAmte69Nc4cX/AK38w9cIxpSH27zcJpaOpp7
 OwSNy/y9CspOc+8a7OoPghqIZpbAh5SvPfkCKgmSi+e2EvmXmo2YXMNsNB8wQK16DPzpFP
 VbuywZ9O1xqKZakD8gJC0jsRRsxeGHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-dY8OJHt0NWWGw6dX5sD_1A-1; Mon, 12 Jul 2021 09:02:45 -0400
X-MC-Unique: dY8OJHt0NWWGw6dX5sD_1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BBA280430A;
 Mon, 12 Jul 2021 13:02:43 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-105.ams2.redhat.com
 [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A72EF5C225;
 Mon, 12 Jul 2021 13:02:24 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/22] Crypto and more patches
Date: Mon, 12 Jul 2021 14:02:01 +0100
Message-Id: <20210712130223.1825930-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit bd38ae26cea0d1d6a97f930248df149204c210a2=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210710' =
into staging (2021-07-12 11:02:39 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/berrange/qemu tags/crypto-and-more-pull-request=0D
=0D
for you to fetch changes up to 1fc9958410c8683950ea22084b133a755561398b:=0D
=0D
  tests/migration: fix unix socket migration (2021-07-12 14:00:20 +0100)=0D
=0D
----------------------------------------------------------------=0D
Merge crypto updates and misc fixes=0D
=0D
 * Introduce a GNUTLS backend for crypto algorithms=0D
 * Change crypto library preference gnutls > gcrypt > nettle > built-in=0D
 * Remove built-in DES impl=0D
 * Remove XTS mode from built-in AES impl=0D
 * Fix seccomp rules to allow resource info getters=0D
 * Fix migration performance test=0D
 * Use GDateTime in io/ and net/rocker/ code=0D
=0D
----------------------------------------------------------------=0D
=0D
Daniel P. Berrang=C3=A9 (21):=0D
  crypto: remove conditional around 3DES crypto test cases=0D
  crypto: remove obsolete crypto test condition=0D
  crypto: skip essiv ivgen tests if AES+ECB isn't available=0D
  crypto: use &error_fatal in crypto tests=0D
  crypto: fix gcrypt min version 1.8 regression=0D
  crypto: drop gcrypt thread initialization code=0D
  crypto: drop custom XTS support in gcrypt driver=0D
  crypto: add crypto tests for single block DES-ECB and DES-CBC=0D
  crypto: delete built-in DES implementation=0D
  crypto: delete built-in XTS cipher mode support=0D
  crypto: replace 'des-rfb' cipher with 'des'=0D
  crypto: flip priority of backends to prefer gcrypt=0D
  crypto: introduce build system for gnutls crypto backend=0D
  crypto: add gnutls cipher provider=0D
  crypto: add gnutls hash provider=0D
  crypto: add gnutls hmac provider=0D
  crypto: add gnutls pbkdf provider=0D
  crypto: prefer gnutls as the crypto backend if new enough=0D
  net/rocker: use GDateTime for formatting timestamp in debug messages=0D
  io: use GDateTime for formatting timestamp for websock headers=0D
  seccomp: don't block getters for resource control syscalls=0D
=0D
Hyman (1):=0D
  tests/migration: fix unix socket migration=0D
=0D
 crypto/cipher-builtin.c.inc         | 132 ---------=0D
 crypto/cipher-gcrypt.c.inc          | 143 +---------=0D
 crypto/cipher-gnutls.c.inc          | 324 ++++++++++++++++++++++=0D
 crypto/cipher-nettle.c.inc          |  26 +-=0D
 crypto/cipher.c                     |  30 +-=0D
 crypto/desrfb.c                     | 416 ----------------------------=0D
 crypto/hash-gnutls.c                | 104 +++++++=0D
 crypto/hmac-gnutls.c                | 139 ++++++++++=0D
 crypto/init.c                       |  62 -----=0D
 crypto/meson.build                  |   9 +-=0D
 crypto/pbkdf-gnutls.c               |  90 ++++++=0D
 hw/net/rocker/rocker.h              |  11 +-=0D
 io/channel-websock.c                |  10 +-=0D
 meson.build                         | 102 ++++---=0D
 qapi/crypto.json                    |   4 +-=0D
 softmmu/qemu-seccomp.c              |   6 -=0D
 tests/migration/guestperf/engine.py |   2 +-=0D
 tests/unit/test-crypto-cipher.c     |  31 ++-=0D
 tests/unit/test-crypto-hash.c       |  13 +-=0D
 tests/unit/test-crypto-hmac.c       |  28 +-=0D
 tests/unit/test-crypto-ivgen.c      |  14 +-=0D
 tests/unit/test-crypto-pbkdf.c      |   5 +-=0D
 ui/vnc.c                            |  20 +-=0D
 23 files changed, 823 insertions(+), 898 deletions(-)=0D
 create mode 100644 crypto/cipher-gnutls.c.inc=0D
 delete mode 100644 crypto/desrfb.c=0D
 create mode 100644 crypto/hash-gnutls.c=0D
 create mode 100644 crypto/hmac-gnutls.c=0D
 create mode 100644 crypto/pbkdf-gnutls.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


