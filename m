Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F3A2C5711
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 15:26:24 +0100 (CET)
Received: from localhost ([::1]:43570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiIE3-0000i5-VL
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 09:26:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiIAG-0004UU-73
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 09:22:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiIAC-0005mm-LK
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 09:22:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606400544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D2aLyrM1tfSGtiUWdWept7ozELi7c+yJBSlVcGctauk=;
 b=J7w+5aNvy+S7hWDSG3vhkxovQS7MRkr8jIVQWCGvMpp3Qhs3+e+9lCWlD+eynsnG7NR7FA
 zWJ9/nTl/HjWR3+CRdXugu229qXSa6qcR9bzLhEskIpeSiGcQYfi/aLOSn0bz9/lzecBYX
 5lSxDvbOjku1kbHQxqLsxqgjVE9TmhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-tB6T3UoxMj-Jm7zQqsIUvQ-1; Thu, 26 Nov 2020 09:22:20 -0500
X-MC-Unique: tB6T3UoxMj-Jm7zQqsIUvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D782A8144E8;
 Thu, 26 Nov 2020 14:22:19 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 949C610013C0;
 Thu, 26 Nov 2020 14:22:19 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] meson: use dependency() to find libjpeg
Date: Thu, 26 Nov 2020 09:22:15 -0500
Message-Id: <20201126142218.3121595-2-pbonzini@redhat.com>
In-Reply-To: <20201126142218.3121595-1-pbonzini@redhat.com>
References: <20201126142218.3121595-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prefer pkg-config to find_library because some installations of libjpeg
may place it outside the default search path.

Reported-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 5062407c70..360623ece9 100644
--- a/meson.build
+++ b/meson.build
@@ -654,9 +654,8 @@ if get_option('vnc').enabled()
   vnc = declare_dependency() # dummy dependency
   png = dependency('libpng', required: get_option('vnc_png'),
                    method: 'pkg-config', static: enable_static)
-  jpeg = cc.find_library('jpeg', has_headers: ['jpeglib.h'],
-                         required: get_option('vnc_jpeg'),
-                         static: enable_static)
+  jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
+                    method: 'pkg-config', static: enable_static)
   sasl = cc.find_library('sasl2', has_headers: ['sasl/sasl.h'],
                          required: get_option('vnc_sasl'),
                          static: enable_static)
-- 
2.26.2



