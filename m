Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE11D68A47E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 22:17:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO3Qb-0000Iy-BF; Fri, 03 Feb 2023 16:17:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO3Q8-0000Dr-00
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:16:34 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO3Q5-00069v-Ku
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:16:31 -0500
Received: by mail-ej1-x62b.google.com with SMTP id p26so18749422ejx.13
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 13:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dNBog4OJsTIuq57RdLP8lPwyYAvHRuqVPpEC+RlZA5k=;
 b=BVnMBRS6BDHfGFvQxHH1OMLoWo7/qDzSyRWKj8YqQ7hK/14Ap8rib7wk3JYt5skQxn
 7LduF7HWUm/qGzp7UGjsjuNVcPXKnAs4vFu9sp2BDAQQPL+4M8xZ+Z5BRuJgImTyzr13
 gV71ys7vdyqrXhMcTyqPcHdPqL96a57dPeLnA8Lw/w+i66q7iSqQU3ib4Lh4g81uG/Ny
 dZa8TUQIdQndZoEoBFbhqRQ5Eo/mVQ2B212j/PJd2J5Z+eovFu+v08Dutsgu/UQujY/z
 kE7A0JUSrS8GQ8iqZFmigE4HW1wbZYt6zYadELq0Oyl0TTcz6/L9+sHiWABclPfS/6IW
 0yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dNBog4OJsTIuq57RdLP8lPwyYAvHRuqVPpEC+RlZA5k=;
 b=01OrIs1XglsYvCil4eDpN27TMfKizCiecAkCPM7rx+oU9L6wJl8wR/fR7Xf+6877yB
 9pGiyvylieX9tpCiAIb4N4DYDkOe+HFhjkSVfh6X64eUePITG9JCus3HC7vJGY48vgXG
 qvyZ7BrocvnVQbeyaHBdISBOJX+frbeay4baJOjarvKqdUTjXh++JcDcO2xnmvTXl92c
 h3Re5jeB5iQJy5jIsTA4QVaWhiQibKcw1aL1zHc+l6NQUz45579QL0dyNVspkKzhFH92
 QdNDB4S0d1GS4NB6UrHtnF6wsm0zMwENotnTONKOoJc7yiRXxdebP3jHbRcz2Ag8/na3
 BQog==
X-Gm-Message-State: AO0yUKX8bTdmw9VnlZPZePlAnJpnYgm0b+h9H2PHz+bEwmskVFD2V5yN
 v8yu2BDU1/213/38tmJ+9jTDt88zF/wCY2mg
X-Google-Smtp-Source: AK7set/Cdq0ZuVZWnaaTbalekJjSgfWGL02dIvlRNLEa44G8g683jWyE8MXOIZzfITMVePlQ5BA0Yw==
X-Received: by 2002:a17:906:bc43:b0:88d:fe1:1ac7 with SMTP id
 s3-20020a170906bc4300b0088d0fe11ac7mr10813644ejv.60.1675458987227; 
 Fri, 03 Feb 2023 13:16:27 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 jo10-20020a170906f6ca00b00878812a8d14sm1885142ejb.85.2023.02.03.13.16.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 13:16:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] hw/ppc: Set QDev properties using QDev API (part 2/3)
Date: Fri,  3 Feb 2023 22:16:18 +0100
Message-Id: <20230203211623.50930-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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

part 1 [*] cover:
--
QEMU provides the QOM API for core objects.
Devices are modelled on top of QOM as QDev objects.

There is no point in using the lower level QOM API with
QDev; it makes the code more complex and harder to review.

I first converted all the calls using errp=&error_abort or
&errp=NULL, then noticed the other uses weren't really
consistent.

A QDev property defined with the DEFINE_PROP_xxx() macros
is always available, thus can't fail. When using hot-plug
devices, we only need to check for optional properties
registered at runtime with the object_property_add_XXX()
API. Some are even always registered in device instance_init.
--

In this series PPC hw is converted. Only one call site in PNV
forwards the Error* argument and its conversion is justified.

Based-on: <20230203180914.49112-1-philmd@linaro.org>
(in particular [PATCH 02/19] hw/qdev: Introduce qdev_prop_set_link():
 https://lore.kernel.org/qemu-devel/20230203180914.49112-3-philmd@linaro.org/)

[*] https://lore.kernel.org/qemu-devel/20230203180914.49112-1-philmd@linaro.org/

Philippe Mathieu-Daudé (5):
  hw/misc/macio: Set QDev properties using QDev API
  hw/pci-host/raven: Set QDev properties using QDev API
  hw/ppc/ppc4xx: Set QDev properties using QDev API
  hw/ppc/spapr: Set QDev properties using QDev API
  hw/ppc/pnv: Set QDev properties using QDev API

 hw/intc/pnv_xive.c         | 11 ++++------
 hw/intc/pnv_xive2.c        | 15 +++++---------
 hw/intc/spapr_xive.c       | 11 ++++------
 hw/intc/xics.c             |  4 ++--
 hw/intc/xive.c             |  4 ++--
 hw/misc/macio/macio.c      |  6 ++----
 hw/pci-host/pnv_phb3.c     |  9 +++------
 hw/pci-host/pnv_phb4.c     |  4 ++--
 hw/pci-host/pnv_phb4_pec.c | 10 +++-------
 hw/pci-host/raven.c        |  6 ++----
 hw/ppc/e500.c              |  3 +--
 hw/ppc/pnv.c               | 41 ++++++++++++++++----------------------
 hw/ppc/pnv_psi.c           | 10 +++-------
 hw/ppc/ppc405_boards.c     |  6 ++----
 hw/ppc/ppc405_uc.c         |  6 +++---
 hw/ppc/ppc440_bamboo.c     |  3 +--
 hw/ppc/ppc4xx_devs.c       |  2 +-
 hw/ppc/sam460ex.c          |  5 ++---
 hw/ppc/spapr_irq.c         |  8 +++-----
 19 files changed, 62 insertions(+), 102 deletions(-)

-- 
2.38.1


