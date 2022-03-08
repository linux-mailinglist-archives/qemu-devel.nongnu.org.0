Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937304D166B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:42:12 +0100 (CET)
Received: from localhost ([::1]:42748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYEF-0000Pn-NB
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:42:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7L-0007kt-JS
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:05 -0500
Received: from [2a00:1450:4864:20::634] (port=46636
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7K-0005nx-0d
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:03 -0500
Received: by mail-ej1-x634.google.com with SMTP id qx21so38497289ejb.13
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5wUS8GH2GpfDxGBxtP6708jGJGpCxaSfYkVvpdgFfqg=;
 b=pLwvrMQRgfB5WhTLdb1YmnbSbiyldj8+pWxTH2rFqDe7uIT+pOxDWXdWujnQ7N/fKx
 ekZ8W7xoKvp4n5jhTJkMekGxojF/fUke+PVz9PEmveQXDOvCltai1dxTgcTfgQjsjJB7
 Dmz5f5KRm/lRR6UqetYqKxWTT4l0gVIx5pJdnn9kRvJXeNA+l5dXaDtVPbkU4XqFSiRR
 MGiZ6s/+vuUgFrJkWEKPZY9Xjriu6UrCYqVN6GAB7tkoe4QhCA4psQBi0lj3ljfrjA2V
 k23zdipzOHiI3jA47zZYb9cJCpvnSEdZYi1qNp4c0RqQXlE6Ayj23VgW3BkJyYjtB3XJ
 /SgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5wUS8GH2GpfDxGBxtP6708jGJGpCxaSfYkVvpdgFfqg=;
 b=aXCAVxbQECb13TH5uoGoCx3WZ5CTEIpLRMWAHMHUZRNkuqmkSXDs6sdEd7Belxnlfi
 TyPC1I7QcdRBaJq8oZs+36vkQPkvsQvRJt9I7rcgjF6hKq1V4PWYnlTwlnxJHbHWMCn0
 C9ZX/uRrm9r/vDg2UzlPhGEjfzbugKfwaWVs5uCeAX5WCVJvUoqIIg8C3o290Ax6V6u4
 HPzNxByjo2ZSaq49K8dmVoEg4z82eu6iKW4ROymZYvFCom2tFk8KvB0NdyEEQiDkDzem
 1dYWa+ZC5xm9Bv99Xa9s79fwg7AcOWQI/nK2yPegotvWTVjkYTQpdWJ6o0hZEuwVoyge
 tdBw==
X-Gm-Message-State: AOAM531z14ilkIixIgEwoKZlbAUSnmbJcGFdvuDATKNo0soERiC7YPHB
 DQ5nBo7HMSmjS/5cTOOvUnl50aZiwVM=
X-Google-Smtp-Source: ABdhPJy7iONqFpltxcI1mCHeNBAo+TtIkqNs4LDqjJnBiTcVLn4iFhMLKK1DTqVH3enbnzKR/Oqnkw==
X-Received: by 2002:a17:906:e28a:b0:6d6:e2e9:d39d with SMTP id
 gg10-20020a170906e28a00b006d6e2e9d39dmr12680887ejb.2.1646739300765; 
 Tue, 08 Mar 2022 03:35:00 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.34.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:34:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/22] update meson-buildoptions.sh
Date: Tue,  8 Mar 2022 12:34:30 +0100
Message-Id: <20220308113445.859669-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
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
2.35.1



