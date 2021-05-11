Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E0937A244
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:36:56 +0200 (CEST)
Received: from localhost ([::1]:59292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNsr-0002qk-NY
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNXE-00026t-TF
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWr-0000pf-U6
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xHH2rqCNUObnMk1i36cH363z47DcN4mqhwv7prq11gI=;
 b=DbWYoJTHwLUCZPH8FieECF/4qbcYzA+HHyoSybKUQQ7zJZyaCBzbsgncC+Ux1vUf6GawvE
 rkbvCq4LI+UYhLEKorNSMWNHcn8mcjPqVs0TD6gfModY76FLWCZ/NkVc5ZUZbT7TsgRSWI
 leS7nPOFvgRoopQSRB/hjBeMLJT5ZDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-VjSbGpyjOXShHB1ecJQofg-1; Tue, 11 May 2021 04:14:06 -0400
X-MC-Unique: VjSbGpyjOXShHB1ecJQofg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEDA46D246
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:05 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F88E62923;
 Tue, 11 May 2021 08:14:05 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/33] configure: fix detection of gdbus-codegen
Date: Tue, 11 May 2021 04:13:49 -0400
Message-Id: <20210511081350.419428-33-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Sebastian Mitterle <smitterl@redhat.com>
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
Fixes: #178
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



