Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0E64956DC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 00:21:16 +0100 (CET)
Received: from localhost ([::1]:42818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAgjz-0003c8-Uy
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 18:21:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nAbJ9-0005wf-Qy
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 12:33:12 -0500
Received: from [201.28.113.2] (port=52664 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>) id 1nAbJ8-0002Sy-Bh
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 12:33:11 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 20 Jan 2022 14:32:02 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id DDB298000C5;
 Thu, 20 Jan 2022 14:32:01 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: fix parameter expansion of --cross-cc-cflags
 options
Date: Thu, 20 Jan 2022 14:31:41 -0300
Message-Id: <20220120173142.2755077-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Jan 2022 17:32:02.0257 (UTC)
 FILETIME=[A2A18C10:01D80E23]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Without this fix, any use of --cross-cc-cflags-* causes a message like:
$ ../configure --cross-cc-ppc64le=clang --cross-cc-cflags-ppc64le="-target powerpc64le-unknown-linux-gnu -sysroot ..."
../configure: 1: eval: cross_cc_cflags_--cross-cc-cflags-ppc64le=-target: not found
../configure: 3816: export: cross_cc_cflags_--cross-cc-cflags-ppc64le: bad variable name

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index e1a31fb332..4735c1bffc 100755
--- a/configure
+++ b/configure
@@ -402,7 +402,7 @@ for opt do
   ;;
   --cross-cc-*[!a-zA-Z0-9_-]*=*) error_exit "Passed bad --cross-cc-FOO option"
   ;;
-  --cross-cc-cflags-*) cc_arch=${opt#--cross-cc-flags-}; cc_arch=${cc_arch%%=*}
+  --cross-cc-cflags-*) cc_arch=${opt#--cross-cc-cflags-}; cc_arch=${cc_arch%%=*}
                       eval "cross_cc_cflags_${cc_arch}=\$optarg"
                       cross_cc_vars="$cross_cc_vars cross_cc_cflags_${cc_arch}"
   ;;
-- 
2.25.1


