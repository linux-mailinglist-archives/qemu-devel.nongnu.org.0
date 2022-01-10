Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D20489BD5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:08:37 +0100 (CET)
Received: from localhost ([::1]:51660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wHk-0004Sv-CY
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:08:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqw-000279-HB
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:54 -0500
Received: from [2a00:1450:4864:20::534] (port=40742
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqv-0000VJ-0c
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:54 -0500
Received: by mail-ed1-x534.google.com with SMTP id a18so53407589edj.7
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=088450L/bqlgI6yAPA9NTzKrp+4+h6Tn3SpFF2ftbfc=;
 b=Wra/+0TOMgvBMf3nwp6wlZt4r/fvuLO9ObnztBTPK61GZOpRtwDLlY2/CYa9IfH9kz
 Y4DMBPx9L/WRyTi8h0RnyU5UnM+qlKMhPYY9untyjs2UgJYnVjr59yqaUg1Cc2Lx85Xo
 pGyQq75j15vmwm9ngJ/6ABaXh07ZWkEiKuvX3njTR9jja0gWDWxgo+S8sCudyTfOhg9O
 tyRoo5jAiRSZc8mCl91GnGxTD5sISOq/eOtJbtfI702TnXpgIivG+Lf890Yr1Jw3f8XN
 jXGesfca+XJTMreMuNjqw62FxdL1erA8VYKlWC6x+99qEd/PnvACqArfYBrbqozXuEHi
 Ab1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=088450L/bqlgI6yAPA9NTzKrp+4+h6Tn3SpFF2ftbfc=;
 b=uALkDH6NCRI9xPxAL13YKDoJHc60ulrRI1nboLLJpcJfiHw7xxD25oEC3lnOHwkllk
 QD2xz3agoOayo2d/9z0mhtUzm1NLhAjds0rwYhP9xAc9kfZMKswMHqBc+A764CSJQJBr
 hUaoRwqQUPP6xDmajPtQ+T31aMbqA645ZPZqCWad5H1TPZfG2iX893CY6YrzBqiqQcRp
 a03EkWfghYrc0ezgDWRni2kWMmWHKcpNYzleSLTLWSN6btEWoJ/9GgMzzXl+kHxEaQmh
 YX1q+id4f5riRYwVol1lyUy2EhjgPho2uVhoL7tSk8uEEoBNIEHqAvncLGOV3g6STCoD
 pPuw==
X-Gm-Message-State: AOAM533Pt+ONgxGqj+VdAiyS9sfb10TlJ8A2JB7sWCNNTFBVqq+Tqrg8
 CT/MlP+ytZrkj4v4BJk/vK2wFfjXkuY=
X-Google-Smtp-Source: ABdhPJyVV8cqUfg8XuBPOwTKkwFdlG/Tfxwt+x3Yl48azE9y0CPeCv4s/ibK7GsfO0n8ZaClfd1KHw==
X-Received: by 2002:a17:906:14d4:: with SMTP id
 y20mr60769ejc.454.1641825651743; 
 Mon, 10 Jan 2022 06:40:51 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:40:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/18] configure: move non-command-line variables away from
 command-line parsing section
Date: Mon, 10 Jan 2022 15:40:25 +0100
Message-Id: <20220110144034.67410-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes it easier to identify candidates for moving to Meson.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/configure b/configure
index be05bcf856..56c113bd83 100755
--- a/configure
+++ b/configure
@@ -307,16 +307,12 @@ debug="no"
 sanitizers="no"
 tsan="no"
 fortify_source="$default_feature"
-mingw32="no"
 gcov="no"
 EXESUF=""
 modules="no"
 module_upgrades="no"
 prefix="/usr/local"
 qemu_suffix="qemu"
-bsd="no"
-linux="no"
-solaris="no"
 profiler="no"
 softmmu="yes"
 linux_user=""
@@ -330,8 +326,6 @@ opengl="$default_feature"
 cpuid_h="no"
 avx2_opt="$default_feature"
 guest_agent="$default_feature"
-guest_agent_with_vss="no"
-guest_agent_ntddscsi="no"
 vss_win32_sdk="$default_feature"
 win_sdk="no"
 want_tools="$default_feature"
@@ -526,6 +520,10 @@ fi
 
 # OS specific
 
+mingw32="no"
+bsd="no"
+linux="no"
+solaris="no"
 case $targetos in
 windows)
   mingw32="yes"
@@ -2549,6 +2547,7 @@ fi
 ##########################################
 # check if we have VSS SDK headers for win
 
+guest_agent_with_vss="no"
 if test "$mingw32" = "yes" && test "$guest_agent" != "no" && \
         test "$vss_win32_sdk" != "no" ; then
   case "$vss_win32_sdk" in
@@ -2579,7 +2578,6 @@ EOF
       echo "ERROR: The headers are extracted in the directory \`inc'."
       feature_not_found "VSS support"
     fi
-    guest_agent_with_vss="no"
   fi
 fi
 
@@ -2606,6 +2604,7 @@ fi
 
 ##########################################
 # check if mingw environment provides a recent ntddscsi.h
+guest_agent_ntddscsi="no"
 if test "$mingw32" = "yes" && test "$guest_agent" != "no"; then
   cat > $TMPC << EOF
 #include <windows.h>
-- 
2.33.1



