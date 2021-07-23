Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8323D3C08
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 16:52:15 +0200 (CEST)
Received: from localhost ([::1]:38604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6wX8-0000ls-8j
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 10:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m6wRW-0002gk-8K
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:46:27 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:37502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m6wRR-0007Oq-SX
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:46:26 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-YfbIQEUvPE2P_fL3WhfHqw-1; Fri, 23 Jul 2021 10:46:08 -0400
X-MC-Unique: YfbIQEUvPE2P_fL3WhfHqw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD982760FB;
 Fri, 23 Jul 2021 14:46:06 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E5046C8D5;
 Fri, 23 Jul 2021 14:46:05 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] configure: Fix excessive error detection when handling
 --cross-cc-FOO
Date: Fri, 23 Jul 2021 16:46:01 +0200
Message-Id: <20210723144601.1038381-3-groug@kaod.org>
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
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

Passing a --cross-cc-cflags-* option with a value that contains a '=3D'
causes configure to exit:

$ ./configure --cross-cc-cflags-arm=3D'-DFOO=3Dbar'

ERROR: Passed bad --cross-cc-FOO option

This is an annoying limitation since '=3D' is frequently found
in CFLAGS.

This is caused by this line in the CC options parsing loop:

  --cross-cc-*[!a-zA-Z0-9_-]*=3D*) error_exit "Passed bad --cross-cc-FOO op=
tion"

The '[!a-zA-Z0-9_-]' pattern matches the first '=3D' in the
option and the '=3D' pattern matches the other one. The '*'
patterns then match the rest.

The intent seems to be that we only want characters from the
range [a-zA-Z0-9_-] in the option name. Shell pattern matching
isn't powerful enough to do that with a single expression.

First, isolate the option name, i.e. before the first '=3D' character,
with a regular expression. Only error out if there's at least one
unwanted character in the name.

Fixes: d75402b5ee29 ("configure: add support for --cross-cc-FOO")
Cc: alex.bennee@linaro.org
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 configure | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index 3a926ff8fc23..61a415e4dc61 100755
--- a/configure
+++ b/configure
@@ -472,16 +472,23 @@ for opt do
   ;;
   --disable-debug-info) debug_info=3D"no"
   ;;
-  --cross-cc-*[!a-zA-Z0-9_-]*=3D*) error_exit "Passed bad --cross-cc-FOO o=
ption"
-  ;;
-  --cross-cc-cflags-*) cc_arch=3D${opt#--cross-cc-cflags-}; cc_arch=3D${cc=
_arch%%=3D*}
-                      eval "cross_cc_cflags_${cc_arch}=3D\$optarg"
-                      cross_cc_vars=3D"$cross_cc_vars cross_cc_cflags_${cc=
_arch}"
-  ;;
-  --cross-cc-*) cc_arch=3D${opt#--cross-cc-}; cc_arch=3D${cc_arch%%=3D*}
-                cc_archs=3D"$cc_archs $cc_arch"
-                eval "cross_cc_${cc_arch}=3D\$optarg"
-                cross_cc_vars=3D"$cross_cc_vars cross_cc_${cc_arch}"
+  --cross-cc-*=3D*)
+    optname=3D$(expr "x$opt" : 'x\([^=3D]*\)=3D.*')
+    case "$optname" in
+    *[!a-zA-Z0-9_-]*) error_exit "Passed bad $optname option"
+    ;;
+    esac
+    case "$opt" in
+    --cross-cc-cflags-*) cc_arch=3D${opt#--cross-cc-cflags-}; cc_arch=3D${=
cc_arch%%=3D*}
+                         eval "cross_cc_cflags_${cc_arch}=3D\$optarg"
+                         cross_cc_vars=3D"$cross_cc_vars cross_cc_cflags_$=
{cc_arch}"
+    ;;
+    --cross-cc-*) cc_arch=3D${opt#--cross-cc-}; cc_arch=3D${cc_arch%%=3D*}
+                  cc_archs=3D"$cc_archs $cc_arch"
+                  eval "cross_cc_${cc_arch}=3D\$optarg"
+                  cross_cc_vars=3D"$cross_cc_vars cross_cc_${cc_arch}"
+    ;;
+    esac
   ;;
   esac
 done
--=20
2.31.1


