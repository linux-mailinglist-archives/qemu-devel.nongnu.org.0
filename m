Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DF342A33C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:27:14 +0200 (CEST)
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFw9-0000RZ-C8
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFiZ-0000DB-TX
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:13 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFiX-0007Tb-Ju
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:11 -0400
Received: by mail-ed1-x535.google.com with SMTP id w19so19747747edd.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/aJ6eQGvd1rKLJWrUxtuPesaanj52usy+8dUhQT+jqs=;
 b=hV1R/ONwb+vfrqHL+5Uf1CQC6+goSw7CrwUdma5yFO+916FTo4skHomfDtuCOdRbci
 c5njoFZO0RhdNp3pBL8vwPNwqSz01oji7TaCH2s29hprcj730qGSDSI2AymxvXWiUPPy
 1Mt/4w9TjiQU+A5MGD3hwz1UtfL6ekWwkbBGZitNAL2WVmsIw81CZMda60LlIUVPjUK+
 b029Y3BkAwlIFmxOO+AtFAcShWKRCOj638cldh04hKJkQc0ojhX9GbDbAEHcYYwhmrwO
 Y0gqlRvRmJSXnh0W3pLP3AuO1biCn92QAzIUsUZ+bUEgrHqT/oGMqONZQBW5l37rKKvh
 GvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/aJ6eQGvd1rKLJWrUxtuPesaanj52usy+8dUhQT+jqs=;
 b=WVWbuqJ/iRtXbePl/Khjt6sQWCp0jJ0uuq//bz6GQtSZQNnBAMx+gkyXF8iWqjwU5B
 e4bAfZ/BaQdkiA4zEzdQ6Nd/WEfEMuczrVQP7kWaXxDCxX4GBrneeGGEAe8sQsOuJel2
 oy7tnHLq7UDyVupemjjGpOImvMDIIFv9BpIUQKIsVWyTDcC11f32WhGY01M80obpq0Pb
 kZVeM0vkE1/Q+4tWXadOxFMR5UjKo3iDMmeXX8YwIkfk+0ImNjvy7/U/D+lYaxN0QZ5x
 af/wcyzl6CEjlMm9UWUW/us3RCun2aREWfbbeAC7y5HmKoUkRIm+P00s5QlAkJrBWjwl
 O/iA==
X-Gm-Message-State: AOAM533wJJFGMy+MXtm4zXylivDKsBeeW1C5EQMCjOFtAfFpgs+Mngka
 m0l1sm8DNwepEzHAwKQaILz9naUpyHM=
X-Google-Smtp-Source: ABdhPJyR1vh+jhiReIXR7Pz4pTAvfFW44RWKoVj66bVvAYT/wo5Ii7XjpU4ChjCbL0W7KOpvNrbpqg==
X-Received: by 2002:a05:6402:1d52:: with SMTP id
 dz18mr39111725edb.49.1634037188375; 
 Tue, 12 Oct 2021 04:13:08 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/24] configure: add command line options for audio drivers
Date: Tue, 12 Oct 2021 13:12:43 +0200
Message-Id: <20211012111302.246627-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: marcandre.lureau@redhat.com, thuth@redhat.com,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handle the choice of audio drivers the same as all other dependencies.

Cc: Gerd Hoffman <kraxel@redhat.com>
Cc: Volker Rümelin <vr_qemu@t-online.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007130630.632028-6-pbonzini@redhat.com>
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



