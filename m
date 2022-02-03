Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DD04A8A6E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 18:43:07 +0100 (CET)
Received: from localhost ([::1]:51208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFg8P-0005MK-Ar
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 12:43:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzo-0004v9-Bh
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:12 -0500
Received: from [2a00:1450:4864:20::529] (port=40471
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzm-0008GS-H0
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:11 -0500
Received: by mail-ed1-x529.google.com with SMTP id w25so7503181edt.7
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g58WPJ8zdxCUyMoGJf6s4wpUFN+9TKuEYqIrdxAgx5g=;
 b=b/9msbDJjV6vWTmFOmpN/VngkHIgbb9BXMEriG4lC7ZbxjCmrHWiefU9+KdoZRlw7V
 vWto0y6ntuPNz0c/ofSDPTf0EwJgaZBkHdkx2swgALJC3JABzseC/of/JNSl7n7XPqGy
 ov+VNydFpsBbOVRhalJsvSHSHIgeuy7/5ehwW8bT0pis47wpdTGZpCM8cukAtnQyCLVy
 gWKF8xXDv1dktmf6IABgaKlY2CM+OQo5HpFUm8oK7+82pXWJbQPAhDQzinKYvIvwvH+6
 +GlDDI2cOJB7jrTcVTtlL9yXfw3Br3SHfs7SOlf5pADpHoTXaZPWE+zRYHnDupuUfKOm
 2dOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=g58WPJ8zdxCUyMoGJf6s4wpUFN+9TKuEYqIrdxAgx5g=;
 b=pU58UkubUou7Q0OWxuCAlDb5DdNTsSKyRy8Enmwc2idXonVJuvKSQb+eE/2B4ifMO3
 Wsa2KZixyOh0AVlnqX2VvIXKmJ8B9f7HteOyrQ91OXx5C85s2yCtkrxwIY2qrgpbxOpD
 77ltLPbF1f9EHgScUZ+iM54y+2k83FH/X6sxtkEPWjb9gmiKpTaZCc0198XYabgAi1Yx
 6ukML71Xoh1uuW4SLTYk8NjBMk6yu/TBCcBESDbpc5DWVIxDJK9XoXbRASE860NGYjXr
 JDths3q79lBChlJcDh+dVuXLI5jnkQusvBq5XBy/JzvpPLxBKK+m+lRweLCCwZDtnlOI
 QR9A==
X-Gm-Message-State: AOAM530me4luQPzphucYPZl7QCB+bN6cyW+b7KlpsJOA6p/09aRyiAz5
 9jpn25fpvc0/T9k6SiE9VS5CQvOXjxU=
X-Google-Smtp-Source: ABdhPJzYMD5fXjRQ9RO27x0hiuQNnyY4MX31PaJi1sP1mQWI2NvFeEdldDGYfO34GM0/poEIayjnvQ==
X-Received: by 2002:a05:6402:d64:: with SMTP id
 ec36mr36159360edb.259.1643909649209; 
 Thu, 03 Feb 2022 09:34:09 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/27] meson: define qemu_cflags/qemu_ldflags
Date: Thu,  3 Feb 2022 18:33:43 +0100
Message-Id: <20220203173359.292068-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prepare for moving more compiler tests to Meson.  If the full set
of compiler flags is needed in a cc.compiles/cc.links test, it will
be handy to have a variable analogous to QEMU_CFLAGS.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index 1199279209..f9aa9a1dab 100644
--- a/meson.build
+++ b/meson.build
@@ -163,6 +163,10 @@ endif
 # Compiler flags #
 ##################
 
+qemu_cflags = config_host['QEMU_CFLAGS'].split()
+qemu_cxxflags = config_host['QEMU_CXXFLAGS'].split()
+qemu_ldflags = config_host['QEMU_LDFLAGS'].split()
+
 # Specify linker-script with add_project_link_arguments so that it is not placed
 # within a linker --start-group/--end-group pair
 if get_option('fuzzing')
@@ -198,12 +202,9 @@ if get_option('fuzzing')
   endif
 endif
 
-add_global_arguments(config_host['QEMU_CFLAGS'].split(),
-                     native: false, language: ['c', 'objc'])
-add_global_arguments(config_host['QEMU_CXXFLAGS'].split(),
-                     native: false, language: 'cpp')
-add_global_link_arguments(config_host['QEMU_LDFLAGS'].split(),
-                          native: false, language: ['c', 'cpp', 'objc'])
+add_global_arguments(qemu_cflags, native: false, language: ['c', 'objc'])
+add_global_arguments(qemu_cxxflags, native: false, language: ['cpp'])
+add_global_link_arguments(qemu_ldflags, native: false, language: ['c', 'cpp', 'objc'])
 
 if targetos == 'linux'
   add_project_arguments('-isystem', meson.current_source_dir() / 'linux-headers',
-- 
2.34.1



