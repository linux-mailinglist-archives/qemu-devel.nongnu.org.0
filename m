Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2F057DAA4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 09:11:40 +0200 (CEST)
Received: from localhost ([::1]:37900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEmp1-0000YP-Hq
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 03:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oEmjT-0004Va-BT
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 03:05:55 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:48987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oEmjQ-00039Y-Ob
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 03:05:54 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.227])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id EA75A232F5;
 Fri, 22 Jul 2022 07:05:40 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 22 Jul
 2022 09:05:39 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001c0ab5402-62ce-4943-ae94-18974cadfa17,
 C964DFE1AD449E897551F86C6D919768E4C9FD76) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.2.115.184
Message-ID: <ae6d8345-5a14-3f1e-d544-5f07b0b76a9c@kaod.org>
Date: Fri, 22 Jul 2022 09:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/8] m25p80: Add SFDP support
Content-Language: en-US
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, <qemu-block@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>, Francisco
 Iglesias <frasse.iglesias@gmail.com>, Iris Chen <irischenlj@fb.com>, Michael
 Walle <michael@walle.cc>
References: <20220722063602.128144-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220722063602.128144-1-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 3f2bfa26-25f3-4ac0-a20d-e8e57cd3b5a3
X-Ovh-Tracer-Id: 5495517448188234674
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtuddguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheptdehkeelieetvddtlefgveeuheduheetledvtdfgfeffledvjeekjeegledvkeeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 7/22/22 08:35, Cédric Le Goater wrote:
> Hello,
> 
> This is a refresh of a patchset sent long ago [1] adding support for

[1] was lost while writing the cover :

   https://lore.kernel.org/qemu-devel/20200902093107.608000-1-clg@kaod.org/

C.

> JEDEC STANDARD JESD216 Serial Flash Discovery Parameters (SFDP). SFDP
> describes the features of a serial flash device using a set of internal
> parameter tables. Support in Linux has been added some time ago and
> the spi-nor driver is using it more often to detect the flash settings
> and even flash models.
> 
> Francisco and I are not entirely satisfied with the way the tables are
> defined. We add some private discussion on how to resolve that but
> neither of us had the time to pursue the study. Latest Francisco
> proposal was :
> 
>      #define define_sfdp_read_wrap(model, wrap_sz)            \
>      uint8_t m25p80_sdfp_read_##model(SFDPTable t, uint32_t addr) \
>      {                                                            \
>           return m25p80_sdfp_read(t, addr & (wrap_sz-1));          \
>      }
>      ...
>      define_sfdp_read_wrap(mt25ql512ab, SZ_256)
>      
>      A new variable in the section would solve it aswell but not convinced at the
>      moment if it is clear enough:
>      
>      typedef struct SFDPSection {
>           const uint32_t addr;
>           const uint32_t size;
>           const uint32_t wrap_sz;
>           const uint8_t *data;
>      } SFDPSection;
>      
>      #define SFDP_RAW(start_addr, vals...) \
>      {                                     \
>         .addr = start_addr,                 \
>         .size = sizeof((uint8_t[]){vals}),  \
>         .data = (const uint8_t[]){vals}     \
>      }
>      
>      #define SFDP_RAW_WRAP(start_addr, _wrap_sz, vals...) \
>      {                                     \
>         .addr = start_addr,                 \
>         .size = sizeof((uint8_t[]){vals}),  \
>         .wrap_sz = _wrap_sz,                \
>         .data = (const uint8_t[]){vals}     \
>      }
>      
>      #define SFDP_TABLE_END() { 0 }
>      #define IS_SFDP_END(x) (x.size == 0)
>      
>      #define M35T4545_WRAP_SZ 0x100
>      
>      static const SFDPTable m35t4545 = {
>           SFDP_RAW_WRAP(0, M35T4545_WRAP_SZ,
>                         0x53, 0x46, 0x44, 0x50, 0x00, 0x01, 0x00, 0xff,
>                         0x00, 0x00, 0x01, 0x09, 0x30, 0x00, 0x00, 0xff),
>      
>           SFDP_RAW(0x38,
>                    0xe5, 0x20, 0xfb, 0xff, 0xff, 0xff, 0xff, 0x0f,
>                    0x29, 0xeb, 0x27, 0x6b, 0x08, 0x3b, 0x27, 0xbb,
>                    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x27, 0xbb,
>                    0xff, 0xff, 0x29, 0xeb, 0x0c, 0x20, 0x10, 0xd8,
>                    0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff),
>      
>           SFDP_TABLE_END()
>      };
>      
>      uint8_t m25p80_sfdp_read(SFDPTable t, uint32_t addr)
>      {
>           if (t[0].wrap_sz) {
>               addr &= (t.wrap_sz-1);
>           }
>      
>           for (int i = 0; !IS_SFDP_END(t[i]); i++) {
>               if (addr >= t[i].addr && addr < (t[i].addr + t[i].size)) {
>                   return t[i].data[addr];
>               }
>           }
>           return 0xFF;
>      }
> 
> Since there is a need, we have been using these patches in OpenBMC for
> some time now and other projects/companies have requested it, I am
> resending the patchset as it is to restart the discussion.
> 
> Thanks,
> 
> C.
> 
> Cédric Le Goater (8):
>    m25p80: Add basic support for the SFDP command
>    m25p80: Add the n25q256a SFDP table
>    m25p80: Add the mx25l25635e SFPD table
>    m25p80: Add the mx25l25635f SFPD table
>    m25p80: Add the mx66l1g45g SFDP table
>    m25p80: Add the w25q256 SFPD table
>    m25p80: Add the w25q512jv SFPD table
>    arm/aspeed: Replace mx25l25635e chip model
> 
>   hw/block/m25p80_sfdp.h |  27 ++++
>   hw/arm/aspeed.c        |   6 +-
>   hw/block/m25p80.c      |  49 ++++++-
>   hw/block/m25p80_sfdp.c | 296 +++++++++++++++++++++++++++++++++++++++++
>   MAINTAINERS            |   2 +-
>   hw/block/meson.build   |   1 +
>   hw/block/trace-events  |   1 +
>   7 files changed, 371 insertions(+), 11 deletions(-)
>   create mode 100644 hw/block/m25p80_sfdp.h
>   create mode 100644 hw/block/m25p80_sfdp.c
> 


