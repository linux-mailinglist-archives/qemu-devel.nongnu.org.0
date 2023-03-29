Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031986CD989
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 14:47:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phVBn-0007Y1-QC; Wed, 29 Mar 2023 08:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phVBm-0007Xa-B2
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 08:46:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phVBk-0002LU-SZ
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 08:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680093963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XBGeMaAuNf6vDdcHhRPgYiFUGalBtVcTLCCDD3wEpr8=;
 b=IuBxeRWedUg6Vlu0hkiv2dujdnTnr3ykNJGNFQAIHtV9vnAb2D7tFYudA0BA0s2M8Vqt8k
 SCNJCbtt90krCJGGtQ8kPLoXgmV5AbAhMF8h5vM7601LCVU3Mr+CfbjdHRtT21dY/aLPPf
 pYD81mTmAbKiO3Cfh9Pxvr2j4m1rIzI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-U5YBoeOXOzK2fU3-LB6EQw-1; Wed, 29 Mar 2023 08:46:02 -0400
X-MC-Unique: U5YBoeOXOzK2fU3-LB6EQw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0CDC3822DE8;
 Wed, 29 Mar 2023 12:46:01 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7ED1D14171BF;
 Wed, 29 Mar 2023 12:46:01 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] tests/vm: use the default system python for NetBSD
Date: Wed, 29 Mar 2023 08:46:01 -0400
Message-Id: <20230329124601.822209-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently our NetBSD VM recipe requests instal of the python37 package
and explicitly tells QEMU to use that version of python. Since the
NetBSD base ISO was updated to version 9.3 though, the default system
python version is 3.9 which is sufficiently new for QEMU to rely on.
Rather than requesting an older python, just test against the default
system python which is what most users will have.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/vm/netbsd | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index aa54338dfa..0b9536ca17 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -30,7 +30,6 @@ class NetBSDVM(basevm.BaseVM):
         "git-base",
         "pkgconf",
         "xz",
-        "python37",
         "ninja-build",
 
         # gnu tools
@@ -66,7 +65,7 @@ class NetBSDVM(basevm.BaseVM):
         mkdir src build; cd src;
         tar -xf /dev/rld1a;
         cd ../build
-        ../src/configure --python=python3.7 --disable-opengl {configure_opts};
+        ../src/configure --disable-opengl {configure_opts};
         gmake --output-sync -j{jobs} {target} {verbose};
     """
     poweroff = "/sbin/poweroff"
-- 
2.39.1


