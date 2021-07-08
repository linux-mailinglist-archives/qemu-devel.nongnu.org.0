Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B106D3C16A6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:52:49 +0200 (CEST)
Received: from localhost ([::1]:43006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WKW-0003h3-OK
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1VnH-0001Ed-8P
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:27 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:40889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1VnF-0008Mf-F0
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:27 -0400
Received: by mail-ej1-x630.google.com with SMTP id o5so10283122ejy.7
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9xNY7jsPAk0cQr26gLtvkhbqtz1+/luMtYD5+m8UI0k=;
 b=nVXcH1wGw/T9gUtf53Rp6prO8B/x5euHumYgn7+q6Ncva+YZylUvFcFSE3LCFUfMAX
 t0Sa0+ZvEdy+J8VDCEBtPC4cnLPeuMWLzPvYN8MTsMy6hQtOMkBwzap+ilCkyIAOlI3i
 SgFa5KLsZ0K0u1WGhuvtcPlXGRy3cshhRyfc0ay4JjJZtOU7poo2noVRaZhE/5zu1KPB
 UbtHnXmLQ4tOk54N8qE9m2fZW5+Kfu53n2I+24DlExYGxs+60EKBFmIEyacYwWmSEWGg
 8l7F9dPVQCWAM1/BponsiqmIu11XWiVtNXQkkq0frW/AkHwK5vQMHj8pEcLBJ3JHDBco
 TFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9xNY7jsPAk0cQr26gLtvkhbqtz1+/luMtYD5+m8UI0k=;
 b=ToOW5au/B2f5PWphuAehO8ESwdZde1xh4d6GlF9dRdnlrtV6aF8SlNOO9yxnUHd9JC
 UFJE9d3hF9yLeO5KlFpVxzFRY8GCOmAGl0LqkqKN8/o23AxCAgcSJjyDjmxaQ+ZhkHzt
 6l2fqraCBWtZzmSA43Jl0PZTFXPuBq7jGL/nrENFYeVle5qXlpiW97SMwKzm9aLsJBuW
 GBAm6rxlUTkXEe6wEOgyBQKrXWPtaMj3FW3gdCLRiorE5p/YzKm3txzlLlCVbwYrcXPi
 Fpdsip5+CczSl12ptb4wfGNnu9rqXtF91GSY8JqRA6BRKfeUMsa4u6CA0uMM+0nwW096
 2y9g==
X-Gm-Message-State: AOAM5324TNHvt20exb9+n0AQZNdRxDLHEHHb2e7onwX9cuBlmX/R8ztf
 XNCD54NGDVXD07zqkXY0nmYxlEhFZ+c=
X-Google-Smtp-Source: ABdhPJzBiouQ00KczBkNyX5GlXYf6F3w2vlx+qqBbJNwo5fTJAjugPBUHkMzzsxxp0dWtQZoUO9VjA==
X-Received: by 2002:a17:906:30d8:: with SMTP id
 b24mr9897282ejb.358.1625757503721; 
 Thu, 08 Jul 2021 08:18:23 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 48/48] configure: allow the selection of alternate config in
 the build
Date: Thu,  8 Jul 2021 17:17:48 +0200
Message-Id: <20210708151748.408754-49-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

While the default config works well enough it does end up enabling a
lot of stuff. For more minimal builds we can select a different list
of devices and let Kconfig work out what we want. For example:

  ../../configure --without-default-features \
    --target-list=arm-softmmu,aarch64-softmmu \
    --with-devices-aarch64=minimal

will override the aarch64-softmmu default set of devices with a more
minimal set of devices that just enables the virt and sbsa-ref models.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210707131744.26027-6-alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configs/devices/aarch64-softmmu/minimal.mak |  9 ++++++++
 configure                                   | 24 ++++++++++++++++++++-
 meson.build                                 |  3 ++-
 3 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 configs/devices/aarch64-softmmu/minimal.mak

diff --git a/configs/devices/aarch64-softmmu/minimal.mak b/configs/devices/aarch64-softmmu/minimal.mak
new file mode 100644
index 0000000000..0ebc1dca56
--- /dev/null
+++ b/configs/devices/aarch64-softmmu/minimal.mak
@@ -0,0 +1,9 @@
+#
+# A minimal version of the config that only supports only a few
+# virtual machines. This avoids bringing in any of numerous legacy
+# features from the 32bit platform (although virt still supports 32bit
+# itself)
+#
+
+CONFIG_ARM_VIRT=y
+CONFIG_SBSA_REF=y
diff --git a/configure b/configure
index 4eba89f823..85db248ac1 100755
--- a/configure
+++ b/configure
@@ -915,6 +915,18 @@ for opt do
   ;;
   --without-default-devices) default_devices="false"
   ;;
+  --with-devices-*[!a-zA-Z0-9_-]*=*) error_exit "Passed bad --with-devices-FOO option"
+  ;;
+  --with-devices-*) device_arch=${opt#--with-devices-};
+                    device_arch=${device_arch%%=*}
+                    cf=$source_path/configs/devices/$device_arch-softmmu/$optarg.mak
+                    if test -f "$cf"; then
+                        device_archs="$device_archs $device_arch"
+                        eval "devices_${device_arch}=\$optarg"
+                    else
+                        error_exit "File $cf does not exist"
+                    fi
+  ;;
   --without-default-features) # processed above
   ;;
   --enable-gprof) gprof="yes"
@@ -1764,7 +1776,8 @@ Advanced options (experts only):
   --without-default-features default all --enable-* options to "disabled"
   --without-default-devices  do not include any device that is not needed to
                            start the emulator (only use if you are including
-                           desired devices in default-configs/devices/)
+                           desired devices in configs/devices/)
+  --with-devices-ARCH=NAME override default configs/devices
   --enable-debug           enable common debug build options
   --enable-sanitizers      enable default sanitizers
   --enable-tsan            enable thread sanitizer
@@ -5082,6 +5095,15 @@ if test "$skip_meson" = no; then
 
   echo "# Automatically generated by configure - do not modify" > $cross
   echo "[properties]" >> $cross
+
+  # unroll any custom device configs
+  if test -n "$device_archs"; then
+      for a in $device_archs; do
+          eval "c=\$devices_${a}"
+          echo "${a}-softmmu = '$c'" >> $cross
+      done
+  fi
+
   test -z "$cxx" && echo "link_language = 'c'" >> $cross
   echo "[built-in options]" >> $cross
   echo "c_args = [${CFLAGS:+$(meson_quote $CFLAGS)}]" >> $cross
diff --git a/meson.build b/meson.build
index 71c7462e89..651c3b114b 100644
--- a/meson.build
+++ b/meson.build
@@ -1595,9 +1595,10 @@ foreach target : target_dirs
                                                configuration: config_target_data)}
 
   if target.endswith('-softmmu')
+    config_input = meson.get_external_property(target, 'default')
     config_devices_mak = target + '-config-devices.mak'
     config_devices_mak = configure_file(
-      input: ['configs/devices' / target / 'default.mak', 'Kconfig'],
+      input: ['configs/devices' / target / config_input + '.mak', 'Kconfig'],
       output: config_devices_mak,
       depfile: config_devices_mak + '.d',
       capture: true,
-- 
2.31.1


