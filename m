Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0799B373DA3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:26:05 +0200 (CEST)
Received: from localhost ([::1]:56724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leITT-0006em-KW
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1leIRy-0005uJ-SN
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:24:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1leIRu-0004F3-17
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620224664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FTD33FhTjuh5rTYJaXergicnx1aBAjM5j/lDbARUCV4=;
 b=WlqZT56H+1MZDwclYHF/Bit/3Rvj6NsUiarfoj63Si/7xU6D2sSInvAFbIvbDOdX7WXyMg
 8K0IesYhwpOWyRuM6JWYnWMHP8vas+GZ3FD6OfECWLH1kw3IPEed+xmvh5ye5C9v/2QRwK
 6Nj4Hy6V4sFTGZyYIflRyLGJcbkngNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-w52ThJKIOAmcKSIS5KkgrA-1; Wed, 05 May 2021 10:24:20 -0400
X-MC-Unique: w52ThJKIOAmcKSIS5KkgrA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37A62195D56D
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 14:24:20 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 936F95D741;
 Wed,  5 May 2021 14:24:12 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: fix detection of gdbus-codegen
Date: Wed,  5 May 2021 10:24:12 -0400
Message-Id: <20210505142412.705817-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: thuth@redhat.com, Sebastian Mitterle <smitterl@redhat.com>,
 elmarco@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"pkg-config --variable=gdbus_codegen gio-2.0" returns "gdbus-codegen",
and it does not pass test -x (which does not walk the path).

Meson 0.58.0 notices that something is iffy, as the dbus_vmstate1
assignment in tests/qtest/meson.build uses an empty string as the
command, and fails very eloquently:

../tests/qtest/meson.build:92:2: ERROR: No program name specified.

Use the "has" function instead of test -x, and fix the generation
of config-host.mak since meson.build expects that GDBUS_CODEGEN
is absent, rather than empty, if the tool is unavailable.

Reported-by: Sebastian Mitterle <smitterl@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 54f8475444..5877a6b2bf 100755
--- a/configure
+++ b/configure
@@ -3341,7 +3341,7 @@ if ! test "$gio" = "no"; then
         gio_cflags=$($pkg_config --cflags gio-2.0)
         gio_libs=$($pkg_config --libs gio-2.0)
         gdbus_codegen=$($pkg_config --variable=gdbus_codegen gio-2.0)
-        if [ ! -x "$gdbus_codegen" ]; then
+        if ! has "$gdbus_codegen"; then
             gdbus_codegen=
         fi
         # Check that the libraries actually work -- Ubuntu 18.04 ships
@@ -5704,6 +5704,8 @@ if test "$gio" = "yes" ; then
     echo "CONFIG_GIO=y" >> $config_host_mak
     echo "GIO_CFLAGS=$gio_cflags" >> $config_host_mak
     echo "GIO_LIBS=$gio_libs" >> $config_host_mak
+fi
+if test "$gdbus_codegen" != "" ; then
     echo "GDBUS_CODEGEN=$gdbus_codegen" >> $config_host_mak
 fi
 echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
-- 
2.26.2


