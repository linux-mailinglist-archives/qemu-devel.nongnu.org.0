Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C2E3903D5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:22:30 +0200 (CEST)
Received: from localhost ([::1]:53058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXwy-0005No-SD
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1llXvI-0004cY-9d
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:20:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1llXvE-0003LJ-Nr
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:20:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621952439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HofWdufSbD2ezXYvRehpFIl+CcbEMPH/mRVnUyU34V8=;
 b=gVYoPC11kmF8i5AWppaZWYqfbgD4/7hcu29vyLKMHfFDsMb+/pmZpXchMFoRbJHghERGxH
 S8cG2jqfAIA1JMcEKcegk8bU0BpolFE4wrD1vyqCqY/SokU+d3UNlyHav7YzIgnUCRX8Pa
 8BUY2sO87sJIsczVXfUMQUfIxlV8It8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-pqxN6C-LPjqayrvMLGOrIw-1; Tue, 25 May 2021 10:20:37 -0400
X-MC-Unique: pqxN6C-LPjqayrvMLGOrIw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01DF8188E3D1;
 Tue, 25 May 2021 14:20:36 +0000 (UTC)
Received: from thuth.com (ovpn-114-230.ams2.redhat.com [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7E259D53;
 Tue, 25 May 2021 14:20:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] configure: Check whether we can compile the s390-ccw bios
 with -msoft-float
Date: Tue, 25 May 2021 16:20:32 +0200
Message-Id: <20210525142032.156989-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The -msoft-float switch is not available in older versions of Clang.
Since we rely on the compiler to not generate floating point instructions
unexpectedly, we block those old compilers now via a test in the configure
script. Note that for some weird reasons, the Clang compiler only complains
about the missing soft-float support if no other flags are passed via
"-Wl,..." to the linker. So we have to use "compile_object" instead of
"compile_prog" for this check.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 676239c697..673419ff31 100755
--- a/configure
+++ b/configure
@@ -5462,7 +5462,7 @@ if test "$cpu" = "s390x" ; then
   write_c_skeleton
   compile_prog "-march=z900" ""
   has_z900=$?
-  if [ $has_z900 = 0 ] || compile_prog "-march=z10" ""; then
+  if [ $has_z900 = 0 ] || compile_object "-march=z10 -msoft-float -Werror"; then
     if [ $has_z900 != 0 ]; then
       echo "WARNING: Your compiler does not support the z900!"
       echo "         The s390-ccw bios will only work with guest CPUs >= z10."
-- 
2.27.0


