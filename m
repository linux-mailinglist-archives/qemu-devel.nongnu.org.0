Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021C428546D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 00:21:17 +0200 (CEST)
Received: from localhost ([::1]:41550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPvKe-0001Qj-08
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 18:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPv9d-0006rB-DP
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 18:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPv9b-0006Ow-FI
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 18:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602022190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=msMKr4jy4cvV0aBat9MPAID6/pVxztok8ewRpD09LUY=;
 b=cWXsHGpG4+YvjQtffHD4X312S3Oq/r9In0gZdPPNVbzNJE38Nh2XCxf6gGoTZwRfBgbHBs
 6FmxWa4ZINmPo1qCm7WIiuOJesNsQ+urTGuxqaasj1vEulv/3nTliWNQ56FC1GwIO8WHNf
 3eI3E3l7wLF2SNX/Fx4IVCSM6mTV+tc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-MdLodyApO9WpkLfuom-Olg-1; Tue, 06 Oct 2020 18:09:48 -0400
X-MC-Unique: MdLodyApO9WpkLfuom-Olg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 521BE1091069;
 Tue,  6 Oct 2020 22:09:47 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04FFB6EF44;
 Tue,  6 Oct 2020 22:09:46 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 09/21] qom: Improve error message displayed with missing object
 properties
Date: Tue,  6 Oct 2020 18:09:18 -0400
Message-Id: <20201006220930.908275-10-ehabkost@redhat.com>
In-Reply-To: <20201006220930.908275-1-ehabkost@redhat.com>
References: <20201006220930.908275-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Instead of only displaying the property missing, also display
the object name. This help developer to quickly figure out the
mistake without opening a debugger.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20200920155340.401482-1-f4bug@amsat.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 qom/object.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qom/object.c b/qom/object.c
index c335dce7e4..1065355233 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1291,7 +1291,8 @@ ObjectProperty *object_property_find_err(Object *obj, const char *name,
 {
     ObjectProperty *prop = object_property_find(obj, name);
     if (!prop) {
-        error_setg(errp, "Property '.%s' not found", name);
+        error_setg(errp, "Property '%s.%s' not found",
+                   object_get_typename(obj), name);
     }
     return prop;
 }
-- 
2.26.2


