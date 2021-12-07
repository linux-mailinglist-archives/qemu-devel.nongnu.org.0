Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C7046B8BD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:22:02 +0100 (CET)
Received: from localhost ([::1]:42704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXbl-0004GS-Lw
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:22:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muXYj-0001ek-3D
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:18:53 -0500
Received: from [2a00:1450:4864:20::12a] (port=40546
 helo=mail-lf1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muXYh-0007Cn-Li
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:18:52 -0500
Received: by mail-lf1-x12a.google.com with SMTP id l22so32389754lfg.7
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 02:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jzagFbFv8aWqFMmnjN+mFUbWJgK6HuzCVGpplDCxWYQ=;
 b=ne4dK4pSqKchod/fAgvZQXc6zmed6rU6y9D/VcZSA7Z4bW4YfyYsP+5GzmK2hiNWTt
 wn7GByaVPBGzcwJ2NNOJkf1nqOWy8Bv44ox6dNhgpxlIHIb+kIPxxLxMCHWNF52zXcGP
 jg8X3M0dHnAlqW3e5fFzz10W6TOlzy78bc60gIkRihXCjVPAcfQ3tX2e7/h3bEKIZPj1
 dku+nrZ7vz1E1IthJy/EMCpJNiBNA37Re+ud1IueJz743SKiG+A6yk6tdkSeVNEXBxJM
 3Q9PNtVG8DmPZbFmVsibRpB3WOYqbz4L98YHirB7eMlg1nsOAg/9ZVdmuF13GcgPHqT/
 WfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jzagFbFv8aWqFMmnjN+mFUbWJgK6HuzCVGpplDCxWYQ=;
 b=kXj7FpuC0OfAJUpH18AHv2n2p/3P3a6PBugXywYSNKPOSxxkKLOy+puwfVD97i6b0H
 2X9eGsjNRSy8iUmNuangdv4zKaHwIGOonU3gLwsMXBfdXXYIlD6pSvIUvS9kxEXV/R8C
 Ba4NsU3Anrm/Zq2HMJKze/yAxXubpfJmXJFpZ0LXSVJk520FeeczvVmS0eqV5dEUyK9F
 ge8xyyRb1is50tqCqB3rY4HxfttlAGIgla9vPSUjRnzU73DDi7z6hxc/eLYSvuMHb2qq
 9305uk6XNxA9ovDJwheSzcf/YIONf1h0V1OliDhvidnST62NjUOvYYoHQAe9LyxgFvwc
 w7lQ==
X-Gm-Message-State: AOAM530zQa536foPBCmH8V3mUoIkOyfh+bky09gPlVxkK7j99omRVsfy
 /xMzq/qxe8ksgfruGpLZbDBW78anH0S3ew==
X-Google-Smtp-Source: ABdhPJz2sYzaA1+o3Mvl/L7KOby12+592i3O+x+sENwNuXAMdxOSb2fd8Bm6kRFSufSRtgGjKBPeeA==
X-Received: by 2002:ac2:5d46:: with SMTP id w6mr38041539lfd.15.1638872329731; 
 Tue, 07 Dec 2021 02:18:49 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id w10sm1629022lfn.308.2021.12.07.02.18.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 02:18:49 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 1/7] net/vmnet: add vmnet dependency and customizable option
Date: Tue,  7 Dec 2021 13:18:22 +0300
Message-Id: <20211207101828.22033-2-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211207101828.22033-1-yaroshchuk2000@gmail.com>
References: <20211207101828.22033-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, r.bolshakov@yadro.com,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 meson.build                   | 4 ++++
 meson_options.txt             | 2 ++
 scripts/meson-buildoptions.sh | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/meson.build b/meson.build
index 96de1a6ef9..ce8acf6ada 100644
--- a/meson.build
+++ b/meson.build
@@ -481,6 +481,8 @@ if cocoa.found() and get_option('gtk').enabled()
   error('Cocoa and GTK+ cannot be enabled at the same time')
 endif
 
+vmnet = dependency('appleframeworks', modules: 'vmnet', required: get_option('vmnet'))
+
 seccomp = not_found
 if not get_option('seccomp').auto() or have_system or have_tools
   seccomp = dependency('libseccomp', version: '>=2.3.0',
@@ -1461,6 +1463,7 @@ config_host_data.set('CONFIG_SECCOMP', seccomp.found())
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
+config_host_data.set('CONFIG_VMNET', vmnet.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
@@ -3397,6 +3400,7 @@ endif
 summary_info += {'JACK support':      jack}
 summary_info += {'brlapi support':    brlapi}
 summary_info += {'vde support':       vde}
+summary_info += {'vmnet.framework support': vmnet}
 summary_info += {'netmap support':    have_netmap}
 summary_info += {'l2tpv3 support':    have_l2tpv3}
 summary_info += {'Linux AIO support': libaio}
diff --git a/meson_options.txt b/meson_options.txt
index e392323732..0538d48a85 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -147,6 +147,8 @@ option('netmap', type : 'feature', value : 'auto',
        description: 'netmap network backend support')
 option('vde', type : 'feature', value : 'auto',
        description: 'vde network backend support')
+option('vmnet', type : 'feature', value : 'auto',
+       description: 'vmnet.framework network backend support')
 option('virglrenderer', type : 'feature', value : 'auto',
        description: 'virgl rendering support')
 option('vnc', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 7a17ff4218..13da30f018 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -82,6 +82,7 @@ meson_options_help() {
   printf "%s\n" '  u2f             U2F emulation support'
   printf "%s\n" '  usb-redir       libusbredir support'
   printf "%s\n" '  vde             vde network backend support'
+  printf "%s\n" '  vmnet           vmnet.framework network backend support'
   printf "%s\n" '  vhost-user-blk-server'
   printf "%s\n" '                  build vhost-user-blk server'
   printf "%s\n" '  virglrenderer   virgl rendering support'
@@ -242,6 +243,8 @@ _meson_option_parse() {
     --disable-usb-redir) printf "%s" -Dusb_redir=disabled ;;
     --enable-vde) printf "%s" -Dvde=enabled ;;
     --disable-vde) printf "%s" -Dvde=disabled ;;
+    --enable-vmnet) printf "%s" -Dvmnet=enabled ;;
+    --disable-vmnet) printf "%s" -Dvmnet=disabled ;;
     --enable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=enabled ;;
     --disable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=disabled ;;
     --enable-virglrenderer) printf "%s" -Dvirglrenderer=enabled ;;
-- 
2.23.0


