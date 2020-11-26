Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4696F2C4FF2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 09:05:33 +0100 (CET)
Received: from localhost ([::1]:49268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiCHU-0007uu-7w
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 03:05:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiCBo-0003js-CI
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 02:59:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiCBm-0007Hy-Ng
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 02:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606377573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iscxj1bJF1udx8dBwJ7KFfb3EmPFrugWzsS5Mh1Qmxo=;
 b=H8zTNSn1L+nf2AV/Hk6c+JQr1tJ3cKDl5VzvBm18Xb0SckNPDQSgkhtDKMsD47Kwe6S75F
 61FJNPLhmE8FfctOD7bfbk/ArxPqCYBWbJrN4Um3ZpyoYYwHzTXvjRk5hr5GLgUiI4IGka
 BNb9s34jy3cqdKR2nICX3Tmpccn923I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-I2WZYXzNNm2BWrAw4I-h0A-1; Thu, 26 Nov 2020 02:59:30 -0500
X-MC-Unique: I2WZYXzNNm2BWrAw4I-h0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C39E100C602;
 Thu, 26 Nov 2020 07:59:29 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8755860855;
 Thu, 26 Nov 2020 07:59:24 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] nsis: Fix build for 64 bit installer
Date: Thu, 26 Nov 2020 02:59:21 -0500
Message-Id: <20201126075921.3116321-6-pbonzini@redhat.com>
In-Reply-To: <20201126075921.3116321-1-pbonzini@redhat.com>
References: <20201126075921.3116321-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

Pass cpu instead of cpu_family to the NSIS installer script.

That script checks for "x86_64" which is the cpu value,
while cpu_family is "x86".

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201125191833.964753-1-sw@weilnetz.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 360623ece9..e3386196ba 100644
--- a/meson.build
+++ b/meson.build
@@ -1955,7 +1955,7 @@ if host_machine.system() == 'windows'
     '@OUTPUT@',
     get_option('prefix'),
     meson.current_source_dir(),
-    host_machine.cpu_family(),
+    host_machine.cpu(),
     '--',
     '-DDISPLAYVERSION=' + meson.project_version(),
   ]
-- 
2.26.2


