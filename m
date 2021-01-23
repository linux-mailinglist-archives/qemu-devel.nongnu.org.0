Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37833015E4
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:34:01 +0100 (CET)
Received: from localhost ([::1]:55606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3JzE-0005HH-6Q
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:34:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Jx2-0003Su-DS
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Jwt-0005mh-9K
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=De9dXKUG8u4h66RkKvO0lN36uT1QI8hZE4mWVBO78n4=;
 b=MiMKNL0DApBJInowxfI/X2gr9otPHy1SXXim9BSfBlV+QM29XeV7EYnTNypR8dl/OXZL3M
 F6A1vmi6tl5739iv6u1CnGtSAkbQSXUsa/BpBglIVa5He/psdnmL8vqvZ+gAKeYPYSGnTf
 dOhpDYtZzxZZFu3kKxBKm0soiEf7HXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-AsLLaY2kPD-jlbvpGrqfqQ-1; Sat, 23 Jan 2021 09:31:31 -0500
X-MC-Unique: AsLLaY2kPD-jlbvpGrqfqQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 316FC10054FF;
 Sat, 23 Jan 2021 14:31:30 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2EE25D9CC;
 Sat, 23 Jan 2021 14:31:29 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/31] configure: MinGW respect --bindir argument
Date: Sat, 23 Jan 2021 09:30:59 -0500
Message-Id: <20210123143128.1167797-3-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
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
Cc: Joshua Watt <JPEWhacker@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joshua Watt <jpewhacker@gmail.com>

There are two cases that need to be accounted for when compiling QEMU
for MinGW32:
 1) A standalone distribution, where QEMU is self contained and
    extracted by the user, such as a user would download from the QEMU
    website. In this case, all the QEMU executable files should be
    rooted in $prefix to ensure they can be easily found by the user
 2) QEMU integrated into a distribution image/sysroot/SDK and
    distributed with other programs. In this case, the provided
    arguments for bindir/datadir/etc. should be respected as they for a
    Linux build.

Restructures the MinGW path configuration so that all of the paths
except bindir use the same rules as when building for other platforms.
This satisfies #2 and #1 since these files do not need to be directly in
$prefix anyway.

The handling for --bindir is changed so that it defaults to $prefix on
MinGW (maintaining the compatibility with #1), but if the user specifies
a specific path when configuring it can also satisfy #2.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Message-Id: <20210112210239.28836-1-JPEWhacker@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 6f6a319c2f..f16fa99060 100755
--- a/configure
+++ b/configure
@@ -1571,20 +1571,15 @@ libexecdir="${libexecdir:-$prefix/libexec}"
 includedir="${includedir:-$prefix/include}"
 
 if test "$mingw32" = "yes" ; then
-    mandir="$prefix"
-    datadir="$prefix"
-    docdir="$prefix"
-    bindir="$prefix"
-    sysconfdir="$prefix"
-    local_statedir="$prefix"
+    bindir="${bindir:-$prefix}"
 else
-    mandir="${mandir:-$prefix/share/man}"
-    datadir="${datadir:-$prefix/share}"
-    docdir="${docdir:-$prefix/share/doc}"
     bindir="${bindir:-$prefix/bin}"
-    sysconfdir="${sysconfdir:-$prefix/etc}"
-    local_statedir="${local_statedir:-$prefix/var}"
 fi
+mandir="${mandir:-$prefix/share/man}"
+datadir="${datadir:-$prefix/share}"
+docdir="${docdir:-$prefix/share/doc}"
+sysconfdir="${sysconfdir:-$prefix/etc}"
+local_statedir="${local_statedir:-$prefix/var}"
 firmwarepath="${firmwarepath:-$datadir/qemu-firmware}"
 localedir="${localedir:-$datadir/locale}"
 
-- 
2.26.2



