Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA0B264432
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 12:34:48 +0200 (CEST)
Received: from localhost ([::1]:43750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGJuh-0003Q6-GE
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 06:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kGJrw-00079Z-Rg; Thu, 10 Sep 2020 06:31:56 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:39767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kGJru-00036e-Ro; Thu, 10 Sep 2020 06:31:56 -0400
Received: by mail-pj1-x1042.google.com with SMTP id s2so2820082pjr.4;
 Thu, 10 Sep 2020 03:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=54KjmFONhFVNbISF0ZvZ1gRQPHqntcxYT0Rta8IUzTM=;
 b=KurugJDrN1wGMLweoZjbyHB+qUZNqOrKrnUYXK4t2mwfPWSoahFtg+wrhKLcZKB+On
 J/6JDp9HhjjmxMEYXfeytHJqiUvLc+kNqpydi935223Bb4N9aPOiX0RvpN5XW91sbB1q
 lxL3ZJW1EFmE9Yd/tfDUIXjkpfh8VPMgIsyg/cf1EQ2aRg7qspAWP/AdloxETJ+bswE+
 cMi1reZbQ4iBD4DMEOlt13SMxoZIcGxaW3wOxPa5Tzv3Bhbykz5Lu1TnGFlykLIPV67B
 Hs8ISjyWBe09KIZ5uTPyr2GYE/juEyOW7+IuOGeU1cBCvKd3qqYLNyNfKMfWDv4Iipgl
 /5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=54KjmFONhFVNbISF0ZvZ1gRQPHqntcxYT0Rta8IUzTM=;
 b=RDCE/u+pgmQpGITl4WA0Ifb/WCINr90EkS6sili6/St0bL5zIxXsPSqVuQTnCw/4Is
 StYfRutRbOBQwXqaoxTEThJLBoyKizU7vNbqY7R3IyNiazpPG3VAM7SKmGkEUfOgbHUf
 SgRGupdr7HTeQo/vxcGtYf5st+67agHaR5yJ8r8HgXlek4QGwLWg0ydKCxYKa/JfTO9L
 JuUqVopaKQutIBNsmNv8OLlWL7lqTLNbSZaaNwiW5B2Wxl4rBUzCUxZnDM0Od4ZilCBe
 gEbzx2+BFIqaarCF20YZ0vzIKiWG5g21jAskohX5Ma3y9m5l+OKurXbk3NpVpcWf9F0k
 ziRg==
X-Gm-Message-State: AOAM532DSfIVg8CRVpRsupCuh71j95xKPR86jxGSoMtEITyy2A7N1wHT
 R/Mlq4qp3YP7Ohl77Rm0Gkcp2/jUROpzWhP3NKs=
X-Google-Smtp-Source: ABdhPJzeSZENAm9t3ZHX/JWZA6L1FLeQv9n0FeoEKD3nUkk7daYT9aNtrDuHq17A07sTS82HynPgtQ==
X-Received: by 2002:a17:90a:880e:: with SMTP id
 s14mr4591185pjn.140.1599733912568; 
 Thu, 10 Sep 2020 03:31:52 -0700 (PDT)
Received: from localhost.localdomain ([222.95.248.6])
 by smtp.googlemail.com with ESMTPSA id g21sm2000203pfh.30.2020.09.10.03.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 03:31:51 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/25] win32: Simplify gmtime_r detection direct base on
 _POSIX_THREAD_SAFE_FUNCTIONS.
Date: Thu, 10 Sep 2020 18:30:40 +0800
Message-Id: <20200910103059.987-7-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200910103059.987-1-luoyonggang@gmail.com>
References: <20200910103059.987-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
 Peter Lieven <pl@kamp.de>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First, this reduce the size of configure, configure are tending to removal in future,
and this didn't introduce any new feature or remove any exist feature.
Second, the current localtime_r detection are conflict with ncursesw detection in
mingw, when ncursesw detected, it will provide the following compile flags
pkg-config --cflags ncursesw
-D_XOPEN_SOURCE=600 -D_POSIX_C_SOURCE=199506L -IC:/CI-Tools/msys64/mingw64/include/ncursesw
And the compile flag _POSIX_C_SOURCE will always cause _POSIX_THREAD_SAFE_FUNCTIONS to
be defined, in new version of mingw, that's will cause localtime_r to be defined.
But the configure script didn't provide _POSIX_C_SOURCE macro, and that's will result
localtime_r not detected because localtime_r are defined in forceinline manner.

And finally cause conflict between QEMU defined localtime_r
struct tm *localtime_r(const time_t *timep, struct tm *result);
with mingw defined localtime_r

