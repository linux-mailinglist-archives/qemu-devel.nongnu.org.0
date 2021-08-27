Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEB53F98E6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 14:11:48 +0200 (CEST)
Received: from localhost ([::1]:54654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJai1-0002YO-Ix
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 08:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJafd-0007vz-8d
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 08:09:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJafa-0004bB-Cq
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 08:09:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630066153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXN2XqI6Yrf3sKmT4TN2bu3GayaHLDeqAznihBOaJXs=;
 b=NyCg+JJ2BSc4Hdy7+fTDWNHZxt+Tnp3ieUm0BE/8jO6zCLBVGM0chzHd7iJ8voNi45LdCQ
 Bp91M1nhh5zLJ+DOwTl/biMPVgLQEEpuVYp2w3SHUaftVEvtdgUlvB04xgOXuvWXrdSYUM
 O1eoF/w+0WkAcOzbgabqKshgFhP8mjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-3AccST65PYayhUysvWHvGQ-1; Fri, 27 Aug 2021 08:09:12 -0400
X-MC-Unique: 3AccST65PYayhUysvWHvGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F08611853026;
 Fri, 27 Aug 2021 12:09:10 +0000 (UTC)
Received: from thuth.com (unknown [10.40.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 364135F724;
 Fri, 27 Aug 2021 12:09:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] meson.build: Fix the check for a usable libfdt
Date: Fri, 27 Aug 2021 14:08:59 +0200
Message-Id: <20210827120901.150276-2-thuth@redhat.com>
In-Reply-To: <20210827120901.150276-1-thuth@redhat.com>
References: <20210827120901.150276-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The check for libfdt currently has a flaw: If there is a system libfdt, the
meson.build code initialized the fdt variable with fdt = cc.find_library(...).
However, if this libfdt is too old and there is no internal dtc module
available, it continues with "fdt" pointing to the old and unusable version.
The check later in the file that tries to detect whether libfdt is necessary
then fails to trigger:

 if not fdt.found() and fdt_required.length() > 0
  error('fdt not available but required by targets ' + ', '.join(fdt_required))
 endif

The build fails then during compilation instead, which is of course bad
since this is quite confusing and already wasted quite some time of the user.
Thus if libfdt is not usable, we should unset the "fdt" variable immediately
again, so that the build already fails during the configuration phase.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/255
Signed-off-by: Thomas Huth <thuth@redhat.com>

If the system has
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index 0b555197c3..ee156ff0a5 100644
--- a/meson.build
+++ b/meson.build
@@ -1916,6 +1916,7 @@ if have_system
       fdt_opt = 'internal'
     else
       fdt_opt = 'disabled'
+      fdt = not_found
     endif
   endif
   if fdt_opt == 'internal'
-- 
2.27.0


