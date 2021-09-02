Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363253FEE46
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:03:56 +0200 (CEST)
Received: from localhost ([::1]:59776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmNm-0007i4-1X
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLm9u-00058n-P9
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLm9s-00073h-BA
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630586971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6rqA3K9F3FH10/7wD1F+o+9rwIXYOs1faRHBea7/k5M=;
 b=SW4byJSUlW2NRNu7xeyQxcza4rUdbLq5s7rwJTwLpWhcIHom9oSQxVsI2/23E5eV3e6Bms
 iacVL6r7Jbvrq4LZ4gqixz8snYjcfRZy6bzAqFQcMNKh/Q+eRCc7RyZ5PkM1HJ3IdG4SuT
 /Mvj9MBokormt0ZzdwEv6QoB6wXRfYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-_xjFe40CO5yi5l7rmeo7FA-1; Thu, 02 Sep 2021 08:49:30 -0400
X-MC-Unique: _xjFe40CO5yi5l7rmeo7FA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C82E1083E8F;
 Thu,  2 Sep 2021 12:49:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8535610016F2;
 Thu,  2 Sep 2021 12:49:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/13] meson.build: Don't use internal libfdt if the user
 requested the system libfdt
Date: Thu,  2 Sep 2021 14:49:06 +0200
Message-Id: <20210902124911.822423-9-thuth@redhat.com>
In-Reply-To: <20210902124911.822423-1-thuth@redhat.com>
References: <20210902124911.822423-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the users ran configure with --enable-libfdt=system, they likely did
that on purpose. We should not silently fall back to the internal libfdt
if the system libfdt is not usable, but report the problem with a proper
message instead.

Message-Id: <20210827120901.150276-3-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index 6f7177428e..ecfdce921c 100644
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


