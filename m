Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC194488263
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:33:24 +0100 (CET)
Received: from localhost ([::1]:42756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n67AB-00012x-WE
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:33:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Iu-0005VZ-UG
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:21 -0500
Received: from [2607:f8b0:4864:20::d33] (port=40610
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66It-0003Wl-In
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:20 -0500
Received: by mail-io1-xd33.google.com with SMTP id q5so10092783ioj.7
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zYfRV6dnf6d+zAIFlxvvp/6sxyAwR3ew/6aIDkWKGyA=;
 b=DmGcah70KXaUCMaNvepb0vXbtdz0FsDVaFoK3DxxNu0CawLQKkB6jXljWQnYwY35Y3
 BUI+h4CrYthOdiVYcBo0T3dwxaD7O0bB/THFi0fQUW+atoa60gkwL4iKk02R6pGI/YrP
 nkdV+U3LusIeSx6jJd+ryWDTqI0lt0Ph5+mMeBZKok9LC5OR01TR+I/t/klPoTE4IqYL
 n4ctyIoU4qnqpNd2aQa6bvknyxVMP+hFyQvQLVRv0N7aobJfIJ0URenHNaE6KTKSggQS
 /xr7scqCsXVB4RxjCh566SINZhPqbev69LrW0lchuvtz1wLwW3uIilQqiezv4m/EEDA4
 OSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zYfRV6dnf6d+zAIFlxvvp/6sxyAwR3ew/6aIDkWKGyA=;
 b=hPQIlZDqkdqi61mls75Sm/4Ic+ZdHwdshC9USB1pP2Iyb7kWSw6ZJl9V75zZ5bL48R
 fYybDnltZ7EpuDsfMS0M9dvLWe/hzxHUqQJS7hmex5LKlZBBiyy4NT/inx1Iqo4W4ezv
 OaUPyILmbztLRjOKihkvKyjOnjTir+GlqeuUo15cmVY6rHZTQWZOv4wX2nJnteRqOfpC
 xqFqmWV2VHI947CRJYceLGlFN/s4tVa+RPzDV0SF3WSvgsiE2E9p431hDA8XKb8lM0Bd
 AwPfs1xL6URB7AU5Z3ylTW+oGUYot93DyXNggTLyTXfUES3D1XkSD6jSTtmSWktVdPDB
 BKqQ==
X-Gm-Message-State: AOAM533eNKKHa68z5kxarZ8zhz5Bpf6Td2HXulEwLc9Lu1WbS3cIn0l7
 OACQ11fmvgy15VfB9upwYYzacF9wD+hLsSaO
X-Google-Smtp-Source: ABdhPJwl2buk8ATQk86GdhbbCHAe3AfusOFMNZx5AB325hJ5oLzWTvSIh4ckif8uIf8Psb6/UGsuVQ==
X-Received: by 2002:a05:6638:3009:: with SMTP id
 r9mr30896197jak.261.1641627498002; 
 Fri, 07 Jan 2022 23:38:18 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:17 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 36/37] bsd-user/freebsd/target_os_ucontext.h: Require
 TARGET_*CONTEXT_SIZE
Date: Sat,  8 Jan 2022 00:37:36 -0700
Message-Id: <20220108073737.5959-37-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, kevans@freebsd.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all architecutres define TARGET_[MU]CONTEXT_SIZE, enforce
requiring them and always check the sizeof target_{u,m}context_t
sizes.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/target_os_ucontext.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/bsd-user/freebsd/target_os_ucontext.h b/bsd-user/freebsd/target_os_ucontext.h
index dd61aec7cce..41b28b2c150 100644
--- a/bsd-user/freebsd/target_os_ucontext.h
+++ b/bsd-user/freebsd/target_os_ucontext.h
@@ -27,10 +27,8 @@ typedef struct target_ucontext {
     int32_t             __spare__[4];
 } target_ucontext_t;
 
-#ifdef TARGET_MCONTEXT_SIZE
 G_STATIC_ASSERT(TARGET_MCONTEXT_SIZE == sizeof(target_mcontext_t));
 G_STATIC_ASSERT(TARGET_UCONTEXT_SIZE == sizeof(target_ucontext_t));
-#endif /* TARGET_MCONTEXT_SIZE */
 
 struct target_sigframe;
 
-- 
2.33.1


