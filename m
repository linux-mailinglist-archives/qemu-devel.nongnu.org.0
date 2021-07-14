Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A233C85C9
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:12:22 +0200 (CEST)
Received: from localhost ([::1]:56306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3fcb-0004X5-O9
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fZg-0001kw-EM
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:09:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fZc-0006TY-RK
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:09:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626271756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=46lwhzGikA3wWmAle0/JO+McYALpvJtaLfO/HBzFzow=;
 b=dU/LpTxr32fl/SpA5y3D9oxspABTXyz3pEb9Ni7MXFTxLwu0hpwkBd1SjDmCQLrDojJAAN
 7lf/7L9l8f4XBCcqVi48Woz0WvvgIoMrv5uZwlm5tE2KfHPmICCSMteDtSbIv+et8Q7CYB
 96YwGeBveXPNxhDPaJ+udbefb4di+ZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-aChDyXoVOY6ywZe7Y5F8SA-1; Wed, 14 Jul 2021 10:09:11 -0400
X-MC-Unique: aChDyXoVOY6ywZe7Y5F8SA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B501C100C609;
 Wed, 14 Jul 2021 14:09:10 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-160.ams2.redhat.com
 [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9730E18A50;
 Wed, 14 Jul 2021 14:09:00 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/26] Crypto and more patches
Date: Wed, 14 Jul 2021 15:08:32 +0100
Message-Id: <20210714140858.2247409-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 4aa2454d94cca99d86aa32e71bd7c8159df91c59=
:=0D
=0D
  Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-requ=
est' into staging (2021-07-14 12:00:56 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/berrange/qemu tags/crypto-and-more-pull-request=0D
=0D
for you to fetch changes up to 80d78357495837f1f0e53fbb6bca5fb793631d94:=0D
=0D
  qemu-options: rewrite help for -smp options (2021-07-14 14:16:35 +0100)=
=0D
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
 * Improve docs for -smp=0D
=0D
----------------------------------------------------------------=0D
=0D
Daniel P. Berrang=C3=A9 (25):=0D
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
  docs: fix typo s/Intel/AMD/ in CPU model notes=0D
  qemu-options: re-arrange CPU topology options=0D
  qemu-options: tweak to show that CPU count is optional=0D
  qemu-options: rewrite help for -smp options=0D
=0D
Hyman (1):=0D
  tests/migration: fix unix socket migration=0D
=0D
 crypto/cipher-builtin.c.inc         | 132 ---------=0D
 crypto/cipher-gcrypt.c.inc          | 143 +---------=0D
 crypto/cipher-gnutls.c.inc          | 335 ++++++++++++++++++++++=0D
 crypto/cipher-nettle.c.inc          |  26 +-=0D
 crypto/cipher.c                     |  30 +-=0D
 crypto/desrfb.c                     | 416 ----------------------------=0D
 crypto/hash-gnutls.c                | 104 +++++++=0D
 crypto/hmac-gnutls.c                | 139 ++++++++++=0D
 crypto/init.c                       |  62 -----=0D
 crypto/meson.build                  |  12 +-=0D
 crypto/pbkdf-gnutls.c               |  90 ++++++=0D
 docs/system/cpu-models-x86.rst.inc  |   2 +-=0D
 hw/net/rocker/rocker.h              |  11 +-=0D
 io/channel-websock.c                |  10 +-=0D
 meson.build                         | 102 ++++---=0D
 qapi/crypto.json                    |   4 +-=0D
 qemu-options.hx                     |  41 ++-=0D
 softmmu/qemu-seccomp.c              |   6 -=0D
 tests/migration/guestperf/engine.py |   2 +-=0D
 tests/unit/test-crypto-cipher.c     |  31 ++-=0D
 tests/unit/test-crypto-hash.c       |  13 +-=0D
 tests/unit/test-crypto-hmac.c       |  28 +-=0D
 tests/unit/test-crypto-ivgen.c      |  14 +-=0D
 tests/unit/test-crypto-pbkdf.c      |   5 +-=0D
 ui/vnc.c                            |  20 +-=0D
 25 files changed, 865 insertions(+), 913 deletions(-)=0D
 create mode 100644 crypto/cipher-gnutls.c.inc=0D
 delete mode 100644 crypto/desrfb.c=0D
 create mode 100644 crypto/hash-gnutls.c=0D
 create mode 100644 crypto/hmac-gnutls.c=0D
 create mode 100644 crypto/pbkdf-gnutls.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


