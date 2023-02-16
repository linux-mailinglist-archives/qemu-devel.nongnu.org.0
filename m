Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366AF699AFC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:15:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnL-0008EO-6h; Thu, 16 Feb 2023 12:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnJ-0008Bb-1w
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:41 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnH-0007sY-GM
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:40 -0500
Received: by mail-wr1-x431.google.com with SMTP id o15so2519809wrc.9
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=b/ZJPvKYLNs02JbKxyWAve6/lJ0RBSn21cgFd8J9qhw=;
 b=N/bTgqvLq/x6rhJOCGYWLDaW+b6ku9+Tf7tyNqG9vH7C7EC9DcFOGSA2u491T9nlet
 27fmOMY+fXlG/Z2VqzBNzVaAJSxM00UAtliDF9M1D29pejtPLGUCu+rARtXUCSNNDheN
 WP9Ry7nE2GlkMn2MOJ5mzNgfSFXYi0b3AKQ8dx40odPp5IIxm9SXKeURXoPU5akdPFo9
 lADCBp4UhVzrf3Vd2LoTNkxuWIOE8jOXUydVAiigwIKd4x7SrN3eJ6aM+dkP0Vzrb7Iv
 jgC+/o8ahUDYs4BCevqb9Y8ts+i1VofYnSRNIOjc42/RVi/jRErEvdYq0VcqpmPtGB5L
 o/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b/ZJPvKYLNs02JbKxyWAve6/lJ0RBSn21cgFd8J9qhw=;
 b=5RULK+tGb9Tg0LI2BqqtJVSaUjZiEMLWuqvAQv6T4SvN0b3qimh6Tf9+02H0yxoKgg
 QXLX5lRiOSVUux4BcGuidn9WOFdOYlRRQLNLtwcKcBb9wt9tMCfModocZKrlgn6K8SR6
 aAe7/76G5CmJcKqaA9m9hBQ9d9aKvqf2eZ5lZjJW5Y/2+xE35Q9jol+mYlUDM50aMX6Q
 cpf2/K1A9x+h0JOiH6o5F4HLTl84mxxcQ7urq2UWtCl493TmJ/Kwl9xYLp1FDqTNo9RY
 lWbvIek7DzeazvYxD+Mk0MEixVJKKVNXqu8l9fMoWWri88LE6a5W2CAWqVTkjwMUB3Jg
 dIkg==
X-Gm-Message-State: AO0yUKW7yO1XlleWIVdC3Mx2vm6rKs5Lx//O7mGEkwULN8tGDX88cWKj
 /pU+Ric4XwwtxNMkR/AI8Yfwpe26GKMnikv4
X-Google-Smtp-Source: AK7set+B0Gz+bpSJ8hUCpOVlkW4wOH3f0QFFx91vdtgbGq+ni8qWJ+aflasEQCnJ+1sQlrdLtwar4Q==
X-Received: by 2002:adf:f111:0:b0:2c5:586b:f53d with SMTP id
 r17-20020adff111000000b002c5586bf53dmr5085650wro.48.1676567498012; 
 Thu, 16 Feb 2023 09:11:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/30] arm/virt: don't try to spell out the accelerator
Date: Thu, 16 Feb 2023 17:11:08 +0000
Message-Id: <20230216171123.2518285-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Cornelia Huck <cohuck@redhat.com>

Just use current_accel_name() directly.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 75f28947de0..8d13e4486b1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2133,21 +2133,21 @@ static void machvirt_init(MachineState *machine)
     if (vms->secure && (kvm_enabled() || hvf_enabled())) {
         error_report("mach-virt: %s does not support providing "
                      "Security extensions (TrustZone) to the guest CPU",
-                     kvm_enabled() ? "KVM" : "HVF");
+                     current_accel_name());
         exit(1);
     }
 
     if (vms->virt && (kvm_enabled() || hvf_enabled())) {
         error_report("mach-virt: %s does not support providing "
                      "Virtualization extensions to the guest CPU",
-                     kvm_enabled() ? "KVM" : "HVF");
+                     current_accel_name());
         exit(1);
     }
 
     if (vms->mte && (kvm_enabled() || hvf_enabled())) {
         error_report("mach-virt: %s does not support providing "
                      "MTE to the guest CPU",
-                     kvm_enabled() ? "KVM" : "HVF");
+                     current_accel_name());
         exit(1);
     }
 
-- 
2.34.1


