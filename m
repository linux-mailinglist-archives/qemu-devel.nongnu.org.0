Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF2D2DFD5D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:18:03 +0100 (CET)
Received: from localhost ([::1]:38240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMwk-0007cU-IS
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRG-0004ro-K6
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:31 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMR9-0007mR-To
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:28 -0500
Received: by mail-wr1-x434.google.com with SMTP id i9so11319150wrc.4
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QcALGteNqeaz9wkB1WyIxyZdXEQ5pVyXB1p6a5LUXjc=;
 b=M5vWrwMISVzFopxvoipMeZpDuxuWYqzlxYp0GJeWqWkBkyww8RJA8wYghyT6shSxWL
 tWan8THqOH0F+wW661nYla4EILGOn1EGwuSsW8qgAOOb5wDKiQmsh7GtxDmY3AIxrmI7
 Hc+E4C1rFpYINIuxlaum9f5JgIeAm31F50PfnWH915uMImVRg11JpFRHbiuGcZ954dSP
 qPOsjaAstFwiSBSJxCMYGtmsP+JcD8TgRglQVwijAl1GOhWpQXaLWi2iF/ssm34I0ckI
 qEkFZlPT4akUem3Uf4Hhctlzfj3Yx/6nCvMIrLmM8t2EQ+YJg7IK9SThbm3gSfVHSel9
 t7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QcALGteNqeaz9wkB1WyIxyZdXEQ5pVyXB1p6a5LUXjc=;
 b=ouRoZgFKwwThYcYtwLr8TZhvhFiCx+lJkRziWUrYH/+i1IPo9H/Ch2s5123Khv269c
 uM4SAfw5EtX5bkgL3qKFv/lNYCxj6bUdkpnOXzGFlT5cC/kzlg290ynsZIgwvh/GRvWF
 +U6q3BNWIwmnK7xT/taXqgAIvgIcSW3Gc0woqHtaDML+twTEsa2LNxLF6q+Dnq0/aTot
 qtJjNBQXCZvrpLyA3iA+d5h7eJIrBMNOYYWFq6/m71HmHfGTVrf1GEOmHXq2KHHjMmRj
 va5RkB6sBpvMqfA+PEzMngRIiPJCvSQKxCQoUNZ4criKf8niecmHr1N8nEyiWs2m3rIx
 z2PQ==
X-Gm-Message-State: AOAM532HIZxFFqC/V20N0wDw86CPZkhHlqvOA+/c6AhtM1GxLMkQfsfi
 ekneQRxjt5GLRdwxZe+rGJ9zMyTzU1g=
X-Google-Smtp-Source: ABdhPJxd3EDFvGcxujYpxD0aYe26OHB943CdQWwTp3cdMGu7vXDLCYfUh1rCquHtxXfghb9ZNskwEg==
X-Received: by 2002:a05:6000:108b:: with SMTP id
 y11mr18890514wrw.379.1608561917160; 
 Mon, 21 Dec 2020 06:45:17 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/55] configure: remove useless code to check for Xen PCI
 passthrough
Date: Mon, 21 Dec 2020 15:44:24 +0100
Message-Id: <20201221144447.26161-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

meson.build is already doing the same check, so remove it from
configure.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/configure b/configure
index ce4f365231..ca8496b607 100755
--- a/configure
+++ b/configure
@@ -2877,18 +2877,6 @@ EOF
   fi
 fi
 
-if test "$xen_pci_passthrough" != "disabled"; then
-  if test "$xen" = "enabled" && test "$linux" = "yes"; then
-    xen_pci_passthrough=enabled
-  else
-    if test "$xen_pci_passthrough" = "enabled"; then
-      error_exit "User requested feature Xen PCI Passthrough" \
-          " but this feature requires /sys from Linux"
-    fi
-    xen_pci_passthrough=disabled
-  fi
-fi
-
 ##########################################
 # X11 probe
 if $pkg_config --exists "x11"; then
-- 
2.29.2



