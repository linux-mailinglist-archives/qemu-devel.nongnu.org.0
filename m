Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A992B5E7C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:40:45 +0100 (CET)
Received: from localhost ([::1]:58976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezLo-0003UV-6k
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kezKC-0002Kc-6f; Tue, 17 Nov 2020 06:39:07 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kezK4-0005gF-7p; Tue, 17 Nov 2020 06:39:01 -0500
Received: by mail-wm1-x344.google.com with SMTP id h2so2940324wmm.0;
 Tue, 17 Nov 2020 03:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QpJ9IH6T/7VwvyWJDc2VrQB3mCDgd19DdGPQ6cTqENI=;
 b=QC1wssdWxdtIZWx2O89GTMfBRRTrRreKkVsNs05NNKrEd6t/ZJySUE+d8ZUfu+wikO
 y18Yb0Z088hevSPT713EOPcg65vYTyOwtrbe+4Yr2z2Dg+EJZpWDquoRXkMIpAfwOQR3
 0deZEdKbRFjkxFuetCrZJpjqC/25244NQPGNgvaDVYZX8lSTpzBtS28XA4Lk7o/B3K4A
 aSVwXdPzmzXMOrsNMa45wBvLPN6HVFlyY4PvuUaUepZuPsOvX1ZKTkina1Od77NS9whF
 2Y5iThaeIRIB3spNGdoVEgE0hUfrtM4j42r3XrBSAA/lewwLQbqaDJjonYXvZE5URlh4
 eadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QpJ9IH6T/7VwvyWJDc2VrQB3mCDgd19DdGPQ6cTqENI=;
 b=AhPP/i/jI/0tXsidpnq02fRK/tlDJRhTGewFy/1lVJuNKChuj172eikpWfMiw0Y+ZS
 5pYFXXCQ85Iufsu7cd1b2Cbu8aRlOYMOJ0AnFCZHiAsDE32zri97xwHSY4U9amT7UYyf
 7jkqIPZ7tOeOWcDrHv1DVTK47gfsD8uklPZB9vCC16wZ7s9PcSuVWZOAz25S8PPUuXlq
 xj8FcoD0uXVKVqitFzfp+DTE3CkNyWZJSACGgpu2LSJ4btHpSMcUvj2m79wVxuvpN5YM
 rl2N2WuiDzydsr8R7hpp4rhN96IIIBGJBHPVBOWdOxuVpCumvrH8jmL8f0IZ5RTr53t+
 n5uQ==
X-Gm-Message-State: AOAM532D/7l5skD1qyqU4ljBKDcPKP3Q0PYQM9c6hF90h56nBPQyi4Ue
 18puWnj8ukpOWyDF70KRwT/wuE5VSEQ=
X-Google-Smtp-Source: ABdhPJxjA0c36K085GfKTi/8YDukOXOFslidolUT5TiTbDcwxMj0vBJ9ElzIoCtqwaY2udd89dR8vA==
X-Received: by 2002:a7b:cc12:: with SMTP id f18mr4042478wmh.110.1605613132185; 
 Tue, 17 Nov 2020 03:38:52 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o63sm3153329wmo.2.2020.11.17.03.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 03:38:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] curl: remove compatibility code
Date: Tue, 17 Nov 2020 12:38:50 +0100
Message-Id: <20201117113850.64108-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cURL 7.16.0 was released in October 2006.  Just remove code that is
in all likelihood not being used anywhere.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/curl.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index 4f907c47be..b77bfe12e7 100644
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
-- 
2.28.0


