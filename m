Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB12344F148
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 05:58:41 +0100 (CET)
Received: from localhost ([::1]:37788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mll7g-0000ge-In
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 23:58:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mll5z-00075P-1r
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 23:56:55 -0500
Received: from [2607:f8b0:4864:20::12d] (port=46748
 helo=mail-il1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mll5w-0003MI-Mu
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 23:56:54 -0500
Received: by mail-il1-x12d.google.com with SMTP id i11so10935874ilv.13
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 20:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1RfAt+Gj4t0D2XZYXWOpd5I5gxE3FaCADzEKGgm/8V0=;
 b=CMsX56wYPh2FbALXg2ax8x+gMQA+TFxhW6C1PgIL2kF/1qkRqQAkZC2V/BiaLyq6TD
 Z3nTZk+uujQUzd1YR6m7JIxRdEMRh870oNXozOlvulv7ZJgKqRdMttoglTBe5eKuFEPn
 jVCEwayIoYAAxMholF8mZ2tERl8qV7QTXZYeHJNTjwXTgHdFfnbzKta35Oa/zm3cshGO
 9JqJSUmrWO2iCSZfJnymfnJvOmh+FUNAuUqJ7hnd0HZifFz02J5vl7aLrCUiUqrzkBcC
 iDREQNG/2IsqkzzOjx5kpKJlG/mk4uL7vdBicHQUfDKYCvG4TSoNlFaq6R1y866RXFiX
 m0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1RfAt+Gj4t0D2XZYXWOpd5I5gxE3FaCADzEKGgm/8V0=;
 b=n+VFauWLYOiprU7sdfYTDM+XDHz0oV2VYYDAvtrexzzVh/4JsmCMxvskNlIELYpMdj
 cU8t08hVh1g6l5H/auY8thR0q3QihNQuVlbhqVjo/ad+3E/pey7c99/L6dAux4CH4f/E
 ukmklq68/y4UjOnnCp62zBnZE8GruVsdIhveIUPx15I2M5LC2XqXQnInWxkQ0J8aNaiC
 puCcNlKlrOjNRotDx62wEaRocSaHBc1yZWTu+UJaBc9NB0le0k7o7Ak9AActS4vHcoig
 z05r2oAezCvvHsW7YXLtJ0HiD/06UkUguDNU23XKSuOxTVh0+B2CsZL6xxt0AV68BepA
 bR1A==
X-Gm-Message-State: AOAM531e+s+n9oe1x4y3JcJC8tF9TwpV03bivS9Uw4gnuKwl0b8OhS1K
 Ij3oupxn4JO6uVDv3qoKqDfihlryhdVVFA==
X-Google-Smtp-Source: ABdhPJyPSbKsX67YHdeU6VnQ0zBg70+vNbFNJvRqQvCWqVYFKCOmDyqnCpbPktPDMDyUQeiU1V38RA==
X-Received: by 2002:a05:6e02:b4f:: with SMTP id
 f15mr3429926ilu.38.1636779411345; 
 Fri, 12 Nov 2021 20:56:51 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id r14sm5414455iov.14.2021.11.12.20.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 20:56:50 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 3/5] linux-user/safe-syscall.inc.S: Move to common-user
Date: Fri, 12 Nov 2021 21:56:01 -0700
Message-Id: <20211113045603.60391-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211113045603.60391-1-imp@bsdimp.com>
References: <20211113045603.60391-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Konrad Witaszczyk <def@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move all the safe_syscall.inc.S files to common-user. They are almost
identical between linux-user and bsd-user to re-use.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 {linux-user => common-user}/host/aarch64/safe-syscall.inc.S | 0
 {linux-user => common-user}/host/arm/safe-syscall.inc.S     | 0
 {linux-user => common-user}/host/i386/safe-syscall.inc.S    | 0
 {linux-user => common-user}/host/ppc64/safe-syscall.inc.S   | 0
 {linux-user => common-user}/host/riscv/safe-syscall.inc.S   | 0
 {linux-user => common-user}/host/s390x/safe-syscall.inc.S   | 0
 {linux-user => common-user}/host/x86_64/safe-syscall.inc.S  | 0
 meson.build                                                 | 1 +
 8 files changed, 1 insertion(+)
 rename {linux-user => common-user}/host/aarch64/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/arm/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/i386/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/ppc64/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/riscv/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/s390x/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/x86_64/safe-syscall.inc.S (100%)

diff --git a/linux-user/host/aarch64/safe-syscall.inc.S b/common-user/host/aarch64/safe-syscall.inc.S
similarity index 100%
rename from linux-user/host/aarch64/safe-syscall.inc.S
rename to common-user/host/aarch64/safe-syscall.inc.S
diff --git a/linux-user/host/arm/safe-syscall.inc.S b/common-user/host/arm/safe-syscall.inc.S
similarity index 100%
rename from linux-user/host/arm/safe-syscall.inc.S
rename to common-user/host/arm/safe-syscall.inc.S
diff --git a/linux-user/host/i386/safe-syscall.inc.S b/common-user/host/i386/safe-syscall.inc.S
similarity index 100%
rename from linux-user/host/i386/safe-syscall.inc.S
rename to common-user/host/i386/safe-syscall.inc.S
diff --git a/linux-user/host/ppc64/safe-syscall.inc.S b/common-user/host/ppc64/safe-syscall.inc.S
similarity index 100%
rename from linux-user/host/ppc64/safe-syscall.inc.S
rename to common-user/host/ppc64/safe-syscall.inc.S
diff --git a/linux-user/host/riscv/safe-syscall.inc.S b/common-user/host/riscv/safe-syscall.inc.S
similarity index 100%
rename from linux-user/host/riscv/safe-syscall.inc.S
rename to common-user/host/riscv/safe-syscall.inc.S
diff --git a/linux-user/host/s390x/safe-syscall.inc.S b/common-user/host/s390x/safe-syscall.inc.S
similarity index 100%
rename from linux-user/host/s390x/safe-syscall.inc.S
rename to common-user/host/s390x/safe-syscall.inc.S
diff --git a/linux-user/host/x86_64/safe-syscall.inc.S b/common-user/host/x86_64/safe-syscall.inc.S
similarity index 100%
rename from linux-user/host/x86_64/safe-syscall.inc.S
rename to common-user/host/x86_64/safe-syscall.inc.S
diff --git a/meson.build b/meson.build
index 9702fdce6d..728d305403 100644
--- a/meson.build
+++ b/meson.build
@@ -2872,6 +2872,7 @@ foreach target : target_dirs
     if 'CONFIG_LINUX_USER' in config_target
       base_dir = 'linux-user'
       target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
+      target_inc += include_directories('common-user/host/' / config_host['ARCH'])
     endif
     if 'CONFIG_BSD_USER' in config_target
       base_dir = 'bsd-user'
-- 
2.33.0


