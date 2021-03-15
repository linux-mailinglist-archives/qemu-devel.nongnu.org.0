Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3504533C4BA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:43:57 +0100 (CET)
Received: from localhost ([::1]:39334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrG0-0004ws-7b
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLrBY-0002vf-TG
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:39:20 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLrBW-0006ve-Vu
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:39:20 -0400
Received: by mail-wm1-x332.google.com with SMTP id l19so8617113wmh.1
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 10:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ROvDIv+xkeg8KzSTHDshfuJ8iLFDFQ5jv8EnC07Y4kk=;
 b=Hw7Dp14KEegMevm2JegvhzOIiHvtCqFudIXnNmJzopTSYY0KS/uNeZfUphNgSw6vDf
 oUyeXMESm/4ME4A+wat8SIOH8Bk72v95LzXs9Z8kEJb+LTXR2+pe07uYHcmTS4f2SDVY
 z39cazgMYRjjGXsFdn3lBU8fo9K2ZpU8ttGDNaHNaHXXkKEghn+ydhAp3LSwRBDP7/Ku
 GJ00Uud+GQJXQCTFqTxrNuHrNcNeLly1vg20Sxz7AB5VKp2NuF3WjOE8pgvdps2loj3B
 GqR8ksCXtQ2SyQ14/eDBFF3194HALvCxv4TEE3JsIWak+4L9doVmafrAZgQma6FcN0+q
 VR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ROvDIv+xkeg8KzSTHDshfuJ8iLFDFQ5jv8EnC07Y4kk=;
 b=Xda9m+rRgvx1AEQC9HL+2p+HKJIPyKHMftD41rhcXY5dfKV2a6LSKetXpVLEk72baS
 /Abh4o1L7FwUe3CNbg2uIDQRfeSOIvrCs3OaEhQRNp1jl0c01AFJ2E1vy87aghAQmBmM
 piUly9cc4HyQ0uur6GkKGCazYLNzhmPV2IyAybaVIwPqsDBR/5xQLjmaIGltVTBTpsS5
 6RzzGKU4Tw0uUYwNOs7WLxtLev/811x5QtclqbkUegegVTmUIbHPIzlagGeZoTOSQcwV
 yA8g513gkPrXjkv9ciiCRDKU+eCuEIsL+/wnf1ZaarX5q34ASJZguWlqkaGtlPoVMv2i
 O4gg==
X-Gm-Message-State: AOAM531odB4HvNLSJN66Yw/a5Ein1LsCtgNjZX580BXM95dZ0QyGBnCm
 Z4Xb1GciDXlVpZ2htXdtlTXdCdWk6cM=
X-Google-Smtp-Source: ABdhPJz2uzCc5dkfiqJV7kR1Gx9IW2WwnlsY/B06/cGPFE6ntP2Z6rLGIMt3/ekAsnGXsfWmwi+GFg==
X-Received: by 2002:a1c:7519:: with SMTP id o25mr757377wmc.35.1615829957350;
 Mon, 15 Mar 2021 10:39:17 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 m132sm295613wmf.45.2021.03.15.10.39.16 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 10:39:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] hexagon: do not specify executables as inputs
Date: Mon, 15 Mar 2021 18:39:08 +0100
Message-Id: <20210315173912.197857-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315173912.197857-1-pbonzini@redhat.com>
References: <20210315173912.197857-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

gen_semantics is an executable, not an input.  Meson 0.57 special cases
the first argument and @INPUT@ is not expanded there.  Fix that by
not including it in the input, only in the command.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/hexagon/meson.build | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 15318a6fa7..5dd68907b1 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -33,8 +33,7 @@ gen_semantics = executable(
 semantics_generated = custom_target(
     'semantics_generated.pyinc',
     output: 'semantics_generated.pyinc',
-    input: gen_semantics,
-    command: ['@INPUT@', '@OUTPUT@'],
+    command: [gen_semantics, '@OUTPUT@'],
 )
 hexagon_ss.add(semantics_generated)
 
@@ -154,8 +153,7 @@ gen_dectree_import = executable(
 iset_py = custom_target(
     'iset.py',
     output: 'iset.py',
-    input: gen_dectree_import,
-    command: ['@INPUT@', '@OUTPUT@'],
+    command: [gen_dectree_import, '@OUTPUT@'],
 )
 hexagon_ss.add(iset_py)
 
-- 
2.29.2



