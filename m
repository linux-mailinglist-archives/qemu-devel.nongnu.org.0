Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A34253E6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:19:48 +0200 (CEST)
Received: from localhost ([::1]:54606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTJL-0006iL-To
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8Y-0005Ng-3A
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:38 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8V-0007k2-NH
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:37 -0400
Received: by mail-ed1-x536.google.com with SMTP id y12so9295010eda.4
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9rCH4wctxN8WcMyAfwBozRtnI26L6A54B5lz96SaiQI=;
 b=CWX+KF1KB78D4apYggdFF2PeR87aDjt/bo4FlQM8OsuDKXYbGvH56EfVyKP8wd4S5z
 UsjfEO1TKqM9ejAZQnqAi7J224DbR7k9IWhJxsMjittYiQLofXbki4DqcvSsf0T48qLJ
 Ep6FGCAXT41v5+dP2rOgUuS3M6jNShIfBDUppUaQGmUYf5UhygPxEP+6/ciD033Gtw/G
 r4CTdTtiAVfSrzSOZfAEFkyFqTpmS9t/WKGdZyBUEK/IilPFVEcwE5HBkxMKRTTT9S4Y
 5IMNmE2kIonh9Eim99+QG5G703Sr0vGlqROSDykvf8KGGjqSgfCnpdooTaDvIMQuWRWU
 jigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9rCH4wctxN8WcMyAfwBozRtnI26L6A54B5lz96SaiQI=;
 b=Os283ReowEXFrcMkq3O5MgaZnqfiZVLYFIojGIVWacZw5cg6XY44Qg1FYlOQLNHjdu
 ysXZ86DtCUbl900eBwKEJSF35vrngjqqmK9LY8Hd1nziTkgPEhOBUQ+R3N4oliBoXE+K
 01fZcWLq7jkgctEIbLJqaDllyHL0SlNJ8Gk8hzqEQyiTSOiAUznLtBljaRKCUIyv4Ljm
 EzT2l6CHnamsqaTjZJicF+/q+9LITGa3V7d2d4DVkXXRIKY5ud3DS97m4xZIXbhoC7Z+
 GdRxmLrxRElTN5xZJM+QXLcozQW8YuSXna7pxwaaLK+l5jhZguIo48FU+/4cp3uYJuNO
 C0Ug==
X-Gm-Message-State: AOAM531gfqZIJBFgmT03qijfY8Zc7TQccug8LIwud/pgcYe+Yn26M7rS
 iOm2Ym+t44B2tt9+tN7XMWBtFJOTMJk=
X-Google-Smtp-Source: ABdhPJwCKF2NU33Z9HONFEE869BmCKNLPPY/dGtxPHg6TGgiVXeIfP0eGwK6hOWSPm8mp8P/1wk2GQ==
X-Received: by 2002:a05:6402:5209:: with SMTP id
 s9mr2298604edd.110.1633612113031; 
 Thu, 07 Oct 2021 06:08:33 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm791254edw.84.2021.10.07.06.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:08:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/24] trace: move configuration from configure to Meson
Date: Thu,  7 Oct 2021 15:08:14 +0200
Message-Id: <20211007130829.632254-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure           | 91 +--------------------------------------------
 docs/meson.build    |  2 +-
 meson.build         | 51 +++++++++++++++++++++----
 meson_options.txt   |  6 +++
 scripts/meson.build |  2 +-
 trace/meson.build   | 15 +++++---
 6 files changed, 61 insertions(+), 106 deletions(-)

diff --git a/configure b/configure
index 98723db0cd..4bfc5e350d 100755
--- a/configure
+++ b/configure
@@ -216,10 +216,6 @@ version_ge () {
     done
 }
 
-have_backend () {
-    echo "$trace_backends" | grep "$1" >/dev/null
-}
-
 glob() {
     eval test -z '"${1#'"$2"'}"'
 }
@@ -3512,56 +3508,6 @@ case "$capstone" in
     ;;
 esac
 
