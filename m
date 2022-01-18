Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6730F492CA3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:43:58 +0100 (CET)
Received: from localhost ([::1]:60864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9sWT-0002sm-I8
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:43:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9s8S-0005Py-6S
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:19:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9s8N-0004Ua-Tn
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642526338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qUx4BP0FIwrp/ETX7AzAIjDyfL8mLaDKixyBGKf1G00=;
 b=F1s5GnpQYTs0pUa5XjZ6z2yOqIE0MkbJX9aHBUu82aeAYg1RJ9I8TlsmlBOOYBelffqER0
 MhTypD7qxbPyTrBZMRMUIqnx+7fhCrkmspnKHHA1CQMGP34q0V3EpCsvGtYnDyYfqqfgmH
 j1SWo1tmSqzwJoDv7kWttp3iKTBEojo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-1Va_pZ9NMPqAZQ_UIMy5Ow-1; Tue, 18 Jan 2022 12:18:53 -0500
X-MC-Unique: 1Va_pZ9NMPqAZQ_UIMy5Ow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA78018982B4;
 Tue, 18 Jan 2022 17:06:09 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78FB4753DA;
 Tue, 18 Jan 2022 17:06:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org
Subject: [PATCH] meson.build: Use a function from libfdt 1.5.1 for the library
 check
Date: Tue, 18 Jan 2022 18:05:48 +0100
Message-Id: <20220118170548.97288-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fdt version test in meson.build uses a function from libfdt v1.4.7,
but we require version 1.5.1 nowadays. Thus use a function that has
been introduced in that version instead.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/822
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 762d7cee85..d1cc04c7a2 100644
--- a/meson.build
+++ b/meson.build
@@ -2276,7 +2276,7 @@ if have_system
     if fdt.found() and cc.links('''
        #include <libfdt.h>
        #include <libfdt_env.h>
-       int main(void) { fdt_check_full(NULL, 0); return 0; }''',
+       int main(void) { fdt_find_max_phandle(NULL, NULL); return 0; }''',
          dependencies: fdt)
       fdt_opt = 'system'
     elif fdt_opt == 'system'
-- 
2.27.0


