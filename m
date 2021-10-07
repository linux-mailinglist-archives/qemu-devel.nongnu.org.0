Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF164253D9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:14:30 +0200 (CEST)
Received: from localhost ([::1]:42094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTED-0006aw-Gf
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT6h-0002Ao-IX
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:06:43 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:41854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT6f-0007M7-Kv
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:06:43 -0400
Received: by mail-ed1-x531.google.com with SMTP id a25so7219408edx.8
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x6Ie3yL7NYkxjE0ns/nXhQ+jNDpQbZB2Hilw1SZ8aW0=;
 b=cwsUta+ApoC5achuUBwIPwNumJOTBUv7k+LRv63hKZns0uPcNFj4jKcdtEqk/uE+c6
 avkE0J8cHsRA0hxMWeI8wECQSVL/w/Gv2FSMAsnZLDZoo+lV73cpho0A5L9IAK6zruur
 TLNfYHsa/Cze+7pMwolDCfFVWyTTc0W2c2ODFn9Van9Prxww+BKczYvqHiopY/jPmFhL
 vHokDYoNmotbSUwPjVx61MMBoMhFXe/EoifSnsiq8rxUTGGQcwR50iUtf4fINfiDfPHQ
 kJEgc1elvpoZZhOcwo8rnmvdT30nzvfTiKYmQAXMGeoVvucs72CwZWTB2HGKWGmRBkMI
 qrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x6Ie3yL7NYkxjE0ns/nXhQ+jNDpQbZB2Hilw1SZ8aW0=;
 b=cwl5XhO+nffirvvk7zDukEJsguT+rkEmf0Xy5x3K/GNrRLLvNabL6uVu2CmuupZc4Z
 SDNMmN3ISitDzob2aqm0PyKcv4hUH+6pgFIlUpEouiVK73U/KotbWCIQVqDCqqhjCmJF
 tmeNqYbvRxtZ4atmnqeLxu6d1colvHlMi7ehdC26uulwnWBtXIQSps3XuskobsuEPs6v
 LD4DwLL4ZRyUcg6hhItPSfHmovyZaeNXPwaos+UjC4WhNyILgIYIqEBEVSoKLFIHqiTF
 gLKfH5/i6K+BjAZF3oOMtPj/Ft7CDKyJSThhWmC4i4oT9IZU+yx+N/EeDNaMoJ6P+VJR
 CllQ==
X-Gm-Message-State: AOAM531QZ3ZQbkLXREaUryutS8UVmUMDpiuUjr1Q91vdEQVqBYVZXVZO
 LLYvP8oYH93P3v8bxUIuiPug/fKm4Eg=
X-Google-Smtp-Source: ABdhPJyzTbfzdCul7PdFh42F0ZZNqeqlpFyk7WThJspWgy9Dq1QRtoQW9fysIHjbfEIFTnFkPygOVQ==
X-Received: by 2002:a17:906:5051:: with SMTP id
 e17mr5455377ejk.481.1633611998164; 
 Thu, 07 Oct 2021 06:06:38 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ca4sm10167543ejb.1.2021.10.07.06.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:06:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/24] configure: add command line options for audio drivers
Date: Thu,  7 Oct 2021 15:06:11 +0200
Message-Id: <20211007130630.632028-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handle the choice of audio drivers the same as all other dependencies.

Cc: Gerd Hoffman <kraxel@redhat.com>
Cc: Volker Rümelin <vr_qemu@t-online.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index fcadcf9577..5541671b58 100755
--- a/configure
+++ b/configure
@@ -310,6 +310,12 @@ vnc_sasl="auto"
 vnc_jpeg="auto"
 vnc_png="auto"
 xkbcommon="auto"
+alsa="auto"
+coreaudio="auto"
+dsound="auto"
+jack="auto"
+oss="auto"
+pa="auto"
 xen=${default_feature:+disabled}
 xen_ctrl_version="$default_feature"
 xen_pci_passthrough="auto"
@@ -1051,6 +1057,30 @@ for opt do
   ;;
   --enable-xen-pci-passthrough) xen_pci_passthrough="enabled"
   ;;
+  --disable-alsa) alsa="disabled"
+  ;;
+  --enable-alsa) alsa="enabled"
+  ;;
+  --disable-coreaudio) coreaudio="disabled"
+  ;;
+  --enable-coreaudio) coreaudio="enabled"
+  ;;
+  --disable-dsound) dsound="disabled"
+  ;;
+  --enable-dsound) dsound="enabled"
+  ;;
+  --disable-jack) jack="disabled"
+  ;;
+  --enable-jack) jack="enabled"
+  ;;
+  --disable-oss) oss="disabled"
+  ;;
+  --enable-oss) oss="enabled"
+  ;;
+  --disable-pa) pa="disabled"
+  ;;
+  --enable-pa) pa="enabled"
+  ;;
   --disable-brlapi) brlapi="disabled"
   ;;
   --enable-brlapi) brlapi="enabled"
@@ -1849,6 +1879,12 @@ disabled with --disable-FEATURE, default is enabled if available
   mpath           Multipath persistent reservation passthrough
   xen             xen backend driver support
   xen-pci-passthrough    PCI passthrough support for Xen
+  alsa            ALSA sound support
+  coreaudio       CoreAudio sound support
+  dsound          DirectSound sound support
+  jack            JACK sound support
+  oss             OSS sound support
+  pa              PulseAudio sound support
   brlapi          BrlAPI (Braile)
   curl            curl connectivity
   membarrier      membarrier system call (for Linux 4.14+ or Windows)
@@ -5015,7 +5051,8 @@ if test "$skip_meson" = no; then
         -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi -Dbpf=$bpf\
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
-        -Daudio_drv_list=$audio_drv_list -Dtcg_interpreter=$tcg_interpreter \
+        -Dalsa=$alsa -Dcoreaudio=$coreaudio -Ddsound=$dsound -Djack=$jack -Doss=$oss \
+        -Dpa=$pa -Daudio_drv_list=$audio_drv_list -Dtcg_interpreter=$tcg_interpreter \
         $cross_arg \
         "$PWD" "$source_path"
 
-- 
2.31.1



