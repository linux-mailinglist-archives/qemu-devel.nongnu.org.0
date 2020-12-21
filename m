Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845E02DFD4A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:13:02 +0100 (CET)
Received: from localhost ([::1]:57394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMrt-0003li-Io
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRQ-0005FS-SD
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:40 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRN-00080a-MH
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:40 -0500
Received: by mail-wm1-x334.google.com with SMTP id r4so11157177wmh.5
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0C3CDOl7kWOIXwW0cGa3NTxLoRJZBcCPdgZjuR7pLXA=;
 b=cMV9erJ+EFzQ7/UWs2mZ92w+VRNAaf+fHylXutcfDUNS3i0uIEJ9WXEN5MHixI+yzT
 3W6nlsoxeZYA31EBln49R5DQLY/O7Fyrb4bfimNY4+x6+pjtJkAQbMN1BpGShGQUaCD/
 AWpum5B6XsiInDR5WkBI5W8pZdYrY5D5RnZbNCT7l9JT8MPogdYTBRfDwfBsF22iM3wk
 RAdo26SDTLgVJfJYI4yDPzNCgX9vzb8XX+m6aVUK2h63bZlFbafnMobS+itOq0nXQs0y
 qBWC/PZHM/osxqswqJ9I/LzkXILOBVMjMb1YjGf7/HhwZ/7Lck2VIKKJl/lra8w16bsn
 M1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0C3CDOl7kWOIXwW0cGa3NTxLoRJZBcCPdgZjuR7pLXA=;
 b=T0fsSw/Mu52OToMkhdeYqf0+JXViek1laSXWg2bZiCkt+O1uI/cBNyo5eFXN1XAVzO
 alDwKMZBuRnUHDtzun+h4f5gHA7Zw5Z6PAtUyLWDt+q+W+DKeJDn31Lju0XUY6Ancd8c
 oh7xuvA3VOMCrBj/DEvUvYcPOD34UNjR+d5PFJQTuy5IzHVK1LsPrr4vMnLBUFMaM8Pr
 kDxDtK2IPhEobTPphebYxXs62070utM7RMIlxjGGJMiderS1LKn4V9GbbqNEI5n2OMsP
 OlKLLXndGi5lqgrus5QwptQrtR0Ifays7GUo769TjKFRSq1yu/7JPyf9pbXBy4L6m2im
 rxng==
X-Gm-Message-State: AOAM532jGM1rNIAlYiqrFwuJEjEsvIyHfMNdibgQMoNmB1XT+JHct1af
 RMzFHOhwWQXBIr5MdRF8/iPBKtFQ3kk=
X-Google-Smtp-Source: ABdhPJzNgS9pim4g9i7xSncAuO+3Phc2NWKgB/s/UJ52fqW0Y3dS9xr4RuCVnKoZ1WLrNDRmMpohdQ==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr17231014wmj.61.1608561936380; 
 Mon, 21 Dec 2020 06:45:36 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 54/55] configure: move tests/qemu-iotests/common.env generation
 to meson
Date: Mon, 21 Dec 2020 15:44:46 +0100
Message-Id: <20201221144447.26161-55-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                        | 7 -------
 tests/qemu-iotests/common.env.in | 3 +++
 tests/qemu-iotests/meson.build   | 3 +++
 3 files changed, 6 insertions(+), 7 deletions(-)
 create mode 100644 tests/qemu-iotests/common.env.in

diff --git a/configure b/configure
index 63ac12d5b8..c8e30ba1c7 100755
--- a/configure
+++ b/configure
@@ -6394,13 +6394,6 @@ for rom in seabios; do
     echo "RANLIB=$ranlib" >> $config_mak
 done
 
-# set up qemu-iotests in this build directory
-iotests_common_env="tests/qemu-iotests/common.env"
-
-echo "# Automatically generated by configure - do not modify" > "$iotests_common_env"
-echo >> "$iotests_common_env"
-echo "export PYTHON='$python'" >> "$iotests_common_env"
-
 if test "$skip_meson" = no; then
 cross="config-meson.cross.new"
 meson_quote() {
diff --git a/tests/qemu-iotests/common.env.in b/tests/qemu-iotests/common.env.in
new file mode 100644
index 0000000000..e565cdf40c
--- /dev/null
+++ b/tests/qemu-iotests/common.env.in
@@ -0,0 +1,3 @@
+# Automatically generated by configure - do not modify
+
+export PYTHON='@PYTHON@'
diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index 67aed1e492..26658ce25c 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -3,3 +3,6 @@ if 'CONFIG_LINUX' in config_host
 else
     socket_scm_helper = []
 endif
+configure_file(output: 'common.env',
+               input: files('common.env.in'),
+               configuration: {'PYTHON': python.full_path()})
-- 
2.29.2



