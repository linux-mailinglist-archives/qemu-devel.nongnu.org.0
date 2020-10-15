Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF3528F535
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 16:50:47 +0200 (CEST)
Received: from localhost ([::1]:60116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT4ac-0004LR-Ar
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 10:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kT4ZQ-00037E-Pn
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 10:49:32 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:48309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kT4ZO-0001Ws-62
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 10:49:32 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-rDnF_8C-MHK3W1r3KIjyMQ-1; Thu, 15 Oct 2020 10:49:09 -0400
X-MC-Unique: rDnF_8C-MHK3W1r3KIjyMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 553D38015AA;
 Thu, 15 Oct 2020 14:49:08 +0000 (UTC)
Received: from bahia.lan (ovpn-112-78.ams2.redhat.com [10.36.112.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C44155763;
 Thu, 15 Oct 2020 14:49:07 +0000 (UTC)
Subject: [PATCH] Makefile: Ensure cscope.out/tags/TAGS are generated in the
 source tree
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Thu, 15 Oct 2020 16:49:06 +0200
Message-ID: <160277334665.1754102.10921580280105870386.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 10:49:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tools usually expect the index files to be in the source tree, eg. emacs.
This is already the case when doing out-of-tree builds, but with in-tree
builds they end up in the build directory.

Force cscope, ctags and etags to put them in the source tree.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 Makefile |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 3c5a0b0f7a11..45f983d9ef08 100644
--- a/Makefile
+++ b/Makefile
@@ -194,19 +194,19 @@ find-src-path =3D find "$(SRC_PATH)/" -path "$(SRC_PA=
TH)/meson" -prune -o \( -name
=20
 .PHONY: ctags
 ctags:
-=09rm -f tags
-=09$(find-src-path) -exec ctags --append {} +
+=09rm -f "$(SRC_PATH)/"tags
+=09$(find-src-path) -exec ctags -f "$(SRC_PATH)/"tags --append {} +
=20
 .PHONY: TAGS
 TAGS:
-=09rm -f TAGS
-=09$(find-src-path) -exec etags --append {} +
+=09rm -f "$(SRC_PATH)/"TAGS
+=09$(find-src-path) -exec etags -f "$(SRC_PATH)/"TAGS --append {} +
=20
 .PHONY: cscope
 cscope:
 =09rm -f "$(SRC_PATH)"/cscope.*
 =09$(find-src-path) -print | sed -e 's,^\./,,' > "$(SRC_PATH)/cscope.files=
"
-=09cscope -b -i"$(SRC_PATH)/cscope.files"
+=09cscope -b -i"$(SRC_PATH)/cscope.files" -f"$(SRC_PATH)"/cscope.out
=20
 # Needed by "meson install"
 export DESTDIR



