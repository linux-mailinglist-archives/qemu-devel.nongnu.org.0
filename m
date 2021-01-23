Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDD930160C
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:48:01 +0100 (CET)
Received: from localhost ([::1]:44914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3KCm-0007eQ-P4
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxK-0003lE-BJ
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxI-0005u3-BJ
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9xPwOfOY8lTKsikvLCFCd4s4xVKDEsJ1hmayQty6fno=;
 b=OsLhdfpyFA+JMFlloMlPSwp4pVkBlTow7yW7y5hurHxAtHakcSg3ZkGQ/zLfkThTKA80+A
 WPAK9yFkhVWgS9GfNN1GJvK0/xt/cywfnTVP7HHBf2O6FyGi5FahfshBsBLg2avk5kSe3l
 dYGAeVYlmpD9hq4HW9J6TFEZ3SWtyeo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-vubidQ9XO9OV7qvCcSGMzA-1; Sat, 23 Jan 2021 09:31:57 -0500
X-MC-Unique: vubidQ9XO9OV7qvCcSGMzA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC37D10054FF
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 583F15DA2D;
 Sat, 23 Jan 2021 14:31:56 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/31] meson.build: Detect bzip2 program
Date: Sat, 23 Jan 2021 09:31:21 -0500
Message-Id: <20210123143128.1167797-25-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The --enable-bzip2/--disable-bzip2 configure arguments are
somehow misleading, they check for the bzip2 library, not
the bzip2 program.

We need the bzip2 program to install the EDK2 firmware blobs
(see commit 623ef637a2e "configure: Check bzip2 is available").

Check if the bzip2 program in the global meson.build to avoid
the configuration to succeed, but a later when trying to install
the firmware blobs:

    ../pc-bios/meson.build:5:2: ERROR: Program 'bzip2' not found

Reported-by: John Snow <jsnow@redhat.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Fixes: c8d5450bba3 ("configure: move install_blobs from configure to meson")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210114174509.2944817-3-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build         | 2 ++
 pc-bios/meson.build | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index ed4eb70cb5..95ef1c8adf 100644
--- a/meson.build
+++ b/meson.build
@@ -96,6 +96,8 @@ if get_option('install_blobs')
   endforeach
 endif
 
+bzip2 = find_program('bzip2', required: install_edk2_blobs)
+
 ##################
 # Compiler flags #
 ##################
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 6a341b6cea..af95c5d1f1 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -1,5 +1,4 @@
 if install_edk2_blobs
-  bzip2 = find_program('bzip2', required: true)
   fds = [
     'edk2-aarch64-code.fd',
     'edk2-arm-code.fd',
-- 
2.26.2



