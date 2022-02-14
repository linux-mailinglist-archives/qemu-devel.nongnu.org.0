Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24AE4B5A32
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 19:47:46 +0100 (CET)
Received: from localhost ([::1]:60326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgO1-0007bS-2t
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 13:47:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg8o-0007Oi-BV
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:32:02 -0500
Received: from [2607:f8b0:4864:20::631] (port=44971
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg8m-0002Xo-N5
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:32:01 -0500
Received: by mail-pl1-x631.google.com with SMTP id y18so11201611plb.11
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 10:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TE0drlB6/eltvA1kfU2gkRbJ1jChXTeQTSUe7QJMmf4=;
 b=Q0EehcpG55lh8lCuIGhyGQgqyumM8EqYc1w0/fH8//hez6affkzULU6T2C4yWTYzQw
 CcNGelEOsFSuJQXlZ0oYVrXv96LP4bq3iDsd/qXspv1MJIewCcOrBaFfx8lEijMgDd0Y
 4PDeOaGj7FBsV0m8/dfO4JVcsWRvEUkuUQH+rI5F2aGKldiyR7PTbdfBedcwu/9ppg6n
 w2TYEhy4ldUcJh5XNeXv17l5BRjsmtSYmtHOdmMsFhTZ3H+tgFjIKmtInabmpI/+LhFe
 TvSMNMVEgLIPvfZYK4EF+tkToJIyO+Lhj/CdC7KGPJaV9YbU4OCbePvfhdktBP2qOnD2
 00oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TE0drlB6/eltvA1kfU2gkRbJ1jChXTeQTSUe7QJMmf4=;
 b=nmmsRI21qWETc57oc23WNeyN/5iG2Pv4gaYddhvgXorbmrdYn+wQ9gb2RTnR/mxB9f
 MkgIvrEnPoTsiX8qew2Z8tIZfnbhow+CiJoYhrcm761JppBzbj6cDrFi1G6QVM6fB1iI
 WwjOD6JvQGuambb0Yf+YxQV9T09GdWHlovWF8V7bb8Fu8MAo37IZeuirG1564kRVsz8G
 9suNOORUDNRS0cllie1zNl+6pz8yKHrltcvK8imEZC4XdLOBGkzBweU9749NSKSO36Rc
 7ppCTSVF9IE5d2usdxtdqi71ofpo2zgEJyoZWjIn+cpSyfoBzLt2uruwe4uS6J++Z19y
 q+CQ==
X-Gm-Message-State: AOAM531DjTNlXMRXk7cSuG8j35/9YeDTwFXV1haPZYM7EEkQvrxgfjG7
 I1OjjIRGazpWE+kKgtMMgnF6kUCUlQI=
X-Google-Smtp-Source: ABdhPJxZaREpKSYVAtJBXp6UKVL+dB2rdHFHHGMAxPaIiMnEkisevFRZPQNLPcVVxexCG/yi+N/gHw==
X-Received: by 2002:a17:90a:c7d2:: with SMTP id
 gf18mr1072124pjb.189.1644863519213; 
 Mon, 14 Feb 2022 10:31:59 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id j8sm39227191pfc.48.2022.02.14.10.31.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:31:58 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 01/14] meson: Display libfdt as disabled when system
 emulation is disabled
Date: Mon, 14 Feb 2022 19:31:31 +0100
Message-Id: <20220214183144.27402-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214183144.27402-1-f4bug@amsat.org>
References: <20220214183144.27402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

When configuring QEMU with --disable-system, meson keeps showing
libfdt as "auto". Mark it as disabled instead.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index df25e7a5e7..9460875693 100644
--- a/meson.build
+++ b/meson.build
@@ -2266,8 +2266,8 @@ if get_option('cfi') and slirp_opt == 'system'
 endif
 
 fdt = not_found
-fdt_opt = get_option('fdt')
 if have_system
+  fdt_opt = get_option('fdt')
   if fdt_opt in ['enabled', 'auto', 'system']
     have_internal = fs.exists(meson.current_source_dir() / 'dtc/libfdt/Makefile.libfdt')
     fdt = cc.find_library('fdt', kwargs: static_kwargs,
@@ -2310,6 +2310,8 @@ if have_system
     fdt = declare_dependency(link_with: libfdt,
                              include_directories: fdt_inc)
   endif
+else
+  fdt_opt = 'disabled'
 endif
 if not fdt.found() and fdt_required.length() > 0
   error('fdt not available but required by targets ' + ', '.join(fdt_required))
-- 
2.34.1


