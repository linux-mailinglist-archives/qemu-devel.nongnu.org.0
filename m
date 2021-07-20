Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3A53CFE1C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:46:39 +0200 (CEST)
Received: from localhost ([::1]:55510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rx8-00079F-5x
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rt4-0008Gt-JO
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rt3-000570-4q
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kvb5HpIjuRDlXZaWhDX69wXILzS1bxei8U/vFSO+RzE=;
 b=h9D1lHgzLY4GeeTpLsREobUOIx/dM+jdu8LaNKI5Xu7ZoYXnlcBGqfXoPW0AmMMeIx0Tzl
 LnbmgY47IU7VyqHVsdWFWyjJS85U0ytGAovw/MBdTVJGObrVlK0YBdew3fW5iI3gObDn0P
 YOMNZtRgfhto5AqkLJ5YIGslUVUA/pM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-RAKWR0-FNyG0Ox8DcanRgA-1; Tue, 20 Jul 2021 11:42:23 -0400
X-MC-Unique: RAKWR0-FNyG0Ox8DcanRgA-1
Received: by mail-wm1-f69.google.com with SMTP id
 f16-20020a1c6a100000b0290210c73f067aso2287770wmc.6
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kvb5HpIjuRDlXZaWhDX69wXILzS1bxei8U/vFSO+RzE=;
 b=An3gMbJu12+fh20im+FTvoeSNvkW+X69z0cstPBhjtVAnD/qtPNnt/KKq/5f2Itx8k
 tz5r4NmJjpzm8wKlzpnPkmYhmkr7DI7Dhvnadm0NsmgLvBGaQ96QDRWdP2jlUxDdYstA
 hd42Uhh0m7lDv+BxRVt6ALGKhKsh/31ghqLAWggbZQ8CZfnDEUieLdOoDH/0yq6vH8zH
 F3wS8O07kXi+DH34fxBTMwx9E0S10LmKwuD8H9k0xCxMvaXHCjVN+Ev64Fdlqdh27smQ
 /jW+tyKLYL1PK/y6QdrJG2jLRbzHeTMS/M17nDCnGy+wec2inzcy65DZM/13HRFltRzg
 7jww==
X-Gm-Message-State: AOAM531jS0A7TOGOVs3WAIE0UnXzCO/1T/3HogsfAjVbHkvRBAc/SFfR
 E/t4+KmT9G5XMDOr2Ux3bNT4GaxUL5YIz6vQYh/4zDAMW6iFJ+OiJH7aMKQQVwHNdgA4cUI0U4x
 uaPLLTi8dZhL4LDtoGQeHl0JkoapFXr30NhSKsfO+Z8dhqp9S9xR47F8FLnsJSNIY
X-Received: by 2002:adf:f44d:: with SMTP id f13mr37125993wrp.353.1626795742249; 
 Tue, 20 Jul 2021 08:42:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZjgtfL/v5yHofb20mFmS1MwCLRtE40RvGYa7PBui1a9H2r2Wx9RCr38aEZcH+eCYelffmaQ==
X-Received: by 2002:adf:f44d:: with SMTP id f13mr37125978wrp.353.1626795742099; 
 Tue, 20 Jul 2021 08:42:22 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 e6sm1836966wme.28.2021.07.20.08.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:42:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/17] hw/arm/Kconfig: Add missing SDHCI symbol to FSL_IMX25
Date: Tue, 20 Jul 2021 17:41:33 +0200
Message-Id: <20210720154141.3919817-10-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720154141.3919817-1-philmd@redhat.com>
References: <20210720154141.3919817-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit bfae1772c43 ("hw/arm/fsl-imx25: Wire up eSDHC controllers")
added a dependency on the TYPE_IMX_USDHC model, but forgot to add
the Kconfig selector. Fix that to solve when built stand-alone:

  $ qemu-system-arm -M imx25-pdk
  qemu-system-arm: missing object type 'imx-usdhc'
  Aborted (core dumped)

Fixes: bfae1772c43 ("hw/arm/fsl-imx25: Wire up eSDHC controllers")
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210515173716.358295-6-philmd@redhat.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 30967da2e14..4ba0aca0676 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -404,6 +404,7 @@ config FSL_IMX25
     select IMX_FEC
     select IMX_I2C
     select WDT_IMX2
+    select SDHCI
 
 config FSL_IMX31
     bool
-- 
2.31.1


