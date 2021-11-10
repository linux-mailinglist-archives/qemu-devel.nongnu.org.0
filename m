Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A3D44C51B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:35:06 +0100 (CET)
Received: from localhost ([::1]:35848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqYz-0005WY-5F
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:35:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mkqWh-0007aw-Eb
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:32:43 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=43772
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mkqWd-0005bv-MW
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:32:43 -0500
Received: by mail-io1-xd2f.google.com with SMTP id z26so3460085iod.10
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 08:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tkJTC1f42Usxm11YPPgsA91Pn7lqAeCzgrwWDOdWQas=;
 b=8RR7sMM4EixWSP78Cc6SgWRvo2g5czo1DENxkcqfbwo8U7Jt+B9vchBw8y0OTdFdeB
 J1vIaU0tZ4VpUZ6saCNRiwW8P8+7bVvaRQh3aVy+cB/9IOSy0UXE36+sE3E2wcnt2G2F
 Giby1UogXkUKs8Y+wxjcUhDoAkUyfYGPdrgA0qdGaGd8l1p6I4rmsPF3OSND6p/9Nz6V
 gbixi8yVzZ14G7ly+QTR10Y7ENjV8SCZSiFVBgoNYscktrPZ1E4JSIVrlmQ76mcXIbqC
 1rYKYaTdj7mettGk6UeEL2Ui3cekr25gBWeHdxSzI5XuRKCuHs3nTjEClcmL+6wiID2V
 P6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tkJTC1f42Usxm11YPPgsA91Pn7lqAeCzgrwWDOdWQas=;
 b=6oiS0UBek/BF4Md5Qu0pSfIOuOx3R1upX56msYNyrMYdUftKRjzdyv+fL+UUaoWb8e
 W66XStvYN6t+vp5BsI3viy3rHghZbvQ4i4PmUsjvlM7EpktK8zP8kj8xnB1Qzw+vwkGk
 Pds5Ar9DKN37Y89oUZCl43CLM9P/pUKQhRsufVSSxag5cmXLWKi8a3qL8WjDxYTyICsi
 IN3rZZ9jU8VHjF1mXtChSnkkrxOwD4xIROa0S3sg/uQfdDTLBp2BB+QTvJzVVW+o7JDn
 oiVQLBsMTGlxgBcEPC78QEUlq55qhAFAKZmOfLuWye/Qp+1yBqGaeph1dyXfKPIh+GQM
 mZ5w==
X-Gm-Message-State: AOAM531wRFThiC82VEO96usKRnAdxV4igQLqTpcnJk1I/bsTe8MugX8e
 3yb8hGs6FMeshdl7dkGmT2HQKBKpjSiyjg==
X-Google-Smtp-Source: ABdhPJyZfcP8Hj4EfXnfJwS1Z1NRMfw9z1pZHVMx7GB3NgPg0fVgS4cN4t17W34BTL1Bd8chWXMJvQ==
X-Received: by 2002:a05:6638:16d6:: with SMTP id
 g22mr106597jat.19.1636561958284; 
 Wed, 10 Nov 2021 08:32:38 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x2sm130403iom.46.2021.11.10.08.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 08:32:37 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 3/6] linux-user/safe-syscall.inc.S: Move to common-user
Date: Wed, 10 Nov 2021 09:31:30 -0700
Message-Id: <20211110163133.76357-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211110163133.76357-1-imp@bsdimp.com>
References: <20211110163133.76357-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move all the safe_syscall.inc.S files to common-user. They are almost
identical between linux-user and bsd-user to re-use.

Signed-off-by: Warner Losh <imp@bsdimp.com>
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


