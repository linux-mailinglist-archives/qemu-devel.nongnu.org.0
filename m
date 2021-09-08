Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0CF4037D5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:27:51 +0200 (CEST)
Received: from localhost ([::1]:53582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuo1-00073h-KX
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRx-0006qn-8B
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:01 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:35440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRm-00031O-S8
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:00 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 z9-20020a7bc149000000b002e8861aff59so1148208wmi.0
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ijvhFm3qkGCih7E+IGi13wOWIV5MP5pvlk/20m1FbI=;
 b=k2fQcQ+OxCunH4x6hU3mXP7H5jcpKIsRbfD9yzifUHeNdEaS3JchMk0H0naf7bRghN
 UNc/DTAHH1lKHwCaYY6EP3l9TMl+fWJ6zUeWwn/1rky6FmXVG594v6er9ZTbN6O/P1Gq
 QiTtWsGcoJ/NMYoPrbpCMRhV3hcm70t8LR73gQ0SDf3+AJ99PnWFJDb8iTGhcp7IgyhV
 J2jznW4hA2v1jrrrRkLZm0/XVCSTQb+YVyzmJ0AidouBkXX51nR93+DisOOPUMs0WfEG
 jBfoGdPi/Mx3SZ0Iiw9c/8zRMEvnoSAz/yeP5VLyI31e7F5Mfjwmq30Nx2O2xWiYEcLC
 3K9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2ijvhFm3qkGCih7E+IGi13wOWIV5MP5pvlk/20m1FbI=;
 b=DMO7go8yEztkQe5fiKqiCZieFg6VmBNyGDgIHZtcvD2UUMQObeCywar40QdFUppgzB
 //H/WRcaghcxXt3PUoir0SZ9BE5RI0SAUOibYvZ4AjydWXHyuL3CzroV+EQY1oEVLk1y
 5YyyNqle08XH1KNF9A4g1SoGDI1H7KBNmep+M+PnaEHV6khI4ci0XtTNbaQpa5BBpG32
 D9tx1QPr7sbV84eV9+nn5jTmnZkCnHKMG6vJrswE6QbwKwRjQXo3u3X6zjQiFJKND1cn
 EceL+32QykdC//O4rx6+3Q5dAc3ZfBgvpbOKGeZ/YrbE4I1atHdcdVl74qbEInU17k9T
 lRhQ==
X-Gm-Message-State: AOAM530wRIntGvCyTtZdkd2W3xGv73+uScC9eKA9n1c5wS6bTZwTERE2
 x+wXBYQLGjStlNirmxoTwNFqhQydPS0=
X-Google-Smtp-Source: ABdhPJwG5BWXMeptXvqr0jd7cB7ai4AnLUxy1JB1Nadn7VanfouBO5ASlmPaC/HCo+Y7sbsr+p+lxA==
X-Received: by 2002:a7b:c408:: with SMTP id k8mr2603296wmi.184.1631095489597; 
 Wed, 08 Sep 2021 03:04:49 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 19/43] fw_cfg: add etc/msr_feature_control
Date: Wed,  8 Sep 2021 12:04:02 +0200
Message-Id: <20210908100426.264356-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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



