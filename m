Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 561D448E6D5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 09:49:54 +0100 (CET)
Received: from localhost ([::1]:47134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8IHQ-0001G8-Ty
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 03:49:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1n8IBB-0007LH-Mo
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:43:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1n8IB9-00077t-F7
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:43:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642149803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9N+UEOqGVufRzOkBuUb7robNgZerYsu2tUe7bTAtTjU=;
 b=Nmo+Wdx/CLNJLPJEd3P6CyLfT9Z7UqI5zPypxoAWRmRsjhAFuS6w2W2d099MSRo8C8vacL
 3AZZ4y24V0mA4UDUfBS9FdbYRLwrZS5i0u9h/m9+roB28RnZrI1Pk0JI/Q4lJCcVxxtyZQ
 ZsKnMyizc2xKuZSP8SWoNJoaS3GyzIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-GuWikm7CPr2qyVVebcYxOg-1; Fri, 14 Jan 2022 03:43:21 -0500
X-MC-Unique: GuWikm7CPr2qyVVebcYxOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 144BC801B32
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 08:43:21 +0000 (UTC)
Received: from localhost (unknown [10.39.208.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B29F978C1D;
 Fri, 14 Jan 2022 08:43:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] build-sys: fix undefined ARCH error
Date: Fri, 14 Jan 2022 12:43:11 +0400
Message-Id: <20220114084312.3725242-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

../qga/meson.build:76:4: ERROR: Key ARCH is not in the dictionary.

Fixes commit 823eb013 ("configure, meson: move ARCH to meson.build")

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/meson.build b/qga/meson.build
index cfb1fbc0853c..613ecb980286 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -75,7 +75,7 @@ if targetos == 'windows'
     endif
     qga_msi = custom_target('QGA MSI',
                             input: files('installer/qemu-ga.wxs'),
-                            output: 'qemu-ga-@0@.msi'.format(config_host['ARCH']),
+                            output: 'qemu-ga-@0@.msi'.format(host_arch),
                             depends: deps,
                             command: [
                               find_program('env'),
-- 
2.34.1.428.gdcc0cd074f0c


