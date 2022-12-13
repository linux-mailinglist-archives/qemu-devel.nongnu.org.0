Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A321264B57D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 13:54:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p54lo-0008VK-TX; Tue, 13 Dec 2022 07:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54lk-0008Uh-2F
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:52:24 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54li-0002yc-Ez
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:52:23 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so7805485wmb.2
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 04:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3bfzNnoI5loXrPkezvGfbdzUW6/ZLveS30TWnXZXaBg=;
 b=JM16wLaqrsHvNIWTJ561XYEmz0daMJhk9cT5BctIO/NWCtE9/Fivhy43SrpItVHXFB
 6QodV7H2+sUJON9Yd3UKewPT/be6ixGnqhEHwWhsp8yjFfR2c5jtH3SYB182DGCO7WH9
 1oN0QGjzL5g0lpNmxIFnbeG4jH7W8GyJvE1qP9ZYvakeaSEG4KoxDTXNu2nVud+yAQhE
 EZOH/M3bWGhaBCCtOyxYwvGwwdNWUAgMOZPQVvqi2h9f9rJGuL9RrAfEoxYg436uOB3l
 DHAjj4Euvp7sZSqbpi2G7rUbA8BjKjXoXs9OXeatF6zCRLfAmQ6VZyehTXCptdvEmf8U
 amlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3bfzNnoI5loXrPkezvGfbdzUW6/ZLveS30TWnXZXaBg=;
 b=xfc4PQcgZKzVypsHOtiY17H+I0VlV9XO56vbVVH7TxBmSMh1Z83KPNIaaU+wLAD7M4
 91qppZZs9aVSdQ2ZRSDK2h1KmwCelR9cg+IvUCAS4TBm7MjxQg7QESdP3yCWO5yeaUEf
 JfarysHp2vedZ1j8WnWg/nMVBP2IPE2eDD1biNgoKAyZIW7Y/cVOVaDagG9o5NttWZK7
 OHN/RGb8uxLhHG3aIO+HeVGYZOklzJPX60T36QxnZ1D2navpua/ChqImoPiQppbECbad
 5A4EECzcWSVnWqF3s+CeX7MgOPim5k14tTw72eEer6LaByug466zt2BcmwDBdRvAe1q+
 YIjQ==
X-Gm-Message-State: ANoB5pncaYrt4ZCK9DuDYbe1h9gNwj9N9mYey2N6RuYQ7n4u4SSvhIe6
 exuLs2uGAgU6Y2alxSk4CrCTg5NnNjCRpWsadXg=
X-Google-Smtp-Source: AA0mqf77irf7zNXmukiwrDTKwDbegq7MpBSRdmRGEPFf/pC1gqsGLpzpmScsSOdw6DgaepqGCBYmIQ==
X-Received: by 2002:a7b:c00a:0:b0:3cf:cfcd:1f5 with SMTP id
 c10-20020a7bc00a000000b003cfcfcd01f5mr15085047wmb.38.1670935940762; 
 Tue, 13 Dec 2022 04:52:20 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p25-20020a05600c205900b003a6125562e1sm12499949wmg.46.2022.12.13.04.52.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Dec 2022 04:52:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-8.0 0/3] hw/ppc: Remove tswap() calls
Date: Tue, 13 Dec 2022 13:52:15 +0100
Message-Id: <20221213125218.39868-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Hi,

I am trying to remove the tswap() API from system
emulation and replace it by more meaningful calls,
because tswap depends on the host endianness, and
this detail should be irrelevant from the system
emulation PoV.

In this RFC series I'm trying to convert the PPC
calls.

Any help in understanding what was the original
author intention is welcomed :)

Thanks,

Phil.

Philippe Mathieu-Daudé (3):
  hw/ppc: Replace tswap32() by const_le32()
  hw/ppc/spapr: Replace tswap64(HPTE) by cpu_to_be64(HPTE)
  hw/net/xilinx_ethlite: Replace tswap32() by be32_to_cpu()

 hw/net/xilinx_ethlite.c | 10 +++++-----
 hw/ppc/sam460ex.c       |  3 ++-
 hw/ppc/spapr.c          |  9 +++++----
 hw/ppc/virtex_ml507.c   |  3 ++-
 4 files changed, 14 insertions(+), 11 deletions(-)

-- 
2.38.1


