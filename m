Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41732D5C47
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:51:23 +0100 (CET)
Received: from localhost ([::1]:39162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMLq-0004QH-N3
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1knMIp-00021G-6O
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:48:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1knMIm-0002Nd-Ip
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:48:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607608090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=anpnx/tw5p62yFhBITy05bzKP3wcJQGVw5OZrWMts1E=;
 b=RJVlImTqG396KA/SMQLHDIDRzdN0zzAvFTv13O+R8y5pu00Uq/ZPGufcyecT8aquFIVfeD
 46x/UMNIfdinhvXeJAnA6pRGIxhfdj5nCVe0CvcAV0StZMlsm+FcxX74ddi+cULZ5n1CWR
 des4kEY7IfuDlN2hinaNXob3FX+SyjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-p-pu4U4xNmybGAAj8pkIRQ-1; Thu, 10 Dec 2020 08:48:09 -0500
X-MC-Unique: p-pu4U4xNmybGAAj8pkIRQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A6141005E48;
 Thu, 10 Dec 2020 13:48:07 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 521085D9DD;
 Thu, 10 Dec 2020 13:47:55 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/13] Remove GCC < 4.8 checks
Date: Thu, 10 Dec 2020 17:47:39 +0400
Message-Id: <20201210134752.780923-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Since commit efc6c07 ("configure: Add a test for the minimum compiler versi=
on"),=0D
QEMU explicitely depends on GCC >=3D 4.8.=0D
=0D
v3:=0D
 - drop first patch replacing QEMU_GNUC_PREREQ with G_GNUC_CHECK_VERSION=0D
 - add last patch to remove QEMU_GNUC_PREREQ=0D
 - tweak commit messages to replace clang 3.8 with clang 3.4=0D
 - fix some extra coding style=0D
 - collect r-b/a-b tags=0D
=0D
v2:=0D
 - include reviewed Philippe earlier series=0D
 - drop problematic patch to replace GCC_FMT_ATTR, but tweak the check to b=
e clang=0D
 - replace QEMU_GNUC_PREREQ with G_GNUC_CHECK_VERSION=0D
 - split changes=0D
 - add patches to drop __GNUC__ checks (clang advertizes itself as 4.2.1, u=
nless=0D
   -fgnuc-version=3D0)=0D
=0D
Marc-Andr=C3=A9 Lureau (11):=0D
  compiler.h: remove GCC < 3 __builtin_expect fallback=0D
  qemu-plugin.h: remove GCC < 4=0D
  tests: remove GCC < 4 fallbacks=0D
  virtiofsd: replace _Static_assert with QEMU_BUILD_BUG_ON=0D
  compiler.h: explicit case for Clang printf attribute=0D
  audio: remove GNUC & MSVC check=0D
  poison: remove GNUC check=0D
  xen: remove GNUC check=0D
  compiler: remove GNUC check=0D
  linux-user: remove GNUC check=0D
  compiler.h: remove QEMU_GNUC_PREREQ=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  qemu/atomic: Drop special case for unsupported compiler=0D
  accel/tcg: Remove special case for GCC < 4.6=0D
=0D
 include/exec/poison.h              |  2 --=0D
 include/hw/xen/interface/io/ring.h |  9 ------=0D
 include/qemu/atomic.h              | 17 -----------=0D
 include/qemu/compiler.h            | 45 ++++++++----------------------=0D
 include/qemu/qemu-plugin.h         |  9 ++----=0D
 scripts/cocci-macro-file.h         |  1 -=0D
 tools/virtiofsd/fuse_common.h      | 11 +-------=0D
 accel/tcg/cpu-exec.c               |  2 +-=0D
 audio/audio.c                      |  8 +-----=0D
 linux-user/strace.c                |  4 ---=0D
 tests/tcg/arm/fcvt.c               |  8 ++----=0D
 11 files changed, 20 insertions(+), 96 deletions(-)=0D
=0D
--=20=0D
2.29.0=0D
=0D


