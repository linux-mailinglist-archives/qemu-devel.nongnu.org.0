Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63130692B1A
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 00:24:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQcj7-0007B0-C8; Fri, 10 Feb 2023 18:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj4-00078y-E9
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:42 -0500
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj1-000521-Sd
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:41 -0500
Received: by mail-il1-x133.google.com with SMTP id t7so1235238ilq.2
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 15:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UUn6fCDhi/Gm5iX7/obKBuiF3I78ANSryTgknqIzZhk=;
 b=hQ5h1pK6P1JFvJDbJDesxRiOSfUnb4S6z9jGMymfLqV/DBxgnUrjuc+xFeNpzPbMjN
 HVUpjHMqovUlugDHD78WDk7Y3l1X6OO3egjhxzdqB7myW0BNmE4CNMMGck+NEAqPbsqX
 nIzO9WmpfdBvhviokBXSItON2XF3HqsbTukmiUB0c3Tt2pLQ08LpMN37vQC9y/w9XO0U
 J+fWX83valZDY9+zVy1mlceMENGY0L4ov9tirjnIUvVIA0UEetSf28OL410aS87jkuAK
 5T7FiHs772hx3gzWMD+vYpM8uZoBzLd/39cQS5JsEoelG5yaJySyVJe1sIM39MHM3sdD
 S5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UUn6fCDhi/Gm5iX7/obKBuiF3I78ANSryTgknqIzZhk=;
 b=1W6FZNVH7xqteo4q4ONSL/++EE7GxC/4Mtjh0hMILhp1ag88PBLz2cWdLHTSYiBnmq
 Lm9Xjl7m2eYFH8j/1uKKNoITF5Yu8xSrsNEQ0EM8ystGhVBKOs9fT3tvwQItzAdK1MfI
 6jDUuy1WHDaetCkmwotyqqa/PfYRSNzvZtXi6Oy3T58b/ru+PxSaWrcjCiHXwijIkIkK
 3lOo35N0DXZMU1ij5K0nTiHgRLBJL11cdTKXBxLLqgAx4t8YNC3O2gtb50nedV06zpXm
 9exot1CBzqgPQOkGksZQDu0C1gZMzQoPKUQ6+jxkunxKaLdll7I7H1Q1W2HG77D1H/m8
 ae/A==
X-Gm-Message-State: AO0yUKVV1DdKd7y4engLmrzhHTncGgh5vR/FvXe1B4FILhcNvT4KeGVQ
 rUGYRPSqxyT65dGWaCwQlj54sJc7Prn90Vzh
X-Google-Smtp-Source: AK7set9UppUjcDRVmWR83D/AFjQD0k8CNZE2Ey8XCHhu5iDdcH2VNF2BOIGDI4J0MtmujpcgBNHGjA==
X-Received: by 2002:a92:c243:0:b0:310:e816:8c8c with SMTP id
 k3-20020a92c243000000b00310e8168c8cmr18901303ilo.3.1676071356953; 
 Fri, 10 Feb 2023 15:22:36 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 k18-20020a02c772000000b003a9418e89acsm1850995jao.23.2023.02.10.15.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 15:22:36 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>,
 richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stacey Son <sson@FreeBSD.org>,
 Juergen Lock <nox@jelal.kn-bremen.de>
Subject: [PATCH 3/9] bsd-user: Add sysarch syscall
Date: Fri, 10 Feb 2023 16:18:23 -0700
Message-Id: <20230210231829.39476-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210231829.39476-1-imp@bsdimp.com>
References: <20230210231829.39476-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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

From: Stacey Son <sson@FreeBSD.org>

Connect up the sysarch system call.

Signed-off-by: Juergen Lock <nox@jelal.kn-bremen.de>
Co-authored-by: Juergen Lock <nox@jelal.kn-bremen.de>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-syscall.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index b4a663fc021..e00997a818c 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -491,6 +491,13 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_undelete(arg1);
         break;
 
+        /*
+         * sys{ctl, arch, call}
+         */
+    case TARGET_FREEBSD_NR_sysarch: /* sysarch(2) */
+        ret = do_freebsd_sysarch(cpu_env, arg1, arg2);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.39.1


