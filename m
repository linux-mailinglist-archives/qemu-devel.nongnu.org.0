Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647A66A7364
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 19:25:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXR7e-0005Lh-02; Wed, 01 Mar 2023 13:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7b-0005E2-8G
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:11 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7Y-0006nX-EH
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:10 -0500
Received: by mail-io1-xd2d.google.com with SMTP id bf15so5741158iob.7
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 10:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1677695047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v82U4AeojucC3DQqhT5F05E7FmGdLYXG/H9YwykhwGc=;
 b=BVPpqWymWuk7edRXDORaOk2vs6tNZiJMrtX/Se4knI/eVtf2/voz35B/52cyu9vkuL
 RaMS06ToE9pxnCEXHvCTT1ui0qqQL0RgZAakkE7xq6333u0v0miEuxL2zm27KWow9652
 0Dl9DVNtU6taZA4Iggrv2aLEHkFgCKD7YCj3tSLFzzVkvhY1OWjCbRYSKXotSqwlgi4h
 iFQE+kWqCD/gm3VDzmVJSgabh/I3nWKuNeZbKGcl66HqML7R9ac4sNCAQSFJhq6XoTKj
 ZiSgZvLyy/IdTQ2QTj2xOkn84ttDaAL0o5uiGEh0Q0hOS23IIOA2qvDnppVfjHUWMqmw
 xFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677695047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v82U4AeojucC3DQqhT5F05E7FmGdLYXG/H9YwykhwGc=;
 b=LKG9Ns/xmHOAnjFiku1Gk9JiBm9oc9jojzJmAet1eguH2gI6Qi0VeGqxisFnnMPUm9
 JmVblnWRvmZuWgG44AlOghGoPjhw6be0agcayJ7SYTgrhBmswuTbaaasM0xtrzqTBNlK
 0ny3VnsYnFKUCoKO96QkYLu6HFowODZ/0H7GPBk14lCFa2cZZHrTNjY/Io+EHhG0fUn5
 3tnVn8gX1bO7iUDE5hl6DBTC7sN7XDmYwP9UfIo7wy2meMlrxjo7W8SakSQfl5QjnjwG
 GSq/ZQVPFVVqyjI9uJk7pCP9p60uGKomzhrRtmNLdO+MJqbaNAMDA0f3ErROhx1IltmC
 7ieQ==
X-Gm-Message-State: AO0yUKVaq0OR1amVkiejbDbKcqo2lzJBjYMOaXx9WXbrFYkCIaINRh5C
 nEP/1MeREH8r4Uz5lXhjdcXuSu/uIZPsOTwl
X-Google-Smtp-Source: AK7set+FzNdJv5JwGAzX1XctpnvYm69KK8GR+mKA+cyMaCzJoMejfTtnAXwSpzj9bFuTmIhnoFTuUg==
X-Received: by 2002:a5e:8e07:0:b0:704:b905:e652 with SMTP id
 a7-20020a5e8e07000000b00704b905e652mr5470906ion.11.1677695046808; 
 Wed, 01 Mar 2023 10:24:06 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 l5-20020a6b7b05000000b0073f8a470bacsm4169316iop.16.2023.03.01.10.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 10:24:06 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Paolo Bonzini <pbonzini@redhat.com>, Doug Rabson <dfr@rabson.org>
Subject: [PULL 01/10] bsd-user: Don't truncate the return value from
 freebsd_syscall
Date: Wed,  1 Mar 2023 11:23:44 -0700
Message-Id: <20230301182353.21559-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301182353.21559-1-imp@bsdimp.com>
References: <20230301182353.21559-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
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


