Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCC04444AA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:31:39 +0100 (CET)
Received: from localhost ([::1]:34978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIEk-0006fo-8H
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHpS-0003dx-DR
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:32 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHpF-0000yh-Vq
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:27 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r8so4035966wra.7
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=88Swk4/lwxEnEiIlWts7AFtGpk1Nrna2L0JS843r/WE=;
 b=i/V1bdyv/OOcMcPcYj3w7fAt59nWOBV1nkp8DzQKOjl0EXSLhIRTsLe9WCZwRNOqqj
 FISF67MZbb3ta73KynOnSTsorJkwsdWPle017eF3ZggEF5gv8w2TlUSH9PSX8zL2ui2e
 YmdVMPZlXVaYYKi9yUt2L/TLM2uQ6jV7TwF00icL2y17KTeu7eGmBbPRkxuyWxF9blEs
 0525PV3wchTgD49X053XMrGV2uJV1ikcZSTn1MJWJbnUN4B7Wd85499YwthjW8npULja
 mJq/NEYr/NEmJucIPUxOgZUBqUNUk1LYk2lwyksp/JpWy/7+mR0grlP3mTrzgM8YoOSb
 1xzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=88Swk4/lwxEnEiIlWts7AFtGpk1Nrna2L0JS843r/WE=;
 b=QbgSFgyZy79SKiqcIRA5UfI0C3nr38wyQaeBssoxBtD01VMfjkynt23DiPm9N0kHV4
 OF2pz3DEYDrlsrKVxkKLDPg/yRneffmtP71P+MRYFJqUo71a+mpXwA4XFdfHohT3awn8
 0q+mMrkP5ebMHt2x9+2DMniBztQs8gaDHx/CIiryr8PoE/29+BE291w8HwOXnEBT2/ow
 Q67V2DRKRgo+sEuOtxmuCtFmdHWBTP5w9317ByerZeJL8FMI4JCtyv1DXPN/jmC6VKaZ
 QqfXv33EfAfj9SUoLuI9XWDD33H3W+YmwXanCJ+qIwYKfa+DQqfZmQcxBkGG94Zay1af
 l5nA==
X-Gm-Message-State: AOAM533WQp/Qlmc7nR1vnr7EVgeJwVZMFlIU77WXExRnAulOt+1mGf+k
 nUYOsdhZXnA+1DeHq3vVJElgW6qpnMU=
X-Google-Smtp-Source: ABdhPJx7kZgPNbP5mNhOWhOsFJObMD1HTTy6w7EBNgbh45AbsrRTRREEFOLEjxbxtAyyAl9eh1XNyQ==
X-Received: by 2002:a05:6000:12c5:: with SMTP id
 l5mr40809770wrx.173.1635951912079; 
 Wed, 03 Nov 2021 08:05:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:05:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/27] Move the l2tpv3 test from configure to meson.build
Date: Wed,  3 Nov 2021 16:04:40 +0100
Message-Id: <20211103150442.387121-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

And while we're at it, also provide a proper entry for this feature
in meson_options.txt, so that people who don't need it have a knob
to disable this feature.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211028185910.1729744-3-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 17 -----------------
 meson.build                   |  8 ++++++++
 meson_options.txt             |  2 ++
 net/meson.build               |  4 +++-
 scripts/meson-buildoptions.sh |  3 +++
 5 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/configure b/configure
index 73af9a7b30..2268e5d0ab 100755
--- a/configure
+++ b/configure
@@ -1896,20 +1896,6 @@ if test -z "$want_tools"; then
     fi
 fi
 
-##########################################
-# L2TPV3 probe
-
-cat > $TMPC <<EOF
-#include <sys/socket.h>
-#include <linux/ip.h>
-int main(void) { return sizeof(struct mmsghdr); }
-EOF
-if compile_prog "" "" ; then
-  l2tpv3=yes
-else
-  l2tpv3=no
-fi
-
 #########################################
 # vhost interdependencies and host support
 
