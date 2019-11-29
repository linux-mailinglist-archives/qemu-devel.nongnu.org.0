Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB06510D767
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Nov 2019 15:48:40 +0100 (CET)
Received: from localhost ([::1]:59870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iahZV-0001HY-RP
	for lists+qemu-devel@lfdr.de; Fri, 29 Nov 2019 09:48:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42849)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iah9R-00078y-1f
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:21:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iah9N-0000Kc-56
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:21:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32428
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iah9L-0000Hd-2f
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:21:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575037293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r1MZ6725hlUYSlwIaJgDzFMQ0CKrUPm20wVl4o9ngc8=;
 b=R9L29djtAJPIdH7jDRnaJvZsT9zh1oBsodmDGAxtJK7bbk+Z/YgyA+T7N3i3Pkg3S5yKCm
 dVg2vsc3EDfRpJNdujoOURTWrvv3JQhOMa7WpIYJkbxQjEmLZGFA3wpRcJqEfT6KUMsC0o
 UWruFITV0TfQa1LTi/9vBdqT7FgODt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-RvLonUxOOIiKvjMfH5bDDw-1; Fri, 29 Nov 2019 09:21:30 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A974DB20
 for <qemu-devel@nongnu.org>; Fri, 29 Nov 2019 14:21:29 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-253.ams2.redhat.com
 [10.36.117.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 430015D6D4;
 Fri, 29 Nov 2019 14:21:28 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	thuth@redhat.com,
	pbonzini@redhat.com
Subject: [PATCH] ci: Use libcap-ng
Date: Fri, 29 Nov 2019 14:21:26 +0000
Message-Id: <20191129142126.32967-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: RvLonUxOOIiKvjMfH5bDDw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

We currently enable libcap-dev in build-clang to pick up the 9p proxy
helper.  Paolo's patch changes that to use libcap-ng, so switch to using
it.  This also means we'll be testing the scsi pr manager and the bridge
helper.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index be57c6a454..62a9609798 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -59,7 +59,7 @@ build-user:
=20
 build-clang:
  script:
- - apt-get install -y -qq clang libsdl2-dev libattr1-dev libcap-dev
+ - apt-get install -y -qq clang libsdl2-dev libattr1-dev libcap-ng-dev
       xfslibs-dev libiscsi-dev libnfs-dev libseccomp-dev gnutls-dev librbd=
-dev
  - ./configure --cc=3Dclang --cxx=3Dclang++ --enable-werror
       --target-list=3D"alpha-softmmu arm-softmmu m68k-softmmu mips64-softm=
mu
--=20
2.23.0