-##########################################
-# check if we have posix_syslog
-
-posix_syslog=no
-cat > $TMPC << EOF
-#include <syslog.h>
-int main(void) { openlog("qemu", LOG_PID, LOG_DAEMON); syslog(LOG_INFO, "configure"); return 0; }
-EOF
-if compile_prog "" "" ; then
-    posix_syslog=yes
-fi
-
-##########################################
-# check if trace backend exists
-
-$python "$source_path/scripts/tracetool.py" "--backends=$trace_backends" --check-backends  > /dev/null 2> /dev/null
-if test "$?" -ne 0 ; then
-  error_exit "invalid trace backends" \
-      "Please choose supported trace backends."
-fi
-
-##########################################
-# For 'ust' backend, test if ust headers are present
-if have_backend "ust"; then
-  if $pkg_config lttng-ust --exists; then
-    lttng_ust_libs=$($pkg_config --libs lttng-ust)
-  else
-    error_exit "Trace backend 'ust' missing lttng-ust header files"
-  fi
-fi
-
-##########################################
-# For 'dtrace' backend, test if 'dtrace' command is present
-if have_backend "dtrace"; then
-  if ! has 'dtrace' ; then
-    error_exit "dtrace command is not found in PATH $PATH"
-  fi
-  trace_backend_stap="no"
-  if has 'stap' ; then
-    trace_backend_stap="yes"
-
-    # Workaround to avoid dtrace(1) producing a file with 'hidden' symbol
-    # visibility. Define STAP_SDT_V2 to produce 'default' symbol visibility
-    # instead. QEMU --enable-modules depends on this because the SystemTap
-    # semaphores are linked into the main binary and not the module's shared
-    # object.
-    QEMU_CFLAGS="$QEMU_CFLAGS -DSTAP_SDT_V2"
-  fi
-fi
-
 ##########################################
 # check and set a backend for coroutine
 
@@ -4572,42 +4518,6 @@ if test "$tpm" = "yes"; then
   echo 'CONFIG_TPM=y' >> $config_host_mak
 fi
 
-echo "TRACE_BACKENDS=$trace_backends" >> $config_host_mak
-if have_backend "nop"; then
-  echo "CONFIG_TRACE_NOP=y" >> $config_host_mak
-fi
-if have_backend "simple"; then
-  echo "CONFIG_TRACE_SIMPLE=y" >> $config_host_mak
-fi
-if have_backend "log"; then
-  echo "CONFIG_TRACE_LOG=y" >> $config_host_mak
-fi
-if have_backend "ust"; then
-  echo "CONFIG_TRACE_UST=y" >> $config_host_mak
-  echo "LTTNG_UST_LIBS=$lttng_ust_libs" >> $config_host_mak
-fi
-if have_backend "dtrace"; then
-  echo "CONFIG_TRACE_DTRACE=y" >> $config_host_mak
-  if test "$trace_backend_stap" = "yes" ; then
-    echo "CONFIG_TRACE_SYSTEMTAP=y" >> $config_host_mak
-  fi
-fi
-if have_backend "ftrace"; then
-  if test "$linux" = "yes" ; then
-    echo "CONFIG_TRACE_FTRACE=y" >> $config_host_mak
-  else
-    feature_not_found "ftrace(trace backend)" "ftrace requires Linux"
-  fi
-fi
-if have_backend "syslog"; then
-  if test "$posix_syslog" = "yes" ; then
-    echo "CONFIG_TRACE_SYSLOG=y" >> $config_host_mak
-  else
-    feature_not_found "syslog(trace backend)" "syslog not available"
-  fi
-fi
-echo "CONFIG_TRACE_FILE=$trace_file" >> $config_host_mak
-
 if test "$rdma" = "yes" ; then
   echo "CONFIG_RDMA=y" >> $config_host_mak
   echo "RDMA_LIBS=$rdma_libs" >> $config_host_mak
@@ -4990,6 +4900,7 @@ if test "$skip_meson" = no; then
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
         -Dalsa=$alsa -Dcoreaudio=$coreaudio -Ddsound=$dsound -Djack=$jack -Doss=$oss \
         -Dpa=$pa -Daudio_drv_list=$audio_drv_list -Dtcg_interpreter=$tcg_interpreter \
+        -Dtrace_backends=$trace_backends -Dtrace_file=$trace_file \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/docs/meson.build b/docs/meson.build
index be4dc30f39..19cce670a2 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -57,7 +57,7 @@ if build_docs
         'qemu-nbd.8': (have_tools ? 'man8' : ''),
         'qemu-pr-helper.8': (have_tools ? 'man8' : ''),
         'qemu-storage-daemon.1': (have_tools ? 'man1' : ''),
-        'qemu-trace-stap.1': (config_host.has_key('CONFIG_TRACE_SYSTEMTAP') ? 'man1' : ''),
+        'qemu-trace-stap.1': (stap.found() ? 'man1' : ''),
         'virtfs-proxy-helper.1': (have_virtfs_proxy_helper ? 'man1' : ''),
         'virtiofsd.1': (have_virtiofsd ? 'man1' : ''),
         'qemu.1': 'man1',
