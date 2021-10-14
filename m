Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD47942DF70
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:45:48 +0200 (CEST)
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3rW-0004Mr-5g
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cH-0003ra-RJ
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:30:03 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:38792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cF-0000jK-K9
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:30:01 -0400
Received: by mail-ed1-x52d.google.com with SMTP id d9so26306550edh.5
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XRSuK+bPtuorOXI6SqdpPSmiLRjrsDmQS3bDT+tnFWY=;
 b=UlNIIFbH5jSfBLKtpnPinDLK8NwOLr6HsYwfiijJ3VeCjiOg/vi+kLKufRPiCFh+Oe
 AMUR49R3pXJqoxAgpEIsLqj1gRB54bGoTolN7jH6OfH+y/8Xk1swOkdk1TkS0S7khbB+
 IAsHMwmmulh7qq+/U67HbZMnaH0A+21dlfIysXkYb7K/DTev4t8eqWTtf9kvCMNft0kB
 j1F9J0bxZ3A9xSlGkQxwcS9k8nprUF6ZC6cevdULutHbCvaEZ6zi3fgzTKTTFV1nnqFA
 ZTDC2XIeCwOh5D7ZesKPy/haJ0al8j1LkY+dbdxbqzxS+BV8O/iazh5VbRZqrXIunk+4
 tkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XRSuK+bPtuorOXI6SqdpPSmiLRjrsDmQS3bDT+tnFWY=;
 b=HsCEfPAkDsYzw95Mpz87p51Vvuqjg3M0HRv5bRfuWSOY8rvaxVuplNUHvhr66YK7LZ
 VAIZrU96+ZQnJzrco2/oJYshX4h5me7QHzSoZLhvo3dZ0JvC++uTA8rnBj1LAtk2YfoC
 VM3Lm1RwIVsHeQVxojzeI5j86uktjOSRMAdn3h+ae/12Y4SsdYUyMAGlIsirAXvZePs6
 /dXBGFxVXB24s/lq3iFPzHCS7k6G66m4yimhwtMFEZ79S8kri3NfPfByWfw44KFMt/g3
 3qern4j9La5r/Wmd9NPwmgjQgXAfC32jviiHdh6QuReX/AA3vfXvmdhE/8PyZ/esEoGO
 IheQ==
X-Gm-Message-State: AOAM533/Y2d5jXQrMJtm5dPztShEzvo/HDIqLaIm4uPvcBuSyyCRxFFA
 ljB74nJC/MS0gANNAHPKhxEPg6Qq14Q=
X-Google-Smtp-Source: ABdhPJx2GFcrcW0PbNc7K0ZORfpEozDNO/EhJk8Zxma3V8L8FjGBZMzIGACablkIJC3ccjeFuTrqMA==
X-Received: by 2002:aa7:d84a:: with SMTP id f10mr10148288eds.132.1634228997223; 
 Thu, 14 Oct 2021 09:29:57 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.29.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:29:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/26] configure, meson: move netmap detection to meson
Date: Thu, 14 Oct 2021 18:29:30 +0200
Message-Id: <20211014162938.430211-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Message-Id: <20211007130829.632254-12-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 40 ++++------------------------------------
 meson.build       | 19 ++++++++++++++++++-
 meson_options.txt |  2 ++
 net/meson.build   |  4 +++-
 4 files changed, 27 insertions(+), 38 deletions(-)

diff --git a/configure b/configure
index 0c077f3f5e..3544024166 100755
--- a/configure
+++ b/configure
@@ -292,7 +292,7 @@ iconv="auto"
 curses="auto"
 docs="auto"
 fdt="auto"
-netmap="no"
+netmap="auto"
 sdl="auto"
 sdl_image="auto"
 virtiofsd="auto"
@@ -701,7 +701,6 @@ FreeBSD)
   bsd_user="yes"
   make="${MAKE-gmake}"
   # needed for kinfo_getvmmap(3) in libutil.h
-  netmap=""  # enable netmap autodetect
 ;;
 DragonFly)
   bsd="yes"
@@ -1026,9 +1025,9 @@ for opt do
   ;;
   --enable-vde) vde="enabled"
   ;;
-  --disable-netmap) netmap="no"
+  --disable-netmap) netmap="disabled"
   ;;
-  --enable-netmap) netmap="yes"
+  --enable-netmap) netmap="enabled"
   ;;
   --disable-xen) xen="disabled"
   ;;
@@ -2903,34 +2902,6 @@ EOF
   fi
 fi
 
