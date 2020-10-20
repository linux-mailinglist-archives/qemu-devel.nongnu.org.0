Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDB0283C5C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 18:21:42 +0200 (CEST)
Received: from localhost ([::1]:50238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPTF7-0001Cm-Do
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 12:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPSqF-0004Ao-TB; Mon, 05 Oct 2020 11:56:00 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPSqC-0001YE-QB; Mon, 05 Oct 2020 11:55:59 -0400
Received: by mail-pf1-x443.google.com with SMTP id w21so7193576pfc.7;
 Mon, 05 Oct 2020 08:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SrkVSypShhYA6dpxFUnwCp8qnWAZDmqFXRpgTELiGHU=;
 b=X/D7KW/fx9ziudkt+fjyondUMfrOwwCHJGW7d5mK9eFLxudVgDXO6FvIusjNQqBII+
 Zggwzy91ynhVaTKrffjQBFNDyos3RqSDWSrMoAjl0BigI0fnI+cIYHayzlz+K/gNZuBb
 cj6/BtYu+luSVzyoEw3ubYT3OrhPP9CTzxWSCa8I0nn4qf9oPOWw+0yjOZMxGpezG/tt
 rlrve6svPHzTVQ5YJt30q5qj4PBgCM6KY2d3uSDTs2akmW5bbSPbikQG0pqy/oKxj0ql
 NVokl8tloXJZCBAfvioOdNERC4g2/YZ9IPGVb7yGYCdOeUZBMLB/Cx09DZ1ddigb/Shm
 StTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SrkVSypShhYA6dpxFUnwCp8qnWAZDmqFXRpgTELiGHU=;
 b=WmEcUCj2g/CCdByMtEsZXp2Ocxiz4IQCQYP3lTIrICP+JEQZ9xZzWhwbrGW5lTmYCV
 xsyyKV6HFP0AS66Gg5AHUF8BiKEM//h/ZXKUb6rxodLrUOET77TZsxG1XXkpl6je+19A
 SktesSSESC6Dtn17ZBHbSJLbqU7PtqKsTzizQOPaodRBMjhxxYr54/ibz0SeCMM8/wlQ
 DtUkUZnydoqxgUf2xKdFMmsxWh5E+MZMfVuKzhSi8fqWlReIjgI3PVmuHELG7qAZu2pU
 zylz8UiDMYQpZ4Dr0SJymVIN3rKn1Ro6d8nC4uIYrsK3EL0PHriI8PrxKyUJicLDBqKd
 IAOw==
X-Gm-Message-State: AOAM533A86ZWOlucS8dBITOQ6O6RvbgG6foeMy6gn5O6Lo+ZpgbMNbcR
 xhPyBvgIX8SqnFbyIQUipphpB3sr9Om6mA==
X-Google-Smtp-Source: ABdhPJw3QTCnBM8mvRSSTiDYjcLUk5jjNSrKrfbqCtuIfK5GTtVHJslbAU/vwfINBGyy7vQhWBxwKQ==
X-Received: by 2002:a63:f04c:: with SMTP id s12mr80653pgj.425.1601913354325;
 Mon, 05 Oct 2020 08:55:54 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id u22sm34803pgi.85.2020.10.05.08.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 08:55:53 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v8 4/4] win32: Simplify gmtime_r detection not depends on if
 _POSIX_C_SOURCE are defined on msys2/mingw
Date: Mon,  5 Oct 2020 23:55:24 +0800
Message-Id: <20201005155524.442-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201005155524.442-1-luoyonggang@gmail.com>
References: <20201005155524.442-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x443.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Yonggang Luo <luoyonggang@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We remove the CONFIG_LOCALTIME_R detection option in configure, and move the check
existence of gmtime_r from configure into C header and source directly by using macro
`_POSIX_THREAD_SAFE_FUNCTIONS`.
Before this patch, the configure script are always assume the compiler doesn't define
_POSIX_C_SOURCE macro at all, but that's not true, because thirdparty library such
as ncursesw may define -D_POSIX_C_SOURCE in it's pkg-config file. And that C Flags will
added -D_POSIX_C_SOURCE into each QEMU_CFLAGS. And that's causing the following compiling error:
n file included from C:/work/xemu/qemu/include/qemu/osdep.h:119,
                 from ../softmmu/main.c:25:
C:/work/xemu/qemu/include/sysemu/os-win32.h:53:12: error: redundant redeclaration of 'gmtime_r' [-Werror=redundant-decls]
   53 | struct tm *gmtime_r(const time_t *timep, struct tm *result);
      |            ^~~~~~~~
In file included from C:/work/xemu/qemu/include/qemu/osdep.h:94,
                 from ../softmmu/main.c:25:
