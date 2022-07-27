Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E854258214E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 09:40:07 +0200 (CEST)
Received: from localhost ([::1]:60096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGbeI-0002XO-Ni
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 03:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGbaK-000609-Fz
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:36:00 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGbaI-0002IP-5g
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:36:00 -0400
Received: by mail-pl1-x62e.google.com with SMTP id t2so1448683ply.2
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 00:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fFZfjp0jm4rG+YetdnNNuYVFJ5peINhs32kgHpyqjdA=;
 b=NJsJYBwt66amVam2SCGwCrrETqwcQp2pyFEMFD+kfE0hoXwzS2kawlpxrA+5zlZEBU
 CW9YzdD8VoMBFbSJ5Tl5b2mmB2R90+pNDZKoUf3NOWLJ9TiniuGITLBc9Tk7T3WqOvVC
 OBPuDexPHrV5bACQll5vSVpLEwVAnK2i7FR6IS7pAgzN+ddgdIRtZdD9mWvrQQxY458n
 EUD8/ys9Nb9SL9Y5LOfWspQZV3RJXTLLet0kyBDbIpw+OI0tYRpbNADW324DkleEIAef
 Og+xhWnJMGGaMO3QfEDrxe4ixsV0NQM6bkSCu+d/XhCC4fjp8+Ca+kQxHSaW/YxVdgfG
 lr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fFZfjp0jm4rG+YetdnNNuYVFJ5peINhs32kgHpyqjdA=;
 b=TnWtcrgFgjTjexFbVq/68zhnXZ21Ln5fFtOAobyhQRQiE/TQ7g+NNqGs920QIdPR/v
 psxp6am9pl1bHU9I14uyS0qkKO92NGKxnVCKYR70SESVBLK/R9jb21wQrBFnGOLcZPKV
 tyldPfaQnkAmclftic7kFxPOWizihxLo7lJGXaytdKMfGNL7am7NVYDUFt9Cj9vS8WOu
 U+BB7L766Fzaud+dZ0k9xo2QXoL1FPHOPGQnoQAYFt6lkkW/G9EPlKMIlHIrhlLQ+hHT
 QotxQzYmswu6nVTTYUdnTqRjaoRariA9ltFm83LtBCcso6MwnW2BpBBKQwhUccGl+f6H
 H2Sw==
X-Gm-Message-State: AJIora+EOvFwb8FEbB206ajIe3HwwNzdpHXHOkGWASjFmwnNNb0YQ0AJ
 pwv+VyBo+NbYUxD+bhrARuSHq6jCPPo=
X-Google-Smtp-Source: AGRyM1vSxQLy/IOfQep9oH/v9BNXGuPU44Der9zC2DnWteqVLoOtODl8nx+IfEgovPm7S1EobNa5Lw==
X-Received: by 2002:a17:902:ecc7:b0:16d:66eb:bb88 with SMTP id
 a7-20020a170902ecc700b0016d66ebbb88mr15870202plh.170.1658907357164; 
 Wed, 27 Jul 2022 00:35:57 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a170902ccc700b0016c09a0ef87sm10533834ple.255.2022.07.27.00.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 00:35:55 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH 3/5] qga/commands-win32: Use os_get_win_version()
Date: Wed, 27 Jul 2022 15:35:40 +0800
Message-Id: <20220727073542.811420-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727073542.811420-1-bmeng.cn@gmail.com>
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Drop its own ga_get_win_version() implementation, and use the one
provided in oslib-win32 instead.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 qga/commands-win32.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 7ed7664715..6186f2e1f2 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2178,26 +2178,6 @@ static ga_win_10_0_t const WIN_10_0_CLIENT_VERSION_MATRIX[3] = {
     {0, 0}
 };
 
-static void ga_get_win_version(RTL_OSVERSIONINFOEXW *info, Error **errp)
-{
-    typedef NTSTATUS(WINAPI *rtl_get_version_t)(
-        RTL_OSVERSIONINFOEXW *os_version_info_ex);
-
-    info->dwOSVersionInfoSize = sizeof(RTL_OSVERSIONINFOEXW);
-
-    HMODULE module = GetModuleHandle("ntdll");
-    PVOID fun = GetProcAddress(module, "RtlGetVersion");
-    if (fun == NULL) {
-        error_setg(errp, QERR_QGA_COMMAND_FAILED,
-            "Failed to get address of RtlGetVersion");
-        return;
-    }
-
-    rtl_get_version_t rtl_get_version = (rtl_get_version_t)fun;
-    rtl_get_version(info);
-    return;
-}
-
 static char *ga_get_win_name(OSVERSIONINFOEXW const *os_version, bool id)
 {
     DWORD major = os_version->dwMajorVersion;
@@ -2312,17 +2292,12 @@ static char *ga_get_current_arch(void)
 
 GuestOSInfo *qmp_guest_get_osinfo(Error **errp)
 {
-    Error *local_err = NULL;
     OSVERSIONINFOEXW os_version = {0};
     bool server;
     char *product_name;
     GuestOSInfo *info;
 
-    ga_get_win_version(&os_version, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return NULL;
-    }
+    os_get_win_version(&os_version);
 
     server = os_version.wProductType != VER_NT_WORKSTATION;
     product_name = ga_get_win_product_name(errp);
-- 
2.34.1


