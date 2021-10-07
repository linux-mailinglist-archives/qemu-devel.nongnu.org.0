Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3404253E0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:16:04 +0200 (CEST)
Received: from localhost ([::1]:45784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTFj-0000e3-Dk
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8Y-0005Oz-Gk
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:38 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8W-0007kj-NN
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:38 -0400
Received: by mail-ed1-x535.google.com with SMTP id y12so9295255eda.4
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OO2zTRrcL6TBfBs2BC24N1/EtkxgIVETUUd19ExDSoU=;
 b=AyVcgayCdaNfFlW3j9RXkdJhVc7Tp/yCQ6605iFjA+JckUSCOIBsk3QEgS9Y6Yvs4s
 Ri+sNdLHsSmiUVSkUFX195VoMJ6Erk64uomOKD9yGhbPOqLycnYI29yOYZSgV2oUIdZY
 DhkfNw9JK5BTwDZ4kPgH+aIZJK1G8qMwtUpIoDKs/RUL2XU8Wy7hD5NnVZ61hPuQuJcu
 NdvF0+3sl7PO+j8+atPP+x69/BsZSoAwjEbCi5OiEmWcxm+IyTodggytus243gTI/DdG
 z33PcJGUvaRSmQ+Cu6N6Xj61lGctQJSkl0p0jqBoCKRB44rKaxaxIXK//n5O3WztT3oj
 Bl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OO2zTRrcL6TBfBs2BC24N1/EtkxgIVETUUd19ExDSoU=;
 b=LBwdQEOw+IdE8kg0hq6WNqpA6HpF9rzsphkJns82/OgEw3llmG1pxklPQ5d/oRalm9
 +u2495xoFGPT4ShhiFk8jPn7n0xMYunOrEhxExYk54HAaQeFmx7QcFowGv9Dq3Z6ExHe
 qQlJj/DBGyfi06pf52SMhhmpfnP4ryVVxtgwX8Tf1+fK0EbPMle0Yv4shOnhyjJSeK5X
 3M7yP0cP7W/mYlApEsyIPgvNy1jYOqVnb8c9vhGnJONVTCw6HfHUOt77Yc+UDGtl6mGT
 Y8JP8twiGD+OU4FEbPLKZ7DVxuiqqq1ZQkUJd+w2NIcnzBRr0d3sSfLPx/+mEidxoIL1
 Gqdw==
X-Gm-Message-State: AOAM5332JnY4zAkYB6yq7Gpj5dtxRGLXhFnSecPktEOMtEKx6Bi2c6sx
 cLgjboKNCPW8ZokTO9RCH6cl6YcH4DI=
X-Google-Smtp-Source: ABdhPJzvVQ+oR1apkBVgm9nVUBhc+zTpb2UWhy2Ue9RDpJq3oYbJpJMnn2So7UiLuPunt1NyJkgzgQ==
X-Received: by 2002:a05:6402:42d1:: with SMTP id
 i17mr6127927edc.320.1633612114457; 
 Thu, 07 Oct 2021 06:08:34 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm791254edw.84.2021.10.07.06.08.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:08:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/24] configure,
 meson: get HOST_WORDS_BIGENDIAN via the machine object
Date: Thu,  7 Oct 2021 15:08:16 +0200
Message-Id: <20211007130829.632254-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need to pass it in config-host.mak.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 4 ----
 meson.build | 3 ++-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index f91b8e1f0d..35e25bb960 100755
--- a/configure
+++ b/configure
@@ -347,7 +347,6 @@ tsan="no"
 fortify_source="$default_feature"
 strip_opt="yes"
 tcg_interpreter="false"
-bigendian="no"
 mingw32="no"
 gcov="no"
 EXESUF=""
@@ -4262,9 +4261,6 @@ fi
 if test "$strip_opt" = "yes" ; then
   echo "STRIP=${strip}" >> $config_host_mak
 fi
-if test "$bigendian" = "yes" ; then
-  echo "HOST_WORDS_BIGENDIAN=y" >> $config_host_mak
-fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
   if test "$guest_agent_with_vss" = "yes" ; then
diff --git a/meson.build b/meson.build
index 6842402a60..9bb443387a 100644
--- a/meson.build
+++ b/meson.build
@@ -1465,6 +1465,7 @@ config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2]
 
 config_host_data.set_quoted('CONFIG_HOST_DSOSUF', host_dsosuf)
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
+config_host_data.set('HOST_WORDS_BIGENDIAN', host_machine.endian() == 'big')
 
 # has_header
 config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
@@ -1625,7 +1626,7 @@ foreach k, v: config_host
     config_host_data.set('HOST_' + v.to_upper(), 1)
   elif strings.contains(k)
     config_host_data.set_quoted(k, v)
-  elif k.startswith('CONFIG_') or k.startswith('HAVE_') or k.startswith('HOST_')
+  elif k.startswith('CONFIG_') or k.startswith('HAVE_')
     config_host_data.set(k, v == 'y' ? 1 : v)
   endif
 endforeach
-- 
2.31.1



