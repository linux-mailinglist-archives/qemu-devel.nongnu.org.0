Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2251417DD
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jan 2020 15:08:23 +0100 (CET)
Received: from localhost ([::1]:40634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isoly-0001QL-1k
	for lists+qemu-devel@lfdr.de; Sat, 18 Jan 2020 09:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45286)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1isokO-0000Be-Ci
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 09:06:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1isokK-0007WN-UV
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 09:06:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53164
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1isokK-0007Vx-RB
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 09:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579356400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTF0bu2VPlQk0T1fzA08DqOqjAzbdx7Avrwx3TjytMM=;
 b=AlYKC2IWHnYdvpQLloIuiqC/4ubHTUzOFcKAF/wLqeb2kWRzYIt+x/TEBQbOKbcpEJj03x
 8k/CuxWsdmI+c6LvBefpd+jrUzUL+zL7bteDs8UeFEOpjGpcltS5ZhUTtXSqxNccdtQu+j
 lpnd3AJ3WCZf0KmeEnLW1u8IresNBQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-c70JbIQuN7akSyQObe3p9Q-1; Sat, 18 Jan 2020 09:06:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B262800D41;
 Sat, 18 Jan 2020 14:06:37 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-59.brq.redhat.com [10.40.204.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76BCB5C1D4;
 Sat, 18 Jan 2020 14:06:32 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 1/6] configure: Do not build libfdt if not required
Date: Sat, 18 Jan 2020 15:06:14 +0100
Message-Id: <20200118140619.26333-2-philmd@redhat.com>
In-Reply-To: <20200118140619.26333-1-philmd@redhat.com>
References: <20200118140619.26333-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: c70JbIQuN7akSyQObe3p9Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We only require libfdt for system emulation, in a small set
of architecture:

4077  # fdt support is mandatory for at least some target architectures,
4078  # so insist on it if we're building those system emulators.
4079  fdt_required=3Dno
4080  for target in $target_list; do
4081    case $target in
4082      aarch64*-softmmu|arm*-softmmu|ppc*-softmmu|microblaze*-softmmu|mi=
ps64el-softmmu|riscv*-softmmu)
4083        fdt_required=3Dyes

Do not build libfdt if we did not manually specified --enable-fdt,
or have one of the platforms that require it in our target list.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Improved description (thuth)
---
 configure | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index 557e4382ea..c67a7e73db 100755
--- a/configure
+++ b/configure
@@ -4095,6 +4095,8 @@ if test "$fdt_required" =3D "yes"; then
       "targets which need it (by specifying a cut down --target-list)."
   fi
   fdt=3Dyes
+elif test "$fdt" !=3D "yes" ; then
+  fdt=3Dno
 fi
=20
 if test "$fdt" !=3D "no" ; then
--=20
2.21.1


