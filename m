Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD4443E8C8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 21:07:26 +0200 (CEST)
Received: from localhost ([::1]:46664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgAkH-0002yE-Kz
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 15:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mgAcl-0003NY-KR
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 14:59:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mgAca-0008Cv-9s
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 14:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635447564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yhi8L4C4GnMYKVMPV4uZwu5G4WEZ36IdMhnOK6XKYI=;
 b=UmJuwj5phDpI71DPEFuIo9chmWHX2FNnZb8SJHVDhTkKJ3q5vnh7ka8WGjnO2MN3VMX61M
 FbJxBo6srEsoFuBBjlghPyee5nsZZGbmdmqg+E/BE46vxLyvyOU1IIpmY1T66saaCK8URv
 dlRh8bCgrsdAqwOW9QgCvExy9pKjtCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-OV6OIQR3Py28SyEU2N53tg-1; Thu, 28 Oct 2021 14:59:23 -0400
X-MC-Unique: OV6OIQR3Py28SyEU2N53tg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49446112C14B
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 18:59:22 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81F815BAF0;
 Thu, 28 Oct 2021 18:59:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/4] Move the l2tpv3 test from configure to meson.build
Date: Thu, 28 Oct 2021 20:59:08 +0200
Message-Id: <20211028185910.1729744-3-thuth@redhat.com>
In-Reply-To: <20211028185910.1729744-1-thuth@redhat.com>
References: <20211028185910.1729744-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

And while we're at it, also provide a proper entry for this feature
in meson_options.txt, so that people who don't need it have a knob
to disable this feature.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure                     | 17 -----------------
 meson.build                   |  8 ++++++++
 meson_options.txt             |  2 ++
 net/meson.build               |  4 +++-
 scripts/meson-buildoptions.sh |  3 +++
 5 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/configure b/configure
index 8fe03b6230..170b1b237a 100755
--- a/configure
+++ b/configure
@@ -1907,20 +1907,6 @@ if test -z "$want_tools"; then
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
 
@@ -3544,9 +3530,6 @@ if test "$slirp_smbd" = "yes" ; then
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
index 2c5b53cbe2..5bb6b901b0 100644
--- a/meson.build
+++ b/meson.build
@@ -1678,6 +1678,13 @@ config_host_data.set('HAVE_MLOCKALL', cc.links(gnu_source_prefix + '''
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
@@ -3394,6 +3401,7 @@ summary_info += {'JACK support':      jack}
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
2.27.0


