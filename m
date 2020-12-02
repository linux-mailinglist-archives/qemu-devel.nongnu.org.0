Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1D72CB942
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:44:59 +0100 (CET)
Received: from localhost ([::1]:55760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOh0-0001mD-4L
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:44:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNM1-0006ad-D8
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:19:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNLr-0006uM-5h
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:19:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606897142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AK/ysKp67JZ+xdz7XmbgJu0fK3M0GYlcrCgTQJsTTe0=;
 b=DZX/1+ezTlKjObOGBcRcbI2Lmc2HvrudzrUbIn/IOvYEonBxv4pbTFR5/ooZUxyMwKCTYp
 i+FHny5DWaiLQMi7HoyIi5ebm5XOWT7Ub98wq3wHT0F9KDkPVpbGvhwdvMMQZjzRgKFi3A
 IytQ93050KIEqEYtMnkn0o93WgZDoGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-iQOqdv92OnyLfjQiUeIusA-1; Wed, 02 Dec 2020 03:19:00 -0500
X-MC-Unique: iQOqdv92OnyLfjQiUeIusA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35FAD8558F5
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:18:59 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2EDB10013C1;
 Wed,  2 Dec 2020 08:18:58 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/15] vl: allow -incoming defer with -preconfig
Date: Wed,  2 Dec 2020 03:18:42 -0500
Message-Id: <20201202081854.4126071-4-pbonzini@redhat.com>
In-Reply-To: <20201202081854.4126071-1-pbonzini@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that there is no RUN_STATE_PRECONFIG anymore that can conflict with
RUN_STATE_INMIGRATE, we can allow -incoming defer with -preconfig.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index abbbb83e1a..3dfac8299b 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2986,9 +2986,8 @@ static void qemu_validate_options(void)
                      "mutually exclusive");
         exit(EXIT_FAILURE);
     }
-    if (incoming && preconfig_requested) {
-        error_report("'preconfig' and 'incoming' options are "
-                     "mutually exclusive");
+    if (incoming && preconfig_requested && strcmp(incoming, "defer") != 0) {
+        error_report("'preconfig' supports '-incoming defer' only");
         exit(EXIT_FAILURE);
     }
 
-- 
2.26.2



