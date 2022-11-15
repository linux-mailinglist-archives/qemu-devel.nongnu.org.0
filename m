Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A52629AD8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 14:42:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouwBe-0004Pn-AF; Tue, 15 Nov 2022 08:41:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouwBK-0004FB-Ql
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:40:58 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouwBI-0005Vi-Rd
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:40:54 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 r4-20020a1c4404000000b003cfdd569507so505708wma.4
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 05:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g2mNEgXxWQy9J7DvL3Ek2eHOu+pfqj023tFWTto4AbI=;
 b=M6Fh19vbSm1J++PIWVwnNSA+ZPkB0TD8YsBTOb5kLOlRcVPNhucIhgy352VPDZOFNf
 mOb0JvYG9M4Selq2xg4LIRdezSuTJd97/9LazCJnznKyna/6tfWHfFY4Pbh0LQa2V7qy
 AG5uMdDRPYpmbyyH0T/736IsApt4tLb1UOdwHA/kS55/1hkYGzSKoZei6fZ5DaJBkte2
 mrOx66KTGzawQoTMshicSeFCSPYAQA/ohLvSWghoHg1TkuDQOt+kuLOxS+FmH8m23wTp
 YgjuWaXaHq0dg5tMjnZ9U/xUvxygf9p1ChBlkayKdSHju7WdM7XBN7CNIzMX/Xe8EfCN
 p+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g2mNEgXxWQy9J7DvL3Ek2eHOu+pfqj023tFWTto4AbI=;
 b=Cio66O8KrzB6hTA9lw9iimmWlmkVEV4fo/GUxZteXcmVbaBJffaUlV2lL3EcQwrgTo
 VIbV/FHsJD0Oaqfy+atuXwkzBZprC0d9pmfwBemMd05eLtC//qCIbeA97owz36bJ8T3o
 xZkkLYRU3IrIxbqQeqNr+DOrZPD4IJIttNGtpJ9dbAQ56iBrs78QzYSjstfW2At4Jz0F
 i4zx3WR3psUCG5kWF3/Z+qhdQKIKCvpSVJL5/ln4HNG79h0EJix6aA0A5dG8Cc0PJoix
 JWQ39Qgygl9CS69DcFLGIrUDh9ejz5lQUfLsxGrHtc9MYNhizOjIHaMlKkfkRCVxoApn
 w1ow==
X-Gm-Message-State: ANoB5pnJyexsuV2JhhYvKzq/+vM/nE2BlvfhJM4oJQ8uxX4+O7CTSFN3
 Qb/u4e7y1YMaRZJFBhDedD75hg==
X-Google-Smtp-Source: AA0mqf5ZrxFf4uwaDht4SnP/Isn4NHoiROyDzwIPKJ46jW2/F1BkKvEu0FKVJIojYByiHQjR8BSeEA==
X-Received: by 2002:a05:600c:221a:b0:3c6:b7cc:79d2 with SMTP id
 z26-20020a05600c221a00b003c6b7cc79d2mr527403wml.42.1668519649393; 
 Tue, 15 Nov 2022 05:40:49 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b003c6cd82596esm23346895wmq.43.2022.11.15.05.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:40:49 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9C0081FFB7;
 Tue, 15 Nov 2022 13:40:48 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 7.2? v1 0/2] Arm GICv2 patches
Date: Tue, 15 Nov 2022 13:40:46 +0000
Message-Id: <20221115134048.2352715-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Peter,

These are the 2 GICv2 patches as you suggested in the last review. I
don't know if they qualify for 7.2 but here they are if you want them.

Alex Bennée (2):
  hw/intc: clean-up access to GIC multi-byte registers
  hw/intc: add implementation of GICD_IIDR to Arm GIC

 hw/intc/arm_gic.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

-- 
2.34.1


