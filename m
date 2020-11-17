Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F4B2B5C65
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 11:00:23 +0100 (CET)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexmg-0005OA-GU
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 05:00:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkQ-0003O5-42
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkM-0003Ur-CZ
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605607077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=1tcsTmyQEqoy8eAVPVvaWe95q+8v20jdLwU+sNUf5+s=;
 b=VFnIAeS7cN+oXOwaWuW5eeA/lr/vnZR9VvdmC9aPh7lMRres8jdF37eqOlyJgwMhNE3r/o
 FmH473/bRDsEIqHjW+gE12ORglw3QxTk/Ul3+byE6GSxv1CH8bOHmJMLkn4NlzzIT8lOTV
 mnKGijZekKEDo2SJjfZ6+8TvQC54VVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-e0n6D6nlP1yG8z3_ETw3sQ-1; Tue, 17 Nov 2020 04:57:55 -0500
X-MC-Unique: e0n6D6nlP1yG8z3_ETw3sQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4493A1008319;
 Tue, 17 Nov 2020 09:57:54 +0000 (UTC)
Received: from thuth.com (ovpn-113-138.ams2.redhat.com [10.36.113.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BB555B4B6;
 Tue, 17 Nov 2020 09:57:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/12] configure: Fix the _BSD_SOURCE define for the Haiku build
Date: Tue, 17 Nov 2020 10:57:38 +0100
Message-Id: <20201117095748.122371-3-thuth@redhat.com>
In-Reply-To: <20201117095748.122371-1-thuth@redhat.com>
References: <20201117095748.122371-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Haiku VM that we are going to add is using _BSD_SOURCE instead
of BSD_SOURCE (without initial underscore)... according to David
Carlier, the BSD_SOURCE without underscore was likely a typo, so
let's simply add the underscore there now.
This fixes the build failure with the bswapXX() macros not being
defined after including <endian.h>.

Message-Id: <20201114165137.15379-2-thuth@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 4cef321d9d..a273a93377 100755
--- a/configure
+++ b/configure
@@ -790,7 +790,7 @@ SunOS)
 ;;
 Haiku)
   haiku="yes"
-  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -DBSD_SOURCE $QEMU_CFLAGS"
+  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE $QEMU_CFLAGS"
 ;;
 Linux)
   audio_drv_list="try-pa oss"
-- 
2.18.4


