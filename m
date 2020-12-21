Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9343E2DFD5E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:18:44 +0100 (CET)
Received: from localhost ([::1]:41096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMxP-0000PC-Ig
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:18:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRD-0004rV-BA
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:31 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMR9-0007pB-S9
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:26 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t16so11330080wra.3
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IUehFNl6rhfyT37c92sSKWNXxAmQ4tNlj0djWzXh9wE=;
 b=dGElYgncueoqFrBjxYK0bsHIMxkhbYq9as0oEtVij5xgY5lf94S8ZtOfX/agLudfpE
 PfGlH73STiagcZ7nglG841pqU6bT0sdUpRBpEJczBkxjZSrnHd6qiKXIg60q3CTfUlDD
 TXJ809A3E/+gZ6shxm5gF8zmvc9TSScXDuY3YKjC1oY54zrDMS/ZZ6gE2VwdDTaEZ9Yh
 /AcVEQA5EaTOU4f3kwyc1WD9rF3nKUaKSzZD3h/cbCMG7gR9GD7TqhcfTBOYFtvSwkEh
 omTZjSv3DwNtxhJ3B+EDgf+pemGBnR7FOjI1TZYgyP1y/MWAm5erfvheEDjzj3nvdgRN
 tCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IUehFNl6rhfyT37c92sSKWNXxAmQ4tNlj0djWzXh9wE=;
 b=GGR40JzgVOkYRpuYYuPcuoK5s8yPHVcBETkM+mu6YOM4uKh43xyLxOEiuZJtnH4qPa
 23c7JPOq8k9nDe7xIJn98fQ+L1yRGQdykh7BgvbuunW1yycgb+MU9spryPRgGZtEjffd
 xOOAyAJRE5zkQo1rQ+OHXh+n+QHYYPhFIMwt9s+l7NC/pxnrTMY96EGmK4g0UMe4V0+P
 n1RtqCuAt5VPn81FvgtfGxbwfnL90iTUzM8IrQuNFI6SHm0KzCkOp9vywcdCEQd7Eo5u
 ON7minzNHgIfVqa0UTzS+PQEc3irgBRUJ7XboN28Fp4NVcmsJt1ytTSIXpAPGeJNnqPw
 E0EQ==
X-Gm-Message-State: AOAM531NmxCqlNy+DwMZUSepI18m1p4WuKGMAdz3imYG2TeludlR6MsT
 Ow/AH5FmUTIQBXZkTxSh/+h6R7hCx8w=
X-Google-Smtp-Source: ABdhPJzzosY0tnTMjjc/TPKo2AKmH2WE9h/E0kmGN+9t6pWAT2a216Ypcu/0y0EJ86MlfYQ2gNDc/w==
X-Received: by 2002:adf:e552:: with SMTP id z18mr19580774wrm.29.1608561922222; 
 Mon, 21 Dec 2020 06:45:22 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 37/55] curl: remove compatibility code, require 7.29.0
Date: Mon, 21 Dec 2020 15:44:29 +0100
Message-Id: <20201221144447.26161-38-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Daniel=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cURL 7.16.0 was released in October 2006.  Just remove code that is
in all likelihood not being used anywhere, and require the oldest version
found in currently supported distros, which is 7.29.0 from CentOS 7.

pkg-config is enough for QEMU, since it does not need extra information
such as the path for certicate authorities.  All supported platforms
today will all have pkg-config for curl, so we can drop curl-config.

Suggested-by: Daniel Berrangé <berrange@redhat.com>
Reviewed-by: Daniel Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/curl.c | 28 ----------------------------
 configure    |  9 ++-------
 2 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index d24a4c5897..4ff895df8f 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -37,26 +37,6 @@
 
 // #define DEBUG_VERBOSE
 
-#if LIBCURL_VERSION_NUM >= 0x071000
-/* The multi interface timer callback was introduced in 7.16.0 */
-#define NEED_CURL_TIMER_CALLBACK
-#define HAVE_SOCKET_ACTION
-#endif
-
-#ifndef HAVE_SOCKET_ACTION
-/* If curl_multi_socket_action isn't available, define it statically here in
- * terms of curl_multi_socket. Note that ev_bitmask will be ignored, which is
- * less efficient but still safe. */
-static CURLMcode __curl_multi_socket_action(CURLM *multi_handle,
-                                            curl_socket_t sockfd,
-                                            int ev_bitmask,
-                                            int *running_handles)
-{
-    return curl_multi_socket(multi_handle, sockfd, running_handles);
-}
-#define curl_multi_socket_action __curl_multi_socket_action
-#endif
-
 #define PROTOCOLS (CURLPROTO_HTTP | CURLPROTO_HTTPS | \
                    CURLPROTO_FTP | CURLPROTO_FTPS)
 
@@ -140,7 +120,6 @@ typedef struct BDRVCURLState {
 static void curl_clean_state(CURLState *s);
 static void curl_multi_do(void *arg);
 
-#ifdef NEED_CURL_TIMER_CALLBACK
 /* Called from curl_multi_do_locked, with s->mutex held.  */
 static int curl_timer_cb(CURLM *multi, long timeout_ms, void *opaque)
 {
@@ -156,7 +135,6 @@ static int curl_timer_cb(CURLM *multi, long timeout_ms, void *opaque)
     }
     return 0;
 }
-#endif
 
 /* Called from curl_multi_do_locked, with s->mutex held.  */
 static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,
@@ -433,7 +411,6 @@ static void curl_multi_do(void *arg)
 
 static void curl_multi_timeout_do(void *arg)
 {
-#ifdef NEED_CURL_TIMER_CALLBACK
     BDRVCURLState *s = (BDRVCURLState *)arg;
     int running;
 
@@ -446,9 +423,6 @@ static void curl_multi_timeout_do(void *arg)
 
     curl_multi_check_completion(s);
     qemu_mutex_unlock(&s->mutex);
-#else
-    abort();
-#endif
 }
 
 /* Called with s->mutex held.  */
@@ -598,10 +572,8 @@ static void curl_attach_aio_context(BlockDriverState *bs,
     s->multi = curl_multi_init();
     s->aio_context = new_context;
     curl_multi_setopt(s->multi, CURLMOPT_SOCKETFUNCTION, curl_sock_cb);
-#ifdef NEED_CURL_TIMER_CALLBACK
     curl_multi_setopt(s->multi, CURLMOPT_TIMERDATA, s);
     curl_multi_setopt(s->multi, CURLMOPT_TIMERFUNCTION, curl_timer_cb);
-#endif
 }
 
 static QemuOptsList runtime_opts = {
diff --git a/configure b/configure
index 8dd9c33685..c75196beb1 100755
--- a/configure
+++ b/configure
@@ -3426,17 +3426,12 @@ done
 ##########################################
 # curl probe
 if test "$curl" != "no" ; then
-  if $pkg_config libcurl --exists; then
-    curlconfig="$pkg_config libcurl"
-  else
-    curlconfig=curl-config
-  fi
   cat > $TMPC << EOF
 #include <curl/curl.h>
 int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return 0; }
 EOF
-  curl_cflags=$($curlconfig --cflags 2>/dev/null)
-  curl_libs=$($curlconfig --libs 2>/dev/null)
+  curl_cflags=$($pkg_config libcurl --cflags 2>/dev/null)
+  curl_libs=$($pkg_config libcurl --libs 2>/dev/null)
   if compile_prog "$curl_cflags" "$curl_libs" ; then
     curl=yes
   else
-- 
2.29.2



