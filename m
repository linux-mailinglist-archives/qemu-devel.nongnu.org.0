Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F5E69555F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 01:29:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRjB1-0007Md-6H; Mon, 13 Feb 2023 19:28:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjAz-0007MF-Ge
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:05 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjAx-0005yV-9v
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:04 -0500
Received: by mail-io1-xd34.google.com with SMTP id j17so5166953ioa.9
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 16:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v82U4AeojucC3DQqhT5F05E7FmGdLYXG/H9YwykhwGc=;
 b=G9f82TVBnS8C8IYlQ6i1v7CLsB/lkOXnmH9ZYOme/UdqLotS2CoRDtUcxiMEDhdhPq
 UziTqt8yac02lvn+bgbUWDRQxvyPL6XhSG3LDob5SRQLQxyJK08Gym4AKkJHZUQpKQqv
 jJHKkmUkLSsoIrB4MoXU3HN7kBk38Q21v77BBb7lY1ewZmYy7/YxWqe6Q0h2dFW+k+Kw
 WwIovcCaX6YZn2nexVDtgdYEJOJs7lwfr4DSPzbYee+rXtchmYNxhsbbpbyOSZ58yjfk
 bK3bDHI/L/x8vIyPIiSaoXZD/e0RlnywO4QQEg0rmToLuoMfk0uz/8yGLNOhOFSo5mxk
 hCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v82U4AeojucC3DQqhT5F05E7FmGdLYXG/H9YwykhwGc=;
 b=aKYxgmvtMDrjHnDq0PW+c/wMJvDLZWR8JWHydouz0CVqatbzPh0o/PkXxNUQNGodPx
 JNJvYpp8eYzmJkXSJfLM1EEUy8vRavkSbO9DPoqCo8A1flVmBiF1iMmyeLXGz6EOWTSp
 yIi3fWXPeMiM44hnZrlf5XB/2j+pfQgkkBNCC/ZA4qf/Ab0hI7cMkXvUipW5dtXht1eY
 yoAGQQag3ETb7l3VtPm6JNHNwfdkmewXDbEdSg31NkFlxpJ+SDXzaGxirWLwgpz6sWU5
 c0JNO/LVSl0JSfs1d18uO7MU2t1uSomRhfMnRAz62ESr2MZoX6GP5sWQexpHePYlZmg8
 or1A==
X-Gm-Message-State: AO0yUKWd/Oozvhgqu1SjUVKBMeDCkVaxLRhKy/05AMUcB8zYKPvnZ52V
 ts0ux7xbJbLYPYLPmhvd6Mn19tslatBCleG0
X-Google-Smtp-Source: AK7set99Ybnb06IanBJXuVgq/vw5r1IaAenrXthhJRxTuFiaRIL0u8BAgBanGbpLDKgPGgV++/05uQ==
X-Received: by 2002:a5e:a80b:0:b0:715:ba8c:3b14 with SMTP id
 c11-20020a5ea80b000000b00715ba8c3b14mr292304ioa.12.1676334481582; 
 Mon, 13 Feb 2023 16:28:01 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 r17-20020a028811000000b003af4300d670sm4500923jai.27.2023.02.13.16.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 16:28:01 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>, Doug Rabson <dfr@rabson.org>
Subject: [PATCH v2 01/12] bsd-user: Don't truncate the return value from
 freebsd_syscall
Date: Mon, 13 Feb 2023 17:27:46 -0700
Message-Id: <20230214002757.99240-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214002757.99240-1-imp@bsdimp.com>
References: <20230214002757.99240-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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


