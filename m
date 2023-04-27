Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E46A6F08CF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:55:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3wx-0007n0-6f; Thu, 27 Apr 2023 11:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3wv-0007mB-4j
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:54:25 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3wt-0006mB-2c
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:54:24 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso49572635e9.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610860; x=1685202860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=irb8Kevpl1FBY/VezS2GPdCbSf2KjxNFns8nRQw9WcE=;
 b=knXVkGySuY/O5OB1hAzAPAa2ryHGcBq1/92oHPakDX97G7LIQfQ07BUCRIGGiyCUAN
 W7LepqQxA/PhMAbNm7A7/eL6JvgvVqwGaTxvd/7iOYW8UQr3Oi9ExGOIDNRLCH29ib3N
 g7uiQaDVJ3XkYgPGtJMT9RNhmfV+ft031szoFFpw+oBPINVnRMuZGu3cJl2MeANJR8rM
 E/wl59AjihmPpVKajTWke+UC4S01gZBZpjJOOYMYiWLwD967YikbxXa/IUtF8HlSAMB4
 7LRaESlydyHr6YNvDxOU2T/cFGvwEEzPdxiONa73z0gOSKo5N6FdM9UTEYTymgVTRqKe
 SxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610860; x=1685202860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=irb8Kevpl1FBY/VezS2GPdCbSf2KjxNFns8nRQw9WcE=;
 b=TC9i0uLOq1PP/9z+9kkoNgwUkPPUlxqYgLxuUyUWetOqVCtr5+kjUwh1X9G4FYPXez
 QZ1lfDEC3S8ygPd8E5df2izM2erGMKFTtDndJM6KadYg6E2ica7c7/4qYdgK2LDvtioO
 8gNo20qjfAqaf0SVEKuki2rj1vYJHyrMbzLAdMFpLwmYK54Guo1CR86ydcMZbMsd3C+G
 ErHE+YDCy6F4LwoIVxo0ip8h3CFjvky6nYHX83LaK905GPp6SBxe4kWBVBJiMO61MrGV
 Ac2PjSyw8fyqchZ8wvZgUGsc1GpkC1l8afmrjniN1q/J4Y4e00btboK8riZMfnbVJMd4
 6ahg==
X-Gm-Message-State: AC+VfDxhlaL8T5HD+OdQV47YTYeAVJEn+/Zdz/oVpf9B2jXJYYvI6iYm
 PV1CM6CP4tyrsf3RGq86txFCMA==
X-Google-Smtp-Source: ACHHUZ5VbI1Ot9oR73UoWyfmNN3HFGRWY6Ekjc8DvOdUxC5TA8IItvxpYfnbBuz2Lz6F52y4rSdhIA==
X-Received: by 2002:a05:600c:b54:b0:3f0:a785:f0e0 with SMTP id
 k20-20020a05600c0b5400b003f0a785f0e0mr1852527wmr.40.1682610860614; 
 Thu, 27 Apr 2023 08:54:20 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m7-20020adfe0c7000000b003048477729asm8766724wri.81.2023.04.27.08.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:54:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 46B8E1FFC4;
 Thu, 27 Apr 2023 16:45:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 15/18] docs/system: remove excessive punctuation from
 guest-loader docs
Date: Thu, 27 Apr 2023 16:45:07 +0100
Message-Id: <20230427154510.1791273-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

A possessive its needs no ' whereas the contraction of it is does.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230424092249.58552-16-alex.bennee@linaro.org>

diff --git a/docs/system/guest-loader.rst b/docs/system/guest-loader.rst
index 9ef9776bf0..304ee5d531 100644
--- a/docs/system/guest-loader.rst
+++ b/docs/system/guest-loader.rst
@@ -14,7 +14,7 @@ The guest loader does two things:
   - load blobs (kernels and initial ram disks) into memory
   - sets platform FDT data so hypervisors can find and boot them
 
-This is what is typically done by a boot-loader like grub using it's
+This is what is typically done by a boot-loader like grub using its
 multi-boot capability. A typical example would look like:
 
 .. parsed-literal::
@@ -25,9 +25,9 @@ multi-boot capability. A typical example would look like:
     -device guest-loader,addr=0x47000000,initrd=rootfs.cpio
 
 In the above example the Xen hypervisor is loaded by the -kernel
-parameter and passed it's boot arguments via -append. The Dom0 guest
+parameter and passed its boot arguments via -append. The Dom0 guest
 is loaded into the areas of memory. Each blob will get
-``/chosen/module@<addr>`` entry in the FDT to indicate it's location and
+``/chosen/module@<addr>`` entry in the FDT to indicate its location and
 size. Additional information can be passed with by using additional
 arguments.
 
-- 
2.39.2


