Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2961357DA7A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 08:44:45 +0200 (CEST)
Received: from localhost ([::1]:39410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEmOy-0006T2-6g
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 02:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org>)
 id 1oEmGt-000892-TH; Fri, 22 Jul 2022 02:36:23 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:57353
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org>)
 id 1oEmGr-0000zC-5C; Fri, 22 Jul 2022 02:36:23 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Lq07v5KRCz4xGH;
 Fri, 22 Jul 2022 16:36:11 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lq07p5ngfz4xG6;
 Fri, 22 Jul 2022 16:36:06 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 0/8] m25p80: Add SFDP support 
Date: Fri, 22 Jul 2022 08:35:54 +0200
Message-Id: <20220722063602.128144-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Hello, 

This is a refresh of a patchset sent long ago [1] adding support for
JEDEC STANDARD JESD216 Serial Flash Discovery Parameters (SFDP). SFDP
describes the features of a serial flash device using a set of internal
parameter tables. Support in Linux has been added some time ago and
the spi-nor driver is using it more often to detect the flash settings
and even flash models.

Francisco and I are not entirely satisfied with the way the tables are
defined. We add some private discussion on how to resolve that but
neither of us had the time to pursue the study. Latest Francisco
proposal was : 

    #define define_sfdp_read_wrap(model, wrap_sz)            \
    uint8_t m25p80_sdfp_read_##model(SFDPTable t, uint32_t addr) \
    {                                                            \
         return m25p80_sdfp_read(t, addr & (wrap_sz-1));          \
    }
    ...
    define_sfdp_read_wrap(mt25ql512ab, SZ_256)
    
    A new variable in the section would solve it aswell but not convinced at the
    moment if it is clear enough:
    
    typedef struct SFDPSection {
         const uint32_t addr;
         const uint32_t size;
         const uint32_t wrap_sz;
         const uint8_t *data;
    } SFDPSection;
    
    #define SFDP_RAW(start_addr, vals...) \
    {                                     \
       .addr = start_addr,                 \
       .size = sizeof((uint8_t[]){vals}),  \
       .data = (const uint8_t[]){vals}     \
    }
    
    #define SFDP_RAW_WRAP(start_addr, _wrap_sz, vals...) \
    {                                     \
       .addr = start_addr,                 \
       .size = sizeof((uint8_t[]){vals}),  \
       .wrap_sz = _wrap_sz,                \
       .data = (const uint8_t[]){vals}     \
    }
    
    #define SFDP_TABLE_END() { 0 }
    #define IS_SFDP_END(x) (x.size == 0)
    
    #define M35T4545_WRAP_SZ 0x100
    
    static const SFDPTable m35t4545 = {
         SFDP_RAW_WRAP(0, M35T4545_WRAP_SZ,
                       0x53, 0x46, 0x44, 0x50, 0x00, 0x01, 0x00, 0xff,
                       0x00, 0x00, 0x01, 0x09, 0x30, 0x00, 0x00, 0xff),
    
         SFDP_RAW(0x38,
                  0xe5, 0x20, 0xfb, 0xff, 0xff, 0xff, 0xff, 0x0f,
                  0x29, 0xeb, 0x27, 0x6b, 0x08, 0x3b, 0x27, 0xbb,
                  0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x27, 0xbb,
                  0xff, 0xff, 0x29, 0xeb, 0x0c, 0x20, 0x10, 0xd8,
                  0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff),
    
         SFDP_TABLE_END()
    };
    
    uint8_t m25p80_sfdp_read(SFDPTable t, uint32_t addr)
    {
         if (t[0].wrap_sz) {
             addr &= (t.wrap_sz-1);
         }
    
         for (int i = 0; !IS_SFDP_END(t[i]); i++) {
             if (addr >= t[i].addr && addr < (t[i].addr + t[i].size)) {
                 return t[i].data[addr];
             }
         }
         return 0xFF;
    }

Since there is a need, we have been using these patches in OpenBMC for
some time now and other projects/companies have requested it, I am
resending the patchset as it is to restart the discussion.

Thanks,

C.

Cédric Le Goater (8):
  m25p80: Add basic support for the SFDP command
  m25p80: Add the n25q256a SFDP table
  m25p80: Add the mx25l25635e SFPD table
  m25p80: Add the mx25l25635f SFPD table
  m25p80: Add the mx66l1g45g SFDP table
  m25p80: Add the w25q256 SFPD table
  m25p80: Add the w25q512jv SFPD table
  arm/aspeed: Replace mx25l25635e chip model

 hw/block/m25p80_sfdp.h |  27 ++++
 hw/arm/aspeed.c        |   6 +-
 hw/block/m25p80.c      |  49 ++++++-
 hw/block/m25p80_sfdp.c | 296 +++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS            |   2 +-
 hw/block/meson.build   |   1 +
 hw/block/trace-events  |   1 +
 7 files changed, 371 insertions(+), 11 deletions(-)
 create mode 100644 hw/block/m25p80_sfdp.h
 create mode 100644 hw/block/m25p80_sfdp.c

-- 
2.35.3


