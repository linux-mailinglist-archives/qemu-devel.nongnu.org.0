Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FD355961F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:11:23 +0200 (CEST)
Received: from localhost ([::1]:57908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fLW-000200-Ch
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0j-0002JR-0C; Fri, 24 Jun 2022 04:49:53 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:41723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0h-0000Dk-7a; Fri, 24 Jun 2022 04:49:52 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-101bb9275bcso2888227fac.8; 
 Fri, 24 Jun 2022 01:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6MgX6+9CuhGwOjr81lW7312NPWPPk/rouG+yP3Odce4=;
 b=X0Eto6V3DPC2PM4RUwbidlde7SZhkHnQzzj1ItY2kqfsrbSooMQSXy3VP2mYoYQC0N
 zs/NASr0H5ye31qTM8Dp3Jf+XBgWktDbN+da4v74a0ypbcT/YEDHpWzf/YyAsoJGTxkg
 JZYmQNXbDtmTfxz6pSgSmypJmLU/4ktzXtpK+WD15xO+Btt8rTNH99yHlyTFWtG0mUiF
 yNrcf5d/WB5xWwX3KbrldLGXoxFZy0z7/1P8+5WjXjdjK2PXslITUxpAfDG3WkmNGGlQ
 yH9dY9Onk54qjxDe2Z/dyAGctM8m8968UzZBeTZGwebUxl879UvOv7d1bwUvpfTHSyPY
 xdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6MgX6+9CuhGwOjr81lW7312NPWPPk/rouG+yP3Odce4=;
 b=kNRPowV6lhNx+OtwNVpGV+nzC9LTiJj7cYDKsL+fv2Br/k9T6njbxG3/TxMJKX7t2Q
 INQ/5BY5UnbsfOHJLg5Bg4HlDWm/Yl/+SFKGYVaRFKnmyjAjvBi0vBYzibdadprJ+wuz
 1hkLB2RrHIDKZt+8OHmFKB46jGIJX/O1VJTzP0sukqufLnbVVdDv03fgHkeQ33c4nQTb
 EMuDZFZ9BigDzeY/OlSP+/vzoVlxGPnjICocQT9wPgFL1SCuLFBEVYV+HqWf31dbhsqh
 spVZIBrEbdR16opZdT7UIeF3HY+dr/33Fc4HdzTDYjjlk1/CJxZRVMvMkS04Ci76W7NY
 Ty7w==
X-Gm-Message-State: AJIora+miHxco/xFEv9bgorHPyAmjpRgnd8mo490pxLIGVXn3Rt4agDD
 n9j732QyucnyaOjve+4ZeCGIC+aKDLo=
X-Google-Smtp-Source: AGRyM1uSCj4c9np+uouCj/TZxopiiSq5YSk4uQl5eH6lY6eG+w6irBW4o4ScZwtH2qUvbP8bceVbBw==
X-Received: by 2002:a05:6870:6492:b0:101:cdd8:fa2b with SMTP id
 cz18-20020a056870649200b00101cdd8fa2bmr1367900oab.216.1656060589768; 
 Fri, 24 Jun 2022 01:49:49 -0700 (PDT)
Received: from balboa.ibmmodules.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a056830230800b0061698ef90e5sm1192768ote.31.2022.06.24.01.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:49:49 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 11/12] ppc/pnv: remove PnvPHB4.version
Date: Fri, 24 Jun 2022 05:49:20 -0300
Message-Id: <20220624084921.399219-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624084921.399219-1-danielhb413@gmail.com>
References: <20220624084921.399219-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's unused.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/hw/pci-host/pnv_phb4.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 61a0cb9989..20aa4819d3 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -77,8 +77,6 @@ struct PnvPHB4 {
     uint32_t chip_id;
     uint32_t phb_id;
 
-    uint64_t version;
-
     /* The owner PEC */
     PnvPhb4PecState *pec;
 
-- 
2.36.1


