Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E1335424F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 15:16:48 +0200 (CEST)
Received: from localhost ([::1]:60016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTP5z-0008Ch-Bb
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 09:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <basil@daynix.com>) id 1lTP3t-0006np-F0
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 09:14:37 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:50881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <basil@daynix.com>) id 1lTP3p-0005yZ-UR
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 09:14:37 -0400
Received: by mail-wm1-x32b.google.com with SMTP id a76so2496140wme.0
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 06:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mbyQp3khJuO+uC4dNzZJaaNxfsygnlYnxyi5g7TNEwQ=;
 b=BSmiNRSPJ/62EcOpPZWCFRakuczpp7+Axdst0iTO/Eq96OIiEoqNGcgWpVdRaEfKZa
 kgXl4PEe4/HBGcxuzFcs0uHJaDUuMSlHMWlWb1GS4dSMjUKQWyHs+UxDqU/c99RPDcdf
 o6gwKvBzqSrtLJV06F27iwKCfS1gmZ6rKiLQAFC1QRndjO/4lURisRccSn9hZMcysdhm
 k0fY54jxSkrR+dpB8Tq8+Pk+SvmxiCsbKtoSQc0imnw5OvjShYZ1nSG2hl9mYFE7iW8T
 KqO23EShONbKSvEDiC9pwmIdiTsJUMF1gZKvtwORr2uYES+XwUOqwLWofxyBRGOmpWi0
 UcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mbyQp3khJuO+uC4dNzZJaaNxfsygnlYnxyi5g7TNEwQ=;
 b=YwtpoiGek4ux5mhx+F4Azq78Nfviu54UA+f+7wJHQW1369BtjP01TrR12HKtKeabjb
 XfWYQFnSu8NjNQe16AUcB6IZtu6f7T8QLMX78Fyz6VY6+4DqotyXNwClvywXbolMcQ8U
 c35EERJEzeUU/abIZXXiZs8FEbYMEE2PN44cUMUTBUkiNtepZxFaO3WT5JJWsGrESOSC
 /cfrVzQTIsuYTzUht+e2SVYrN9pRC4e9vIBxv7mxCBtYppnGFyiOhq42MLBsEll2UB+t
 0oKoVe52MyIQw/Oj8oWJPweaUH30ysPHN08klP92rrW1YSOVU0ldqtoZG4WdTXKQG+xI
 v60g==
X-Gm-Message-State: AOAM533QXWJL5eMF8FKpM+jXCLx0ETeiR64J7qy13ZIKc/Q6xNJoNpGq
 hh2jwktF92mwzXN2+8Hu35k/BBa5Ou4qhw==
X-Google-Smtp-Source: ABdhPJwjvFld8u+crzfurmXDGaeg/2Fr1Er37XN/CDBdB82jIFoBJZr239AtATv6JXKuYLxN8E8uTA==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr6646196wmh.105.1617628472442; 
 Mon, 05 Apr 2021 06:14:32 -0700 (PDT)
Received: from localhost.localdomain (bzq-84-110-34-91.static-ip.bezeqint.net.
 [84.110.34.91])
 by smtp.gmail.com with ESMTPSA id e9sm12661542wrv.92.2021.04.05.06.14.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Apr 2021 06:14:32 -0700 (PDT)
From: Basil Salman <basil@daynix.com>
To: qemu-devel@nongnu.org,
	Michael Roth <michael.roth@amd.com>
Subject: [PATCH 3/3] qga-win: Fix handle leak in ga_get_win_product_name()
Date: Mon,  5 Apr 2021 16:14:20 +0300
Message-Id: <20210405131420.598273-3-basil@daynix.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20210405131420.598273-1-basil@daynix.com>
References: <20210405131420.598273-1-basil@daynix.com>
Received-SPF: none client-ip=2a00:1450:4864:20::32b;
 envelope-from=basil@daynix.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>, Kostiantyn Kostiuk <konstantin@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In ga_get_win_product_name() a handle to Registry key was open
but not closed.
In this patch the handle is closed as part of the free routine.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1929144

Signed-off-by: Basil Salman <basil@daynix.com>
Signed-off-by: Basil Salman <bsalman@redhat.com>
---
 qga/commands-win32.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index d51833ef15..8cea3ec0f8 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2229,7 +2229,7 @@ static char *ga_get_win_name(OSVERSIONINFOEXW const *os_version, bool id)
 
 static char *ga_get_win_product_name(Error **errp)
 {
-    HKEY key = NULL;
+    HKEY key = INVALID_HANDLE_VALUE;
     DWORD size = 128;
     char *result = g_malloc0(size);
     LONG err = ERROR_SUCCESS;
@@ -2239,7 +2239,8 @@ static char *ga_get_win_product_name(Error **errp)
                       &key);
     if (err != ERROR_SUCCESS) {
         error_setg_win32(errp, err, "failed to open registry key");
-        goto fail;
+        g_free(result);
+        return NULL;
     }
 
     err = RegQueryValueExA(key, "ProductName", NULL, NULL,
@@ -2260,9 +2261,12 @@ static char *ga_get_win_product_name(Error **errp)
         goto fail;
     }
 
+    RegCloseKey(key);
     return result;
 
 fail:
+    if (key != INVALID_HANDLE_VALUE) {
+        RegCloseKey(key);
+    }
     g_free(result);
     return NULL;
 }
-- 
2.17.2


