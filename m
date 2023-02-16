Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491E469A26F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:35:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnlM-0008Ub-Tf; Thu, 16 Feb 2023 18:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlG-0008SQ-Ip
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:33:58 -0500
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlE-0008Ph-Pp
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:33:58 -0500
Received: by mail-il1-x130.google.com with SMTP id v13so1422503iln.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 15:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v82U4AeojucC3DQqhT5F05E7FmGdLYXG/H9YwykhwGc=;
 b=zKdv/Pn8yayE8JFx3+Wz7/lkpVBdRFXuRrc2u5CAet2xgnWEts63iGIpzT7hvaB0zG
 9LxgJdiTZ9KJi35LvBYycgPZEu/04i6oG1V0WGX+6vciOjd4mcTylqeMLrdupvKtJfqm
 mCdWC/b9bjuNeMwgThAJoRcSOo+QH0oO11z1R/1TSu/BrXjTAdU741Wcg5+OPiD3qoPz
 0qfYvoZGzzzdmHLNd/PsojF2OQv+y3A23WtiCzvr+t+2d4ZfJMGRvoXHQQbkYUde9ebZ
 h25j5qt+ST33wbNyj1MMCAGLfcIzR3DCNq8G6ln35tRLDuskosTCrW2lcoM+ennr6jeR
 bzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v82U4AeojucC3DQqhT5F05E7FmGdLYXG/H9YwykhwGc=;
 b=DYWvauv29U3b3lb6GCX5o7TOuVjfAegTub30KFNWY8vXr+K06rC9RsjzPoA6aBiyul
 keHeWvDspjIL2KTLNq7VL+JrCUjsSy6YQy+1tSbSXN6ZDTtnM3Awn0BCGQr8plRObFHB
 gggjhsKs11qjX2h9x9086Wi5svlywyV0k/IAjhnmscg8+PU3VvsliTHhOKlHbKsCTLdk
 OBAy0KHDpcjbA0jfmVIiuNZMNjUTkBaWmnO/tvxCx2EA571Xfdpnnz5KQftiXV5ZZemZ
 Skvjz1mtOXui2apvexpRJdhlNFR+n9D1beC9OsYUsla1bpVFlXBcNkx+eqxsilCO0Pjn
 9lAw==
X-Gm-Message-State: AO0yUKVkN/Fx1PGWnPk4Bj9I4leGmLpweqe7ZvxScZTeD9+tbeGeXTJb
 dhojAuaokDr4Nq16nwAOqnPYpYVRnp14bRBm
X-Google-Smtp-Source: AK7set8h90//KLnQjJX+jwtTUl+OZnEIQFk2uPuD3qwqWYnMWtfDVujWRUTVZLZVIni6D94H7QtbeQ==
X-Received: by 2002:a05:6e02:1e02:b0:315:29ff:da7f with SMTP id
 g2-20020a056e021e0200b0031529ffda7fmr7591716ila.11.1676590434945; 
 Thu, 16 Feb 2023 15:33:54 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 y7-20020a02a387000000b00346a98b0a76sm934816jak.77.2023.02.16.15.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 15:33:54 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Doug Rabson <dfr@rabson.org>
Subject: [PATCH v3 01/11] bsd-user: Don't truncate the return value from
 freebsd_syscall
Date: Thu, 16 Feb 2023 16:33:43 -0700
Message-Id: <20230216233353.13944-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216233353.13944-1-imp@bsdimp.com>
References: <20230216233353.13944-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Doug Rabson <dfr@rabson.org>

System call return values on FreeBSD are in a register (which is spelled
abi_long in qemu). This was being assigned into an int variable which
causes problems for 64bit targets.

Resolves: https://github.com/qemu-bsd-user/qemu-bsd-user/issues/40
Signed-off-by: Doug Rabson <dfr@rabson.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
[ Edited commit message for upstreaming into qemu-project ]
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 57996cad8ae..b4a663fc021 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -512,7 +512,7 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
                             abi_long arg8)
 {
     CPUState *cpu = env_cpu(cpu_env);
-    int ret;
+    abi_long ret;
 
     trace_guest_user_syscall(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
     if (do_strace) {
-- 
2.39.1


