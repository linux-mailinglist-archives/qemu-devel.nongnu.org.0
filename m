Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0252DAEF4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:29:20 +0100 (CET)
Received: from localhost ([::1]:36922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBKI-0006LH-2i
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4l-0001eC-6i
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:15 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:34751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4Z-0007Ba-Cm
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:14 -0500
Received: by mail-wm1-x32b.google.com with SMTP id g25so11100192wmh.1
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6oHI4nI9UNd7uvlc5Xb1A8Ko50Iz35kwbptxV7aPIF8=;
 b=yO5sx1v6gDzE4VdJpkQUYiqXp7oFgdBBbGbGaAG4RVBBCynIGZ9bBGLHJQcVHlT9zl
 9LF0GLyg5xZRSbS8qlEF0tXeF+qBDD6uPSF4uu0dUgbnDMXmbbVxvDBBPBww0DjDJoYP
 v6syNfLAxBNjH61tXV6WsDzMGmu9rmTt+DdvTZjTQZoeTMYZwvmKIs0dBoZuQ3rBN01L
 XWcfNQa0WUD3tlKAkSD9hZdbeVEgmXCg3IEPQdnVHEUCdXhtGDn62tgq3EyehfOPtjZ0
 B3EMLLmYBPq+m8n+064Ei8ZFwVWIobBnd3E5EwE1JiXJluP7AbyLbUby6p4m9WSIgQB2
 a54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6oHI4nI9UNd7uvlc5Xb1A8Ko50Iz35kwbptxV7aPIF8=;
 b=c3qqlP63NchDOIDifIL0dvbYvBNg6CDKaMt3yuVyAFD4fodkSlTghZvoNs2uajZdDV
 RY42VBaVrnh8Qv2tBISj0BfW/5FrxYj+jiUaD2jeq8ZnhGx0jF8wZGAshIVJrpVI/lk2
 aRhSsHeCW6+DwXl8kUrahdFpSE96j+KnYERbhOwo142f01LUUeuhegfFNCKMwBQ437ug
 UjGHYYId/jOEzeiTnm2dHNZmkD059Wg3MVVltfRk0mvWfbMUr3j1Qg4/kDhkCWUe/bgZ
 cl6RBP7ecQ0JkifmIZArBIvaUY3VVltjtxHHiSmJvY0rS4Dy7xsOB8Q7KzmGx5e+QUjy
 9Ocw==
X-Gm-Message-State: AOAM531tzmdKtpLCgxumTfMB3UaQlBQu7XBPnxzG+uAXP1FlNJIYK+4F
 dMw+vFUtsIObUAy1w5n9BrpSJohgTJLIxQ==
X-Google-Smtp-Source: ABdhPJyasY+tFVH2VrYkW9DAwKNrybbUfzwlgoA1pUuU6681MWdXXnhs/kO7lr3YqzNylhBtAUvv+g==
X-Received: by 2002:a1c:151:: with SMTP id 78mr33597452wmb.24.1608041580440;
 Tue, 15 Dec 2020 06:13:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.12.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:12:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/20] hw/block/m25p80: Fix when VCFG XIP bit is set for Numonyx
Date: Tue, 15 Dec 2020 14:12:35 +0000
Message-Id: <20201215141237.17868-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Joe Komlodi <joe.komlodi@xilinx.com>

VCFG XIP is set (disabled) when the NVCFG XIP bits are all set (disabled).

Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Message-id: 1605568264-26376-3-git-send-email-komlodi@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/block/m25p80.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index bad72538386..7e1d56442f3 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -768,7 +768,7 @@ static void reset_memory(Flash *s)
         s->volatile_cfg |= VCFG_DUMMY;
         s->volatile_cfg |= VCFG_WRAP_SEQUENTIAL;
         if ((s->nonvolatile_cfg & NVCFG_XIP_MODE_MASK)
-                                != NVCFG_XIP_MODE_DISABLED) {
+                                == NVCFG_XIP_MODE_DISABLED) {
             s->volatile_cfg |= VCFG_XIP_MODE_DISABLED;
         }
         s->volatile_cfg |= deposit32(s->volatile_cfg,
-- 
2.20.1


