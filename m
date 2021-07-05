Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE8B3BC14F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:04:22 +0200 (CEST)
Received: from localhost ([::1]:54732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0R52-0004Mz-M4
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1F-0001At-PK
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:25 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:47061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1D-0003Zf-QM
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id n9so5307514wrs.13
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EBf1XxvnjwHyACj8LDHAse0MRy1NY8enHUr2qaJuunM=;
 b=eAEbdettcHmaLY0E4YyDPbonTw8gf94saVK04tIcxJReYt1IOciR9UGxw1GgP0aeFV
 jm9e4bjIYTdZU6wQSSFM9SvxMGsiMSzzEbuuhQuNCqOVoDKq08ksMuDgPn9V+FVCf3kU
 VtulXhff1kdbtq3Ilv7qXTzwS1ocSY0t3uzxIN1TEgSG0tYpbhfCNVEUEOpDWTXmWSox
 9HAcvaOcpkSze9nmyMR26kL5C51vn2NZ6G0YeGCnf5p6TH8eB5bCV5jYdcQYpJ0TQjGW
 t4gyroVTXgv8SHyo+BwXcCXwOtPTkQgsjS8DD/smgHcXGfDyKDkwZCcxtE2u9BUxIbRr
 G8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EBf1XxvnjwHyACj8LDHAse0MRy1NY8enHUr2qaJuunM=;
 b=jN6lDyHE0ov0DQW4KSUpoMtc/uj0f4QN6EWpc4eSzARuSv0sBRASyQxDVcVVGy7l4R
 2yPtLZv+2EsVVGc+WWkUwBpEj1TewQdFbYtk0MeDfaNp2dD3a89Lv/XgDy4rDrIzdZNu
 zeP9zdqOZ6gPYxJtAUyEydVN+ZzwiEowMZhCka9458Tc2Tw1BLBUPODOZIm2ib/pTIs2
 2u1RCtm1Vs32Cu3WPb2fd62cjn9n4hvqFhMWGmzc/OPP3xthlyjebyB8yiIL08jjTCri
 eu+4hR8vWWS11SK0EsLzRL24XxQFx/glNu+DUIo2eY7It1A8yaArd/EyoVfyOJdYshRq
 XphA==
X-Gm-Message-State: AOAM531rE2TXtaoNaBRM5dcwvv/i1qDnfyHS1F59VQuEm3PPWrWTC9PM
 sr5JUPBCoQQtXFwbR2x8Rced8HHPaSo=
X-Google-Smtp-Source: ABdhPJxa7CSfTiGvV7ET4OI4cvha/aBEoS/8Zo7lesHEHGXyZr2Q2LL5V5msXRysIV9gMo4FMW2tSw==
X-Received: by 2002:adf:e8cc:: with SMTP id k12mr16400897wrn.163.1625500820992; 
 Mon, 05 Jul 2021 09:00:20 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b12sm1217063wrt.78.2021.07.05.09.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 09:00:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/17] configure: drop vte-2.90 check
Date: Mon,  5 Jul 2021 18:00:02 +0200
Message-Id: <20210705160018.241397-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705160018.241397-1-pbonzini@redhat.com>
References: <20210705160018.241397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All currently supported distros have vte 0.37 or newer, which is where the
ABI changed from 2.90 to 2.91.  So drop support for the older ABI.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index e799d908a3..27841f82ed 100755
--- a/configure
+++ b/configure
@@ -2803,19 +2803,13 @@ fi
 # VTE probe
 
 if test "$vte" != "no"; then
-    vteminversion="0.32.0"
     if $pkg_config --exists "vte-2.91"; then
-      vtepackage="vte-2.91"
-    else
-      vtepackage="vte-2.90"
-    fi
-    if $pkg_config --exists "$vtepackage >= $vteminversion"; then
-        vte_cflags=$($pkg_config --cflags $vtepackage)
-        vte_libs=$($pkg_config --libs $vtepackage)
-        vteversion=$($pkg_config --modversion $vtepackage)
+        vte_cflags=$($pkg_config --cflags vte-2.91)
+        vte_libs=$($pkg_config --libs vte-2.91)
+        vteversion=$($pkg_config --modversion vte-2.91)
         vte="yes"
     elif test "$vte" = "yes"; then
-        feature_not_found "vte" "Install libvte-2.90/2.91 devel"
+        feature_not_found "vte" "Install libvte-2.91 devel"
     else
         vte="no"
     fi
-- 
2.31.1



