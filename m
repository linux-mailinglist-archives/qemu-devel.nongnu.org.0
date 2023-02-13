Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D12A694E11
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:33:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcfi-00087i-LM; Mon, 13 Feb 2023 12:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfb-00084v-J4
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:17 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfY-0005Pl-DD
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:14 -0500
Received: by mail-ej1-x634.google.com with SMTP id lu11so33748971ejb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i5Dhi2NHN2PG2x1FBdEMPbc7SBgsKBo5zgjP3kO7nnE=;
 b=OdBpL2zs3kDOF6tzp32vJ+92n7romHYUt5pDe+85QrGw6b93ku8iKttIUQ5DpO8ANf
 qZ3BzuF0x1yZ6wssbC1u6UWtk2ieUtr8mm887K71e9wYqIuNJ11SP2+Rsc5ZIunxZtJE
 d/S0tlVUJYapzLaIbu96BotikAcS7tAUzayK8jiix0S3tp0YKfS7y9b+zjw1pDPmVTWI
 xtZBEHlVZJpNIikhM/DpS/oD6jgdjKBjQoVax8tgk0ZiuB+UYBrTUEGHQBz/8DHIWW5/
 c2DVmAHVZGm07XzJqPrSa5YTeh8zkf9R2CcM9U2yUTsv2eH10HPGhMvWC34zKixWIMPz
 6dVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i5Dhi2NHN2PG2x1FBdEMPbc7SBgsKBo5zgjP3kO7nnE=;
 b=p1mwMTQHNoh8EfQgfxJXFWKZeYwK994Ef2hDV7i79B9ZdxbQTjvx0t1p7obY019i7P
 Kh4LzSNObhc6kCNvEEk/oPyq4L4hTQxB6Sbf1VvVaaIGeQkk0YX+fWQKVPZRpoOc8sE1
 WfY+wYBQ93YTy2E6o1NZYYIJCvXbYtsBnmKKFaWX3ATj1XTK9NWjXVFMEl7AwoigTRri
 bigYHdVXU9WRD3dizOpnn25SD2Bgs7GFmS3D2+Nm8xVGEuVWhK6TZ0CKDvBAQDBwpVRI
 DFxvjhkoGmtrZust4ChR6McDnj/FFZSwM4vicYv/bhXU5vY79kGir/Biv2ErNVTovMw2
 +waQ==
X-Gm-Message-State: AO0yUKWOlzoUfv/lCyDgICuCzCpNFTPBaTgIFFDC1Scio0cbPQrqeumF
 uDMsWP2aXEl98raLOQ5xooPUk8Ltss8=
X-Google-Smtp-Source: AK7set88gk3ZUro22nxIQqcH/RD5VZokv3dXPhGQEAA+StsshqbykSYkD0SaTJ5yQ0BiEvV7uAYuuw==
X-Received: by 2002:a17:907:804:b0:8a9:fa2f:e440 with SMTP id
 wv4-20020a170907080400b008a9fa2fe440mr29856570ejb.55.1676309469016; 
 Mon, 13 Feb 2023 09:31:09 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906684b00b008aea5e0938esm6988699ejs.183.2023.02.13.09.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 09:31:08 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 08/12] hw/isa/lpc_ich9: Remove redundant ich9_lpc_reset()
 invocation
Date: Mon, 13 Feb 2023 18:30:29 +0100
Message-Id: <20230213173033.98762-9-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213173033.98762-1-shentey@gmail.com>
References: <20230213173033.98762-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

ich9_lpc_reset() is the dc->reset callback which is called
automatically. No need to call it explicitly during k->realize.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/lpc_ich9.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index c5060d145f..2a4baac129 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -57,8 +57,6 @@
 /*****************************************************************************/
 /* ICH9 LPC PCI to ISA bridge */
 
-static void ich9_lpc_reset(DeviceState *qdev);
-
 /* chipset configuration register
  * to access chipset configuration registers, pci_[sg]et_{byte, word, long}
  * are used.
@@ -439,8 +437,6 @@ static void ich9_lpc_pm_init(ICH9LPCState *lpc)
                                  sizeof lpc->smi_features_ok,
                                  true);
     }
-
-    ich9_lpc_reset(DEVICE(lpc));
 }
 
 /* APM */
-- 
2.39.1


