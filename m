Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A02114CAD96
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:31:30 +0100 (CET)
Received: from localhost ([::1]:36236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTl3-0000aY-EN
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:31:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTS4-0006qc-M8
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:53 -0500
Received: from [2a00:1450:4864:20::32d] (port=56092
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTS3-0008Qn-7H
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:52 -0500
Received: by mail-wm1-x32d.google.com with SMTP id i66so1665848wma.5
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gc1VZ48NcTl2YvmBVaW5SzwnjSSDE+xasrOWm+E//I4=;
 b=AXxVa2p2eJJH8jfmQBprWOPWBKmY0Jsmg2LnSt/jBpeRwgZXSJNkMg1P/cqkot68LA
 lxtSBsV0k3AnrhSuRd03DVdu32ildIu10ITPVPUQLXlpJo3fHTlRQ9/bAqq9cchxFaCD
 h0PDNBzPAQbB+J6jnOLcuDoQW5XpKzng8ISnvd8XXsBzJFtxY+VTG/HznKWt2w3/J+IJ
 yAWOFNNwP/W25f32OlewJCl6uDfvq0eFAWyJPZDuVpUKT858rjfPhmiww05yYdS6MriH
 8kQZh7sqGehDCar2llP4giNjJrEufGi4qMjFgKdjCAK71FJgYQ/jub7iRG2m00RSFG6c
 DrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gc1VZ48NcTl2YvmBVaW5SzwnjSSDE+xasrOWm+E//I4=;
 b=ERSAtyJKl1YAaLd2ZPawLN51BRjibJuLikEIw91n5+ITW1R2VpO2sdkNNRAwoZhUve
 ag59C+b1oZqbQ4ppakzZiPD7UlcNKbBApo/SMjb1mLKIaUMi8d72qfVFeYqKhbKEO90y
 Oy//mk3LjWo19kLKxqVT8FrECH4bKNN2fHh1CpXIQmMtugU37udmdHtnrz+l6rCDdaVL
 j4xnQjk5RBVjqmDD/A64F52TslgQgDsKmgYwSyUqG6ZpeUmt3VZvNogSMTL9UEt/nl8O
 NK08heuesLodxXiYUpYc/JQNEoKGL/qMgZwkvTU/ct95yxyBJtlg+vPT9ctEIb0OIkHQ
 isMw==
X-Gm-Message-State: AOAM530xDm+BHXH98ov4e1p3jcyF0t3DS5IxHUnsd/vHh5vj3NGT3JtV
 kfcHksZNdlD/KUD491HPALXXo2FcjyU=
X-Google-Smtp-Source: ABdhPJw38sq8igfM18VGPr6F4iOh+0gxMuIZmVvpA7eBuhPeALshXssDiJqXMs3BBO2tXvelsAVaBw==
X-Received: by 2002:a1c:a382:0:b0:381:cfd:5564 with SMTP id
 m124-20020a1ca382000000b003810cfd5564mr813410wme.103.1646244708436; 
 Wed, 02 Mar 2022 10:11:48 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm7720811wmb.48.2022.03.02.10.11.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:11:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/11] update meson-buildoptions.sh
Date: Wed,  2 Mar 2022 19:11:30 +0100
Message-Id: <20220302181134.285107-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302181134.285107-1-pbonzini@redhat.com>
References: <20220302181134.285107-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/meson-buildoptions.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 9ee684ef03..1e26f4571e 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -20,7 +20,6 @@ meson_options_help() {
   printf "%s\n" '  --enable-malloc=CHOICE   choose memory allocator to use [system] (choices:'
   printf "%s\n" '                           jemalloc/system/tcmalloc)'
   printf "%s\n" '  --enable-profiler        profiler support'
-  printf "%s\n" '  --enable-qga-vss         build QGA VSS support'
   printf "%s\n" '  --enable-qom-cast-debug  cast debugging support'
   printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using /dev/(u)random and'
   printf "%s\n" '                           getrandom()'
@@ -97,6 +96,7 @@ meson_options_help() {
   printf "%s\n" '  parallels       parallels image format support'
   printf "%s\n" '  qcow1           qcow1 image format support'
   printf "%s\n" '  qed             qed image format support'
+  printf "%s\n" '  qga-vss         build QGA VSS support (broken with MinGW)'
   printf "%s\n" '  rbd             Ceph block device driver'
   printf "%s\n" '  replication     replication support'
   printf "%s\n" '  sdl             SDL user interface'
-- 
2.34.1



