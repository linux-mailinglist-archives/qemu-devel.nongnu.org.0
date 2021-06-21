Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290B63AE6FB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:24:05 +0200 (CEST)
Received: from localhost ([::1]:48956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvH64-00089d-6I
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGil-0007z2-2s
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGij-0007C0-AI
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7biP6JJbyuJRCJdBRCKnmG7hELSt7T74oVBVwoLxxQc=;
 b=HeTt52rc5cIdtSzXCyN/HETO9nyApFqsTtTDN9qXZ3W6nkYXJWyFZJHWxY+e3aOevjfd07
 ih9NMAZhew45h1GAnmVNuhtgH97pLbfcwtAX87sm1jqHq/rieUFvcVmppJX1rnyP6/4Lwv
 4W6OZ0RdHy/nNjjKmDIAlV8LGZYMj4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586--pv_joRPNTymXMMLCBpp-w-1; Mon, 21 Jun 2021 05:59:55 -0400
X-MC-Unique: -pv_joRPNTymXMMLCBpp-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 261E5100C665;
 Mon, 21 Jun 2021 09:59:54 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E92585D740;
 Mon, 21 Jun 2021 09:59:52 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 28/37] configure: Check whether we can compile the s390-ccw
 bios with -msoft-float
Date: Mon, 21 Jun 2021 11:58:33 +0200
Message-Id: <20210621095842.335162-29-cohuck@redhat.com>
In-Reply-To: <20210621095842.335162-1-cohuck@redhat.com>
References: <20210621095842.335162-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The -msoft-float switch is not available in older versions of Clang.
Since we rely on the compiler to not generate floating point instructions
unexpectedly, we block those old compilers now via a test in the configure
script. Note that for some weird reasons, the Clang compiler only complains
about the missing soft-float support if no other flags are passed via
"-Wl,..." to the linker. So we have to use "compile_object" instead of
"compile_prog" for this check.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210525142032.156989-1-thuth@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 262ab71802eb..931f6ac01af0 100755
--- a/configure
+++ b/configure
@@ -5424,7 +5424,7 @@ if test "$cpu" = "s390x" ; then
   write_c_skeleton
   compile_prog "-march=z900" ""
   has_z900=$?
-  if [ $has_z900 = 0 ] || compile_prog "-march=z10" ""; then
+  if [ $has_z900 = 0 ] || compile_object "-march=z10 -msoft-float -Werror"; then
     if [ $has_z900 != 0 ]; then
       echo "WARNING: Your compiler does not support the z900!"
       echo "         The s390-ccw bios will only work with guest CPUs >= z10."
-- 
2.31.1


