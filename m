Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C78284767
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 09:36:36 +0200 (CEST)
Received: from localhost ([::1]:54344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPhWV-00020y-6F
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 03:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kPhQI-0002w4-BE
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 03:30:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kPhQG-0001Su-NB
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 03:30:09 -0400
Received: by mail-wr1-x42c.google.com with SMTP id o5so12222378wrn.13
 for <qemu-devel@nongnu.org>; Tue, 06 Oct 2020 00:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rX/2cdjF+IuOQnPp1vgFSyENqGKo+72G+GCVvdtD8j4=;
 b=OJ7EvcrZsBtrqbmDuOZlKzZwGCzCSBYc2kJZcrl1IlOcG5jjYSogfxeXAXwaOTT1Eg
 4s/5AX9PkqWdgybN8O0RVEhmCzbhz7J0u8iB2Xf8ag13WzkLNoU/jEqsmh0ifshqcul2
 VDj3RZIkvqcrdxtnS4dxZ3rnB3QQteDc+JK5zp9SaYlzA0up/wpSvZSXuVxOw5/JtX3X
 cYMxKveYswS7zvGfOjJOCxAfVVXt+BFHICE6ovFN1qLbZXm/+dJaqNbDX1RrTcUMiNsS
 P3oGMCgbks2MViCbbf3jBs9/N1wegFXx7V0SDfaiXeYsUzNdtwmGhAWpmp7UwJCfP8FH
 +uSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rX/2cdjF+IuOQnPp1vgFSyENqGKo+72G+GCVvdtD8j4=;
 b=bj+Au3SjebL2D9o58n2T8EiwDYyCQRJyhUq6lNDHCmRM2lm/A5l1i6Nv6bfACkWRXu
 SC0+FI5p3BWT0VFdefAo/atMtvAOTOBlpIxFN/goxo5fHlVoOzaEHJ5sJFhW6KeNi8Lg
 G9wxJVDp6SiyRKb8ggroYHd+QxScTNC8VNW9kITno57MzE03oPs1TNaSQv5LF+izyX/U
 BXQPU+/ipt0GOY6DpGUB0bv9MpXrpk3Ae+x4Ha7qhjj/i4K46j2JUiqizrtZ+ebU1FJn
 ojruXJt7c2VrcDjwWx4Dh4C9KR+jA1hUDNxl7L40CLhaHvF4ElbYJ30OEUT3BYau5LJB
 Na4A==
X-Gm-Message-State: AOAM533CHeIcQQ8+1/mMKXMA1ykjk3Eg8k9jZTczgR6LEXQueBX8x+L1
 EEAU1gIPPMcUaS3b+g++hGMYCT2uGhw=
X-Google-Smtp-Source: ABdhPJxgp8MbFnQ8Po0YZis6YYKlhiSbdxBD9e8P7vo8sZsb7qKn+kbeL4lwgwCPulYDD6mocoz9iA==
X-Received: by 2002:adf:90a2:: with SMTP id i31mr3606709wri.276.1601969407103; 
 Tue, 06 Oct 2020 00:30:07 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:5aca:cd0b:c4a1:9c2e])
 by smtp.gmail.com with ESMTPSA id i9sm2576329wma.47.2020.10.06.00.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 00:30:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/37] configure: don't enable ASLR for --enable-debug Windows
 builds
Date: Tue,  6 Oct 2020 09:29:33 +0200
Message-Id: <20201006072947.487729-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201006072947.487729-1-pbonzini@redhat.com>
References: <20201006072947.487729-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Unlike other OSs it is not possible for gdb to temporarily disable ASLR when
debugging executables on Windows which causes gdb to fail with memory access
errors when trying to debug QEMU.

Keep ASLR enabled by default on Windows via the --dynamicbase compiler flag
except for --enable-debug builds when there is a clear expectation that a
functioning gdb is expected at the cost of slightly less security.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20201005133434.12614-1-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 04c8cc017c..28df227db5 100755
--- a/configure
+++ b/configure
@@ -5882,7 +5882,14 @@ fi
 
 # Use ASLR, no-SEH and DEP if available
 if test "$mingw32" = "yes" ; then
-    for flag in --dynamicbase --no-seh --nxcompat; do
+    flags="--no-seh --nxcompat"
+
+    # Disable ASLR for debug builds to allow debugging with gdb
+    if test "$debug" = "no" ; then
+        flags="--dynamicbase $flags"
+    fi
+
+    for flag in $flags; do
         if ld_has $flag ; then
             QEMU_LDFLAGS="-Wl,$flag $QEMU_LDFLAGS"
         fi
-- 
2.26.2



