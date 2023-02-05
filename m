Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333C168AF3E
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:08:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObuG-0001rj-HN; Sun, 05 Feb 2023 05:05:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtg-000143-Co; Sun, 05 Feb 2023 05:05:20 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObte-00057i-VF; Sun, 05 Feb 2023 05:05:20 -0500
Received: by mail-oi1-x22b.google.com with SMTP id r28so7620036oiw.3;
 Sun, 05 Feb 2023 02:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZUkjxFctZTc2l6rAO74466Igw8QaYm6+knXc6Rb2k4g=;
 b=h8O24DC1xfZC8m6HsHg6vKjHnveoQNWk25z0x5TWJ6YZc0tb+ezKGGCRs+Tuzfhr9a
 lUF2zwFvoOUH2So8afy4HVFyctn1cL7hZVTqbQ4KPXBIPJGma8aAcWyU3Eni+UTMf1T1
 2tj7ppxh1PWlFCkl5cfZtfPub+yNqL+WC20tdQzcr1pwt8WTtxnyD9gLjam8Y6MRlLQZ
 Tozkq86jkbclNRazcLEfOnlP+QCQFhCTt111Z+qpRC92vykdT/Lj1A1K9PEu73xBjIin
 kg7NAIC3ValAIoumHyWCSbPzySGOM+uOI/6gnghQwygk1VPB0rukLnqWFRGp++tCmB82
 sBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZUkjxFctZTc2l6rAO74466Igw8QaYm6+knXc6Rb2k4g=;
 b=zgtrRdsHT3rgu98mHzqK0Z+elaf0l23iaHRdIGU9xOXU5mUEn7LXSXG60l74Bjj9E1
 8SWNCrpcqiVXM8HRi9eeef/PMiDuLIR3+wsOauevPcTFjAhekocWBViAAJqTlvuY5vVz
 ukaSqCMLqpANDAgw3NDBXyWDE3DZupEjKbkMeA7HBMnqpCDWUQsr+npTSqX+bpy1rcSt
 l7ip/hgHsVJcEFwC/eMljEhXBPnVp9/v5y0ajBSUhEIV9cFjPdbDUAzn+CRuldHXqiMK
 KjlBQjfYOK/64/bCwIX+MSncgPJv3KT1P021150rkncNxwj+hLBMYemHBDxS9Yai2isy
 M5Fw==
X-Gm-Message-State: AO0yUKXvhYrv6wzaq2Er36vo941u6EqlVIXGu9TumJqHk4i0uBXkTJgc
 k14/UVK41amkZHL34Z5Sc05irQn94bw=
X-Google-Smtp-Source: AK7set8Aowwnk4aSI9A3TWk9rCdJ5I9FliirhED/lrIMmjWYnXie7DDIoCu+lXAYlUeKqUnl3pP1Ow==
X-Received: by 2002:a54:4509:0:b0:378:57fc:c63e with SMTP id
 l9-20020a544509000000b0037857fcc63emr7482216oil.17.1675591517807; 
 Sun, 05 Feb 2023 02:05:17 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm2730924oie.47.2023.02.05.02.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:05:17 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 11/16] ppc/pnv/pci: Update PHB5 version register
Date: Sun,  5 Feb 2023 07:04:44 -0300
Message-Id: <20230205100449.2352781-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205100449.2352781-1-danielhb413@gmail.com>
References: <20230205100449.2352781-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Frederic Barrat <fbarrat@linux.ibm.com>

Update register value per its P10 DD2 definition.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20230127122848.550083-4-fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/hw/pci-host/pnv_phb4.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 761525686e..28d61b96c7 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -214,7 +214,7 @@ struct PnvPhb4PecClass {
 #define PNV_PHB5(obj) \
     OBJECT_CHECK(PnvPhb4, (obj), TYPE_PNV_PHB5)
 
-#define PNV_PHB5_VERSION           0x000000a500000001ull
+#define PNV_PHB5_VERSION           0x000000a500000002ull
 
 #define TYPE_PNV_PHB5_PEC "pnv-phb5-pec"
 #define PNV_PHB5_PEC(obj) \
-- 
2.39.1


