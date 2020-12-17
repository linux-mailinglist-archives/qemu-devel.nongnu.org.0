Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1DA2DCDE1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 09:52:25 +0100 (CET)
Received: from localhost ([::1]:54596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpp1M-0006G9-Br
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 03:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpozD-00047e-2Z
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 03:50:11 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:38655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpozB-0006zP-IZ
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 03:50:10 -0500
Received: by mail-ed1-x534.google.com with SMTP id cw27so27768215edb.5
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 00:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zcxU3Rxj/pJG1xoPDfYItl/XH77RMBe4vQl+GWrFfq4=;
 b=ZAiRnXMPbSlHmhxw8mtC/YXnNxUVE9VkEWJVkX817JonL7RgaU1wpLpdeL2c3nOqhT
 dgUQfC+uiwZtmxmZXKRKAbIxj7dXcZ+hNj2+vjX2q5/0oDD0XliKKRNP+EQA8/EE7ZVR
 RZ3QSK97/zjahdD4RWcRg8OqsxDY7AVZKYXWIz0vVCpLIIvcO+8UUSWLFzfWjKzlhGQH
 6Tm70uZp3UBjOaT+UKbL6BMskPhvnYJoXFJaKltLWCyQ9LyBkRJHinJIuvU4Y0i3KoYr
 U/GXTmNOVspVsahvFSvE1kVb1awQHGbZpONuIGn8IdUb1p5cslbPWIZBNlbNQOPM+CxB
 ib3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zcxU3Rxj/pJG1xoPDfYItl/XH77RMBe4vQl+GWrFfq4=;
 b=HRCz72W7t0lN2nlDnEALljVZUKYRWSCfmNeIqjln+jSk7koWMa3MUulMcyDik2ndlR
 zmB09IVfbMTE3v9YHQ770VJ1RIDruGLw2hKXMYrSXODWBB72m24F1bp1pkgbc1DBAGLt
 hjSMKn3+iSywvfHtlY9HhsmM7iXluG/yu0AV9kuxUkWIlWyF974XR0fAnbO946PhKOxl
 pb2sFhQcmRR60otSx8MqPFAoIilDv7H+bmVtsC9Ho0bwWU0ryn23h5/3/QT+ANoakZbJ
 ylgmrhDpv4c9AU8Ng2PNwHUcpUI+3CqjzCEl+mo2uEBmvQ4Jrvt88pxS4Pexgucfybh1
 w2sA==
X-Gm-Message-State: AOAM5306Vstir6sf4Aw9DP8hkE5xv11WFK+2S2VeV4cFHmfLaI+glIr9
 L/kJov7M3pCL0EoJIpWy4iqtE95PV8c=
X-Google-Smtp-Source: ABdhPJwsEPa5Q2UpwN1vYwhe/lZpgowuXLpTX+/WXZHOE6WKMdJJG1nNr82jjhH1kwPaA4tuqeKLHw==
X-Received: by 2002:aa7:db01:: with SMTP id t1mr37361085eds.185.1608195008361; 
 Thu, 17 Dec 2020 00:50:08 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dd12sm22949542edb.6.2020.12.17.00.50.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 00:50:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] configure: remove useless code to check for Xen PCI
 passthrough
Date: Thu, 17 Dec 2020 09:50:02 +0100
Message-Id: <20201217085005.10644-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217085005.10644-1-pbonzini@redhat.com>
References: <20201217085005.10644-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

meson.build is already doing the same check, so remove it from
configure.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/configure b/configure
index 708cf365f0..085a5ad7ff 100755
--- a/configure
+++ b/configure
@@ -2879,18 +2879,6 @@ EOF
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



