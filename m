Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6483A4141CD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 08:26:52 +0200 (CEST)
Received: from localhost ([::1]:59352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSviV-0000yV-GN
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 02:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWs-0001M9-Qp
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:51 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:42891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWo-0007Th-NF
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:50 -0400
Received: by mail-io1-xd35.google.com with SMTP id b10so1920157ioq.9
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 23:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k8/U+V4On1a0jp4LKCee8f0RCpT6m/1m5ZiCNYWdnpo=;
 b=A6l3w4ljprehLgyZOZHVTFuh2RNaBYHjVxgGJZqahzuqib9eDHNB5cPnQWiJwc+Pft
 wSfss0jB8NoGR/wxvsJao4tYZfkcckRmBWbvIEp67CKix8/S5M6I1Au7dfR/W2WDu+gj
 U6olBcnkL6VWGZiM5IdZ5KSzyycAw1q8i8FLQ1gKXwDiRpIPx/HH/X+OPvfeEiywcww8
 ugHhdzu/Zu7xw7zB3UWaGN2mxKg4+1++QisJ4tCiSN3S8WQV3EpmVDArvr3oh8sg1Ziv
 SYIn1j+1mD/ueMMzlyFWjFdNw35kFNoEI7VwV1l4cvjn3oOss8WUvN3BHV0j4T1qFlkn
 +CCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k8/U+V4On1a0jp4LKCee8f0RCpT6m/1m5ZiCNYWdnpo=;
 b=I2FtmCdB7k8X1vOwEVaPlDq6Xc7GOJCsap2gESDnUAqOFPzuNLrK+2YXYp14kbsM6W
 GezqxZrsq7eXm1zKx7CNnqsIkWGyOuCP3RyS4xGBjgsoEKgnsWZ9BuS7l6igkBXWX92w
 DK1fqolCK3exFwIt0UKFl27DNj9SIyBxRv3uji542wClngWq2YpHfbi/sVWOWFEVHqG6
 369WjgK86EvlmndMW2bujXxwcX49YJ2D3r6bCaao0h8WQa7QnmXUYYNvnlKPtwUy347B
 Hhn3JarfFlsSi10fNn1fCSrMd9t6nbu3N6jkuSH1IIRTGTMhieVVGf9aNhjxMyv038up
 zw7w==
X-Gm-Message-State: AOAM531U/0EPXEvimumw/f6mijo8I25y/EktLWhvIx9gtx04u8e1keKA
 zPekFW37uElUkXEW1n/FrJE6LyMmnsRcFwDJt9c=
X-Google-Smtp-Source: ABdhPJxxNdGUhzUqgGen+xs3Ibs34WwTwn7gbS5nVZQc+QtCHSq9i8McrdT0eZkEKl4p/AJ+jOxSBg==
X-Received: by 2002:a05:6602:117:: with SMTP id
 s23mr3128645iot.124.1632291284743; 
 Tue, 21 Sep 2021 23:14:44 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a25sm540817ioq.46.2021.09.21.23.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:14:44 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/14] bsd-user: export get_errno and is_error from syscall.c
Date: Wed, 22 Sep 2021 00:14:28 -0600
Message-Id: <20210922061438.27645-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922061438.27645-1-imp@bsdimp.com>
References: <20210922061438.27645-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make get_errno and is_error global so files other than syscall.c can use
them.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h    |  4 ++++
 bsd-user/syscall.c | 10 +++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 522d6c4031..22fc3a6c30 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -235,6 +235,10 @@ extern unsigned long target_dflssiz;
 extern unsigned long target_maxssiz;
 extern unsigned long target_sgrowsiz;
 
+/* syscall.c */
+abi_long get_errno(abi_long ret);
+int is_error(abi_long ret);
+
 /* user access */
 
 #define VERIFY_READ  PAGE_READ
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 372836d44d..a579d52ede 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -33,18 +33,18 @@
 static abi_ulong target_brk;
 static abi_ulong target_original_brk;
 
-static inline abi_long get_errno(abi_long ret)
+abi_long get_errno(abi_long ret)
 {
-    if (ret == -1)
+    if (ret == -1) {
         /* XXX need to translate host -> target errnos here */
         return -(errno);
-    else
-        return ret;
+    }
+    return ret;
 }
 
 #define target_to_host_bitmask(x, tbl) (x)
 
-static inline int is_error(abi_long ret)
+int is_error(abi_long ret)
 {
     return (abi_ulong)ret >= (abi_ulong)(-4096);
 }
-- 
2.32.0


