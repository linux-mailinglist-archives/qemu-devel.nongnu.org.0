Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DCA489C18
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:24:03 +0100 (CET)
Received: from localhost ([::1]:49204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wWg-0007gZ-5G
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:24:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vrM-0002hh-0H
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:41:20 -0500
Received: from [2a00:1450:4864:20::534] (port=41519
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vr6-0000Wn-OC
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:41:09 -0500
Received: by mail-ed1-x534.google.com with SMTP id t24so6624944edi.8
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=raXOgou5jVKECUtcQISBg+Quw7i8HlpQqMT1vsPNKj0=;
 b=p+gX8PIrSdRz47V6vE4gbEnJaiA2G/ajdNmlUVCd5bGPq3YAzSh2A/SFTfgqDSfPLr
 uNZxgZ/S8/6zu/gNMuAWfiiNuHlBfs40Fvv7dhsdR7HtV0+dXR2Kifw6IUM8U1WSf4Ar
 +XIASrbcP4PZR0NQ+k8jpp7DM7WZf9ppQokHpFw0LXEYzRgHTjFACTkEyp9AxZ0aWi9l
 lreY8mmNCLJr8QYqetGTgRBMZPRl/wdd/mVzMUI+/MSbPpArdoFfalhM+0apeSWRWVvo
 zUnHH4FSbLh09jza1X8b0LvCBxCVhGjokrE6pCXs1aZNJnHxM2FlaYYrEaEWctxc6kV1
 gvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=raXOgou5jVKECUtcQISBg+Quw7i8HlpQqMT1vsPNKj0=;
 b=xSp+9PVuCyoSFKOWhknzhHxJ0QInvvOVZQDDr48kNXK+gOiweWcPeo3nezQkqVsGWD
 IuJM39TNA2JX/F+K3CSUcGv2DPV2CahXC06BZv0Vth00Huri3esED3yrB5NpJywcuqCb
 JsyNEFmCLtMMnjsy+2R76MVSty9jYni8g1SKu26vFytumj62GFTlaWrwvHcpJYkO2KUy
 6uf8uwXka6GF+WpU/ybFPOzJUS27p81JqvScFUZGEtJGd1bLVvLwrkMs+tMXSDeapACF
 RH1f61g3kS5FPdhtuVr5e/fVZOOdzDWmI+L/w0qKvgvPc5xrp6veVpnM8jXaYd/8W2Xz
 v+BQ==
X-Gm-Message-State: AOAM533YOWV5wFuMDsvsb3aEg0czehGm9VbMGTh67OtNPRBTIJCmW3jK
 2OlUjG360lKd6YW9h0KqwEAoo5Ly6Bs=
X-Google-Smtp-Source: ABdhPJxrRERGBw0PHEE+e+cdEKMGH/jD1lwu2nSyY3gPFizjcprKYbWD/sRSa18UBft6wBBjhIw+Jg==
X-Received: by 2002:a17:907:8687:: with SMTP id
 qa7mr71327ejc.192.1641825663144; 
 Mon, 10 Jan 2022 06:41:03 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:41:02 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/18] tests/tcg: Fix target-specific Makefile variables path
 for user-mode
Date: Mon, 10 Jan 2022 15:40:31 +0100
Message-Id: <20220110144034.67410-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Commit 812b31d3f91 refactor missed to update this path.

Fixes: 812b31d3f91 ("configs: rename default-configs to configs and reorganise")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211226001541.3807919-1-f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/Makefile.target | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 0f8645f782..ae8004c76e 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -33,7 +33,7 @@ all:
 -include ../../../config-host.mak
 -include ../config-$(TARGET).mak
 ifeq ($(CONFIG_USER_ONLY),y)
--include $(SRC_PATH)/default-configs/targets/$(TARGET).mak
+-include $(SRC_PATH)/configs/targets/$(TARGET)/default.mak
 endif
 
 # for including , in command strings
-- 
2.33.1



