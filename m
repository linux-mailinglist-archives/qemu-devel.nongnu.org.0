Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DE16B12A1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 21:05:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa01b-00012B-Mq; Wed, 08 Mar 2023 15:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pa01Y-000115-UE
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:04:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pa01W-0006xV-Ri
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678305869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n7a42SrubIoXUImbAN8XOyOMoYa67DMUvHOpB/gTJ0M=;
 b=DVCn21zItp4RE6GNyT+qHz06HEg1JRWu6twm2t/lY0hJCme4Xtko/nRy2vfxMPjVGEoHfj
 6ELVW2S7BKp2fY0MAZzVZc+cI6mYYPC103UvXUkoPvN/FJNv9UPcQG/tIHF1+RjI9qZGEt
 gdyKNxN5xfRF3t7DX4wVFieaeWceCBU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-R1cTlSxrMcS8EIIexxB1fw-1; Wed, 08 Mar 2023 15:04:26 -0500
X-MC-Unique: R1cTlSxrMcS8EIIexxB1fw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3B401C27D86;
 Wed,  8 Mar 2023 20:04:25 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.45.224.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8C5F2026D4B;
 Wed,  8 Mar 2023 20:04:24 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 2/5] qga/win32: Use rundll for VSS installation
Date: Wed,  8 Mar 2023 22:04:16 +0200
Message-Id: <20230308200419.453688-3-kkostiuk@redhat.com>
In-Reply-To: <20230308200419.453688-1-kkostiuk@redhat.com>
References: <20230308200419.453688-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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

The custom action uses cmd.exe to run VSS Service installation
and removal which causes an interactive command shell to spawn.
This shell can be used to execute any commands as a SYSTEM user.
Even if call qemu-ga.exe directly the interactive command shell
will be spawned as qemu-ga.exe is a console application and used
by users from the console as well as a service.

As VSS Service runs from DLL which contains the installer and
uninstaller code, it can be run directly by rundll32.exe without
any interactive command shell.

Add specific entry points for rundll which is just a wrapper
for COMRegister/COMUnregister functions with proper arguments.

resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2167423
fixes: CVE-2023-0664 (part 2 of 2)

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Yan Vugenfirer <yvugenfi@redhat.com>
Reported-by: Brian Wiltse <brian.wiltse@live.com>
---
 qga/installer/qemu-ga.wxs | 10 +++++-----
 qga/vss-win32/install.cpp |  9 +++++++++
 qga/vss-win32/qga-vss.def |  2 ++
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index feb629ec47..46ae9e7a13 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -127,22 +127,22 @@
       </Directory>
     </Directory>
 
-    <Property Id="cmd" Value="cmd.exe"/>
+    <Property Id="rundll" Value="rundll32.exe"/>
     <Property Id="REINSTALLMODE" Value="amus"/>
 
     <?ifdef var.InstallVss?>
     <CustomAction Id="RegisterCom"
-              ExeCommand='/c "[qemu_ga_directory]qemu-ga.exe" -s vss-install'
+              ExeCommand='"[qemu_ga_directory]qga-vss.dll",DLLCOMRegister'
               Execute="deferred"
-              Property="cmd"
+              Property="rundll"
               Impersonate="no"
               Return="check"
               >
     </CustomAction>
     <CustomAction Id="UnRegisterCom"
-              ExeCommand='/c "[qemu_ga_directory]qemu-ga.exe" -s vss-uninstall'
+              ExeCommand='"[qemu_ga_directory]qga-vss.dll",DLLCOMUnregister'
               Execute="deferred"
-              Property="cmd"
+              Property="rundll"
               Impersonate="no"
               Return="check"
               >
diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
index b57508fbe0..68662a6dfc 100644
--- a/qga/vss-win32/install.cpp
+++ b/qga/vss-win32/install.cpp
@@ -357,6 +357,15 @@ out:
     return hr;
 }
 
+STDAPI_(void) CALLBACK DLLCOMRegister(HWND, HINSTANCE, LPSTR, int)
+{
+    COMRegister();
+}
+
+STDAPI_(void) CALLBACK DLLCOMUnregister(HWND, HINSTANCE, LPSTR, int)
+{
+    COMUnregister();
+}
 
 static BOOL CreateRegistryKey(LPCTSTR key, LPCTSTR value, LPCTSTR data)
 {
diff --git a/qga/vss-win32/qga-vss.def b/qga/vss-win32/qga-vss.def
index 927782c31b..ee97a81427 100644
--- a/qga/vss-win32/qga-vss.def
+++ b/qga/vss-win32/qga-vss.def
@@ -1,6 +1,8 @@
 LIBRARY      "QGA-PROVIDER.DLL"
 
 EXPORTS
+	DLLCOMRegister
+	DLLCOMUnregister
 	COMRegister		PRIVATE
 	COMUnregister		PRIVATE
 	DllCanUnloadNow		PRIVATE
-- 
2.25.1


