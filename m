Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D90B42A39E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:49:36 +0200 (CEST)
Received: from localhost ([::1]:46570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGHn-0004kj-5I
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFij-0000lT-02
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:21 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:37692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFih-0007ZD-6B
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:20 -0400
Received: by mail-ed1-x534.google.com with SMTP id y12so66814303eda.4
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=egO8CcBP38r8vMR00kJzKnE8qCDEvtuqwYl8X7EjwHM=;
 b=GTYdQR6oD7lLmyUo0HkNtVp9RE/24gQ4y+U+iGs6FhVxmq07WpwNCSTvAKUaae09Ck
 eJ0COvnd6qtUXw2Z3fbmqZ9VkV0q34bs0RscvTQyayf/PXqE4oQ0QgmJW+NJOfxW4WNg
 pWVjq+X7fzL3zeevddz4gGHOhNriMT+PZSb48tqzqAHoLed5aIh7vhDaujzwiEP5/NPs
 6KLwy//a5FrPdfxU8em2sr36bLm+xWVACQQda9BkeGDdQinHMziEa11GO+do93rhzIoy
 ydR4oiBrUUwm5MzWSlkTVqjLGei33J+MgCrcdPwbsa5osd9NeTPxd0hz6On3/CbLj9Yt
 SyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=egO8CcBP38r8vMR00kJzKnE8qCDEvtuqwYl8X7EjwHM=;
 b=Soog2QdlKcAl1eGrak9ynCyyAq53pUm8aPG1XJ5K8cR2PpXskNL4bg9nsW2lxQiOxO
 9V5Ogc2Wlg2a1FcV3eEEYI3D6jp8J3/SxwNM2IiAk+U7mGdqsLydE2sDqoTP0xO2UIDc
 wa+SHoJuFRtZN8q8vB/WUl0DYsYbaveHeT9YtlmEjh2RAVB2/WeM1BW/DX4r7fYGZJoi
 /lS6fzbvTB0a7mq7myv7XUT20xkqK2xGRv6DfuNoZiWLIzoJCvJ/qZDSIgkW7vvynFv8
 Bp0y3nCSrWpNJVlYsLF9qQ/dHYxSjamvq2Oe7xwJa3KNaeENFAQqmf3f7kv+mYbw0wOW
 kXug==
X-Gm-Message-State: AOAM533I2X534ruRCejqx4ONxkZ107Xv40fo5uaEMYGFLDl6++Q25YYA
 vurKrmjVaMn4ZU6kpFhNWtncw0sFCMc=
X-Google-Smtp-Source: ABdhPJzEtwoEYhLhyiUJQsOEp+o8VrfXG1diBJKSZ6D2N5uaWTat9zv1aq/toSBut/+wiLc92HTSlQ==
X-Received: by 2002:a50:d9c5:: with SMTP id x5mr50171050edj.37.1634037197890; 
 Tue, 12 Oct 2021 04:13:17 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/24] configure, meson: move netmap detection to meson
Date: Tue, 12 Oct 2021 13:12:55 +0200
Message-Id: <20211012111302.246627-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20211007130829.632254-12-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 40 ++++------------------------------------
 meson.build       | 19 ++++++++++++++++++-
 meson_options.txt |  2 ++
 net/meson.build   |  4 +++-
 4 files changed, 27 insertions(+), 38 deletions(-)

diff --git a/configure b/configure
index a2b1d54be8..bb3bb3e58f 100755
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
@@ -2901,34 +2900,6 @@ EOF
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
 
@@ -4173,9 +4144,6 @@ if test "$slirp_smbd" = "yes" ; then
   echo "CONFIG_SLIRP_SMBD=y" >> $config_host_mak
   echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
 fi
-if test "$netmap" = "yes" ; then
-  echo "CONFIG_NETMAP=y" >> $config_host_mak
-fi
 if test "$l2tpv3" = "yes" ; then
   echo "CONFIG_L2TPV3=y" >> $config_host_mak
 fi
@@ -4722,7 +4690,7 @@ if test "$skip_meson" = no; then
         -Dalsa=$alsa -Dcoreaudio=$coreaudio -Ddsound=$dsound -Djack=$jack -Doss=$oss \
         -Dpa=$pa -Daudio_drv_list=$audio_drv_list -Dtcg_interpreter=$tcg_interpreter \
         -Dtrace_backends=$trace_backends -Dtrace_file=$trace_file -Dlinux_aio=$linux_aio \
-        -Dvde=$vde \
+        -Dnetmap=$netmap -Dvde=$vde \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/meson.build b/meson.build
index e98efd3480..68bf65a923 100644
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
@@ -3313,7 +3330,7 @@ endif
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