diff --git a/meson.build b/meson.build
index 8752b757cc..98fa4b68d9 100644
--- a/meson.build
+++ b/meson.build
@@ -111,6 +111,22 @@ foreach target : edk2_targets
   endif
 endforeach
 
+dtrace = not_found
+stap = not_found
+if 'dtrace' in get_option('trace_backends')
+  dtrace = find_program('dtrace', required: true)
+  stap = find_program('stap', required: false)
+  if stap.found()
+    # Workaround to avoid dtrace(1) producing a file with 'hidden' symbol
+    # visibility. Define STAP_SDT_V2 to produce 'default' symbol visibility
+    # instead. QEMU --enable-modules depends on this because the SystemTap
+    # semaphores are linked into the main binary and not the module's shared
+    # object.
+    add_global_arguments('-DSTAP_SDT_V2',
+                         native: false, language: ['c', 'cpp', 'objc'])
+  endif
+endif
+
 ##################
 # Compiler flags #
 ##################
@@ -201,6 +217,19 @@ if get_option('fuzzing') and get_option('fuzzing_engine') == '' and \
   error('Your compiler does not support -fsanitize=fuzzer')
 endif
 
+if 'ftrace' in get_option('trace_backends') and targetos != 'linux'
+  error('ftrace is supported only on Linux')
+endif
+if 'syslog' in get_option('trace_backends') and not cc.compiles('''
+    #include <syslog.h>
+    int main(void) {
+        openlog("qemu", LOG_PID, LOG_DAEMON);
+        syslog(LOG_INFO, "configure");
+        return 0;
+    }''')
+  error('syslog is not supported on this system')
+endif
+
 if targetos != 'linux' and get_option('mpath').enabled()
   error('Multipath is supported only on Linux')
 endif
@@ -361,8 +390,9 @@ if 'CONFIG_GIO' in config_host
                            link_args: config_host['GIO_LIBS'].split())
 endif
 lttng = not_found
-if 'CONFIG_TRACE_UST' in config_host
-  lttng = declare_dependency(link_args: config_host['LTTNG_UST_LIBS'].split())
+if 'ust' in get_option('trace_backends')
+  lttng = dependency('lttng-ust', required: true, method: 'pkg-config',
+                     kwargs: static_kwargs)
 endif
 pixman = not_found
 if have_system or have_tools
@@ -1349,6 +1379,11 @@ elif get_option('virtfs').disabled()
   have_virtfs = false
 endif
 
+foreach k : get_option('trace_backends')
+  config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
+endforeach
+config_host_data.set_quoted('CONFIG_TRACE_FILE', get_option('trace_file'))
+
 config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') / get_option('bindir'))
 config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
 config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
@@ -1574,7 +1609,7 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
 arrays = ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
-strings = ['HOST_DSOSUF', 'CONFIG_IASL', 'CONFIG_TRACE_FILE']
+strings = ['HOST_DSOSUF', 'CONFIG_IASL']
 foreach k, v: config_host
   if ignored.contains(k)
     # do nothing
