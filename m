Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCA66BB6A7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 15:54:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcSV7-0003cn-HG; Wed, 15 Mar 2023 10:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcSUw-0003aK-Ra; Wed, 15 Mar 2023 10:53:02 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcSUu-0002pl-Dk; Wed, 15 Mar 2023 10:53:02 -0400
Received: by mail-io1-xd30.google.com with SMTP id o12so1943584iow.6;
 Wed, 15 Mar 2023 07:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678891974;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=BuvaOfZ/Wt+HI1e/GHjGpIz7wYN5Yon49vtjiAvXON4=;
 b=mZ71dx7cn7rxobTXybZQzfLK1GHXUszS8+qcbIQuP5Xx4+akf4svpB1xMVCigV6UfO
 O0C2tdcnKLXG3/kuDyfwnlYBu2JFlV8SD9cH9e/OPoLhdhHjUvXNUXJw2ppK3v46KA0U
 HdRkJP6a8NgRYLsJ8UNcAV/WrN2nsF4DFMzT5MtgObPuRgo3I3gewvpSUQo60CjhWTtQ
 tQh4rLxrOEkSuvYFiJJpGBdlR/6xwJbJ7U7cL1+H0/xk2omVsznpi7zqPiQ4XWq8KfCt
 qMqKodUdJA0LbMHqvOguRxUa67PY/wRk5mcGIW+Gnl2VUxyxRK3A2DmXlfkOeyjBaLZA
 ncMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678891974;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BuvaOfZ/Wt+HI1e/GHjGpIz7wYN5Yon49vtjiAvXON4=;
 b=rd+RR4dBWeP0kuZDfZv2Z2HG5GDKLySJWjw4cnxPf1afH5riV+jtcRy+IL4XMezEDk
 y19SojLiaJeC8LecpNjeYk1tcDb3yvhYsO4dTVH4VUlQzKuqZMa2hLroi8zbV9Z5w3QL
 x55amgtdJV3+m1U9Ia7aUhWffYtBxn5o1FKRchgHM/4Uh62CsIqBRtaOtZlYGunRwaEn
 E1JfPFQZw4q2pts+MsCXWB36YgwBfxD5JZXnye5kbe6YLAXGxiM01hrz7e4RQJnDNQXZ
 mISv19HyJn2Hsdv0LZAnXRiLgK3k0jcbJxWaOjXO6FOYUvAXyGd0Ii+dJsghqSsfSvTW
 7RGw==
X-Gm-Message-State: AO0yUKXlwKCuTqNpBok8rV2VF2T/8jbGPdPfvBYUJOFXzdPoyz8f3sbK
 I4qmKzZ9A8FDQhHSVi+TtPc=
X-Google-Smtp-Source: AK7set+zBjDw2KFUdyWoo/KbW6TM8eZTv4n4x7ZbNsgdT0wiJgObe0EiT4YI4WL7yKkTiOFplssKwQ==
X-Received: by 2002:a5e:dd48:0:b0:74c:923c:7d84 with SMTP id
 u8-20020a5edd48000000b0074c923c7d84mr25559044iop.7.1678891973804; 
 Wed, 15 Mar 2023 07:52:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a056638022400b0040535426261sm1715461jaq.37.2023.03.15.07.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 07:52:53 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/5] Support both Ethernet interfaces on i.MX6UL and i.MX7
Date: Wed, 15 Mar 2023 07:52:43 -0700
Message-Id: <20230315145248.1639364-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=groeck7@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The SOC on i.MX6UL and i.MX7 has 2 Ethernet interfaces. The PHY on each may
be connected to separate MDIO busses, or both may be connected on the same
MDIO bus using different PHY addresses. Commit 461c51ad4275 ("Add a phy-num
property to the i.MX FEC emulator") added support for specifying PHY
addresses, but it did not provide support for linking the second PHY on
a given MDIO bus to the other Ethernet interface.

To be able to support two PHY instances on a single MDIO bus, two properties
are needed: First, there needs to be a flag indicating if the MDIO bus on
a given Ethernet interface is connected. If not, attempts to read from this
bus must always return 0xffff. Implement this property as phy-connected.
Second, if the MDIO bus on an interface is active, it needs a link to the
consumer interface to be able to provide PHY access for it. Implement this
property as phy-consumer.

The first patch of the series implements support in hw/net/imx_fec.c.
Patches 2..5 set the necessary properties in i.MX6UL and i.MX7 emulations.
With this series in place, both Ethernet interfaces on affected emulations
are functional.

----------------------------------------------------------------
Guenter Roeck (5):
      hw/net/imx_fec: Support two Ethernet interfaces connected to single MDIO bus
      fsl-imx6ul: Add fec[12]-phy-connected properties
      arm/mcimx6ul-evk: Set fec1-phy-connected property to false
      fsl-imx7: Add fec[12]-phy-connected properties
      arm/mcimx7d-sabre: Set fec2-phy-connected property to false

 hw/arm/fsl-imx6ul.c         | 20 ++++++++++++++++++++
 hw/arm/fsl-imx7.c           | 20 ++++++++++++++++++++
 hw/arm/mcimx6ul-evk.c       |  2 ++
 hw/arm/mcimx7d-sabre.c      |  2 ++
 hw/net/imx_fec.c            | 27 +++++++++++++++++++++++----
 include/hw/arm/fsl-imx6ul.h |  1 +
 include/hw/arm/fsl-imx7.h   |  1 +
 include/hw/net/imx_fec.h    |  2 ++
 8 files changed, 71 insertions(+), 4 deletions(-)

