Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5870C47E2D9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:04:30 +0100 (CET)
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Mph-0008R0-ET
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:04:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdO-0004Jb-Kx
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:47 -0500
Received: from [2a00:1450:4864:20::42f] (port=43936
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdL-0008Q3-TR
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:46 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v11so10923099wrw.10
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e1urq3/NH1DhV4VQiTljtVXGI+TxRV769wqtxpZBiJE=;
 b=PagxT/JDmSY4hHWAO9RNDgyHX7l8iVUTXjbXoXpYw6Obl0zpcQQ3wyAXU+EoZH4WqE
 WN607ztZCJJnSgKFN4DZQsmRG9+BMoLFToozG2E/IOYVS4pPBEieUtzzDq1F5pO9fUiA
 uz/ta8JjzNyyA3YTkxGUoyYxnxetqHTpCSi7XN39GjGDFpRvtG6y+TMBjcSAYS7THBxr
 uywsMOweBWOHSvO5mNFkEWWmRPFcZwrs+M/UhM8pypFFyE9GnwRoqn1+v8IiDBttVrZf
 HDR90MDxehmfukNfFku/k2VtQuNMGoSFD7HGsgKaWB/SzQKN79yGuP9phB0wJ4N/pSGr
 SKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e1urq3/NH1DhV4VQiTljtVXGI+TxRV769wqtxpZBiJE=;
 b=5VAG4rMno9YM5aTkmfcOmimy8uXpIKQuDftyhZWWIYl9B8dHUI2nqdnCUYLUJAxzS7
 aRGMmsEj/A7bN0QzKjA1BeCgWwAa+PKNl5T9/gHtNloJ/zi+eAtjqW92iXhKNq+te92g
 uYUGr3T+q0KhSPTro3fU9O8TmRwV7Nb9j2ilbK2Pz28TpSl0wdCQQ4CD5Y5goAbQlTSc
 gjIYtZtlUnMzCylU/lgDEytNDFLzqbE9yUE2xoOWJ+InXZITipcq6WHX8iShZ4PLZxsB
 yVdTig/YP6SCiVxbnQqC9DZi/oXgQcibhDTeYfwbxCf3pYeyW6+A+uziOO4NNXmue7N2
 QvJA==
X-Gm-Message-State: AOAM532cSjf/+epcuATF8yJ05Oa3OB3Tymzw7qFLp0XOqB+H7bh1YCfx
 cVS5tIA6Z8de24RX90nGxfk/8UCjZ0o=
X-Google-Smtp-Source: ABdhPJyNXFCckWTNwvZHfaz+iiXar6WBsmsX/OuHO/6MweKKAudJAnGd287JJVlp206q4Z+/+c/WJw==
X-Received: by 2002:a05:6000:1886:: with SMTP id
 a6mr1545762wri.614.1640260301709; 
 Thu, 23 Dec 2021 03:51:41 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm4537106wru.109.2021.12.23.03.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:51:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/15] configure: move non-command-line variables away from
 command-line parsing section
Date: Thu, 23 Dec 2021 12:51:29 +0100
Message-Id: <20211223115134.579235-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115134.579235-1-pbonzini@redhat.com>
References: <20211223115134.579235-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
index 302d58102b..8eb8e4c2cc 100755
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
@@ -2546,6 +2544,7 @@ fi
 ##########################################
 # check if we have VSS SDK headers for win
 
+guest_agent_with_vss="no"
 if test "$mingw32" = "yes" && test "$guest_agent" != "no" && \
         test "$vss_win32_sdk" != "no" ; then
   case "$vss_win32_sdk" in
@@ -2576,7 +2575,6 @@ EOF
       echo "ERROR: The headers are extracted in the directory \`inc'."
       feature_not_found "VSS support"
     fi
-    guest_agent_with_vss="no"
   fi
 fi
 
@@ -2603,6 +2601,7 @@ fi
 
 ##########################################
 # check if mingw environment provides a recent ntddscsi.h
+guest_agent_ntddscsi="no"
 if test "$mingw32" = "yes" && test "$guest_agent" != "no"; then
   cat > $TMPC << EOF
 #include <windows.h>
-- 
2.33.1



