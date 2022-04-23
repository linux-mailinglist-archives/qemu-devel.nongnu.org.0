Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BA850CA9F
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:30:16 +0200 (CEST)
Received: from localhost ([::1]:35174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFq3-00026Y-Ar
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFG5-0007W2-4O
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:53:05 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:42931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFG3-0005ED-9U
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:53:04 -0400
Received: by mail-ej1-x62d.google.com with SMTP id i27so21134972ejd.9
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=if4h28CU6zDu/VVdbHqYlAOIQutrEFzWQ1TQd/xf2e8=;
 b=qLLxfk0AC7cgO7ZmcKjrJIgWQcBUHHo+6hnJTfCkg/BCTTIPnNeso2buHgCi24Ikm8
 JOj6QU6AygqaTVFe6mIbdzLAazZbsXrmkt24LvygmZqD6Jk9Z8GWSdm7ukSQgRIOb3Lk
 SxUoHy6UH6JjB+M6PvsX2kBH6xikSaX9hr1PGwGnJIeaHmsFLpobzBQCtI0HuA0c0pWV
 SZ3024PEgqUG70ZtMWT9WRI/mnmcueWGfgFhSmK6ubzKCRXqkguFf419jGz9bOhujml3
 QhakyDP3Emav1/e1ymWbLMcw7lZNdpx5AW1XWOcswpqNd0SUcULs6zG6vXaBAzPH1GrA
 U5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=if4h28CU6zDu/VVdbHqYlAOIQutrEFzWQ1TQd/xf2e8=;
 b=rDpLslzYD6S8w6BPBQYsNfQs8AvpDOzvtEuAM/Qw0ZNH8V6npHFcMNMGQjHG8Op2xv
 ALK2KOlf2qodSCce+c2ZntUKPJUF4hJaMOswhbqRBUzXbrA9LNJDvkTwIwImPWWaPN8f
 b4hixuPWvvDBrewFVPVW7fo4wxce3NcpGjMPVP1i1FFF4BibjmN6wjywufmwU3NZ45Yu
 qMQ6nbLHiQvMxfOesEV0I7JkFgi9LOOrTm2aOD+LDvKR1RKwwlGzjna7cxPSL7wEm3lf
 kccMJsMoxa0VQR6ccSxjS3+Pv7Ge60FOLUzmhDIuiFFvn8YV0eGVpdLLjieMNdecRjq8
 v+Ig==
X-Gm-Message-State: AOAM533Y4SVSTbiVOTMBMXlI72pZR20koJwR+A0LIF8W3XQ/dVJcJOOl
 Z8Q164k83MgLcN05zVUe7lpue4Rw7q4k9g==
X-Google-Smtp-Source: ABdhPJzCYAj/1OFhFR594FTFF8RMgjV53qRRbkL91sV460XZ7p9FqFE1CxJQTM9NQMU5/BRwxikEWQ==
X-Received: by 2002:a17:906:52c7:b0:6ce:a880:50a3 with SMTP id
 w7-20020a17090652c700b006cea88050a3mr8159211ejn.437.1650718379555; 
 Sat, 23 Apr 2022 05:52:59 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 31/34] build: move vhost-user-fs configuration to Kconfig
Date: Sat, 23 Apr 2022 14:51:48 +0200
Message-Id: <20220423125151.27821-32-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost-user-fs is a device and it should be possible to enable/disable
it with --without-default-devices, not --without-default-features.
Compute its default value in Kconfig to obtain the more intuitive
behavior.

In this case the configure options were undocumented, too.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 12 ------------
 hw/virtio/Kconfig |  5 +++++
 meson.build       |  1 -
 3 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/configure b/configure
index ceef39a615..3389db6f3a 100755
--- a/configure
+++ b/configure
@@ -286,7 +286,6 @@ vhost_kernel="$default_feature"
 vhost_net="$default_feature"
 vhost_crypto="$default_feature"
 vhost_user="no"
-vhost_user_fs="$default_feature"
 vhost_vdpa="$default_feature"
 debug_tcg="no"
 sanitizers="no"
@@ -872,10 +871,6 @@ for opt do
   ;;
   --enable-vhost-crypto) vhost_crypto="yes"
   ;;
-  --disable-vhost-user-fs) vhost_user_fs="no"
-  ;;
-  --enable-vhost-user-fs) vhost_user_fs="yes"
-  ;;
   --disable-zlib-test)
   ;;
   --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
@@ -1536,10 +1531,6 @@ test "$vhost_crypto" = "" && vhost_crypto=$vhost_user
 if test "$vhost_crypto" = "yes" && test "$vhost_user" = "no"; then
   error_exit "--enable-vhost-crypto requires --enable-vhost-user"
 fi
-test "$vhost_user_fs" = "" && vhost_user_fs=$vhost_user
-if test "$vhost_user_fs" = "yes" && test "$vhost_user" = "no"; then
-  error_exit "--enable-vhost-user-fs requires --enable-vhost-user"
-fi
 
 # OR the vhost-kernel, vhost-vdpa and vhost-user values for simplicity
 if test "$vhost_net" = ""; then
@@ -2088,9 +2079,6 @@ fi
 if test "$vhost_vdpa" = "yes" ; then
   echo "CONFIG_VHOST_VDPA=y" >> $config_host_mak
 fi
-if test "$vhost_user_fs" = "yes" ; then
-  echo "CONFIG_VHOST_USER_FS=y" >> $config_host_mak
-fi
 
 # XXX: suppress that
 if [ "$bsd" = "yes" ] ; then
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index b642ae1081..f8e235f814 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -78,3 +78,8 @@ config VHOST_USER_RNG
     bool
     default y
     depends on VIRTIO && VHOST_USER
+
+config VHOST_USER_FS
+    bool
+    default y
+    depends on VIRTIO && VHOST_USER
diff --git a/meson.build b/meson.build
index ac1a8fd4e7..85059154e4 100644
--- a/meson.build
+++ b/meson.build
@@ -3690,7 +3690,6 @@ summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
 summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
 summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
 summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
-summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
 summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
 summary_info += {'build guest agent': have_ga}
 summary(summary_info, bool_yn: true, section: 'Configurable features')
-- 
2.35.1



