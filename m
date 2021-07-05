Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED02A3BC170
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:12:38 +0200 (CEST)
Received: from localhost ([::1]:48412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0RD3-0002Gn-W2
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1K-0001K5-B3
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:30 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1I-0003dB-JD
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:30 -0400
Received: by mail-wr1-x429.google.com with SMTP id t15so19293852wry.11
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sHXNM04uxEiAbDswn208ExLFOlINybso2tUyXQRPesg=;
 b=EKHUsMGWxHmS8RNQeQIj13TXJABJzWfSy7I1GD6IR6sth52XgK2sS3VHn63EQAE29v
 1vCuiSIUU7feOmHL6mFG6iJm5bOzCdXLAHf43Rk1+vP9t8ouO72HVxkzyAv5kMCDDiNg
 byQybmBb30+6+ZwqnHbMRYgX3ly3bPhliFwJP13KT/Tx4fJFVpbIHOaon4b+BXAA8BdZ
 06jPhUVr+/paDv3o93cSo59iS0E4dzk7l9eLb9DCuyyC38VFZpKJbPLpxehsPbVfqtq7
 MKCZOuX5Hcxw0GpHKTNDS2TjqmXcXpK81N651Kxpo4NEyq8QvYpVUQozIWRA8AfnyAFd
 Am4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sHXNM04uxEiAbDswn208ExLFOlINybso2tUyXQRPesg=;
 b=T+LmNfLtvuTIDUXKDLRO7ZFq9dhtatJiDFVsSbkD7P0ARuUGkE2A/U6YHBxoZzCMr0
 p6zE4Rs0yWRjwK3IUR5C2xz83h64nAgK0TNIQJg+qfY/ANf480w1pRY0ozgUfqofx9dB
 5DpB4TIzEtJ5lDPbNuMxXXzwDd99c2kKtCyNLC4TCznvnw+7byynuIirwRemHMgKZCzl
 Rq+B2caDvm5dbkLxUU1pTAnzR49Ii/u22oSMijwsX6ateisTJmEVmENXX5wYF5iPDaTo
 ieScGVAlAXPkL+PSbd8KP1DJIdMmygt9pCd6N8e8aPXa8YFrKXXEauhhX70wtXZV/W2i
 VtOw==
X-Gm-Message-State: AOAM530NVfNXp64HKP921I9bTmx50ggHJuj9dw5wSEgItW1GggXt3dCp
 aD1ICyj6Py0m6wH1DpJBmo6Z6SjG7og=
X-Google-Smtp-Source: ABdhPJzv8/DMgMd9xq4C4rw741IrXFXTnLZL3R/CNGlX3xCJgURQoPV7pQ1wuz3994Z3C4WO/gkTww==
X-Received: by 2002:a5d:5609:: with SMTP id l9mr16468268wrv.123.1625500827278; 
 Mon, 05 Jul 2021 09:00:27 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b12sm1217063wrt.78.2021.07.05.09.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 09:00:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/17] configure, meson: move CONFIG_IVSHMEM to meson
Date: Mon,  5 Jul 2021 18:00:11 +0200
Message-Id: <20210705160018.241397-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705160018.241397-1-pbonzini@redhat.com>
References: <20210705160018.241397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
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

This is a duplicate of CONFIG_EVENTFD, handle it directly in meson.build.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure              | 8 --------
 docs/devel/kconfig.rst | 2 +-
 meson.build            | 5 +++--
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 341b74dd5e..a524104120 100755
--- a/configure
+++ b/configure
@@ -5037,11 +5037,6 @@ if test "$mingw32" = "yes" ; then
     done
 fi
 
-# We can only support ivshmem if we have eventfd
-if [ "$eventfd" = "yes" ]; then
-  ivshmem=yes
-fi
-
 # Probe for guest agent support/options
 
 if [ "$guest_agent" != "no" ]; then
@@ -5639,9 +5634,6 @@ fi
 if test "$have_getrandom" = "yes" ; then
   echo "CONFIG_GETRANDOM=y" >> $config_host_mak
 fi
-if test "$ivshmem" = "yes" ; then
-  echo "CONFIG_IVSHMEM=y" >> $config_host_mak
-fi
 if test "$debug_mutex" = "yes" ; then
   echo "CONFIG_DEBUG_MUTEX=y" >> $config_host_mak
 fi
diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
index cb2d7ffac0..a1cdbec751 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -303,5 +303,5 @@ variable::
     host_kconfig = \
       ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=y'] : []) + \
       ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
-      ('CONFIG_IVSHMEM' in config_host ? ['CONFIG_IVSHMEM=y'] : []) + \
+      (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
       ...
diff --git a/meson.build b/meson.build
index e288e4c21c..b5dcc3d70e 100644
--- a/meson.build
+++ b/meson.build
@@ -1335,10 +1335,11 @@ if link_language == 'cpp'
   }
 endif
 
+have_ivshmem = config_host.has_key('CONFIG_EVENTFD')
 host_kconfig = \
   ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=y'] : []) + \
   ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
-  ('CONFIG_IVSHMEM' in config_host ? ['CONFIG_IVSHMEM=y'] : []) + \
+  (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
   ('CONFIG_OPENGL' in config_host ? ['CONFIG_OPENGL=y'] : []) + \
   (x11.found() ? ['CONFIG_X11=y'] : []) + \
   ('CONFIG_VHOST_USER' in config_host ? ['CONFIG_VHOST_USER=y'] : []) + \
@@ -2489,7 +2490,7 @@ if have_tools
                install: true)
   endif
 
-  if 'CONFIG_IVSHMEM' in config_host
+  if have_ivshmem
     subdir('contrib/ivshmem-client')
     subdir('contrib/ivshmem-server')
   endif
-- 
2.31.1



