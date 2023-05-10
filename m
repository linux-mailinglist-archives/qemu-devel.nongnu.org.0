Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD3D6FE136
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:10:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlPI-0006tv-K9; Wed, 10 May 2023 11:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPF-0006sf-CL
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:05 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPC-0001Vr-Q4
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:05 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f42c865535so20311245e9.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683731221; x=1686323221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/PAoQoQ7BYCD+/Pqb98Lo7VCKddJs1izVetKE3RbLdc=;
 b=ovqNJXDnXOzVjK3zGipcALJchggDrVwt7AMVU6BnEAHz69/ZA+bifh8mul9Sx2M+MN
 IDM6l0WrWe8wqsKuHC9p7UlKYAOP6XMOIx40ajcmOOQXSuLzjV4HgK7XnbopIfdpiz1m
 e9lMNuwNlsqf9FmXFYjpKVV1V8mFSLsnCRdSeEeR3RpRCac7HiLwnXNJjiMduqbF6hY5
 W/6qjwnuuL9DFpxov7L3hyqs8v3ThhiSaS8boE55S/xXHsOtL14780HuQybPPZJmdAPj
 Hi37VJKY5SgerlhlX+xNZPJ1E4xp56yCKtMsZ8PgIdk8vTk3k5zfk49lLxOoCCdEXBl/
 rt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683731221; x=1686323221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/PAoQoQ7BYCD+/Pqb98Lo7VCKddJs1izVetKE3RbLdc=;
 b=dAMCHYzNE72+2Lbz6/CS4fpJSe3sprNd9Y93jQ/LenrhDbD/xcbnncJk/xreXtDuWG
 Y6vGMosfJ6NJ3ea+1Qm9L1bDZ8gxZk/0alC/Evgx1qYmSRsdlB3NWcLHTx2WHEt28yju
 UnOM/HGrFc051evy6Duc86ntainmXC2OvNRs75g+s64fucONyZxNNzkZzs/nuI17Y2TN
 Giah8gcSe88VrYR4v1jJdVhB16uJ/kQzlBDTHH6iSVlieLBnF28TkUruLxubsb9LLPGJ
 hfBctCEQ7XQLlEFu2IxqWQ5irBvU3Hek+spTsgVCIzKpyCiygDBRWudi/p+M5/ttlWuR
 cqKA==
X-Gm-Message-State: AC+VfDynhvwk9o5U2QVeRH2pXBZx0D8SvTOxIXLBT9mABrsmxq99kndM
 upFBRyupsOkpskRpy2GrnkigDQ==
X-Google-Smtp-Source: ACHHUZ7HLPEPBhtW8PjqOrwSZ+yhxi7ldlR2zH0vQoMF3ANiu3QSf/iAIEhYJCWoKgJZoUW5YVSYnQ==
X-Received: by 2002:a05:600c:209:b0:3f1:72ec:4015 with SMTP id
 9-20020a05600c020900b003f172ec4015mr12445283wmi.13.1683731221247; 
 Wed, 10 May 2023 08:07:01 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a1cf702000000b003f32f013c3csm23187052wmh.6.2023.05.10.08.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:07:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 72E7D1FFC3;
 Wed, 10 May 2023 16:06:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 8/8] hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102 machine
Date: Wed, 10 May 2023 16:06:58 +0100
Message-Id: <20230510150658.1399087-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510150658.1399087-1-alex.bennee@linaro.org>
References: <20230510150658.1399087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Fabiano Rosas <farosas@suse.de>

This machine hardcodes initialization of the USB device, so select the
corresponding Kconfig. It is not enough to have it as "default y if
XLNX_VERSAL" at usb/Kconfig because building --without-default-devices
disables the default selection resulting in:

$ ./qemu-system-aarch64 -M xlnx-zcu102
qemu-system-aarch64: missing object type 'usb_dwc3'
Aborted (core dumped)

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230208192654.8854-8-farosas@suse.de>
Message-Id: <20230503091244.1450613-8-alex.bennee@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2d7c457955..0f42c556d7 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -436,6 +436,7 @@ config XLNX_VERSAL
     select OR_IRQ
     select XLNX_BBRAM
     select XLNX_EFUSE_VERSAL
+    select XLNX_USB_SUBSYS
 
 config NPCM7XX
     bool
diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index ce4f433976..0ec6def4b8 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -136,5 +136,4 @@ config USB_DWC3
 
 config XLNX_USB_SUBSYS
     bool
-    default y if XLNX_VERSAL
     select USB_DWC3
-- 
2.39.2


