Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2334FDF6C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 14:27:13 +0200 (CEST)
Received: from localhost ([::1]:33854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neFc0-00015S-Oy
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 08:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neFP5-0004yy-25
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:13:53 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neFP3-0001O0-Jy
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:13:50 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 r133-20020a1c448b000000b0038ccb70e239so1628686wma.3
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 05:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eJqQuScG9BOoUAHQIhydVm0PsVJlLCM2jTqJMbpcmTE=;
 b=FqJmA749Y/i3+BaNBdTHAaub7gPC6zsrkvwCznP0RwSqzAgE26YBMSLfljyxhEa1Bg
 9jseW+gOPhamu+3schVwkhcK8W0MND5s88FjwMKbUvV2wNa60qznwCldCwcpL84+aRm2
 buCfUfSRV9Nhx74kEKAToCmfjYP4ThY/xQFoV/ioBlQfn3fPscmvuYG5+jvMJFV23ioh
 7iWM0T+lsLzjB8pLbNVmJESl5TKiia4SxSu6SK8CByWewLKFhGvIaTwYJWBi4zM+1U/g
 CfbevxjrMpRFmyL+R44eCDh21SUA4MjoIKKApx19o9LoO9uj6qKlLLD6pFaGS4KT1Pcp
 2wHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eJqQuScG9BOoUAHQIhydVm0PsVJlLCM2jTqJMbpcmTE=;
 b=BBXtwSoK1pA1P/7IqZBh5O0/ZX7eV7nBU6aqAi5MSPAPCG+sQ41lJ3KJlPGwpyLo3v
 RUxx3otXKfwyDzzrbFs679md/brsYJNoCLma0kcyhqiPOhiyxUe0fmQOuMS4NIfDBwTe
 hV6z1DhD0ByX5/S5pcyp1qkR0zFh3osH81eVZJjGeEauHt4e6FpR8bRqwk9LFQ7Z49Yy
 DR0HGK1EMZs8R4337gcjSdVGnSxwB/oq0qCoQZDOnqBLk1NJm8ingOgwQ38r9JRYfd2y
 yZyNxWV+PI47Fj/9DjDEi2lmO1V2BJe9qA483zhbe76mFFmjhNtMver/3NwS6dwx3Grz
 5jQg==
X-Gm-Message-State: AOAM530rSOhyKmyKNrNRA72N1+3cg+zcyFmTxwffPBUuk/RKNa/jQ8VP
 1qW+KPN4/vmd4CCGZs0U1zSOS8S5DpOEAg==
X-Google-Smtp-Source: ABdhPJz6N4N37IwHu/pPnxjkSHZjO0bN/BnWzGlk1tdCDeW3wig2oX5B1tiQfsPD2qLbUxAUdEudmA==
X-Received: by 2002:a05:600c:3c8d:b0:38e:4bc6:abde with SMTP id
 bg13-20020a05600c3c8d00b0038e4bc6abdemr3741286wmb.13.1649765628187; 
 Tue, 12 Apr 2022 05:13:48 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b0038e8f9d7b57sm2355805wmq.42.2022.04.12.05.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 05:13:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/4] net: slirp: allow CFI with libslirp >= 4.7
Date: Tue, 12 Apr 2022 14:13:37 +0200
Message-Id: <20220412121337.207203-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412121337.207203-1-pbonzini@redhat.com>
References: <20220412121337.207203-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: samuel.thibault@ens-lyon.org, thuth@redhat.com, dbuono@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

slirp 4.7 introduces a new CFI-friendly timer callback that does
not pass function pointers within libslirp as callbacks for timers.
Check the version number and, if it is new enough, allow using CFI
even with a system libslirp.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meson.build b/meson.build
index 861de93c4f..92a83580a3 100644
--- a/meson.build
+++ b/meson.build
@@ -2485,21 +2485,21 @@ if have_system
     slirp = declare_dependency(link_with: libslirp,
                                dependencies: slirp_deps,
                                include_directories: slirp_inc)
+  else
+    # slirp <4.7 is incompatible with CFI support in QEMU.  This is because
+    # it passes function pointers within libslirp as callbacks for timers.
+    # When using a system-wide shared libslirp, the type information for the
+    # callback is missing and the timer call produces a false positive with CFI.
+    #
+    # Now that slirp_opt has been defined, check if the selected slirp is compatible
+    # with control-flow integrity.
+    if get_option('cfi') and slirp.found() and slirp.version().version_compare('<4.7')
+      error('Control-Flow Integrity is not compatible with system-wide slirp.' \
+             + ' Please configure with --enable-slirp=git or upgrade to libslirp 4.7')
+    endif
   endif
 endif
 
-# For CFI, we need to compile slirp as a static library together with qemu.
-# This is because we register slirp functions as callbacks for QEMU Timers.
-# When using a system-wide shared libslirp, the type information for the
-# callback is missing and the timer call produces a false positive with CFI.
-#
-# Now that slirp_opt has been defined, check if the selected slirp is compatible
-# with control-flow integrity.
-if get_option('cfi') and slirp_opt == 'system'
-  error('Control-Flow Integrity is not compatible with system-wide slirp.' \
-         + ' Please configure with --enable-slirp=git')
-endif
-
 fdt = not_found
 if have_system
   fdt_opt = get_option('fdt')
-- 
2.35.1


