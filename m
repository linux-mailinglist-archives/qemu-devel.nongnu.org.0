Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E995E42DF42
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:36:45 +0200 (CEST)
Received: from localhost ([::1]:33124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3in-0003gL-0p
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c4-0003M9-Mb
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:48 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:41755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c3-0000YF-3x
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:48 -0400
Received: by mail-ed1-x52e.google.com with SMTP id a25so26569129edx.8
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mSnZL1jG9+y6XU4K3OU5eki1vBIFFfko4zZP+7xfuR8=;
 b=FwuDnnvdUzciizQdY3bTTvKrCyJACHtvivc4zS8MM+OntI1MtG8Dg2tdqxo2bFp/Bz
 GcyrQhcv+1/Rsy5YJCGHt4VMG6fxZsstj9lH+ZahasNU+Hp5EmIOy1PQKLcpzGnc2sHc
 HCU8gxQp0GCxIiYrSywkdY2FvsFxYzpP/BROmItD48F6g2rcLEoBQgfbRED7huLfx7+p
 1zfW+eTUEmzgOK1NxhWUCxZxq5v+bnTtdNBMdbUZ70gIdmCXk4lwSTCDAhssRRuXQRgL
 yDBfyBnM1i9/3QWn5Szf0JO9CmVLGSaUvFqqLtu4J1aiKDWvrJhD0WFOwOGM7AZZI4wo
 ltUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mSnZL1jG9+y6XU4K3OU5eki1vBIFFfko4zZP+7xfuR8=;
 b=V9Jaeo08YZSSgnFoRjv9VovY8iaW8V+Oc1GjzT+5+YDQ/CXbg/qFgQOzB1gg6Nd7Rr
 oan9XpXk6hi3Qx4Zg3TN+bCTDOCCPAq4z4yL5PFtumA0d3AKSKhGubTQyvn2jvb1nNj4
 9/jJ8BCqHihVg/IDIWEf+DmDjkSFB435qLC1RkbpwRfQnYDQvGNsC1086uOa3NmPZSWQ
 XCoXhCyWgXaym1zSe2u5HLo6DNpwAYpypYxkYRkB5mNTJIi1bwNYjfZggsSXStbbbJzN
 FQThED8bCjnl6uoCfJR4Ly/U1lJJ0ryiDg6GGtziLvl0C7Ny/rSc1g4cqAzFykUPOyUi
 gdEw==
X-Gm-Message-State: AOAM531uwCoMiAezzp0tMaXeK5WjwlvUY1TdKKBiwup5FR+xevTFVm9H
 /OqCoyvJWGvr2dRT4J1uFmc+5iP/8sI=
X-Google-Smtp-Source: ABdhPJwmrm6yNxWUcf+BeWMOIhF0ms98FLuNstkN3xJJBH1iR3VXXQk0iT2E8PdeO+Ahm8x4TSICVA==
X-Received: by 2002:a17:906:270e:: with SMTP id
 z14mr4991482ejc.414.1634228985791; 
 Thu, 14 Oct 2021 09:29:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:29:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/26] configure: add command line options for audio drivers
Date: Thu, 14 Oct 2021 18:29:17 +0200
Message-Id: <20211014162938.430211-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handle the choice of audio drivers the same as all other dependencies.

Cc: Gerd Hoffman <kraxel@redhat.com>
Cc: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007130630.632028-6-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index b9a457a02f..2dd9460d20 100755
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
@@ -1851,6 +1881,12 @@ disabled with --disable-FEATURE, default is enabled if available
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
@@ -5017,7 +5053,8 @@ if test "$skip_meson" = no; then
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



