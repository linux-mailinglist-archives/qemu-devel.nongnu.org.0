Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C624A8B69
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:19:23 +0100 (CET)
Received: from localhost ([::1]:46344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFghW-0008Eg-Kx
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:19:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0V-0005NH-6f
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:55 -0500
Received: from [2a00:1450:4864:20::636] (port=34410
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0L-0008Iv-At
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:53 -0500
Received: by mail-ej1-x636.google.com with SMTP id h7so11069325ejf.1
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HOz+JkaMiBGPL4mWan35UDjel2rnKkZv+jfsc9rcGSE=;
 b=Bmfx7q0ioidA+Yzuva5nTgcNLJWFoXYc1PbVbB6PiPdYHY9uu0I6Uktn5mYF4ivJRE
 nTMzNQm0W9IY3giRpsRKVOfiqe+VlJrM9H4cPNENwh8xr7ZbsT1oGb7gX4hKoNMKiyy7
 92/+ACLh0y+jKXXzJFHjO1QMWzX0evIYgh/NYW1K6vYnfl1e8Hv7eeRoQS0y4VD7/EUf
 vxV2P1xXEqH2zkOvkJ1ODROW9cdSmoqLbmILdb+nv8K3ugsEiSp++Jt3g2YF1uMjGE1M
 29ZEVUkv0BkN0YXK00vnI5zWjlV112NFweoDoDpu2LJX7UO8DEfrcpkZsBlHe7aPwVH7
 VfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HOz+JkaMiBGPL4mWan35UDjel2rnKkZv+jfsc9rcGSE=;
 b=lKLalipqcKjyEMsogBnyN/JeRQBv4N13y6ShhtUUMcBA3B571fdYhZi2mFpLiIuEAY
 8CLSRhITWacnNTWJ2k0VuFgdqKtRdZjmT4JIgFZDHW0MBL7JpzOefjiaYOlo0JSrz1Ft
 cjMdrknxKeQ6EQGhgsmapWxKZNAK6K5mbfZ6qDJlRD5KVyUhw/Re6Pj7yDurwxnzWHvL
 QbHHZ9wLNzSQ/EmYln5/p8JXFEwkJzSsHwdgKwZhi+nfuOEG30vQc1CCqYguJL92Jd2U
 /9p6Y6VBGtfbqL6PjGtSeJsDnrrvcRp+kzIaNWdNepbiukMbfIra/bUiXS0wjSXSJln8
 2+Fg==
X-Gm-Message-State: AOAM532p3rIvvlzUOj0/0ivgEe3jePdBRvaAsAiFyfiG66uBOz1OJYT/
 fNt5UK64+k1lKtw6GbqSNRURxi9YLX4=
X-Google-Smtp-Source: ABdhPJxtp+ZJafrViP10AkpErrKGfGSjgKnmzxGuxg+czKkWGCgnPqY6gO/1qCct9OL7X96Vdn3N3w==
X-Received: by 2002:a17:906:b853:: with SMTP id
 ga19mr29549413ejb.263.1643909655456; 
 Thu, 03 Feb 2022 09:34:15 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/27] meson: drop --with-win-sdk
Date: Thu,  3 Feb 2022 18:33:51 +0100
Message-Id: <20220203173359.292068-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It's no longer used.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 29 -----------------------------
 meson.build |  5 -----
 2 files changed, 34 deletions(-)

diff --git a/configure b/configure
index e25de48b3e..3fb28891d3 100755
--- a/configure
+++ b/configure
@@ -317,7 +317,6 @@ pie=""
 trace_backends="log"
 trace_file="trace"
 vss_win32_sdk="$default_feature"
-win_sdk="no"
 coroutine=""
 tls_priority="NORMAL"
 plugins="$default_feature"
@@ -959,12 +958,6 @@ for opt do
   ;;
   --without-vss-sdk) vss_win32_sdk="no"
   ;;
-  --with-win-sdk) win_sdk=""
-  ;;
-  --with-win-sdk=*) win_sdk="$optarg"
-  ;;
-  --without-win-sdk) win_sdk="no"
-  ;;
   --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
       echo "$0: $opt is obsolete, virtio-blk data-plane is always on" >&2
   ;;
@@ -2340,27 +2333,6 @@ EOF
   fi
 fi
 
-##########################################
-# lookup Windows platform SDK (if not specified)
-# The SDK is needed only to build .tlb (type library) file of guest agent
-# VSS provider from the source. It is usually unnecessary because the
-# pre-compiled .tlb file is included.
-
-if test "$mingw32" = "yes" && \
-        test "$guest_agent_with_vss" = "yes" ; then
-  if test -z "$win_sdk"; then
-    programfiles="$PROGRAMFILES"
-    test -n "$PROGRAMW6432" && programfiles="$PROGRAMW6432"
-    if test -n "$programfiles"; then
-      win_sdk=$(ls -d "$programfiles/Microsoft SDKs/Windows/v"* | tail -1) 2>/dev/null
-    else
-      feature_not_found "Windows SDK"
-    fi
-  elif test "$win_sdk" = "no"; then
-    win_sdk=""
-  fi
-fi
-
 ##########################################
 # check if mingw environment provides a recent ntddscsi.h
 guest_agent_ntddscsi="no"
@@ -2892,7 +2864,6 @@ if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
   if test "$guest_agent_with_vss" = "yes" ; then
     echo "CONFIG_QGA_VSS=y" >> $config_host_mak
-    echo "WIN_SDK=\"$win_sdk\"" >> $config_host_mak
   fi
   if test "$guest_agent_ntddscsi" = "yes" ; then
     echo "CONFIG_QGA_NTDDSCSI=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index c4601554a5..e1667954b9 100644
--- a/meson.build
+++ b/meson.build
@@ -3413,11 +3413,6 @@ endif
 if targetos == 'darwin'
   summary_info += {'Objective-C compiler': ' '.join(meson.get_compiler('objc').cmd_array())}
 endif
-if targetos == 'windows'
-  if 'WIN_SDK' in config_host
-    summary_info += {'Windows SDK':   config_host['WIN_SDK']}
-  endif
-endif
 summary_info += {'CFLAGS':            ' '.join(get_option('c_args')
                                                + ['-O' + get_option('optimization')]
                                                + (get_option('debug') ? ['-g'] : []))}
-- 
2.34.1



