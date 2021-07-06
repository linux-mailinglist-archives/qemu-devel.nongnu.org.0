Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BA83BC908
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:07:32 +0200 (CEST)
Received: from localhost ([::1]:37756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hzG-0002Zg-9h
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hrs-00051J-G7
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:59:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hri-0000ys-PM
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KJD7MvSJwxFYxQj3CzmDO66jpJfi3OUsG1KNQbWkdjg=;
 b=UlVZ1L6Q8u4RdaAJUnmVYUY9Un2Sp2+9KsllsF5ozzV/Ynrc2B15lk1O9RxsRydxvV/BuE
 vhgVJyWS7p27r2sq6lwzrHuzXtayr+cBYRMT82QGgUnAoV/XZl30CvoIec0S2DYOVpBurf
 0+vYtJNFRqNV8te5Xq3VvxIa7KBFapk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-KD91TYpLN_-St2Na_mQ0uw-1; Tue, 06 Jul 2021 05:59:38 -0400
X-MC-Unique: KD91TYpLN_-St2Na_mQ0uw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A36980414C
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 09:59:37 +0000 (UTC)
Received: from domokun.gsslab.fab.redhat.com (gx270-2.gsslab.fab.redhat.com
 [10.33.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3672A5D6A1;
 Tue,  6 Jul 2021 09:59:26 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/18] crypto: misc cleanup and introduce gnutls backend driver
Date: Tue,  6 Jul 2021 10:59:06 +0100
Message-Id: <20210706095924.764117-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the crypto layer has a choice of backend drivers=0D
=0D
 * builtin - AES/DES for ciphers using in-tree impl,=0D
             glib for hash / hmac=0D
 * gcrypt - all ciphers and al hash/hmac algs=0D
 * nettle - all ciphers and al hash/hmac algs=0D
=0D
We currently default to nettle because that minimizes the=0D
deps from QEMU, as gnutls already pulls in nettle.=0D
=0D
In retrospect, however, this was the wrong metric to optimize=0D
for. Instead we should have picked backend based on the=0D
performance of the drivers.=0D
=0D
The nettle impls have some limited CPU hardware acceleration,=0D
but aside from in ECB mode, nettle is slower than gcrypt in=0D
every case. In the most important AES-XTS case used for luks=0D
disk encryption, nettle is achieves just 15%  of the performance=0D
of gcrypt. It is clear we should prefer gcrypt over nettle.=0D
=0D
gnutls uses nettle internally and also exposes many of the=0D
ciphers for direct usage. Unexpectedly, gnutls is actually=0D
faster than nettle, despite using nettle. The reason for=0D
this is that gnutls provides CPU accelerated code for handling=0D
CBC and XTS modes. This lets gnutls get in the same ballpark as=0D
gcrypt for the most important encryption modes. It is also good=0D
for hash impls.=0D
=0D
This series thus does a number of things=0D
=0D
 - Introduce gnutls as a backe driver=0D
 - Change priority order gnutls > gcrypt > nettle > builtin=0D
 - Cleanup cruft from older versions of crypto libraries=0D
 - Make some tests more robust and easier to debug=0D
 - Drop support for built-in XTS impl, as it is too slow=0D
   to be useful for LUKS=0D
 - Drop support for built-in DES impl, to minize amount of=0D
   custom crypto code carried. VNC password auth will=0D
   require use of an grypt/nettle/gnutls=0D
=0D
Daniel P. Berrang=C3=A9 (18):=0D
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
  crypto: rename des-rfb cipher to just des=0D
  crypto: flip priority of backends to prefer gcrypt=0D
  crypto: introduce build system for gnutls crypto backend=0D
  crypto: add gnutls cipher provider=0D
  crypto: add gnutls hash provider=0D
  crypto: add gnutls hmac provider=0D
  crypto: add gnutls pbkdf provider=0D
  crypto: prefer gnutls as the crypto backend if new enough=0D
=0D
 crypto/cipher-builtin.c.inc     | 132 ----------=0D
 crypto/cipher-gcrypt.c.inc      | 143 +----------=0D
 crypto/cipher-gnutls.c.inc      | 325 +++++++++++++++++++++++++=0D
 crypto/cipher-nettle.c.inc      |  26 +-=0D
 crypto/cipher.c                 |  30 +--=0D
 crypto/desrfb.c                 | 416 --------------------------------=0D
 crypto/hash-gnutls.c            | 104 ++++++++=0D
 crypto/hmac-gnutls.c            | 136 +++++++++++=0D
 crypto/init.c                   |  62 -----=0D
 crypto/meson.build              |   9 +-=0D
 crypto/pbkdf-gnutls.c           |  90 +++++++=0D
 meson.build                     | 102 +++++---=0D
 qapi/crypto.json                |   4 +-=0D
 tests/unit/test-crypto-cipher.c |  31 ++-=0D
 tests/unit/test-crypto-hash.c   |  12 +-=0D
 tests/unit/test-crypto-hmac.c   |  28 +--=0D
 tests/unit/test-crypto-ivgen.c  |  14 +-=0D
 tests/unit/test-crypto-pbkdf.c  |   5 +-=0D
 ui/vnc.c                        |  20 +-=0D
 19 files changed, 814 insertions(+), 875 deletions(-)=0D
 create mode 100644 crypto/cipher-gnutls.c.inc=0D
 delete mode 100644 crypto/desrfb.c=0D
 create mode 100644 crypto/hash-gnutls.c=0D
 create mode 100644 crypto/hmac-gnutls.c=0D
 create mode 100644 crypto/pbkdf-gnutls.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


