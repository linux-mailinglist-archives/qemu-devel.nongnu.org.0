Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE5D64F3C4
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:12:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IaI-0000SD-LB; Fri, 16 Dec 2022 16:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Ia9-0000RF-Tj
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:49:30 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Ia8-0001eb-EM
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:49:29 -0500
Received: by mail-ej1-x632.google.com with SMTP id gh17so9207090ejb.6
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DS1n89zjWFctpH207GLU2vh7nlSlC63ivQwklpEZR0E=;
 b=xpU/wbdgnHte2AhnyAwP3OKn6uS3is7+qO7Ebduusq/C2nkmjE3LNJdQ0+MmQgOg9+
 4QNoGspdPL2awxbKTBphW/6UxcLgsYPk8LDs1HaVgfdInz++cVPO1rVNUNDWxYCk3ndE
 ES4IVYSaKTMM1NTcuwyNVzkopelvE5l6S305R7B/YC+AI2Tq3bf4IQtA9TYEr6PHg8I9
 FWyWxJ/IG+awNkj7kMWs5d44DVufyAd9tHyIRX7woaNRNWICR5N9oJnxkQOOW4yCt1kX
 Jd9TSBJXh6tjkaaETUQuhcPbAgGzPjeDZmvkUmtEWP/Gc4Jp2AUIOJjT1Vo8eoH30tVe
 Az6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DS1n89zjWFctpH207GLU2vh7nlSlC63ivQwklpEZR0E=;
 b=OdCV+OY/CpMaN8ihTdcKxiw8r1Xx5j6i804u6F9GQozEmm4a5mwAhW0ypLFvS1T2WT
 xd3VswtS+g6bZ4g7t3YYUQ9311omi5gXSFYjuJPhrMINQ4N2dWziKiYrEob15OnlUld4
 r28Juvm54NcoRnWM/QP1PujjLuDcRtVpqK4eP+ceoEuXWcLfjOYOnRJ/AYWb9iGzVC+s
 g+eW+ph/S9NaQweapD50CByJTWQ/Whe5q+zkb8RcKb4yo42z+SYtvh60+8KUTQ+w67z0
 9/w2a7RS5XpytWC+f8PYnt40t5xvNOHrHKYvXqUOHIaGKI/U953wDWV0kuzthoi9KjzZ
 7GJA==
X-Gm-Message-State: ANoB5pn0laStFmncypBeIy7hEFiKgm2k2oFSTuqeC6+Q9S4K7/UodgbL
 RLdnsp3D/GCuP4b4jskYZoyxKg+lkkjzHQko950=
X-Google-Smtp-Source: AA0mqf5zzw5+O4GNmA/AdmVaO1FCiE82Gd/fBJhsie11ICfPP0g0OL2avzTaAVLYTsuVouGwPYNTcw==
X-Received: by 2002:a17:906:bc8b:b0:7c0:9f6f:6d8 with SMTP id
 lv11-20020a170906bc8b00b007c09f6f06d8mr26104000ejb.2.1671227367539; 
 Fri, 16 Dec 2022 13:49:27 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a17090631c500b007bfc5cbaee8sm1314418ejf.17.2022.12.16.13.49.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 13:49:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/2] hw/arm/smmu-common: Avoid using inlined functions with
 external linkage
Date: Fri, 16 Dec 2022 22:49:22 +0100
Message-Id: <20221216214924.4711-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Avoid inlined functions with external linkage,
convert 'inline' header to 'static inline' in source.

Supersedes: <20221208161152.28976-1-philmd@linaro.org>

Philippe Mathieu-Daudé (2):
  hw/arm/smmu-common: Reduce smmu_inv_notifiers_mr() scope
  hw/arm/smmu-common: Avoid using inlined functions with external
    linkage

 hw/arm/smmu-common.c         | 15 +++++++--------
 include/hw/arm/smmu-common.h |  3 ---
 2 files changed, 7 insertions(+), 11 deletions(-)

-- 
2.38.1


