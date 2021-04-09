Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D683590C5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 02:08:17 +0200 (CEST)
Received: from localhost ([::1]:44700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUeh5-00036Q-RT
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 20:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUecC-0001Fr-MC; Thu, 08 Apr 2021 20:03:12 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:35335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUecA-0005Ce-Ks; Thu, 08 Apr 2021 20:03:12 -0400
Received: by mail-pf1-x434.google.com with SMTP id n38so3044659pfv.2;
 Thu, 08 Apr 2021 17:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6EQ33cLsvaMdyk9vZ1RjmmWSEqY5Z0Yx1WWV7OjMVSY=;
 b=cwfOIOV5NeQ0atG6S3nvh1PPBzKcBBAe1NIsxIeFXhlxU8DK7I/uLkBDFemC6HqSD0
 yu9GCyvFQFO4vHV2J9vP0d+kIEz2mQGDxrta5FHGZkr29/rBCJWEKUYgro9lBimlqXHT
 C5OU2G3QkxwReJwTyc7VOF7GtdJIz1eTAI1hbxgj2XlqUFI+UYLrkcH/Vk914WzON/fW
 DeA5N6Fvpq6nxoxMcweAttgxKZ8eDsNkDBrwv6SDABgNNj9h3Uc2LTiXBJwPPU7kIWkk
 XTrsJtRNv+fDSuaUYgzrnIFA4UOeDYazFQ5/5ZWabgjgFtoth50FZ4++tCYMURkIyMRK
 Kyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=6EQ33cLsvaMdyk9vZ1RjmmWSEqY5Z0Yx1WWV7OjMVSY=;
 b=jPfeL6i0IU+iBFr3RvGYaMABhLTTS3FshQ9hmt17yV5oEylzFS9c+ycQJ8DRGuRFVN
 UES9DkQqQt8PPuESpwRSKz4pIGsBh57ARcidjWiDiDowPbYXv9aqmg0i/jNj8X9JTUB2
 bPeHnSh8JAMtsU0j+1tfMO/LvMWuvCFNUUv5ktW4bLVJYmU8MximgNJcX4M8iBef7v7F
 zLu3FUmBVPKAKl0qFhej53y76LQ3vIk64ZHZedpeEqqAksX6VSiSHA2MklbRWCCAK8kq
 bGGj+Xhw7Vra4akXbxIGAsWGDLhTP7WzyvGi7Xq0gnB7hDQVVl7WOONlk+CJJ7+VZ/SX
 41xg==
X-Gm-Message-State: AOAM533cspRI1dzSMo6Odg/CkSYkLdVMKwtStKlZk9C8JaoBwr9dh5Me
 WtUkVlX59D7uam4wMNF4frk=
X-Google-Smtp-Source: ABdhPJzLYYEZdvYJECV8D/qPCt6p5s/KQCxqLv4QRHXg8lGk6xITXO8Nyp+5iB08bX2XcLVAjdKNYw==
X-Received: by 2002:a63:62c4:: with SMTP id
 w187mr10045122pgb.173.1617926588724; 
 Thu, 08 Apr 2021 17:03:08 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id f17sm393406pfk.184.2021.04.08.17.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 17:03:07 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v5 0/3] hw/misc: Model ASPEED hash and crypto engine
Date: Fri,  9 Apr 2021 09:32:50 +0930
Message-Id: <20210409000253.1475587-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This version of the series adds the cleanups Cédric made and the scatter
gather feature that Klaus implemented. I took inspiration from Klaus's
patches and reworked the direct hashing mode to easier implement both sg
and direct modes.

The r-b tags are preserved as the changes were minor. I welcome further
review though if you have time.

v5: Merge scatter gather feature
v4: Rebase on Philippe's memory region cleanup series [1]
    Address feedback from Cédric
    Rework qtest to run on ast2400, ast2500 and ast2600
v3: Rework qtest to not use libqtest-single.h, rebase to avoid LPC
conflicts.
v2: Address review from Andrew and Philippe. Adds a qtest.

[1] https://lore.kernel.org/qemu-devel/20210312182851.1922972-1-f4bug@amsat.org/

This adds a model for the ASPEED hash and crypto engine (HACE) found on
all supported ASPEED SoCs.

The model uses Qemu's gcrypto API to perform the SHA and MD5 hashing
directly in the machine's emulated memory space, which I found a neat
use of Qemu's features.

It has been tested using u-boot and from Linux userspace, and adds a
qtest for the model running as part of the ast2600-evb, ast2500-evb and
palmetto-bmc (to test ast2400) machines.

Note that the tests will fail without Philippe/Cédric's memory region series.

Joel Stanley (3):
  hw: Model ASPEED's Hash and Crypto Engine
  aspeed: Integrate HACE
  tests/qtest: Add test for Aspeed HACE

 docs/system/arm/aspeed.rst     |   2 +-
 include/hw/arm/aspeed_soc.h    |   3 +
 include/hw/misc/aspeed_hace.h  |  43 +++
 hw/arm/aspeed_ast2600.c        |  15 ++
 hw/arm/aspeed_soc.c            |  16 ++
 hw/misc/aspeed_hace.c          | 389 +++++++++++++++++++++++++++
 tests/qtest/aspeed_hace-test.c | 469 +++++++++++++++++++++++++++++++++
 MAINTAINERS                    |   1 +
 hw/misc/meson.build            |   1 +
 tests/qtest/meson.build        |   3 +
 10 files changed, 941 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/misc/aspeed_hace.h
 create mode 100644 hw/misc/aspeed_hace.c
 create mode 100644 tests/qtest/aspeed_hace-test.c

-- 
2.30.2


