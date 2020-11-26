Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A632C5321
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:36:20 +0100 (CET)
Received: from localhost ([::1]:40146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFZT-0000et-1K
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:36:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kiFSs-0002g8-4Q
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:29:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kiFSq-00067I-0o
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606390166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BC0D4ZdT9Jgpt+rPkHUotDwo0hF4Mnn8h6b6tpFO6zE=;
 b=V7NLpNkb8B9q/+kDlh/pwJXaz4QOoLeePxqfyWy0FtcMnOwOpyk2olEwrhxhw9E6npjnuJ
 aBWur+JSIOljf0rZbEBAt0D/MYbbdThUHEzdISnxPXDCifRXIewO3NyYFW8iINR6855fIn
 T/6Uqd79zjI6Z55AGh9joSjeHRbP/6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-CadFTIKFMGWtL7Ug3LIIVQ-1; Thu, 26 Nov 2020 06:29:24 -0500
X-MC-Unique: CadFTIKFMGWtL7Ug3LIIVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F822100C662;
 Thu, 26 Nov 2020 11:29:23 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 191EF19C71;
 Thu, 26 Nov 2020 11:29:18 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/13] Remove GCC < 4.8 checks
Date: Thu, 26 Nov 2020 15:29:02 +0400
Message-Id: <20201126112915.525285-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Peter Maydell <peter.maydell@linaro.org>, philmd@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Since commit efc6c07 ("configure: Add a test for the minimum compiler versi=
on"),=0D
QEMU explicitely depends on GCC >=3D 4.8.=0D
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
  compiler.h: replace QEMU_GNUC_PREREQ macro=0D
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