-##########################################
-# netmap support probe
-# Apart from looking for netmap headers, we make sure that the host API version
-# supports the netmap backend (>=11). The upper bound (15) is meant to simulate
-# a minor/major version number. Minor new features will be marked with values up
-# to 15, and if something happens that requires a change to the backend we will
-# move above 15, submit the backend fixes and modify this two bounds.
-if test "$netmap" != "no" ; then
-  cat > $TMPC << EOF
-#include <inttypes.h>
-#include <net/if.h>
-#include <net/netmap.h>
-#include <net/netmap_user.h>
-#if (NETMAP_API < 11) || (NETMAP_API > 15)
-#error
-#endif
-int main(void) { return 0; }
-EOF
-  if compile_prog "" "" ; then
-    netmap=yes
-  else
-    if test "$netmap" = "yes" ; then
-      feature_not_found "netmap"
-    fi
-    netmap=no
-  fi
-fi
-
 ##########################################
 # plugin linker support probe
 
@@ -4175,9 +4146,6 @@ if test "$slirp_smbd" = "yes" ; then
   echo "CONFIG_SLIRP_SMBD=y" >> $config_host_mak
   echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
 fi
-if test "$netmap" = "yes" ; then
-  echo "CONFIG_NETMAP=y" >> $config_host_mak
-fi
 if test "$l2tpv3" = "yes" ; then
   echo "CONFIG_L2TPV3=y" >> $config_host_mak
 fi
@@ -4724,7 +4692,7 @@ if test "$skip_meson" = no; then
         -Dalsa=$alsa -Dcoreaudio=$coreaudio -Ddsound=$dsound -Djack=$jack -Doss=$oss \
         -Dpa=$pa -Daudio_drv_list=$audio_drv_list -Dtcg_interpreter=$tcg_interpreter \
         -Dtrace_backends=$trace_backends -Dtrace_file=$trace_file -Dlinux_aio=$linux_aio \
-        -Dvde=$vde \
+        -Dnetmap=$netmap -Dvde=$vde \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/meson.build b/meson.build
index 0e948a8024..40563e3c24 100644
--- a/meson.build
+++ b/meson.build
@@ -1656,6 +1656,23 @@ config_host_data.set('HAVE_MLOCKALL', cc.links(gnu_source_prefix + '''
     return mlockall(MCL_FUTURE);
   }'''))
 
+have_netmap = false
+if not get_option('netmap').disabled() and have_system
+  have_netmap = cc.compiles('''
+    #include <inttypes.h>
+    #include <net/if.h>
+    #include <net/netmap.h>
+    #include <net/netmap_user.h>
+    #if (NETMAP_API < 11) || (NETMAP_API > 15)
+    #error
+    #endif
+    int main(void) { return 0; }''')
+  if not have_netmap and get_option('netmap').enabled()
+    error('Netmap headers not available')
+  endif
+endif
+config_host_data.set('CONFIG_NETMAP', have_netmap)
+
 # Work around a system header bug with some kernel/XFS header
 # versions where they both try to define 'struct fsxattr':
 # xfs headers will not try to redefine structs from linux headers
@@ -3311,7 +3328,7 @@ endif
 summary_info += {'JACK support':      jack}
 summary_info += {'brlapi support':    brlapi}
 summary_info += {'vde support':       vde}
-summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
+summary_info += {'netmap support':    have_netmap}
 summary_info += {'Linux AIO support': libaio}
 summary_info += {'Linux io_uring support': linux_io_uring}
 summary_info += {'ATTR/XATTR support': libattr}
diff --git a/meson_options.txt b/meson_options.txt
index 7d0fa1c7f4..d8e67ae481 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -129,6 +129,8 @@ option('u2f', type : 'feature', value : 'auto',
        description: 'U2F emulation support')
 option('usb_redir', type : 'feature', value : 'auto',
        description: 'libusbredir support')
+option('netmap', type : 'feature', value : 'auto',
+       description: 'netmap network backend support')
 option('vde', type : 'feature', value : 'auto',
        description: 'vde network backend support')
 option('virglrenderer', type : 'feature', value : 'auto',
diff --git a/net/meson.build b/net/meson.build
index 491144a697..94383e7460 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -21,7 +21,9 @@ softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
 softmmu_ss.add(when: 'CONFIG_L2TPV3', if_true: files('l2tpv3.c'))
 softmmu_ss.add(when: slirp, if_true: files('slirp.c'))
 softmmu_ss.add(when: vde, if_true: files('vde.c'))
-softmmu_ss.add(when: 'CONFIG_NETMAP', if_true: files('netmap.c'))
+if have_netmap
+  softmmu_ss.add(files('netmap.c'))
+endif
 vhost_user_ss = ss.source_set()
 vhost_user_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost-user.c'), if_false: files('vhost-user-stub.c'))
 softmmu_ss.add_all(when: 'CONFIG_VHOST_NET_USER', if_true: vhost_user_ss)
-- 
2.31.1



