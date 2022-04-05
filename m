Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0B44F2990
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 11:38:41 +0200 (CEST)
Received: from localhost ([::1]:44136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbfe2-0001re-4x
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 05:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nbfMP-0006pZ-HA
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:20:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nbfMI-0001qR-AM
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:20:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649150417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GjZaBCs6xPPvOTcK99tzAcs0y9oxheE4duMLgEWctqc=;
 b=ENbw0KvFX2RhqFYUs41Uojtv6wppwzk/aba262ibSk4hYpabbTsqfo5MPXSH3igRo1VAy7
 WuE0swk+ynHsPtUmMXKBdW/SfIK9E1JR3/fzZR7Hog8ID0mVIHwXQzwVrYgujk1Kvxgvc9
 LxkzpLqgM8zmvNbfeeL9y/0Xo8+7tT8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-XOLbiRrmNvKyyXxRutNxyw-1; Tue, 05 Apr 2022 05:20:14 -0400
X-MC-Unique: XOLbiRrmNvKyyXxRutNxyw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 556C3800882;
 Tue,  5 Apr 2022 09:20:14 +0000 (UTC)
Received: from avogadro.mxp.redhat.com (unknown [10.32.181.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27A902167D9B;
 Tue,  5 Apr 2022 09:20:04 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] qga/vss-win32: fix compilation with clang++
Date: Tue,  5 Apr 2022 11:20:00 +0200
Message-Id: <20220405092001.104507-3-pbonzini@redhat.com>
In-Reply-To: <20220405092001.104507-1-pbonzini@redhat.com>
References: <20220405092001.104507-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Helge Konetzka <hk@zapateado.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Helge Konetzka <hk@zapateado.de>

This fixes:

qga/vss-win32/install.cpp:49:24: error: cannot initialize a variable of
type 'char *' with an rvalue of type 'const char *'
    char *msg = NULL, *nul = strchr(text, '(');
                       ^     ~~~~~~~~~~~~~~~~~

Signed-off-by: Helge Konetzka <hk@zapateado.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Message-Id: <39400817-3dc9-516d-9096-bc1f68862531@zapateado.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/vss-win32/install.cpp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
index 8076efe3cb..b57508fbe0 100644
--- a/qga/vss-win32/install.cpp
+++ b/qga/vss-win32/install.cpp
@@ -46,7 +46,8 @@ void errmsg(DWORD err, const char *text)
      * If text doesn't contains '(', negative precision is given, which is
      * treated as though it were missing.
      */
-    char *msg = NULL, *nul = strchr(text, '(');
+    char *msg = NULL;
+    const char *nul = strchr(text, '(');
     int len = nul ? nul - text : -1;
 
     FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER |
-- 
2.35.1