```
#if defined(_POSIX_C_SOURCE) && !defined(_POSIX_THREAD_SAFE_FUNCTIONS)
#define _POSIX_THREAD_SAFE_FUNCTIONS 200112L
#endif

#ifdef _POSIX_THREAD_SAFE_FUNCTIONS
__forceinline struct tm *__CRTDECL localtime_r(const time_t *_Time, struct tm *_Tm) {
  return localtime_s(_Tm, _Time) ? NULL : _Tm;
}
__forceinline struct tm *__CRTDECL gmtime_r(const time_t *_Time, struct tm *_Tm) {
  return gmtime_s(_Tm, _Time) ? NULL : _Tm;
}
__forceinline char *__CRTDECL ctime_r(const time_t *_Time, char *_Str) {
  return ctime_s(_Str, 0x7fffffff, _Time) ? NULL : _Str;
}
__forceinline char *__CRTDECL asctime_r(const struct tm *_Tm, char * _Str) {
  return asctime_s(_Str, 0x7fffffff, _Tm) ? NULL : _Str;
}
#endif
```

So I suggest remove this configure script, and restrict msys2/mingw version to easy to maintain.
And use _POSIX_THREAD_SAFE_FUNCTIONS to guard the localtime_r and counterpart functions

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 configure                 | 34 ----------------------------------
 include/sysemu/os-win32.h |  4 ++--
 util/oslib-win32.c        |  2 +-
 3 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/configure b/configure
index b21843fdb9..af86ba1db3 100755
--- a/configure
+++ b/configure
@@ -2495,37 +2495,6 @@ if test "$vhost_net" = ""; then
   test "$vhost_kernel" = "yes" && vhost_net=yes
 fi
 
-##########################################
-# MinGW / Mingw-w64 localtime_r/gmtime_r check
-
-if test "$mingw32" = "yes"; then
-    # Some versions of MinGW / Mingw-w64 lack localtime_r
-    # and gmtime_r entirely.
-    #
-    # Some versions of Mingw-w64 define a macro for
-    # localtime_r/gmtime_r.
-    #
-    # Some versions of Mingw-w64 will define functions
-    # for localtime_r/gmtime_r, but only if you have
-    # _POSIX_THREAD_SAFE_FUNCTIONS defined. For fun
-    # though, unistd.h and pthread.h both define
-    # that for you.
-    #
-    # So this #undef localtime_r and #include <unistd.h>
-    # are not in fact redundant.
-cat > $TMPC << EOF
-#include <unistd.h>
-#include <time.h>
-#undef localtime_r
-int main(void) { localtime_r(NULL, NULL); return 0; }
-EOF
-    if compile_prog "" "" ; then
-        localtime_r="yes"
-    else
-        localtime_r="no"
-    fi
-fi
-
 ##########################################
 # pkg-config probe
 
@@ -7087,9 +7056,6 @@ if [ "$bsd" = "yes" ] ; then
   echo "CONFIG_BSD=y" >> $config_host_mak
 fi
 
-if test "$localtime_r" = "yes" ; then
-  echo "CONFIG_LOCALTIME_R=y" >> $config_host_mak
-fi
 if test "$qom_cast_debug" = "yes" ; then
   echo "CONFIG_QOM_CAST_DEBUG=y" >> $config_host_mak
 fi
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index d8978e28c0..3ac8a53bac 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -48,12 +48,12 @@
 #define siglongjmp(env, val) longjmp(env, val)
 
 /* Missing POSIX functions. Don't use MinGW-w64 macros. */
-#ifndef CONFIG_LOCALTIME_R
+#ifndef _POSIX_THREAD_SAFE_FUNCTIONS
 #undef gmtime_r
 struct tm *gmtime_r(const time_t *timep, struct tm *result);
 #undef localtime_r
 struct tm *localtime_r(const time_t *timep, struct tm *result);
-#endif /* CONFIG_LOCALTIME_R */
+#endif
 
 static inline void os_setup_signal_handling(void) {}
 static inline void os_daemonize(void) {}
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index c654dafd93..f2fa9a3549 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -106,7 +106,7 @@ void qemu_anon_ram_free(void *ptr, size_t size)
     }
 }
 
-#ifndef CONFIG_LOCALTIME_R
+#ifndef _POSIX_THREAD_SAFE_FUNCTIONS
 /* FIXME: add proper locking */
 struct tm *gmtime_r(const time_t *timep, struct tm *result)
 {
-- 
2.28.0.windows.1