C:/CI-Tools/msys64/mingw64/x86_64-w64-mingw32/include/time.h:284:36: note: previous definition of 'gmtime_r' was here
  284 | __forceinline struct tm *__CRTDECL gmtime_r(const time_t *_Time, struct tm *_Tm) {
      |                                    ^~~~~~~~
In file included from C:/work/xemu/qemu/include/qemu/osdep.h:119,
                 from ../softmmu/main.c:25:
C:/work/xemu/qemu/include/sysemu/os-win32.h:55:12: error: redundant redeclaration of 'localtime_r' [-Werror=redundant-decls]
   55 | struct tm *localtime_r(const time_t *timep, struct tm *result);
      |            ^~~~~~~~~~~
In file included from C:/work/xemu/qemu/include/qemu/osdep.h:94,
                 from ../softmmu/main.c:25:
C:/CI-Tools/msys64/mingw64/x86_64-w64-mingw32/include/time.h:281:36: note: previous definition of 'localtime_r' was here
  281 | __forceinline struct tm *__CRTDECL localtime_r(const time_t *_Time, struct tm *_Tm) {
      |                                    ^~~~~~~~~~~
Compiling C object libcommon.fa.p/hw_gpio_zaurus.c.obj
In file included from C:/work/xemu/qemu/include/qemu/osdep.h:119,
                 from ../hw/i2c/smbus_slave.c:16:
C:/work/xemu/qemu/include/sysemu/os-win32.h:53:12: error: redundant redeclaration of 'gmtime_r' [-Werror=redundant-decls]
   53 | struct tm *gmtime_r(const time_t *timep, struct tm *result);
      |            ^~~~~~~~
In file included from C:/work/xemu/qemu/include/qemu/osdep.h:94,
                 from ../hw/i2c/smbus_slave.c:16:
C:/CI-Tools/msys64/mingw64/x86_64-w64-mingw32/include/time.h:284:36: note: previous definition of 'gmtime_r' was here
  284 | __forceinline struct tm *__CRTDECL gmtime_r(const time_t *_Time, struct tm *_Tm) {
      |                                    ^~~~~~~~
In file included from C:/work/xemu/qemu/include/qemu/osdep.h:119,
                 from ../hw/i2c/smbus_slave.c:16:
C:/work/xemu/qemu/include/sysemu/os-win32.h:55:12: error: redundant redeclaration of 'localtime_r' [-Werror=redundant-decls]
   55 | struct tm *localtime_r(const time_t *timep, struct tm *result);
      |            ^~~~~~~~~~~
In file included from C:/work/xemu/qemu/include/qemu/osdep.h:94,
                 from ../hw/i2c/smbus_slave.c:16:
C:/CI-Tools/msys64/mingw64/x86_64-w64-mingw32/include/time.h:281:36: note: previous definition of 'localtime_r' was here
  281 | __forceinline struct tm *__CRTDECL localtime_r(const time_t *_Time, struct tm *_Tm) {
      |                                    ^~~~~~~~~~~
Compiling C object libcommon.fa.p/hw_dma_xilinx_axidma.c.obj

After this patch, whenever ncursesw or other thirdparty libraries tried to define or not
define  _POSIX_C_SOURCE, the source will building properly. Because now, we don't make any
assumption if _POSIX_C_SOURCE are defined. We solely relied on if the macro `_POSIX_THREAD_SAFE_FUNCTIONS`
are defined in msys2/mingw header.

The _POSIX_THREAD_SAFE_FUNCTIONS are defined in mingw header like this:

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

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 configure                 | 34 ----------------------------------
 include/sysemu/os-win32.h |  4 ++--
 util/oslib-win32.c        |  4 ++--
 3 files changed, 4 insertions(+), 38 deletions(-)

diff --git a/configure b/configure
index 6acdd6fa88..19813935b3 100755
--- a/configure
+++ b/configure
@@ -2378,37 +2378,6 @@ if test "$vhost_net" = ""; then
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
 
@@ -6715,9 +6684,6 @@ if [ "$bsd" = "yes" ] ; then
   echo "CONFIG_BSD=y" >> $config_host_mak
 fi
 
-if test "$localtime_r" = "yes" ; then
-  echo "CONFIG_LOCALTIME_R=y" >> $config_host_mak
-fi
 if test "$qom_cast_debug" = "yes" ; then
   echo "CONFIG_QOM_CAST_DEBUG=y" >> $config_host_mak
 fi
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index d8978e28c0..5346d51e89 100644
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
+#endif /* _POSIX_THREAD_SAFE_FUNCTIONS */
 
 static inline void os_setup_signal_handling(void) {}
 static inline void os_daemonize(void) {}
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 051afb217b..e99debfb8d 100644
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
@@ -130,7 +130,7 @@ struct tm *localtime_r(const time_t *timep, struct tm *result)
     }
     return p;
 }
-#endif /* CONFIG_LOCALTIME_R */
+#endif /* _POSIX_THREAD_SAFE_FUNCTIONS */
 
 static int socket_error(void)
 {
-- 
2.28.0.windows.1


