Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E345F28FC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 09:09:29 +0200 (CEST)
Received: from localhost ([::1]:50600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofFZv-0005fe-RP
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 03:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ofFWS-0003Pg-Cs
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 03:05:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ofFWL-0004YN-L5
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 03:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664780741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=egaj1fcf/WoJTXCBb40TAoJRsBRtAB3MnpTrpECqxro=;
 b=Inqg+WYHS+ff8Bo818bGnW1uSjJFoa22BZmOtpPg+uAGFyP1aNRim+lE4/16/pPfRjEuOl
 gpHTD7auvl/yvhDtJXcTymAN9eKv5UKIuiJcAoLDXXPR4wvItxId7SzfL9MzpgDs0onAlM
 ElKJy4qw+Jn6bwGA4dCEXEmzNrK15oo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-gKZZ_c4ZMgmFQF_n7taCfA-1; Mon, 03 Oct 2022 03:05:38 -0400
X-MC-Unique: gKZZ_c4ZMgmFQF_n7taCfA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 343D885A59D;
 Mon,  3 Oct 2022 07:05:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1471A2166B26;
 Mon,  3 Oct 2022 07:05:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: jb-gnumlists@wisemo.com, thuth@redhat.com, jasowang@redhat.com,
 qemu_oss@crudebyte.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] build-sys: error when slirp is not found and not disabled
Date: Mon,  3 Oct 2022 11:05:34 +0400
Message-Id: <20221003070534.2180380-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This is an alternative configure-time solution to "[PATCH] net:
print a more actionable error when slirp is not found".

See also "If your networking is failing after updating to the latest git
version of QEMU..." ML thread.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meson.build b/meson.build
index 8dc661363f..565096001d 100644
--- a/meson.build
+++ b/meson.build
@@ -657,6 +657,12 @@ if not get_option('slirp').auto() or have_system
   endif
 endif
 
+if not get_option('slirp').disabled() and not slirp.found()
+  error('libslirp is not explicitely disabled and was not found. ' +
+        'Since qemu 7.2, libslirp is no longer included as a submodule ' +
+        'fallback, you must install it on your system or --disable-libslirp.')
+endif
+
 vde = not_found
 if not get_option('vde').auto() or have_system or have_tools
   vde = cc.find_library('vdeplug', has_headers: ['libvdeplug.h'],
-- 
2.37.3


