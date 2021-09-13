Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EF1408B00
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:24:32 +0200 (CEST)
Received: from localhost ([::1]:49098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPl0h-0006Be-3c
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkbD-0002wp-0N
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:11 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkbB-00064v-Mj
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:10 -0400
Received: by mail-wm1-x329.google.com with SMTP id 140so3027836wma.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ijvhFm3qkGCih7E+IGi13wOWIV5MP5pvlk/20m1FbI=;
 b=O3ZVioHs5df8JNEOrOFmmOvYjB1rVn0wqp4mW6kju7dQoCtJ+nJSju+Ei2wzHBWmrA
 tLVSGuQ62HKjxAlpEr7KScTe0XpH7XfNJtYhPYFDzlJyIrkY1Z5y7r2PAVASq1Yxmdl6
 UYbuIIhdjgFYd9+Jq1qoC1N+hKwAsKnucIu/zD9Zk3SMWC7E7XwM6LjXj1sT8LcLtGnE
 3jJIl9tg3TeCyX94qoshrqvDoDlG0Q63mS2uTdKVWND4cAY7s2DntTPmRBxi0b0g0X3w
 9rqIfIx3L2FoSPWm7m+KUj6m9BL9DI6E4HCRTK08oeRvxRmD953K/asg5jIU68FBJMSG
 1f0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2ijvhFm3qkGCih7E+IGi13wOWIV5MP5pvlk/20m1FbI=;
 b=NrR5nQhIXODveOV+lS+ua9CK+C60Dmz6FrrSrwvVTJMAMP1rUpErS+xblqnwY2t8Fq
 ylrjFn1n+Gh67OITBpxT5lq+CqNX3mVMpoQlq82OnNWmsF/nQbeLw0QS7SgjwYhOeXTc
 C86Yxb3ccVyUzMXyLYOi6CkBmv8BJvbHX3zIRjBQZE1ID5QL5t6k1GsKCK8a0CJMjC6B
 eif1Fsyvr+d/OgCcOorzHXTNFvIqxgstKxFp4DqZwq8j+J58L6KelGolIumjNV+ehLDL
 2MtWTLeYDxRLWzOjG8TFWeLdHfVoEoBa2tDZJcQ0AXsEwzvxNJl7XxVcXXavEYPhfB9O
 unHA==
X-Gm-Message-State: AOAM532cgb3pbLalnWgc8z9eZsqU3OFGp3FlZzFqjhXy9iXygmCSdneW
 14AULcDwJaEWF5/BWFSc6X1NremABCo=
X-Google-Smtp-Source: ABdhPJzOCqclkgTsckDf1Hq0Mm0NwPxif8uihfRABzNTc5uwljTRni3kn4A/XIsLDBKMtf1+eeRtpA==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr10704681wmk.97.1631534288417; 
 Mon, 13 Sep 2021 04:58:08 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.58.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:58:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/21] fw_cfg: add etc/msr_feature_control
Date: Mon, 13 Sep 2021 13:57:38 +0200
Message-Id: <20210913115742.533197-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The file already existed, but nobody had noticed the warning until now.
Add it at the bottom, since that is where unknown files go in legacy mode.

Fixes: 217f1b4a721 ("target-i386: Publish advised value of MSR_IA32_FEATURE_CONTROL via fw_cfg")
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/nvram/fw_cfg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 9b8dcca4ea..c06b30de11 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -878,6 +878,7 @@ static struct {
     { "etc/tpm/log", 150 },
     { "etc/acpi/rsdp", 160 },
     { "bootorder", 170 },
+    { "etc/msr_feature_control", 180 },
 
 #define FW_CFG_ORDER_OVERRIDE_LAST 200
 };
-- 
2.31.1



