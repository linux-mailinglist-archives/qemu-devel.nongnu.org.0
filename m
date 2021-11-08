Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3392447C4C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:53:28 +0100 (CET)
Received: from localhost ([::1]:33342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0P9-0000c3-Ub
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:53:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk0MZ-0004eT-CF
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:50:49 -0500
Received: from [2a00:1450:4864:20::12c] (port=34593
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk0MU-0003hM-2t
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:50:47 -0500
Received: by mail-lf1-x12c.google.com with SMTP id u11so34489600lfs.1
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 00:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JfMAiceoomjlqsAnaVtSpe+RW+YX7W3jh6X67XyGhKM=;
 b=IpPG0pBX5EkQMog25VnrjQZr7PsRdeCE+kbsOWGqESuRFY3Ace1Zk925LHyjfPQt8J
 j2nzbdHfIVEYv/2rdQV52jdwTX11gLfAb7RLGnr5VhZprkS+oTCdM3JR71MhGC/Qtie4
 RiEZzDuYyql/hDyz4FPxEp+k1QoBnJQYwkZbAYzASy7+C6BrISQ58NmOB/rHW9lEAx2m
 Hr+34p3RIu1fDqPR9hh8uYwfKq5vwMOkceR4w+8+8WyOjFgjFR5OXLjLYf+B9zlIFwty
 6EECP0PBfAOcK8KCJ+N5rwjMq4uOQeGBgCRosVukMtq2Zvc5LrARmjjkAAy4HcivsEFn
 XdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JfMAiceoomjlqsAnaVtSpe+RW+YX7W3jh6X67XyGhKM=;
 b=aIU+FPnlhHxiXbnJpAkpD93mnxnsilUZcC31HZr5DfLoipBvDcq6n6QtXZ4ksVe9D9
 TCmwSu3OsYICeDzmgKzqjsjGE+ZdPP4fNeQb/iokurXONc9e4nqcRCMfC14xuqtX4Qvt
 GJoZmm7xbUWniXFQrCizbb0Tb6Mgov+PZgzZrNdJVnC+chL51shxOOsZ0yPhIr+AzBQv
 hUm9T1pndyl1bGQshPw9gT1ruqZlI89m1wKQrL5es2qcvwuyKhIqwwzvNXffpKLE3bJh
 XophfVCSVhyeyDg/2CsjAakDzYUH8nF7U9krezKwKqFmZHuXUnX8SO647p3RMlfLL71O
 PD3A==
X-Gm-Message-State: AOAM53137er0pGpW00ttrnsnLdzqYeMYL796s2m/urQ5ZsRoxXeTpAUA
 CDCOZoHsOLbSMem/2jL1LdPniwNIFsg=
X-Google-Smtp-Source: ABdhPJyAAo5BI7781CCz2xDxsJVe53u6ZC7Np9OxDMQDp4YPfEkfeyqqqqmtgRpdtLVzd3Jo/MPMrA==
X-Received: by 2002:a05:6402:2690:: with SMTP id
 w16mr40966803edd.220.1636361006981; 
 Mon, 08 Nov 2021 00:43:26 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id nb17sm7743211ejc.7.2021.11.08.00.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 00:43:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] configure: ignore preexisting QEMU_*FLAGS envvars
Date: Mon,  8 Nov 2021 09:43:22 +0100
Message-Id: <20211108084323.541961-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108084323.541961-1-pbonzini@redhat.com>
References: <20211108084323.541961-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

User flags should be passed via CFLAGS/CXXFLAGS/LDFLAGS,
or --extra-cflags/extra-cxxflags/--extra-ldflags on the
command line.

QEMU_CFLAGS, QEMU_CXXFLAGS and QEMU_LDFLAGS are reserved
for flags detected by configure, so do not add to them
and clear them at the beginning of the script.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 1ea26c67e5..2048a52b20 100755
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


