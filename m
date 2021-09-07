Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB594030D9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:20:00 +0200 (CEST)
Received: from localhost ([::1]:42238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjRf-0004yl-Po
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2n-0006a2-UY
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:17 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:44834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2m-0001Ba-4a
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:17 -0400
Received: by mail-io1-xd2f.google.com with SMTP id g9so438703ioq.11
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gZ1GIZjdhmw+PtxEgB45jDBjSRzqt+uOkvQ7QNISVeo=;
 b=e8ypGLfx3d253MFW0CzmQW+X645TF7Ab/A1Qrl7A6FVJ6WjKSkOcrlJi/iKuF+8hOX
 DRlK2ftFskSntezJsoH3kfjLlIvc1ZyENFZQP7huv1LBdA8k9DzPN0wVXPTAvWpTuBvq
 XD+9xl5otRRdkyw4FUfvd140sO1Q81skFlHi32DjEz5KsxUPGhNBoPKL3lueIh347aNU
 fL7ilYI0Iy3CN5hLA5Z/SaU/V9bwd6UvNsBImaQ/mm2SdQGPk8MrRBo4T6ktbAqE9eNH
 C/kEe12mrYxLQ2i93dxeNF3PfDTI1tHJGcFW4ZlscUi4WMZThFHR8KxQNBST+idcJiP1
 /o6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gZ1GIZjdhmw+PtxEgB45jDBjSRzqt+uOkvQ7QNISVeo=;
 b=tj/RotregVnanyS0lVMkBYMfQKs220ci4vnqim0eOFZR7OGng6dZ9Izpb4ZHjwStY4
 iyK4yrFJR1uRDX+FRhor2BDnuqk5IXtewDuxsIuGtBZLvsDG/h+AfMUIOw5d7RMdAhLA
 jw298WahLlqVuuZe3cpujmjzjPFuFvopfRr21jH8Rj7rqrML0vI+5t6+lKw57V1VCVgu
 aQZiwOXxDTOJVb0nodl5MpgvvDJGPWhnBE/wb4ifFDjdR/BmiF9nTHCdFZ+gFBKE5uQs
 CJ1AKjC3zb5XPAdLriuoGClai+/uhkwXdrM52RAN18DrLk76IEOGkHBRTh1XMwtHjYP3
 Gamw==
X-Gm-Message-State: AOAM533dwBisJ7uSMZddmZ2gJWHvjVEz5Z0p1LCMJbTLpTFgO7bzJKKe
 4WcLYySghTvgQAW4xzq53wjZMDusPeBAU/aVQ8U=
X-Google-Smtp-Source: ABdhPJwTdr/8ffZ9Qawgbngx+xw13yNU4mSJzdZuiigqtmDFA8uNA3ugj5JyGZf7GHh+aas328j01w==
X-Received: by 2002:a05:6638:381e:: with SMTP id
 i30mr453640jav.9.1631051654850; 
 Tue, 07 Sep 2021 14:54:14 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:54:14 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 41/42] bsd-user: Add '-0 argv0' option to bsd-user/main.c
Date: Tue,  7 Sep 2021 15:53:31 -0600
Message-Id: <20210907215332.30737-42-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Colin Percival <cperciva@tarsnap.com>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Colin Percival <cperciva@tarsnap.com>

Previously it was impossible to emulate a program with a file name
different from its argv[0].  With this change, you can run
    qemu -0 fakename realname args
which runs the program "realname" with an argv of "fakename args".

Signed-off-by: Colin Percival <cperciva@tarsnap.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 659dd2b512..6df4f4f011 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -243,6 +243,7 @@ int main(int argc, char **argv)
     char **target_environ, **wrk;
     envlist_t *envlist = NULL;
     bsd_type = HOST_DEFAULT_BSD_TYPE;
+    char *argv0 = NULL;
 
     adjust_ssize();
 
@@ -367,6 +368,8 @@ int main(int argc, char **argv)
             do_strace = 1;
         } else if (!strcmp(r, "trace")) {
             trace_opt_parse(optarg);
+        } else if (!strcmp(r, "0")) {
+            argv0 = argv[optind++];
         } else {
             usage();
         }
@@ -390,6 +393,9 @@ int main(int argc, char **argv)
         usage();
     }
     filename = argv[optind];
+    if (argv0) {
+        argv[optind] = argv0;
+    }
 
     if (!trace_init_backends()) {
         exit(1);
-- 
2.32.0


