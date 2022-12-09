Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E056481C3
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:31:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bW6-0004XA-WB; Fri, 09 Dec 2022 06:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUp-0003yV-O0
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUl-0000yz-CN
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iUWdx2zhhTuGpVL2oq7NV4uBafczGyLM+OQnO3SSoHE=;
 b=Ypi/+zswbCxeGsdnVpR/pB6F4be1wo0sDLalrcm0Faoq0SO5/pyTIK5Bf1Fd8axXM+HX6A
 VUUGP9p2iEKdf97nnlt0D+52g73sF2t9R5sLI6bRMtUBRcBtzcua7K4HytmWIMf80Mc5lg
 18yf5LM3/NoylEdLE3ClEp2twvimetI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-10-phSMVtOMNamM4kmKQL6vuw-1; Fri, 09 Dec 2022 06:24:35 -0500
X-MC-Unique: phSMVtOMNamM4kmKQL6vuw-1
Received: by mail-ej1-f72.google.com with SMTP id
 xc12-20020a170907074c00b007416699ea14so2905521ejb.19
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:24:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iUWdx2zhhTuGpVL2oq7NV4uBafczGyLM+OQnO3SSoHE=;
 b=d78pX2PDupwDdcA+o2bvlTvkIy2nI5b8Prfq6Kpb5geKskEGC2YiYpQ2UlI/48CHs1
 d0ORZ7C7OMe0fYt0ZnoH+N7zdZtk0bfWpbP/TwxwcSKnfMsGZ9gyFFRtHNUFKh9kS5f7
 6J9lGAs570SCQxiZtnb4wYV36N78FerT3nEZJ9BJBKpPS3H3hbhkRh/kfYNWGcJ4KtDl
 TEtXQA09WZF9Sd10uXCru0yiyJONwHb40nWZGpvFIAlbd9fvBJW14RCckyy31k60spgL
 85vNDpHulaqICCQ76qphRhVuBvS0JPKjeYiASfUpuaiVq/8ZdtHKsiJGD1CwWshw8PpS
 jwxA==
X-Gm-Message-State: ANoB5pm5iQvFR3nZHehPohe9NGgt719wBiI4/vc4m8+ohS/vHctXLy3L
 XwB/gvmECvEcCog5kTmDziqsfOfJ4/i34/KFCEeDdhUGCFBeB1gnm05e5tLS85YOWV5d4rHyBg7
 92Ebg+nd1pU05KQqq1I8l3MQO++vpUqaaGxdEN0p+rI8l0L5GM4Jg0L1ly/SGSXzccH8=
X-Received: by 2002:a05:6402:e09:b0:467:91bc:f523 with SMTP id
 h9-20020a0564020e0900b0046791bcf523mr5453505edh.36.1670585073618; 
 Fri, 09 Dec 2022 03:24:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5vYRZnEhNKs3YvUrFJV6b0Oa9Yh2I8//+BIsquP0kwyYj65aJKDcGRpilo1O5NLzxjKVo9lg==
X-Received: by 2002:a05:6402:e09:b0:467:91bc:f523 with SMTP id
 h9-20020a0564020e0900b0046791bcf523mr5453484edh.36.1670585073237; 
 Fri, 09 Dec 2022 03:24:33 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a056402054900b00463c5c32c6esm515547edx.89.2022.12.09.03.24.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:24:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/30] meson: require 0.63.0
Date: Fri,  9 Dec 2022 12:23:47 +0100
Message-Id: <20221209112409.184703-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This allows cleanups cleanups in modinfo collection and supports the
equivalent of QEMU's --static option to configure.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 2 +-
 meson       | 2 +-
 meson.build | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index adfff30a6204..411dfe977958 100755
--- a/configure
+++ b/configure
@@ -1043,7 +1043,7 @@ fi
 python="$python -B"
 
 if test -z "$meson"; then
-    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.61.5; then
+    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.63.0; then
         meson=meson
     elif test "$git_submodules_action" != 'ignore' ; then
         meson=git
diff --git a/meson b/meson
index 3a9b285a55b9..9c6dab2cfd31 160000
--- a/meson
+++ b/meson
@@ -1 +1 @@
-Subproject commit 3a9b285a55b91b53b2acda987192274352ecb5be
+Subproject commit 9c6dab2cfd310ef2d840a2a7a479ce6b9e563b1d
diff --git a/meson.build b/meson.build
index dbd0b5563446..19b023985325 100644
--- a/meson.build
+++ b/meson.build
@@ -1,4 +1,4 @@
-project('qemu', ['c'], meson_version: '>=0.61.3',
+project('qemu', ['c'], meson_version: '>=0.63.0',
         default_options: ['warning_level=1', 'c_std=gnu11', 'cpp_std=gnu++11', 'b_colorout=auto',
                           'b_staticpic=false', 'stdsplit=false', 'optimization=2', 'b_pie=true'],
         version: files('VERSION'))
-- 
2.38.1


