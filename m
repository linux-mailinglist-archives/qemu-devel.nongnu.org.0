Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D56A55F441
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 05:44:31 +0200 (CEST)
Received: from localhost ([::1]:49694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Ocv-0002Br-JM
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 23:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVR-0007gP-PB; Tue, 28 Jun 2022 23:36:45 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:50806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVQ-0006oR-8R; Tue, 28 Jun 2022 23:36:45 -0400
Received: by mail-pj1-x1030.google.com with SMTP id go6so14472565pjb.0;
 Tue, 28 Jun 2022 20:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iAfcxedpA0fkKQ95aKfI39jiWma1JkWWL+ACHMzG7Ls=;
 b=PF1cTARNTNViX4k0IpSOUVov9hrMqZiQbYcweT2xPH390bKbLjp4OCmfvgaNjONLPk
 lOcvqKA4xUQ2EYbd0X0UJP8CBLFA5gNCRYeRwdCigndHBd5iQXXZ2ZM/C85jpfeRrKem
 PBsQcrhLJSb+Fs3qcTpWeN36kTSbOySWIRYnBhyGQZlIVjAlBdKBJIKdTuR1rYYFaB9S
 5B/vYA95jCheG9X3TkhEiBrHDBNhHOy9IpoOsvHz3tfI5RZ8853AFniMYoeL/0KhRTB+
 1Xa9he5DBj5pBV9HMZc28enPWSq5up4WXCsnTPW2ZWf9qcj/16tpvnDHKeGdYCHPvwXz
 8fGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iAfcxedpA0fkKQ95aKfI39jiWma1JkWWL+ACHMzG7Ls=;
 b=PsHathOHgoqgg4D9a4V76iuLQtd6ExFS/Hv4atRcFwXiAfzkhxJRo1V809OtRLCXKl
 +HPQih4ZjsUJYVivN4ygz8cA7zOQhYWX6ipqxsIrw9rnVAxZRIBDplt5KOgcUfIHk79H
 XwF7gY9y1JEC8dLpbKGcmUKOJyiWweQHMg6mjqfc2r5dg9bCOfbd/9dtWtTFOXtl2MoR
 e/8EPEYohBcdjDl324PZg9RT7hM3UbJcfV348sqfiHds2mnu/PuTA+7Bv5gOgMxkTXdA
 sjJCVFxpwsy1p/Jx5JWLJpwtaXqIwfu8MaMUQi35T7N3vmqqOH1AJ9MdkvIQlOpcl63s
 I4tw==
X-Gm-Message-State: AJIora93WNZce4Ph3UJvdEAIq7guwQhnu1ea0K390LoqzXKXIiVpQwa0
 xGEYY+e8bwqz8uh24tudxBw=
X-Google-Smtp-Source: AGRyM1sFM4j38p/nnyNh9sn5EfEFpo2z1a3cNAM6L8cxOt7lHJ+inXKtuqcKQN0j1sWLAwK9IwMjzA==
X-Received: by 2002:a17:90a:3e07:b0:1ed:492d:2792 with SMTP id
 j7-20020a17090a3e0700b001ed492d2792mr3456533pjc.57.1656473802657; 
 Tue, 28 Jun 2022 20:36:42 -0700 (PDT)
Received: from localhost (fwdproxy-prn-119.fbsv.net.
 [2a03:2880:ff:77::face:b00c]) by smtp.gmail.com with ESMTPSA id
 w20-20020a1709029a9400b0015e8d4eb231sm10098269plp.123.2022.06.28.20.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 20:36:42 -0700 (PDT)
From: Peter Delevoryas <peterdelevoryas@gmail.com>
X-Google-Original-From: Peter Delevoryas <pdel@fb.com>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v2 08/13] hw/i2c/pmbus: Reset out buf after switching pages
Date: Tue, 28 Jun 2022 20:36:29 -0700
Message-Id: <20220629033634.3850922-9-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629033634.3850922-1-pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peterdelevoryas@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

When a pmbus device switches pages, it should clears its output buffer so
that the next transaction doesn't emit data from the previous page.

Fixes: 3746d5c15e70570b ("hw/i2c: add support for PMBus”)
Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/pmbus_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 62885fa6a1..efddc36fd9 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -1088,6 +1088,7 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
 
     if (pmdev->code == PMBUS_PAGE) {
         pmdev->page = pmbus_receive8(pmdev);
+        pmdev->out_buf_len = 0;
         return 0;
     }
 
-- 
2.30.2


