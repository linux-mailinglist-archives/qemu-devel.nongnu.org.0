Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECF54D0698
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:31:59 +0100 (CET)
Received: from localhost ([::1]:59298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRI9G-0008G3-NL
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:31:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHuj-0001Bh-P1
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:57 -0500
Received: from [2a00:1450:4864:20::529] (port=41660
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHud-0005N8-9D
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:57 -0500
Received: by mail-ed1-x529.google.com with SMTP id c20so2720327edr.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gc1VZ48NcTl2YvmBVaW5SzwnjSSDE+xasrOWm+E//I4=;
 b=FcEXouVF1sIDo5HQHEsAMpY17nsD+CTlpx4uT9OK4w2kwYJ1cRNqe+U3p7hhprNw2R
 DTIUy4Emq8jYAtZxmYcn74Mjup12iG4+yT/l+pisHDuKgc+Mb6bOA1NR8UP/vkPHDY7w
 7JwYWC56gf7D8RdSQ+zFUwwm0JgpiR18w3Sr0PdPevgYoSoBKOIuk9nWSz9lAQcAv1yS
 pJRMYqq8DndeXuzvkrols3hQUdP7aiEY36sAf9NsGnGO56jQpeOxq0qVfuMC/SdbWKXy
 8bNhUvd1/c6hxwx/62hbT7QQqrRC0K9mSL0XnN2a2Iomu9mcTLDt7iMRw5vb5Uo+bDxS
 ZDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gc1VZ48NcTl2YvmBVaW5SzwnjSSDE+xasrOWm+E//I4=;
 b=XlRZjyL2Lzia9LOnmM5B/fVKFM8R7b/1MC/6c+AaNH+RtoYyKJUwXDFAbtPnEIbe/u
 pufkPXcphRMwCI7XgWp3ivMClGlESwed2v+SHURqEYGHM4nj1xSwHVx/bn3qbtZ8PfQ9
 ViNnR13uUN1aQaikj3IKFA/7ExTgsZNj7f1WVAJBUNSTns9KY9fz4VaeJ+iB516mHfvk
 C/wCsfmCV+JwOyNyo1g/K0X1kpKxOawSLIeu13pFavNqiPIRM648UimKKppitMIO4m6a
 Vr4CKk09gXfosC1S7eBka9LzJi7hKHW8oYl8k2KZ5I95rtlK2VzmcKvJ6WVvcb/H16c4
 ZLiw==
X-Gm-Message-State: AOAM531p8AKMT8CSnu0GIUhtfdFofCSB0UmcDZwYa4P9k+/COj1jaqgj
 tcz93mE7NpgGtoBb8Tx3YWi0SLvqteE=
X-Google-Smtp-Source: ABdhPJz/7YoEKPRxHAQwHco7I57l9zBrYD94VnH+YnCr3ckVWDgS08vnLEAtyBadXT93IpZX80kKLQ==
X-Received: by 2002:a05:6402:238b:b0:415:ce67:49ee with SMTP id
 j11-20020a056402238b00b00415ce6749eemr12274135eda.199.1646677001227; 
 Mon, 07 Mar 2022 10:16:41 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/23] update meson-buildoptions.sh
Date: Mon,  7 Mar 2022 19:16:17 +0100
Message-Id: <20220307181633.596898-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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



