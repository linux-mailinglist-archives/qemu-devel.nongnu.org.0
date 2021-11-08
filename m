Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B1A448200
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 15:42:31 +0100 (CET)
Received: from localhost ([::1]:43214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk5qw-0002B5-9J
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 09:42:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5lB-0008Ch-Dx
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:33 -0500
Received: from [2a00:1450:4864:20::52c] (port=41744
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5l6-00075h-Tf
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:33 -0500
Received: by mail-ed1-x52c.google.com with SMTP id ee33so63597143edb.8
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 06:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K4e8aZwmBGkLPpGgvBHKgRPMlikqDCklpG1ZfbA/AsM=;
 b=OTm7jhxRc5hX00H7kxGUYELFDeyaOWXnl9oTem2YLimOlkzbF7fr/tArWdaAsaF3ya
 3e1PVG46OI0Kyc1gbtbDRuLiMo1vOPoAxVRH2ycscsdOwkJWFE7UmRGeycoKMiIPKprj
 ByhmEZSI9qUvu/ZOu7AtrWd69T8fPmPctVoAi5eOacmgG78pnXOY1bDfAgzYTC7/HkPF
 UbcgUtCMuRESuUGvCDgbH++GzjH6+5zwGHwg1xTO2D7mdaBHurZgXKIeiZSIJ8N9Xa0A
 E2hzye6gBCnRYxKV+CpkreXkhORZ1d73qoK+H+PERdLkr3q/Zwc3MO/vSAF9TteCgZCG
 g9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=K4e8aZwmBGkLPpGgvBHKgRPMlikqDCklpG1ZfbA/AsM=;
 b=NsenYNfHoC6yykcrC7HrQjXEzC5OuYs7MOydK/8d67KPVOsRTKfn788Eu0ctB+/1RW
 t7IGtgrt82n2a53Hw2Gl0jjyOpfOpDiB51XmHruPDQCzZSMp1SG9PvyGjszSLHUOfASa
 c6Ys0Lv8bGKwJvJqbxsUXQ/5p7qD+CpRsWaytOttGpnweqlMRZrEzQLaAEAomTTxk2LT
 r1Y/pJLK6GAhqcQdXaANMR7LvgioIObAdG8yVN9Fz4qfy6RXhDsAkXl9ml8W9sXBGvQp
 jGh9kCWLr8tVriR1Bsy8XVWOv7Rte78eFDqSBBPaOd7wAbbVj6Jc/paQBQLkMaclXwrw
 kLwg==
X-Gm-Message-State: AOAM532VMqye9kSCDKqfrJRteqJVl+SJ7l/mQYRjmgbC6Szpkm/qPPPm
 dlYaWbH4d64PVWibQUgMsTjLeJ1trsE=
X-Google-Smtp-Source: ABdhPJzD1IY56CFeOR1HgKcxBTCjNgbHN0ESXCo/0/QXgPhdLvriXoJaAeYp66UdMQh0eTS3+49pLQ==
X-Received: by 2002:a50:fc85:: with SMTP id f5mr168592edq.8.1636382184821;
 Mon, 08 Nov 2021 06:36:24 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id hp3sm8366662ejc.61.2021.11.08.06.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:36:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/10] configure: ignore preexisting QEMU_*FLAGS envvars
Date: Mon,  8 Nov 2021 15:36:15 +0100
Message-Id: <20211108143616.660340-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108143616.660340-1-pbonzini@redhat.com>
References: <20211108143616.660340-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

User flags should be passed via CFLAGS/CXXFLAGS/LDFLAGS,
or --extra-cflags/extra-cxxflags/--extra-ldflags on the
command line.

QEMU_CFLAGS, QEMU_CXXFLAGS and QEMU_LDFLAGS are reserved
for flags detected by configure, so do not add to them
and clear them at the beginning of the script.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 9f1641e79c..89c1872c3b 100755
--- a/configure
+++ b/configure
@@ -158,7 +158,7 @@ update_cxxflags() {
     # Set QEMU_CXXFLAGS from QEMU_CFLAGS by filtering out those
     # options which some versions of GCC's C++ compiler complain about
     # because they only make sense for C programs.
-    QEMU_CXXFLAGS="$QEMU_CXXFLAGS -D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS"
+    QEMU_CXXFLAGS="-D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS"
     CONFIGURE_CXXFLAGS=$(echo "$CONFIGURE_CFLAGS" | sed s/-std=gnu11/-std=gnu++11/)
     for arg in $QEMU_CFLAGS; do
         case $arg in
@@ -465,11 +465,13 @@ sdl2_config="${SDL2_CONFIG-${cross_prefix}sdl2-config}"
 # left shift of signed integers is well defined and has the expected
 # 2s-complement style results. (Both clang and gcc agree that it
 # provides these semantics.)
-QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv $QEMU_CFLAGS"
+QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv"
 QEMU_CFLAGS="-Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
 QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
 QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
 
+QEMU_LDFLAGS=
+
 # Flags that are needed during configure but later taken care of by Meson
 CONFIGURE_CFLAGS="-std=gnu11 -Wall"
 CONFIGURE_LDFLAGS=
-- 
2.33.1



