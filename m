Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24B068AF41
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:09:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObu3-00016d-M2; Sun, 05 Feb 2023 05:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtQ-0000yg-8L; Sun, 05 Feb 2023 05:05:15 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtL-00057b-Bt; Sun, 05 Feb 2023 05:05:00 -0500
Received: by mail-oi1-x236.google.com with SMTP id r28so7619739oiw.3;
 Sun, 05 Feb 2023 02:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NpoNX2dxcyKhglstuvdHrDSP+68EMHvHibawEKNZWnc=;
 b=g99hmpu5Eji509+nWil6NIL6E8wnf3/+SYLzvYJG8JsqQ32Y33AG4FrwMokkgax6g7
 px2sWM2yhEL1gAHV7nLKOLYRjXfx3HFC3aLx176AEsInlWcM2x5TbtCWI/vhsqi7+1/r
 KSwX1LBYjRZDSySlmHH3DES3BLg7iDYa6cACX6tBq24VE6CIiIrDN3sWCINCsZOI/oBU
 3s2OxnmX4IaPNX45voC52GV4IuBTwygTjD6oDV2cfy9TiRVTSRnKL0zzn+SjSmDv41hY
 5ro8LdtxdmJnfLJTHvkYGpiXTOdKPS34QPzPTaOktsyHdpzFGHzxpK3zDfX+hNHnIK4h
 ofog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NpoNX2dxcyKhglstuvdHrDSP+68EMHvHibawEKNZWnc=;
 b=0o/taz/2Li59U30edEdGsbnFIjZSRG5+CkChlBoeun3bk6zhYgPD6p3Fh5GsdDRn8R
 QDGfAXW0P0d27PaKOwDDTiesRNAbXKhmAFc0o0UK1zs2q7PBr6WwhamQmaKG9jnpONEp
 woZ+lnDoaDPtTjtSDQcfkqtNLfFL4ySNAU22Zg2aC8mjZRbXnw9YEe3ed93NCHtKlSz7
 YKwPI6F2EzB8YiOzijVz2WgR5uYQv9PVwRGKnBkRNCmGSAtgHI0Krvat3P9YigoE/xr4
 9JN4ZwYYUa+ZO4IYwzFFox+J6WZtnUfhFkX/dqPWwIysvWEqtq3XjT3hLC7qG7sXzbe2
 mbRw==
X-Gm-Message-State: AO0yUKXvCYOGkUNP5opnKC3UvszkEAoCM0pi7NdHNue2x0WxqOP72vC9
 GzNaULo5R2fmlkXkm9ILc6C20j9DxAU=
X-Google-Smtp-Source: AK7set/2D/a/3RpKLH4/hxoDogr2WpJY3fsD7twE/Oww8zjOruRClYwZ0zqUKpeQEi0A024xPO6YiA==
X-Received: by 2002:a05:6808:68a:b0:378:51b3:e0c1 with SMTP id
 k10-20020a056808068a00b0037851b3e0c1mr7575109oig.4.1675591496761; 
 Sun, 05 Feb 2023 02:04:56 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm2730924oie.47.2023.02.05.02.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:04:56 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 01/16] tests/migration: add sysprof-capture-4 as dependency for
 stress binary
Date: Sun,  5 Feb 2023 07:04:34 -0300
Message-Id: <20230205100449.2352781-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205100449.2352781-1-danielhb413@gmail.com>
References: <20230205100449.2352781-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>

`make tests/migration/stress` fails with:

    FAILED: tests/migration/stress
    cc -m64 -mlittle-endian  -o tests/migration/stress tests/migration/stress.p/stress.c.o -Wl,--as-needed -Wl,--no-undefined -pie -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -fstack-protector-strong -static -pthread -Wl,--start-group -lgthread-2.0 -lglib-2.0 -Wl,--end-group
    /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gutils.c.o): in function `.annobin_gutils.c':
    (.text+0x3b4): warning: Using 'getpwuid' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
    /usr/bin/ld: (.text+0x178): warning: Using 'getpwnam_r' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
    /usr/bin/ld: (.text+0x1bc): warning: Using 'getpwuid_r' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
    /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gthread.c.o):(.toc+0x0): undefined reference to `sysprof_clock'
    /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gtrace.c.o): in function `.annobin_gtrace.c':
    (.text+0x24): undefined reference to `sysprof_collector_mark_vprintf'
    /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gtrace.c.o): in function `g_trace_define_int64_counter':
    (.text+0x8c): undefined reference to `sysprof_collector_request_counters'
    /usr/bin/ld: (.text+0x108): undefined reference to `sysprof_collector_define_counters'
    /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gtrace.c.o): in function `g_trace_set_int64_counter':
    (.text+0x23c): undefined reference to `sysprof_collector_set_counters'
    /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gspawn.c.o):(.toc+0x0): undefined reference to `sysprof_clock'
    /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gmain.c.o):(.toc+0x0): undefined reference to `sysprof_clock'
    collect2: error: ld returned 1 exit status
    ninja: build stopped: subcommand failed.
    make: *** [Makefile:162: run-ninja] Error 1

Add sysprof-capture-4 as dependency for stress binary.

Tested on:
  - CentOS Stream 9 ppc64le
  - Fedora 36 x86_64

Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20220809002451.91541-2-muriloo@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/migration/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/migration/meson.build b/tests/migration/meson.build
index f215ee7d3a..dd562355a1 100644
--- a/tests/migration/meson.build
+++ b/tests/migration/meson.build
@@ -1,7 +1,9 @@
+sysprof = dependency('sysprof-capture-4', required: false)
+
 stress = executable(
   'stress',
   files('stress.c'),
-  dependencies: [glib],
+  dependencies: [glib, sysprof],
   link_args: ['-static'],
   build_by_default: false,
 )
-- 
2.39.1


