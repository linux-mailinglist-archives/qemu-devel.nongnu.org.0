Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222E23D3C01
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 16:50:40 +0200 (CEST)
Received: from localhost ([::1]:36144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6wVb-0007Ep-77
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 10:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m6wRV-0002g6-0t
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:46:25 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:28565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m6wRR-0007Qf-ST
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:46:24 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-O_RHg1zvP-W1wtUUcyLNHg-1; Fri, 23 Jul 2021 10:46:07 -0400
X-MC-Unique: O_RHg1zvP-W1wtUUcyLNHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 307011009E43;
 Fri, 23 Jul 2021 14:46:05 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B88875D6AD;
 Fri, 23 Jul 2021 14:46:03 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] configure: Fix trivial typo in --cross-cc-cflags-FOO
Date: Fri, 23 Jul 2021 16:46:00 +0200
Message-Id: <20210723144601.1038381-2-groug@kaod.org>
In-Reply-To: <20210723144601.1038381-1-groug@kaod.org>
References: <20210723144601.1038381-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: qemu-trivial@nongnu.org, alex.bennee@linaro.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'flags' wording is used in several places instead of 'cflags'.

$ git grep cross-cc-flags
configure:  --cross-cc-cflags-*) cc_arch=3D${opt#--cross-cc-flags-}; cc_arc=
h=3D${cc_arch%%=3D*}
configure:  --cross-cc-flags-ARCH=3D   use compiler flags when building ARC=
H guest tests
docs/devel/testing.rst:There is also a ``--cross-cc-flags-ARCH`` flag in ca=
se additional

Fix this treewide.

Fixes: d422b2bc23bf ("configure: allow user to specify --cross-cc-cflags-fo=
o=3D")
Fixes: f8ed349e6d14 ("docs/devel: add "check-tcg" to testing.rst")
Cc: alex.bennee@linaro.org
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 configure              | 4 ++--
 docs/devel/testing.rst | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index b5965b159f2f..3a926ff8fc23 100755
--- a/configure
+++ b/configure
@@ -474,7 +474,7 @@ for opt do
   ;;
   --cross-cc-*[!a-zA-Z0-9_-]*=3D*) error_exit "Passed bad --cross-cc-FOO o=
ption"
   ;;
-  --cross-cc-cflags-*) cc_arch=3D${opt#--cross-cc-flags-}; cc_arch=3D${cc_=
arch%%=3D*}
+  --cross-cc-cflags-*) cc_arch=3D${opt#--cross-cc-cflags-}; cc_arch=3D${cc=
_arch%%=3D*}
                       eval "cross_cc_cflags_${cc_arch}=3D\$optarg"
                       cross_cc_vars=3D"$cross_cc_vars cross_cc_cflags_${cc=
_arch}"
   ;;
@@ -1764,7 +1764,7 @@ Advanced options (experts only):
   --extra-cxxflags=3DCXXFLAGS append extra C++ compiler flags QEMU_CXXFLAG=
S
   --extra-ldflags=3DLDFLAGS  append extra linker flags LDFLAGS
   --cross-cc-ARCH=3DCC       use compiler when building ARCH guest test ca=
ses
-  --cross-cc-flags-ARCH=3D   use compiler flags when building ARCH guest t=
ests
+  --cross-cc-cflags-ARCH=3DCFLAGS use compiler flags when building ARCH gu=
est tests
   --make=3DMAKE              use specified make [$make]
   --python=3DPYTHON          use specified python [$python]
   --sphinx-build=3DSPHINX    use specified sphinx-build [$sphinx_build]
diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 8f572255d320..a8c8aa365cf8 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -1142,7 +1142,7 @@ for the architecture in question, for example::
=20
   $(configure) --cross-cc-aarch64=3Daarch64-cc
=20
-There is also a ``--cross-cc-flags-ARCH`` flag in case additional
+There is also a ``--cross-cc-cflags-ARCH`` flag in case additional
 compiler flags are needed to build for a given target.
=20
 If you have the ability to run containers as the user the build system
--=20
2.31.1


