Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B474CE451
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 11:59:23 +0100 (CET)
Received: from localhost ([::1]:50434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQS8A-0006BP-PL
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 05:59:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQS6f-00044c-T4
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 05:57:49 -0500
Received: from [2a00:1450:4864:20::32d] (port=38746
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQS6e-0002Qk-DA
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 05:57:49 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so7362921wms.3
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 02:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7zONuSKHAqhLjp/GIujk3Eq5yTF2yfO0KL8UNCqj52k=;
 b=Tzy9Nqwa89b3SM3iK5WHi6cu1QXOsLYr3/mikC9r8NsO2BwZr+/nurFoB++eHiIjHZ
 eKz0BprdmzLe6sZtGQRVNKr47a/BVXpG3cjKZ7yJgI8rasCLy6ae5FlZguSu+/af1+Ry
 NBPJBDlZgiOuM5a7x2mrjJXfyMWuy9xsX4s25sVf93v5jCTtnMyRdH22iSoK+MJdKjBl
 IpPIlnujKyUkfQQ3MH6CNWEGqvK72xhkt4kFZWXfm41NMoNvMnh2gz+Lh3I432GnAN5k
 W4gqHgN+O+PdyBOgcXjkjbUdQ+eVkWu6KFgglkTaqAEjiEuhXtWKMxElv9fQU7PoYbGp
 gtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7zONuSKHAqhLjp/GIujk3Eq5yTF2yfO0KL8UNCqj52k=;
 b=bCbjLrwl/aKpeyl82v8CpMpGEpXqCe5z137/ps4cZwt6O55SI6I1bPuETEy3rnr3b2
 wY6+fwNMg/qMGc5NT2QLN4rcpzPUfXgdRNCiwY0wusTx9CC6SFNZMYgmQNpK+6VTKhlU
 PSgvDAxj+poqdkKfj2YpLEMr37EZMHdG3r2fwB6geqk2CgE7Xov9EUrNSSknxGK55mfR
 H/ycMZ+w8lzQZojVfyBjWbOgIUJEEAoCr9+wlngc16+euwDttyhDA9DHbLLaP82ekNT5
 nrYKHGJga02mP4EC32W7mrXblxFZ51I9VQXlgaXVoaEFKf240ldCUAPYOTjGfAvEtQYz
 9eMA==
X-Gm-Message-State: AOAM531I5j6DlAbdq033iJ6KCzSDe5uuJxUFwejZm1QETzgXubhXL8W4
 +G4J5mthG5mfWCHpQEVi5B1GNGx8GgqrGQ==
X-Google-Smtp-Source: ABdhPJwWq5XlxDcVOWQBCYLxv8FO6iQIu1MSmXVaOyu95xCLAzr+fSVNkWQER8CDoVkF7U+0RO+aWQ==
X-Received: by 2002:a05:600c:4e08:b0:381:9094:6b3c with SMTP id
 b8-20020a05600c4e0800b0038190946b3cmr11167256wmq.103.1646477867008; 
 Sat, 05 Mar 2022 02:57:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a05600c4e0d00b003816cb4892csm24079324wmq.0.2022.03.05.02.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Mar 2022 02:57:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] nsis installer: Suppress "ANSI targets are deprecated"
 warning
Date: Sat,  5 Mar 2022 10:57:42 +0000
Message-Id: <20220305105743.2384766-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220305105743.2384766-1-peter.maydell@linaro.org>
References: <20220305105743.2384766-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we build our Windows installer, it emits the warning:

   warning 7998: ANSI targets are deprecated

Fix this by making our installer a Unicode installer instead.  These
won't work on Win95/98/ME, but we already do not support those.

See
https://nsis.sourceforge.io/Docs/Chapter4.html#aunicodetarget
for the documentation of the Unicode directive.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 qemu.nsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/qemu.nsi b/qemu.nsi
index c3df8c9d3b0..a44d2be32a2 100644
--- a/qemu.nsi
+++ b/qemu.nsi
@@ -35,6 +35,9 @@
 !define OUTFILE "qemu-setup.exe"
 !endif
 
+; Build a unicode installer
+Unicode True
+
 ; Use maximum compression.
 SetCompressor /SOLID lzma
 
-- 
2.25.1


