Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E5F3F98E7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 14:11:50 +0200 (CEST)
Received: from localhost ([::1]:54902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJai5-0002jZ-Ac
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 08:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJafg-00082r-GV
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 08:09:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJafe-0004eU-Vo
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 08:09:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630066158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RfZfF21nSXQrRkrJHOwZUW8yGVvBIA0k8gN9gMcChCw=;
 b=K3oNLRkf7cRMU+qeQK9ocmtlaifhMKk6WupWR9EcqoOQ7uFDBeUhPrLqAUOf4KS9z1b8MT
 9VbA4zVQL1sySSpWntb2fKoNOSXEr36HK83iA3QYz5lZgEOUZFmygS4HHM+DHTJ/7c+ucg
 VLqi0TBFw+FOCFfLkcSIajKv+6yUrfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-LlufIBm7MWi1NEmu0YqNWg-1; Fri, 27 Aug 2021 08:09:15 -0400
X-MC-Unique: LlufIBm7MWi1NEmu0YqNWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 162481082925;
 Fri, 27 Aug 2021 12:09:14 +0000 (UTC)
Received: from thuth.com (unknown [10.40.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C33B368D97;
 Fri, 27 Aug 2021 12:09:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] meson.build: Don't use internal libfdt if the user
 requested the system libfdt
Date: Fri, 27 Aug 2021 14:09:00 +0200
Message-Id: <20210827120901.150276-3-thuth@redhat.com>
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the users ran configure with --enable-libfdt=system, they likely did
that on purpose. We should not silently fall back to the internal libfdt
if the system libfdt is not usable, but report the problem with a proper
message instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index ee156ff0a5..bc6a52b909 100644
--- a/meson.build
+++ b/meson.build
@@ -1912,6 +1912,8 @@ if have_system
        int main(void) { fdt_check_full(NULL, 0); return 0; }''',
          dependencies: fdt)
       fdt_opt = 'system'
+    elif fdt_opt == 'system'
+       error('system libfdt requested, but it is too old (1.5.1 or newer required)')
     elif have_internal
       fdt_opt = 'internal'
     else
-- 
2.27.0


