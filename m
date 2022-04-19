Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B532C506413
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 07:56:25 +0200 (CEST)
Received: from localhost ([::1]:35008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nggqe-0004EO-PQ
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 01:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggll-00014H-0p
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:21 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglg-0004NL-Jo
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:17 -0400
Received: by mail-wr1-x435.google.com with SMTP id t1so20933108wra.4
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mPuqrCMV9aD2M+alYk9Azn6BTL3OZnvdkF5lNEL9Dco=;
 b=Uv1FeH5S7RPw4D2XeuCtPhtHmui6emsO2LPqJcRkdEfqWZEvhbdzz9cy1pvoxfMG7+
 bIjXsp9adBTQvYA3oHMpjr8oJdZCi/8o4nStHeHMz7v5wNNuYP4tK1XBmALV8Z5x51p5
 C1JItGwSa2xEZ37J/QFZOMpiszSPSbFnnUOJxsx1l/Kx9ej7UikrqPBJcwUaidJVqXxQ
 HlyVMCw2hWuMuisK2i/1UuHNqabuWZTcvG7S/CNE7dQbDWF9A5eh0q5n6gMDbclwC7Pj
 ZTcTPnJs/B/sMrnlm0xsMbHpU2oJNZ+ep7Fd8gerfsZ/bmzTo3t0KsbtS8sxvG2wZ/mC
 6FAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mPuqrCMV9aD2M+alYk9Azn6BTL3OZnvdkF5lNEL9Dco=;
 b=k/ImS7ZPziZGSVouD7h06HC2RvYCxZmGzei0wzesRXxO0LaciPEDlKpHYRtjoAquP/
 flOUw20rEAWWuSxK5tbM9/q1KS/EdxBPYdDA4AJVJoPDJK47iRVYT3Fmx+CzKouZSQDm
 wl0uJKyqi9+nvnq96N+USUaVmtM3u2llMJST2paGO+tzuFxkLShLOYuCYOatgXMnqrYP
 QSvI/clvG0bb7w+QjxPMIhHTIVFKm+uBGH2e8K5eOYE4dw/Q5EYllq3iF/tdwkK07txb
 mBjtdEntnC6DIPKj040e6Thf5MVQhzv9YEFj9lsdp05RLyk/oE1ZpNVwQrcv1zHFV7tC
 d/YQ==
X-Gm-Message-State: AOAM530rDw7wZI8PvKp4CbLIroIwdJI8WH2I1gLwhzvJHWSnlQrZ9KX/
 +YhkMRkZUt+L8ZLj+oT8dJ9sPBuJj7WRyw==
X-Google-Smtp-Source: ABdhPJzGHUEiXXxV7nsvPd0cqdj/jdpiJC/Yg6nnSyhM0yhzb9DPgpBsAvxS41oYNQdKQVrK2hqvCw==
X-Received: by 2002:a5d:6487:0:b0:20a:a600:c512 with SMTP id
 o7-20020a5d6487000000b0020aa600c512mr1476295wri.560.1650347475221; 
 Mon, 18 Apr 2022 22:51:15 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/53] oslib: drop qemu_gettimeofday()
Date: Tue, 19 Apr 2022 07:50:21 +0200
Message-Id: <20220419055109.142788-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

No longer used after the previous patches.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220307070401.171986-6-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/os-posix.h |  3 ---
 include/sysemu/os-win32.h |  6 ------
 util/oslib-win32.c        | 20 --------------------
 3 files changed, 29 deletions(-)

diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index dd64fb401d..23bd45457d 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -52,9 +52,6 @@ int os_mlock(void);
 #define closesocket(s) close(s)
 #define ioctlsocket(s, r, v) ioctl(s, r, v)
 
-typedef struct timeval qemu_timeval;
-#define qemu_gettimeofday(tp) gettimeofday(tp, NULL)
-
 int os_set_daemonize(bool d);
 bool is_daemonized(void);
 
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 770752222a..1351d1d29e 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -71,12 +71,6 @@ int getpagesize(void);
 # define EPROTONOSUPPORT EINVAL
 #endif
 
-typedef struct {
-    long tv_sec;
-    long tv_usec;
-} qemu_timeval;
-int qemu_gettimeofday(qemu_timeval *tp);
-
 static inline int os_set_daemonize(bool d)
 {
     if (d) {
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 4b1ce0be4b..f139c069ae 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -230,26 +230,6 @@ void qemu_set_cloexec(int fd)
 {
 }
 
-/* Offset between 1/1/1601 and 1/1/1970 in 100 nanosec units */
-#define _W32_FT_OFFSET (116444736000000000ULL)
-
-int qemu_gettimeofday(qemu_timeval *tp)
-{
-  union {
-    unsigned long long ns100; /*time since 1 Jan 1601 in 100ns units */
-    FILETIME ft;
-  }  _now;
-
-  if(tp) {
-      GetSystemTimeAsFileTime (&_now.ft);
-      tp->tv_usec=(long)((_now.ns100 / 10ULL) % 1000000ULL );
-      tp->tv_sec= (long)((_now.ns100 - _W32_FT_OFFSET) / 10000000ULL);
-  }
-  /* Always return 0 as per Open Group Base Specifications Issue 6.
-     Do not set errno on error.  */
-  return 0;
-}
-
 int qemu_get_thread_id(void)
 {
     return GetCurrentThreadId();
-- 
2.35.1



