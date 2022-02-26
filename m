Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF474C571A
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 18:21:56 +0100 (CET)
Received: from localhost ([::1]:39126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO0lX-0008Uy-EP
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 12:21:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XX-0008KN-4d
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:28 -0500
Received: from [2607:f8b0:4864:20::d31] (port=45770
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XU-0000Qf-Gg
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:26 -0500
Received: by mail-io1-xd31.google.com with SMTP id c14so10147018ioa.12
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 09:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hy2bdjFp84wHHa+MT23SEu6EAim31NmTv5svUlwzfpY=;
 b=NenM39sTuSsE1R/qfup/5Q/4gSrYUVdtnn9ZkSiON8xVwX0ZtLrhiWaA7bJkDHaoDg
 OP2v8aImTJnUr/nuDwA1Zu9SyL2hsD/GhfUW6FbNBheAHKLNFOhqRK2rnvkCUc31lFgN
 k6tk2/keL1J4klDvqtIJN209zoQU8idDZHRXOJ372OqY6oABJx5iZDXyhfIAxNVKTOSs
 fgMRThyp1yS3HCM1KMTVqqETEMYx16p5XZsVyB4VpLYMmiUELNapFYqlHCQbrXoad2ax
 ne1Scy0/CPJi6+CdQtTJu2b6xgzKB7DwQdpZm8qbPmx54KW8Qp30p/JorA5CbxtXZXsc
 suOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hy2bdjFp84wHHa+MT23SEu6EAim31NmTv5svUlwzfpY=;
 b=ztsBgjILzx73zCoYmcFl5KhWznLNAPGTg+7whLTwGcmerrZQCD78zj6RBQt7V31KHa
 DK9lsG+cXMwRE0kiRtdNgn4dz2rTmlinGAKFGZ6JhzGs/7JBYdV8guGpVsKjoykCe5fK
 6i0YDJewXj3QNn4shiPBHAcNZtnWqE1PRwzuKwxmweb1Q9uWtOp3g+E7S5R48jDgJYx7
 rjGrrV+z2FuGLgoXn1WnlZVpiChuGloDxkEB4wVJDy+f7BhHxxV4GXtWKKatGBoClAwM
 1QAxIkaL3biTtDUDSueoXvPDQVy2gLi6MM+H4m4KEAj0y/HtMKEJ7+7S8vdjYXSGZyQj
 Hqiw==
X-Gm-Message-State: AOAM530/Luujyrc7C7YvktO+aMellyr85kH9R95hI6G9iQ2Kq5Vovk/s
 hinYf8Inc1PBWRu9OvKgzWKpHgjiKwGnHA==
X-Google-Smtp-Source: ABdhPJwlj1EMjvTjZJI3DXsmxefKZ95F/qQszeBv2LNsB3mNQoyQhI5u8jftTXRqmmpaStqKfNiVyg==
X-Received: by 2002:a5e:9248:0:b0:640:70ff:4e28 with SMTP id
 z8-20020a5e9248000000b0064070ff4e28mr9603294iop.44.1645895242427; 
 Sat, 26 Feb 2022 09:07:22 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 e23-20020a6b5017000000b00635b8032d45sm3138764iob.22.2022.02.26.09.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 09:07:21 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/16] bsd-user: Move system call building to os-syscall.c
Date: Sat, 26 Feb 2022 10:07:38 -0700
Message-Id: <20220226170744.76615-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220226170744.76615-1-imp@bsdimp.com>
References: <20220226170744.76615-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/meson.build | 1 +
 bsd-user/meson.build         | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/freebsd/meson.build b/bsd-user/freebsd/meson.build
index 4b69cca7b90..f87c788e846 100644
--- a/bsd-user/freebsd/meson.build
+++ b/bsd-user/freebsd/meson.build
@@ -1,3 +1,4 @@
 bsd_user_ss.add(files(
   'os-sys.c',
+  'os-syscall.c',
 ))
diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 8380fa44c25..5243122fc56 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -13,7 +13,6 @@ bsd_user_ss.add(files(
   'mmap.c',
   'signal.c',
   'strace.c',
-  'syscall.c',
   'uaccess.c',
 ))
 
-- 
2.33.1