@@ -2112,7 +2147,7 @@ qapi_gen_depends = [ meson.current_source_dir() / 'scripts/qapi/__init__.py',
 
 tracetool = [
   python, files('scripts/tracetool.py'),
-   '--backend=' + config_host['TRACE_BACKENDS']
+   '--backend=' + ','.join(get_option('trace_backends'))
 ]
 tracetool_depends = files(
   'scripts/tracetool/backend/log.py',
@@ -2831,7 +2866,7 @@ foreach target : target_dirs
       emulators += {exe['name']: emulator}
     endif
 
-    if 'CONFIG_TRACE_SYSTEMTAP' in config_host
+    if stap.found()
       foreach stp: [
         {'ext': '.stp-build', 'fmt': 'stap', 'bin': meson.current_build_dir() / exe['name'], 'install': false},
         {'ext': '.stp', 'fmt': 'stap', 'bin': get_option('prefix') / get_option('bindir') / exe['name'], 'install': true},
@@ -3012,9 +3047,9 @@ summary_info += {'fuzzing support':   get_option('fuzzing')}
 if have_system
   summary_info += {'Audio drivers':     ' '.join(audio_drivers_selected)}
 endif
-summary_info += {'Trace backends':    config_host['TRACE_BACKENDS']}
-if config_host['TRACE_BACKENDS'].split().contains('simple')
-  summary_info += {'Trace output file': config_host['CONFIG_TRACE_FILE'] + '-<pid>'}
+summary_info += {'Trace backends':    ','.join(get_option('trace_backends'))}
+if 'simple' in get_option('trace_backends')
+  summary_info += {'Trace output file': get_option('trace_file') + '-<pid>'}
 endif
 summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
 summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNEL')}
diff --git a/meson_options.txt b/meson_options.txt
index 100c30e967..8f9c3b5b17 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -13,6 +13,8 @@ option('audio_drv_list', type: 'array', value: ['default'],
        description: 'Set audio driver list')
 option('fuzzing_engine', type : 'string', value : '',
        description: 'fuzzing engine library for OSS-Fuzz')
+option('trace_file', type: 'string', value: 'trace',
+       description: 'Trace file prefix for simple backend')
 
 option('docs', type : 'feature', value : 'auto',
        description: 'Documentations build support')
@@ -146,6 +148,10 @@ option('fuse', type: 'feature', value: 'auto',
 option('fuse_lseek', type : 'feature', value : 'auto',
        description: 'SEEK_HOLE/SEEK_DATA support for FUSE exports')
 
+option('trace_backends', type: 'array', value: ['log'],
+       choices: ['dtrace', 'ftrace', 'log', 'nop', 'simple', 'syslog', 'ust'],
+       description: 'Set available tracing backends')
+
 option('alsa', type: 'feature', value: 'auto',
        description: 'ALSA sound support')
 option('coreaudio', type: 'feature', value: 'auto',
diff --git a/scripts/meson.build b/scripts/meson.build
index e8cc63896d..1c89e10a76 100644
--- a/scripts/meson.build
+++ b/scripts/meson.build
@@ -1,3 +1,3 @@
-if 'CONFIG_TRACE_SYSTEMTAP' in config_host
+if stap.found()
   install_data('qemu-trace-stap', install_dir: get_option('bindir'))
 endif
diff --git a/trace/meson.build b/trace/meson.build
index b8f95de200..573dd699c6 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -2,7 +2,6 @@
 specific_ss.add(files('control-target.c'))
 
 trace_events_files = []
-dtrace = find_program('dtrace', required: 'CONFIG_TRACE_DTRACE' in config_host)
 foreach dir : [ '.' ] + trace_events_subdirs
   trace_events_file = meson.project_source_root() / dir / 'trace-events'
   trace_events_files += [ trace_events_file ]
@@ -21,7 +20,7 @@ foreach dir : [ '.' ] + trace_events_subdirs
                           input: trace_events_file,
                           command: [ tracetool, group, '--format=c', '@INPUT@', '@OUTPUT@' ],
                           depend_files: tracetool_depends)
-  if 'CONFIG_TRACE_UST' in config_host
+  if 'ust' in get_option('trace_backends')
     trace_ust_h = custom_target(fmt.format('trace-ust', 'h'),
                                 output: fmt.format('trace-ust', 'h'),
                                 input: trace_events_file,
@@ -31,7 +30,7 @@ foreach dir : [ '.' ] + trace_events_subdirs
     genh += trace_ust_h
   endif
   trace_ss.add(trace_h, trace_c)
-  if 'CONFIG_TRACE_DTRACE' in config_host
+  if 'dtrace' in get_option('trace_backends')
     trace_dtrace = custom_target(fmt.format('trace-dtrace', 'dtrace'),
                                  output: fmt.format('trace-dtrace', 'dtrace'),
                                  input: trace_events_file,
@@ -76,7 +75,7 @@ foreach d : [
   specific_ss.add(when: 'CONFIG_TCG', if_true: gen)
 endforeach
 
-if 'CONFIG_TRACE_UST' in config_host
+if 'ust' in get_option('trace_backends')
   trace_ust_all_h = custom_target('trace-ust-all.h',
                                   output: 'trace-ust-all.h',
                                   input: trace_events_files,
@@ -91,7 +90,11 @@ if 'CONFIG_TRACE_UST' in config_host
   genh += trace_ust_all_h
 endif
 
-trace_ss.add(when: 'CONFIG_TRACE_SIMPLE', if_true: files('simple.c'))
-trace_ss.add(when: 'CONFIG_TRACE_FTRACE', if_true: files('ftrace.c'))
+if 'simple' in get_option('trace_backends')
+  trace_ss.add(files('simple.c'))
+endif
+if 'ftrace' in get_option('trace_backends')
+  trace_ss.add(files('ftrace.c'))
+endif
 trace_ss.add(files('control.c'))
 trace_ss.add(files('qmp.c'))
-- 
2.31.1



