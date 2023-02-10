Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EA1692B13
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 00:23:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQcj6-00079s-07; Fri, 10 Feb 2023 18:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj4-000790-5Q
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:42 -0500
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj1-00051W-Ru
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:41 -0500
Received: by mail-io1-xd33.google.com with SMTP id w24so2537219iow.13
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 15:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZx/cesf8ubpxj5ZEsfC2inUjsK/fycZyKobQ/kbFiQ=;
 b=mWlCYK/aqno9hLIXbtFLEXgknC65/WPlzq9zTG1rNsqmlL4wM8GgjxEZlUUg4DZVuG
 hLye0wSfXJ38oNMD37OFTTGaw3ey52+iAWnOzxVEym0rBiqEahQGULa2LvTlsWzYbLOW
 rzSUkdSy/VOprMAP2Ua9EOZAxKoMVYCwmWo198ydoRgdPRfu6JkxY4BfWYnbh23hnEls
 9hb1j+zI/KlPP+K7Tb8tYd3wQoIAdCaMxrTZ853cOAnwVYLKnqkpQtbY8m2ADvr+VWxE
 Pwr66xmA3L+57lethKq3476nzpUjrSSEZIUSW5B22BR9vAKVsVb3iBWwcUqRFQrwH+oS
 uMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YZx/cesf8ubpxj5ZEsfC2inUjsK/fycZyKobQ/kbFiQ=;
 b=Qswu8C6/tfmfSqRR1SfRi774VYgUlNfhF0VjzIgx/G9GHK+A5OgeSI23uvLW57P4BY
 MzD89wdqip/oQMYR0Fw2ClimmCsR1rag508weiwoj9PC8dtFdqz2oH5+uWWeF8IFsp1H
 NmY3bjZ4ucQdYxw/eUB+/+pCR28YV6+WdYrQwuoSZSQ/MZpGJnso+uIItn/8MGDezXo5
 zMPhTLp0IO4kQs/mW0C3mlizj73d5QsAffWWvFtrENfBCWjQ+GvfiOG71tzsDMFLCMaH
 SSOtuPYRNO6+19ELt3Q8SpPT6zOPpMHiaNwVbUwwmHs6H8Kl/XHZcyRK4WyE0Fc7hgke
 HheQ==
X-Gm-Message-State: AO0yUKUyC9zpi8nn+iS1FzH9AVdAShtX8ZbpzseVX0eV+ythuQ+miNvr
 VGqp6EyY3tVI+1xMV0gHxrsOQtlKV+ik6GqT
X-Google-Smtp-Source: AK7set9rclTjQQcVV5QRzUSC2JNZ8pi8C+E4oU4465MbdZR5v0O/dFqa0Lxc83wbAU1x9u5DMwxIkA==
X-Received: by 2002:a6b:6f14:0:b0:734:87f8:8d01 with SMTP id
 k20-20020a6b6f14000000b0073487f88d01mr13469072ioc.5.1676071354921; 
 Fri, 10 Feb 2023 15:22:34 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 k18-20020a02c772000000b003a9418e89acsm1850995jao.23.2023.02.10.15.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 15:22:34 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>,
 richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Doug Rabson <dfr@rabson.org>
Subject: [PATCH 1/9] bsd-user: Don't truncate the return value from
 freebsd_syscall
Date: Fri, 10 Feb 2023 16:18:21 -0700
Message-Id: <20230210231829.39476-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210231829.39476-1-imp@bsdimp.com>
References: <20230210231829.39476-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
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
api_long in qemu). This was being assigned into an int variable which
causes problems for 64bit targets.

Resolves: https://github.com/qemu-bsd-user/qemu-bsd-user/issues/40
Signed-off-by: Doug Rabson <dfr@rabson.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
[ Edited commit message for upstreaming into qemu-project ]
Signed-off-by: Warner Losh <imp@bsdimp.com>
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


