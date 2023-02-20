Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27B469D231
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 18:42:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUAAm-00022s-LK; Mon, 20 Feb 2023 12:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pUAAj-00022Q-Ff
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:41:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pUAAh-0001VZ-SK
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676914911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7KiL9+KFCXh/oTcHXI2rSh6PoRnGKK4D8XMQnveaPqI=;
 b=QoDgx8wU/spj6qHgA5lLSGhf1NodVKMNsGr8OA5hvnSc4DOsF476CmuwWoaMLb1nxOwCIo
 R2V91bNrgEutINOZggYDx/wU1dGvodfUreFTz2ZgFsz4d4cy6G0b3tiERYBEByHAevjYfm
 14bc4f6vUfCWEqf/q3mlBAmsmctMeXU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-gvm5jXHsMKaBsHriLCMrjQ-1; Mon, 20 Feb 2023 12:41:49 -0500
X-MC-Unique: gvm5jXHsMKaBsHriLCMrjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A1441C17421;
 Mon, 20 Feb 2023 17:41:49 +0000 (UTC)
Received: from kostyanf14nb.Dlink (unknown [10.45.224.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4469F404CD84;
 Mon, 20 Feb 2023 17:41:48 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>
Subject: [PATCH 2/2] qga/win32: Use rundll for VSS installation
Date: Mon, 20 Feb 2023 19:41:42 +0200
Message-Id: <20230220174142.240393-3-kkostiuk@redhat.com>
In-Reply-To: <20230220174142.240393-1-kkostiuk@redhat.com>
References: <20230220174142.240393-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
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

Add specific an entry points for rundll which is
just a wrapper for COMRegister/COMUnregister functions.

resolves: rhbz#2167436
fixes: CVE-2023-0664

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
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


