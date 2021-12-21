Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54E847BEA3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:12:00 +0100 (CET)
Received: from localhost ([::1]:43634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzd3n-0001VL-W4
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:12:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxd-0005KG-0D
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:37 -0500
Received: from [2a00:1450:4864:20::335] (port=38867
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxa-0004zZ-8r
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:36 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 203-20020a1c01d4000000b00345bf98da86so148496wmb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 03:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J49N23xHBKV/77Hu3VntKAVvl0oVhU6OpoF8x6m8Wws=;
 b=gsJ+2q0v9R8Lg0hi7ytHs66GntZB0pMWJ5O91NCnQh4cSuREu+b3n9uL5hzBHlrSsi
 t7VinjKHchgzujDdlcsZ46MyvSmaPgHyCBvpwMCQV1EfoAa44oPPCERDeuJqF7lA6p86
 XRhpRBOZYnFd47Pr9azOD5WMqOp09i82nr5FE62n9XRS2zOemW2Q6TvFvkK+MUR3l2KI
 71frfeWdfH0qc7Iu26P//TzImWIMltBFfH9RbE8FBcvHiVJW/TevYYhOd4dmga3EXyqX
 rVoKbtItrXoafI+Hxwwu5QnDHLN40S3Tsp+zYPXcUweO9419BgL8CdfwZtnaI0Hu8CDN
 ghLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J49N23xHBKV/77Hu3VntKAVvl0oVhU6OpoF8x6m8Wws=;
 b=V5NEIlAC04wV0FU6vi+O7CqUYL930gVNXErQ+hwff1xXlwWBkvyHY4pJpKBWj1UtQW
 tN45plDf+CAXkf6sw00kd9ma+nZpcARYvUxM3qs25ki4wwB7U77L4sq1U4hCoWoRikYU
 ZNFVXg+zp+8vi5TBhnWhyD0ObE6sQN4x04HEgVPlzEPaxkqYyyHuTT/9is6mucA3Dy1c
 qSKxK2BLrktLKIwdnBpJE2QMiTLTE8mP3MdxuSa/CgTrr1InuaT7zxxayqAOrnvS5f1I
 jLozKkuiXhZzWFavcXTJHE+WAvYharWMIdUMQyzhadkuzsYGb1xbwAZnfg8E8UHp0OgM
 lUxg==
X-Gm-Message-State: AOAM533KVmnF8bR1MP8JvAM3XZ3CptkSmjPUnKfNf7DLu2yGOfoGsC9Q
 W22ODceA9nMriYQ5S79tPXEfXXoGqic=
X-Google-Smtp-Source: ABdhPJxIRUGBoU0hKM07AGfewv9umG6dKIdTbYm0YLCzsvO7C7buEupcmznB+GDgBCnO+Uixmx+O5w==
X-Received: by 2002:a05:600c:3ac8:: with SMTP id
 d8mr2224111wms.72.1640084733046; 
 Tue, 21 Dec 2021 03:05:33 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id az11sm1949444wmb.30.2021.12.21.03.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 03:05:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] configure: move non-command-line variables away from
 command-line parsing section
Date: Tue, 21 Dec 2021 12:05:23 +0100
Message-Id: <20211221110526.351709-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211221110526.351709-1-pbonzini@redhat.com>
References: <20211221110526.351709-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes it easier to identify candidates for moving to Meson.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/configure b/configure
index 40dd6e8d1b..810bc36490 100755
--- a/configure
+++ b/configure
@@ -308,16 +308,12 @@ debug="no"
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
@@ -331,8 +327,6 @@ opengl="$default_feature"
 cpuid_h="no"
 avx2_opt="$default_feature"
 guest_agent="$default_feature"
-guest_agent_with_vss="no"
-guest_agent_ntddscsi="no"
 vss_win32_sdk="$default_feature"
 win_sdk="no"
 want_tools="$default_feature"
@@ -527,6 +521,10 @@ fi
 
 # OS specific
 
+mingw32="no"
+bsd="no"
+linux="no"
+solaris="no"
 case $targetos in
 windows)
   mingw32="yes"
@@ -2574,6 +2572,7 @@ fi
 ##########################################
 # check if we have VSS SDK headers for win
 
+guest_agent_with_vss="no"
 if test "$mingw32" = "yes" && test "$guest_agent" != "no" && \
         test "$vss_win32_sdk" != "no" ; then
   case "$vss_win32_sdk" in
@@ -2604,7 +2603,6 @@ EOF
       echo "ERROR: The headers are extracted in the directory \`inc'."
       feature_not_found "VSS support"
     fi
-    guest_agent_with_vss="no"
   fi
 fi
 
@@ -2631,6 +2629,7 @@ fi
 
 ##########################################
 # check if mingw environment provides a recent ntddscsi.h
+guest_agent_ntddscsi="no"
 if test "$mingw32" = "yes" && test "$guest_agent" != "no"; then
   cat > $TMPC << EOF
 #include <windows.h>
-- 
2.33.1



