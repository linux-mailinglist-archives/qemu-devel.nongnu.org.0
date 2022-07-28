Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687E05848A7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 01:26:13 +0200 (CEST)
Received: from localhost ([::1]:38534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHCtP-0005wr-W4
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 19:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9208ef30ce=irischenlj@fb.com>)
 id 1oHCr4-0002TS-P0; Thu, 28 Jul 2022 19:23:46 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:60750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9208ef30ce=irischenlj@fb.com>)
 id 1oHCr2-0002ri-Lz; Thu, 28 Jul 2022 19:23:46 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26SKCgni032371;
 Thu, 28 Jul 2022 16:23:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=gZzEABBktv6NAd2k/Leql+AGIcbpwc2oVq6FpQ4WKtQ=;
 b=m+XvSMstaAJfCYUdb89RJokyYHrhBayMUlPqocieh2gN0oe09cyDThWLKpFx1akcbpsx
 6o/bIkyPoo/YostbXKtUWrUp1EmrDZc6RbiNbCk8zN1f4uPdLNm47xEgdXfq1F0LTbhe
 SCWC0uUbH81z07DtBaYFw8DXzmc0L1Ucc40= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3hjw4ff758-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 Jul 2022 16:23:30 -0700
Received: from snc-exhub201.TheFacebook.com (2620:10d:c085:21d::7) by
 snc-exhub104.TheFacebook.com (2620:10d:c085:11d::4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 16:23:28 -0700
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c085:21d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 16:23:27 -0700
From: Iris Chen <irischenlj@fb.com>
To: 
CC: <irischenlj@fb.com>, <peter@pjd.dev>, <pdel@fb.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <clg@kaod.org>,
 <patrick@stwcx.xyz>, <alistair@alistair23.me>, <kwolf@redhat.com>,
 <hreitz@redhat.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <pbonzini@redhat.com>, <qemu-block@nongnu.org>, <dz4list@gmail.com>
Subject: [RFC 0/3] Add Generic SPI GPIO model
Date: Thu, 28 Jul 2022 16:23:19 -0700
Message-ID: <20220728232322.2921703-1-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:208::f]
X-Proofpoint-ORIG-GUID: aoeI0_qCaKz9t8k0bq7QKCGh5yjyc_1v
X-Proofpoint-GUID: aoeI0_qCaKz9t8k0bq7QKCGh5yjyc_1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-28_06,2022-07-28_02,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=9208ef30ce=irischenlj@fb.com;
 helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hey everyone,

I have been working on a project to add support for SPI-based TPMs in QEMU.
Currently, most of our vboot platforms using a SPI-based TPM use the Linux 
SPI-GPIO driver to "bit-bang" the SPI protocol. This is because the Aspeed 
SPI controller (modeled in QEMU under hw/ssi/aspeed_smc.c) has an implementation 
deficiency that prevents bi-directional operations. Thus, in order to connect 
a TPM to this bus, my patch implements a QEMU SPI-GPIO driver (as the QEMU
counterpart of the Linux SPI-GPIO driver).

As we use SPI-based TPMs on many of our BMCs for the secure-boot implementation,  
I have already tested this implementation locally with our Yosemite-v3.5 platform 
and Facebook-OpenBMC. This model was tested by connecting a generic SPI-NOR (m25p80 
for example) to the Yosemite-v3.5 SPI bus containing the TPM.

This patch is an RFC because I have several questions about design. Although the
model is working, I understand there are many areas where the design decision
is not deal (ie. abstracting hard coded GPIO values). Below are some details of the 
patch and specific areas where I would appreciate feedback on how to make this better:
 
hw/arm/aspeed.c: 
I am not sure where the best place is to instantiate the spi_gpio besides the
aspeed_machine_init. Could we add the ability to instantiate it on the command line?

m25p80_transfer8_ex in hw/block/m25p80.c: 
Existing SPI model assumed that the output byte is fully formed, can be passed to 
the SPI device, and the input byte can be returned, all in one operation. With 
SPI-GPIO we don't have the input byte until all 8 bits of the output have been 
shifted out, so we have to prime the MISO with bogus values (0xFF).

MOSI pin in spi_gpio: the mosi pin is not included and we poll the realtime value
of the gpio for input bits to prevent bugs with caching the mosi value. It was discovered 
during testing that when using the mosi pin as the input pin, the mosi value was not 
being updated due to a kernel and aspeed_gpio model optimization. Thus, here we are 
reading the value directly from the gpio controller instead of waiting for the push.

I realize there are Aspeed specifics in the spi_gpio model. To make this extensible, 
is it preferred to make this into a base class and have our Aspeed SPI GPIO extend 
this or we could set up params to pass in the constructor?

Thanks for your review and any direction here would be helpful :) 

Iris Chen (3):
  hw: m25p80: add prereading ability in transfer8
  hw: spi_gpio: add spi gpio model
  hw: aspeed: hook up the spi gpio model

 hw/arm/Kconfig            |   1 +
 hw/arm/aspeed.c           |   5 ++
 hw/block/m25p80.c         |  29 ++++++-
 hw/ssi/Kconfig            |   4 +
 hw/ssi/meson.build        |   1 +
 hw/ssi/spi_gpio.c         | 166 ++++++++++++++++++++++++++++++++++++++
 hw/ssi/ssi.c              |   4 -
 include/hw/ssi/spi_gpio.h |  38 +++++++++
 include/hw/ssi/ssi.h      |   5 ++
 9 files changed, 248 insertions(+), 5 deletions(-)
 create mode 100644 hw/ssi/spi_gpio.c
 create mode 100644 include/hw/ssi/spi_gpio.h

-- 
2.30.2


