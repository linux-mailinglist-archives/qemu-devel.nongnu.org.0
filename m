Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4D228CACC
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 11:11:38 +0200 (CEST)
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSGLJ-0006iL-Ov
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 05:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kSGFt-0003j6-IY
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 05:06:02 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:23060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kSGFr-0001Cn-RZ
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 05:06:01 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-kRJQGmD4O4aiCoaAvhMs7w-1; Tue, 13 Oct 2020 05:05:55 -0400
X-MC-Unique: kRJQGmD4O4aiCoaAvhMs7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA94F1018F63
 for <qemu-devel@nongnu.org>; Tue, 13 Oct 2020 09:05:54 +0000 (UTC)
Received: from bahia.lan (ovpn-112-78.ams2.redhat.com [10.36.112.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D3A57665A;
 Tue, 13 Oct 2020 09:05:54 +0000 (UTC)
Subject: [PATCH] Makefile: Add *.[ch].inc files to cscope/ctags/TAGS
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Tue, 13 Oct 2020 11:05:53 +0200
Message-ID: <160257995354.899044.14483032809159561276.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 05:05:58
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code base has some C source and header files that don't get indexed
because their name ends with .inc:

$ git ls-files "*.[ch].inc" | wc -l
66

Add them to the list.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c37e513431fe..b5003cdb4a43 100644
--- a/Makefile
+++ b/Makefile
@@ -190,7 +190,7 @@ distclean: clean ninja-distclean
 =09rm -f linux-headers/asm
 =09rm -Rf .sdk
=20
-find-src-path =3D find "$(SRC_PATH)/" -path "$(SRC_PATH)/meson" -prune -o =
-name "*.[chsS]"
+find-src-path =3D find "$(SRC_PATH)/" -path "$(SRC_PATH)/meson" -prune -o =
-name "*.[chsS]" -o -name "*.[ch].inc"
=20
 .PHONY: ctags
 ctags:



