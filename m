Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D493142C9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:24:23 +0100 (CET)
Received: from localhost ([::1]:55958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ExC-0003hd-0i
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCe-0003Zw-T9
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:04 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCd-0006Fr-1P
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:04 -0500
Received: by mail-wr1-x435.google.com with SMTP id r21so2150262wrr.9
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YDl//AE2f3xGXEVdNr/160U3DFg4IAMDxHMNoVyzCI4=;
 b=N64mXyyjbiMMQWuIO2a0EHanWuhDtJbjUngecQE1LlFyIKYKutg9i2oLPeFNY4mwau
 XFkJd+lNVRZHhRPhkgGnOcWirKGEpYm2CA4G4PDBw7fSw61rnZTGvOMEJFNh3BNtUGD1
 wYg2Iie2iaymGvobDwI/FRd/7PYj70ZAt1rXzPbdNRRi+n9Uy4uf/qJzOFS1vn6GuGem
 VPZwrdegqfHEmBjHE3wNyXSxkYRmjy/LArVALy0OUQ2+n7Yg32tOTsdlfW6xPKfsAGcT
 58jKy4RrpDE1a2bgh1iPPFpuDN2AGiA9lSOM8JYQRS4iB01qm8/QdMVirsP4ytE44xGz
 hOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YDl//AE2f3xGXEVdNr/160U3DFg4IAMDxHMNoVyzCI4=;
 b=HsKPyvj5dJ2EeFVlS187zlANegvNjueamAJ0JAauaOeflsXvIWgdIPlf2QLEOLXI71
 PlAOA1ZyuREX67a+00xAxfuGyayMHiyw2iat5zH0b51Fn1/PHACwBI5nxKdQQCQrSV90
 Mb4dB1/kEqY3kUT2gWJ6ok8CDkfwQ2UkpIiGs/1pcE+vu69E/MtzxBmKqK6wVu2bFDvP
 uOGMA2PYTq7f4E86I1fCVsrW6w3bVHAPuFuKfE2E8JU1+Rp4sHefdhSmGiSVhoD+TW9e
 VStU8mEtyO0yTjLgky619APFWXP+n8On6dWvYRIi82ScaproKNClmV8t68lJEwMvMCnP
 w9ew==
X-Gm-Message-State: AOAM530t1tWpar1VIzKfgWfXJgkfs/DQ3dSj1+tIpFmrKI+eMmzrrpp7
 dXbZeYj5nSDdtR4iM/Im0aySF4L42tkZKQ==
X-Google-Smtp-Source: ABdhPJx3iRKJKbb/HcBCJWcyCLer+wnseCCqj1jZkNiK0yB0Z9UmCBQckmm3UtEO4VJl3obF+/WK2Q==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr20520591wrq.136.1612808637488; 
 Mon, 08 Feb 2021 10:23:57 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/46] meson: Restrict some trace event directories to
 user/system emulation
Date: Mon,  8 Feb 2021 19:23:11 +0100
Message-Id: <20210208182331.58897-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210122204441.2145197-8-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/meson.build b/meson.build
index da21812064..d6eb880b89 100644
--- a/meson.build
+++ b/meson.build
@@ -1741,22 +1741,10 @@ target_softmmu_arch = {}
 # TODO: add each directory to the subdirs from its own meson.build, once
 # we have those
 trace_events_subdirs = [
-  'accel/kvm',
-  'accel/tcg',
   'crypto',
-  'hw/core',
   'qapi',
   'qom',
   'monitor',
-  'target/arm',
-  'target/hppa',
-  'target/i386',
-  'target/i386/kvm',
-  'target/mips',
-  'target/ppc',
-  'target/riscv',
-  'target/s390x',
-  'target/sparc',
   'util',
 ]
 if have_user
@@ -1773,6 +1761,7 @@ if have_block
 endif
 if have_system
   trace_events_subdirs += [
+    'accel/kvm',
     'audio',
     'backends',
     'backends/tpm',
@@ -1830,6 +1819,21 @@ if have_system
     'ui',
   ]
 endif
+if have_system or have_user
+  trace_events_subdirs += [
+    'accel/tcg',
+    'hw/core',
+    'target/arm',
+    'target/hppa',
+    'target/i386',
+    'target/i386/kvm',
+    'target/mips',
+    'target/ppc',
+    'target/riscv',
+    'target/s390x',
+    'target/sparc',
+  ]
+endif
 
 vhost_user = not_found
 if 'CONFIG_VHOST_USER' in config_host
-- 
2.29.2



