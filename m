Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF458508C57
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:42:01 +0200 (CEST)
Received: from localhost ([::1]:34348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCSu-0005QJ-Tm
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLX-0001HO-09
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:23 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLV-0000u3-5H
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:22 -0400
Received: by mail-wr1-x434.google.com with SMTP id q3so2780351wrj.7
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=69Benn7RO1xIp2afo9GkcAzM/ddXV6mj86NlD1orfxI=;
 b=d/Vsz9CruWn69wOD1ALTpYxBpZD5/8o0tyS/pDaZLFmRla4ebwgz6tcbV1XpkO8UkI
 yg7SuK0JJLyk/Ow1F0OfkMYGlTDe5Km0KKdu7mbRSfzaLweJRVoR6c97YosGLrW1ZO2F
 o/fUWKRsYWXmde7ESwWdLEzC56XtfbdzLDt2aS9mlDTLp3DWtVrRiPFEvHqGDSsdW7xc
 jFxo0uQgaKlFjv2J6rDhBoU8R6dasNGrNGYuHH0oBcgEP+yMV1B3uAM0IAagppGWr7ZU
 FkbgiQmHN8JSs9ND4gHMUH2mR7hIlBYWSab1ra4MfnJn7Tq4ngmhfyLhm3ks6pEXowbt
 pj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=69Benn7RO1xIp2afo9GkcAzM/ddXV6mj86NlD1orfxI=;
 b=XwvH3ZHyt3rbSrpqUL9FAbpZXd5HSTRinXJB/NNaT8khQNtJRusgeKJ8tbEtRrIktr
 cJDz4oTZ1vAd3S+Yo0HanGZvTbQV5CtX574RZkYyekCkA2sxGRE70opYg65bTkYzMpkk
 0tSwzjPvsE3VLfiVcSIRGBD8ZGfKetOF2YNvPNL2DZV3xBLMxsBiRU5h6k1i5un0IJQ6
 iKNq8cMMNn0+EaEf9WHQg9mXdL//fR6MafAsv0asyLhZnMJN3uvyJMKWrUrDlYykuUOk
 NHBrnH/d90j3fNiYicbYVCpx4QgNJKZWXnILAcY+v974Qz6pcM6bYL5wfsd6hkvgXI1y
 2v9A==
X-Gm-Message-State: AOAM53275a4KEmN410978m2YOFqxkcByZQR6b5MBc1tUVaQnA1jdtty/
 +SrpdPraCDFRVvg1NuxAJYdNtrwRg24N/w==
X-Google-Smtp-Source: ABdhPJzlLbKpP1QaLHsmMUELDuR0mQTSlW4MWNrbvOpfOXyiFEzyPxcHt8995R7XyOnJ3lwKYRroQQ==
X-Received: by 2002:a5d:6d8d:0:b0:20a:a8b0:98e0 with SMTP id
 l13-20020a5d6d8d000000b0020aa8b098e0mr6389260wrs.88.1650468858910; 
 Wed, 20 Apr 2022 08:34:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/34] configure: move --enable/--disable-debug-info to second
 option parsing pass
Date: Wed, 20 Apr 2022 17:33:39 +0200
Message-Id: <20220420153407.73926-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

$debug_info is not needed anywhere except in the final meson invocation,
no need to special case it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/configure b/configure
index 48ae18f47f..07053e7b27 100755
--- a/configure
+++ b/configure
@@ -244,7 +244,6 @@ audio_drv_list="default"
 block_drv_rw_whitelist=""
 block_drv_ro_whitelist=""
 host_cc="cc"
-debug_info="yes"
 lto="false"
 stack_protector=""
 safe_stack=""
@@ -304,6 +303,7 @@ vhost_user_fs="$default_feature"
 vhost_vdpa="$default_feature"
 rdma="$default_feature"
 pvrdma="$default_feature"
+debug_info="yes"
 debug_tcg="no"
 debug="no"
 sanitizers="no"
@@ -379,10 +379,6 @@ for opt do
   ;;
   --extra-ldflags=*) EXTRA_LDFLAGS="$EXTRA_LDFLAGS $optarg"
   ;;
-  --enable-debug-info) debug_info="yes"
-  ;;
-  --disable-debug-info) debug_info="no"
-  ;;
   --cross-cc-*[!a-zA-Z0-9_-]*=*) error_exit "Passed bad --cross-cc-FOO option"
   ;;
   --cross-cc-cflags-*) cc_arch=${opt#--cross-cc-cflags-}; cc_arch=${cc_arch%%=*}
@@ -759,12 +755,12 @@ for opt do
   ;;
   --extra-ldflags=*)
   ;;
-  --enable-debug-info)
-  ;;
-  --disable-debug-info)
-  ;;
   --cross-cc-*)
   ;;
+  --enable-debug-info) debug_info="yes"
+  ;;
+  --disable-debug-info) debug_info="no"
+  ;;
   --enable-modules)
       modules="yes"
   ;;
-- 
2.35.1