@@ -3514,9 +3500,6 @@ if test "$slirp_smbd" = "yes" ; then
   echo "CONFIG_SLIRP_SMBD=y" >> $config_host_mak
   echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
 fi
-if test "$l2tpv3" = "yes" ; then
-  echo "CONFIG_L2TPV3=y" >> $config_host_mak
-fi
 if test "$gprof" = "yes" ; then
   echo "CONFIG_GPROF=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 30b06b12b4..e330438270 100644
--- a/meson.build
+++ b/meson.build
@@ -1658,6 +1658,13 @@ config_host_data.set('HAVE_MLOCKALL', cc.links(gnu_source_prefix + '''
     return mlockall(MCL_FUTURE);
   }'''))
 
+have_l2tpv3 = false
+if not get_option('l2tpv3').disabled() and have_system
+  have_l2tpv3 = (cc.has_header_symbol('sys/socket.h', 'struct mmsghdr')
+                 and cc.has_header('linux/ip.h'))
+endif
+config_host_data.set('CONFIG_L2TPV3', have_l2tpv3)
+
 have_netmap = false
 if not get_option('netmap').disabled() and have_system
   have_netmap = cc.compiles('''
@@ -3377,6 +3384,7 @@ summary_info += {'JACK support':      jack}
 summary_info += {'brlapi support':    brlapi}
 summary_info += {'vde support':       vde}
 summary_info += {'netmap support':    have_netmap}
+summary_info += {'l2tpv3 support':    have_l2tpv3}
 summary_info += {'Linux AIO support': libaio}
 summary_info += {'Linux io_uring support': linux_io_uring}
 summary_info += {'ATTR/XATTR support': libattr}
diff --git a/meson_options.txt b/meson_options.txt
index 4ab4570125..e740dce2a5 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -141,6 +141,8 @@ option('u2f', type : 'feature', value : 'auto',
        description: 'U2F emulation support')
 option('usb_redir', type : 'feature', value : 'auto',
        description: 'libusbredir support')
+option('l2tpv3', type : 'feature', value : 'auto',
+       description: 'l2tpv3 network backend support')
 option('netmap', type : 'feature', value : 'auto',
        description: 'netmap network backend support')
 option('vde', type : 'feature', value : 'auto',
diff --git a/net/meson.build b/net/meson.build
index 94383e7460..847bc2ac85 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -18,7 +18,9 @@ softmmu_ss.add(files(
 
 softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
 
-softmmu_ss.add(when: 'CONFIG_L2TPV3', if_true: files('l2tpv3.c'))
+if have_l2tpv3
+  softmmu_ss.add(files('l2tpv3.c'))
+endif
 softmmu_ss.add(when: slirp, if_true: files('slirp.c'))
 softmmu_ss.add(when: vde, if_true: files('vde.c'))
 if have_netmap
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index c795a13020..55b8a78560 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -49,6 +49,7 @@ meson_options_help() {
   printf "%s\n" '  iconv           Font glyph conversion support'
   printf "%s\n" '  jack            JACK sound support'
   printf "%s\n" '  kvm             KVM acceleration support'
+  printf "%s\n" '  l2tpv3          l2tpv3 network backend support'
   printf "%s\n" '  libdaxctl       libdaxctl support'
   printf "%s\n" '  libiscsi        libiscsi userspace initiator'
   printf "%s\n" '  libnfs          libnfs block device driver'
@@ -166,6 +167,8 @@ _meson_option_parse() {
     --disable-jack) printf "%s" -Djack=disabled ;;
     --enable-kvm) printf "%s" -Dkvm=enabled ;;
     --disable-kvm) printf "%s" -Dkvm=disabled ;;
+    --enable-l2tpv3) printf "%s" -Dl2tpv3=enabled ;;
+    --disable-l2tpv3) printf "%s" -Dl2tpv3=disabled ;;
     --enable-libdaxctl) printf "%s" -Dlibdaxctl=enabled ;;
     --disable-libdaxctl) printf "%s" -Dlibdaxctl=disabled ;;
     --enable-libiscsi) printf "%s" -Dlibiscsi=enabled ;;
-- 
2.31.1



