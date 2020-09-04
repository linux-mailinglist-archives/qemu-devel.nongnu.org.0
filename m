Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A7C25D825
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 13:57:32 +0200 (CEST)
Received: from localhost ([::1]:48492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEALT-0005LR-9Z
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 07:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA6u-00011V-2j
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:42:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21793
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA6o-0005Hl-GY
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:42:27 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-Sl7zWWnVORy_0W_jlp-oFA-1; Fri, 04 Sep 2020 07:42:18 -0400
X-MC-Unique: Sl7zWWnVORy_0W_jlp-oFA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92274909EF9
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 11:41:44 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 204D682165
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 11:41:44 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/46] configure: remove unnecessary libm test
Date: Fri,  4 Sep 2020 07:41:11 -0400
Message-Id: <20200904114122.31307-36-pbonzini@redhat.com>
In-Reply-To: <20200904114122.31307-1-pbonzini@redhat.com>
References: <20200904114122.31307-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 01:57:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The same test is already performed by meson.build.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/configure b/configure
index d9e11a04ab..59453ade2f 100755
--- a/configure
+++ b/configure
@@ -4968,20 +4968,6 @@ if test "$libiscsi" != "no" ; then
   fi
 fi
 
-##########################################
-# Do we need libm
-cat > $TMPC << EOF
-#include <math.h>
-int main(int argc, char **argv) { return isnan(sin((double)argc)); }
-EOF
-if compile_prog "" "" ; then
-  :
-elif compile_prog "" "-lm" ; then
-  LIBS="-lm $LIBS"
-else
-  error_exit "libm check failed"
-fi
-
 ##########################################
 # Do we need librt
 # uClibc provides 2 versions of clock_gettime(), one with realtime
-- 
2.26.2



