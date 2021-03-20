Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAE0342A78
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 05:20:12 +0100 (CET)
Received: from localhost ([::1]:34806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNT5v-0004h7-Ct
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 00:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lNT4x-00044A-RE
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 00:19:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lNT4s-0001ma-Ho
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 00:19:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616213944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lUnwcybZywkU5SwBHHcOsvqNm6NDwGhyBTSUV07CaOU=;
 b=ByV6APJjhfALSdRDYpXY/JvENAdzP5JDJpHp8uKR0/LdklD4ipQZYhbp7NNAVXFdJC5tWA
 FUChJIEaoUlzf31wInAxpsm9C0wc8DiY4ZqE8tKeHwCoG3VBqh5yugSEtQb210o+076e1z
 cNxLd1FVrKgwwuSOJVCqlbF4iS84q+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227--mex6WckOJCd8rIK0_Co_A-1; Sat, 20 Mar 2021 00:19:01 -0400
X-MC-Unique: -mex6WckOJCd8rIK0_Co_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8E23107ACCA;
 Sat, 20 Mar 2021 04:18:58 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-40.bne.redhat.com [10.64.54.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 279005C1D1;
 Sat, 20 Mar 2021 04:18:56 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 1/2] disas/arm-a64.cc: Fix build error
Date: Sat, 20 Mar 2021 12:18:54 +0800
Message-Id: <20210320041854.68668-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes the following build error with gcc v11.0.0:

  # gcc --version
  gcc (GCC) 11.0.0 20210210 (Red Hat 11.0.0-0)

  [969/2604] Compiling C++ object libcommon.fa.p/disas_arm-a64.cc.o
  FAILED: libcommon.fa.p/disas_arm-a64.cc.o
    :
  In file included from /usr/include/glib-2.0/glib/gmacros.h:241,
                   from /usr/lib64/glib-2.0/include/glibconfig.h:9,
                   from /usr/include/glib-2.0/glib/gtypes.h:32,
                   from /usr/include/glib-2.0/glib/galloca.h:32,
                   from /usr/include/glib-2.0/glib.h:30,
                   from /home/gavin/sandbox/qemu.main/include/glib-compat.h:32,
                   from /home/gavin/sandbox/qemu.main/include/qemu/osdep.h:126,
                   from ../disas/arm-a64.cc:21:
  /usr/include/c++/11/type_traits:56:3: error: template with C linkage
     56 |   template<typename _Tp, _Tp __v>
        |   ^~~~~~~~
  ../disas/arm-a64.cc:20:1: note: ‘extern "C"’ linkage started here
     20 | extern "C" {
        | ^~~~~~~~~~

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 disas/arm-a64.cc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/disas/arm-a64.cc b/disas/arm-a64.cc
index 9fa779e175..8545c04038 100644
--- a/disas/arm-a64.cc
+++ b/disas/arm-a64.cc
@@ -17,13 +17,13 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "vixl/a64/disasm-a64.h"
+
 extern "C" {
 #include "qemu/osdep.h"
 #include "disas/dis-asm.h"
 }
 
-#include "vixl/a64/disasm-a64.h"
-
 using namespace vixl;
 
 static Decoder *vixl_decoder = NULL;
-- 
2.23.0


