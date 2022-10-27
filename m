Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B1660FA1C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 16:08:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo3Sa-000732-CZ; Thu, 27 Oct 2022 10:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo3SX-0006pj-VZ
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:02:14 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo3SW-0004yE-50
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:02:13 -0400
Received: by mail-wr1-x42d.google.com with SMTP id o4so2337418wrq.6
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 07:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aPnmbweyE1Xy8T+XROprkhTWK5HbMiivGz275jA7ODc=;
 b=zNcEZp/w942WvJsPUrftQ0YRkxpbafbMFoYenHTkmIQLVwDkmSrWlNpg+7vP9wu7kf
 Vs8pZB9OToizI5QMnWSHXEhv28zm1Ubo47LqiqoF/6fv2zxl5i4nTO34OyD6c5t2oLeb
 ti2lmW3nBlOqwKY6gkBn9M7VOWUQdWstAuVFVaBk/6ZIpwjoMLE2S1XI77b6kzYBOUHL
 SVhqqg/iLFUYWAxwtmIc1/QIXBXXETyXw5AGuwSMHSO3/05FZywJYOJGlOGYD6zsxn9O
 Qrr2+kMwmBHPfBlLz3YlLLLhqxqWeVB+JeZlPUSW5Y1a3xag8OZf3hfDEZl0K5JD0Zw3
 7Sug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aPnmbweyE1Xy8T+XROprkhTWK5HbMiivGz275jA7ODc=;
 b=HOgii0FFnT6jcsHG55vla7UV5IjZGpJXsB1Vu4qMJoR+PlVcbrEGYuKg3MiyIQGiKP
 JwOobJokMzbgSmJDMK64SPeTtE4UZDf5EZufvRtbNVtCjgLRgBGOvsGjeraMwkMpl7TE
 exMuVBWu0EySv26gfgcpQ0LR8gERFoGkM8EdAl4WFLDXsi0CzWqkRHXpL0AoWE06XzRl
 0wxPH9Nw6I1/IIolzKEli/F/QavUBl7EeWhIkvAGRdz9BlayBkS39zRE+rlrW551cZAl
 /JS77SvuJczlXQiomfoix8SwitUHHLip4d3zUm/P+KbW1s/f0Gg3UAGtCxp7CGvIeXHo
 wjOw==
X-Gm-Message-State: ACrzQf2TaG0dqVMBHw79mWR1AL9Qdn6wyMrJd0p0AlBvj6QVe5vg0NxD
 Ec8sptkT+6LXmgvgidHyu5otIw==
X-Google-Smtp-Source: AMsMyM4FDXOZ+XHGVw+ewrU1QE5IsoX3rqSeY1H1xH2ap4Bs7sSRNNkvmMV4XMMI60t2/TRHNPEy3g==
X-Received: by 2002:a5d:6ac6:0:b0:236:84b5:6660 with SMTP id
 u6-20020a5d6ac6000000b0023684b56660mr7973284wrw.555.1666879330494; 
 Thu, 27 Oct 2022 07:02:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp6-20020a5d5a86000000b00228a6ce17b4sm1301236wrb.37.2022.10.27.07.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 07:02:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jerome Forissier <jerome.forissier@linaro.org>
Subject: [PATCH 0/2] hw/arm/boot.c: Set EL3 HXen,
 vector lengths when direct booting kernel
Date: Thu, 27 Oct 2022 15:02:05 +0100
Message-Id: <20221027140207.413084-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When we direct boot a kernel on a CPU which emulates EL3, we need to
set up the EL3 system registers as the Linux kernel documentation
specifies:
    https://www.kernel.org/doc/Documentation/arm64/booting.rst

Mostly we get this right, but working through the list of config
bits that need to be set, I found that we'd missed a few things:

- FEAT_HCX: SCR_EL3.HXEn (bit 38) must be initialised to 0b1
- SVE: ZCR_EL3.LEN should be initialized to a sensible value.
  We leave it at 0, which means the guest can only use the
  minimum vector length supported by the CPU, not the full range.
- SME: ditto for SMCR_EL3.LEN

This series fixes those.

thanks
-- PMM

Peter Maydell (2):
  hw/arm/boot: Set SME and SVE EL3 vector lengths when booting kernel
  hw/arm/boot: Set SCR_EL3.HXEn when booting kernel

 hw/arm/boot.c | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.25.1


