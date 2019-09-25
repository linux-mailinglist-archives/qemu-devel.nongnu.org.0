Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737ABBE7BA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 23:39:56 +0200 (CEST)
Received: from localhost ([::1]:57600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDF0t-0008IJ-2B
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 17:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37631)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iDEwr-00060U-0E
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 17:35:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iDEwp-0005t4-Um
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 17:35:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34428)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1iDEwm-0005ls-UI; Wed, 25 Sep 2019 17:35:41 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F3A928553A;
 Wed, 25 Sep 2019 21:35:38 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CDC719C5B;
 Wed, 25 Sep 2019 21:35:34 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/13] crypto/luks: preparation for encryption key managment
Date: Thu, 26 Sep 2019 00:35:14 +0300
Message-Id: <20190925213527.9117-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 25 Sep 2019 21:35:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

This patch series is the refactoring/preparation part of the
former patch series I had sent which adds support for luks
key management.

V2:
I addressed all the review comments
I also added another minor patch to improve an error messsage
when trying to create too large file, for which I have an
open bug that waits to be closed.
Its also is form of refactoring, and thus I guess it makes
sense to include it here.

Best regards,
        Maxim Levitsky

Maxim Levitsky (13):
  block-crypto: misc refactoring
  qcrypto-luks: rename some fields in QCryptoBlockLUKSHeader
  qcrypto-luks: don't overwrite cipher_mode in header
  qcrypto-luks: simplify masterkey and masterkey length
  qcrypto-luks: pass keyslot index rather that pointer to the keyslot
  qcrypto-luks: use the parsed encryption settings in QCryptoBlockLUKS
  qcrypto-luks: purge unused error codes from open callback
  qcrypto-luks: extract store and load header
  qcrypto-luks: extract check and parse header
  qcrypto-luks: extract store key function
  qcrypto-luks: simplify the math used for keyslot locations
  qcrypto-luks: more rigorous header checking
  LUKS: better error message when creating too large files

 block/crypto.c      |   33 +-
 crypto/block-luks.c | 1025 +++++++++++++++++++++++++------------------
 2 files changed, 617 insertions(+), 441 deletions(-)

--=20
2.17.2


