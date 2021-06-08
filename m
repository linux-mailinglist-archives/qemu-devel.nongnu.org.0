Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7FD39F56A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:45:27 +0200 (CEST)
Received: from localhost ([::1]:36740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaAg-0006DA-V9
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpO-0006wP-L0
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpM-000873-R3
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:26 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so1668661wmd.5
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7FKShxn7QBxgN3qly4JQ5WCEBg/8yu0IMrH4TjLvmeU=;
 b=VvhahdfHFgs/ilBBpRBRe/xllLg+2WJB4bi09+ETvFE1uzShjSVH6sgt/mzi3XDHbE
 Jo5WOrIEURakXnAqsqH90vmVBCHQql8tyALBJLpdmkYRDTjw7vD0lb12tMD5uLIy5og2
 GJ50BNMlyVaC8uFXGleg/9rce6K38p0BDVIud+OZEOA/loof1vvqmQlicEFIpEZCsAmZ
 7317kPyFZVY2IaH2MenjAnD3uE6KxHnY07uylcwxKJ8Qer1NAB5c9qOb23qNsO2NceLs
 vddAjdVhY7TMdgj2RU0ksUolQnhl5rcS9G91uIhdoFTr3Qht8odXUc+BaBS2A+nQk0ap
 Xp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7FKShxn7QBxgN3qly4JQ5WCEBg/8yu0IMrH4TjLvmeU=;
 b=mq4Kcd16+I+09U4u4wWf9IIxORk35b9jU1OPWcKsE9wo1ewvpzfM8Avhe2sX0BBGxg
 VeVDf978J3vefWUKx/RXsVPf0C9Ey4EnOsqVkNdnLsHJYXHgIcRu6JGNok/WwBZKe5En
 BNsmlLS07UaDW3yWQT3sOyZR8JFEROmQrHjUkwV/NelJDUhsZ8sDEGtz0a0UysdFkbOk
 zGkrd9qG4sDZx3LFZIKtPr9HPG/++fyXV5YR3TTp4MGTSEKdl5GP49MHLltwjIyTR/Zu
 1Rl3qoX5yZ21HpHGvFis/rD9gluhhfEZzqlGeadOzKkn6ccQl8pzPdlAPCAGPj5MOciT
 abLA==
X-Gm-Message-State: AOAM530dXE0UE9nQSqDIDxTeAl0iVx6WKjUgfsJrByMK4ELBl1ZHR574
 Ix7lckJg5tdlkr08LZrUw9rrbxyoEW+4Zw==
X-Google-Smtp-Source: ABdhPJyWR7ylK5I9sFyQBDCGrdWjWh23vppai8tsxhyLQntoOlWDEgBdNWcygwN9wKVnjHepd44z3w==
X-Received: by 2002:a05:600c:3b11:: with SMTP id
 m17mr21621044wms.150.1623151403716; 
 Tue, 08 Jun 2021 04:23:23 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/26] configure: convert CONFIG_STATIC_ASSERT tests to meson
Date: Tue,  8 Jun 2021 13:22:58 +0200
Message-Id: <20210608112301.402434-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 18 ------------------
 meson.build |  6 ++++++
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/configure b/configure
index 3e94ec0bd2..dd6098e306 100755
--- a/configure
+++ b/configure
@@ -4392,20 +4392,6 @@ then
 fi
 
 
-##########################################
-# check for _Static_assert()
-
-have_static_assert=no
-cat > $TMPC << EOF
-_Static_assert(1, "success");
-int main(void) {
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-    have_static_assert=yes
-fi
-
 ##########################################
 # checks for sanitizers
 
@@ -5128,10 +5114,6 @@ if test "$have_af_vsock" = "yes" ; then
   echo "CONFIG_AF_VSOCK=y" >> $config_host_mak
 fi
 
-if test "$have_static_assert" = "yes" ; then
-  echo "CONFIG_STATIC_ASSERT=y" >> $config_host_mak
-fi
-
 if test "$debug_mutex" = "yes" ; then
   echo "CONFIG_DEBUG_MUTEX=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 0b9dac5546..4b9bbca7ff 100644
--- a/meson.build
+++ b/meson.build
@@ -1318,6 +1318,12 @@ config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
 config_host_data.set('HAVE_UTMPX',
                      cc.has_header_symbol('utmpx.h', 'struct utmpx'))
 
+config_host_data.set('CONFIG_STATIC_ASSERT', cc.compiles('''
+  _Static_assert(1, "success");
+  int main(void) {
+    return 0;
+  }'''))
+
 # Some versions of Mac OS X incorrectly define SIZE_MAX
 config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
     #include <stdint.h>
-- 
2.31.1



