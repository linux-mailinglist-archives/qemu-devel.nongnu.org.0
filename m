Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B114EDDDD
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:48:47 +0200 (CEST)
Received: from localhost ([::1]:60648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZx2T-0001OW-UE
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:48:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nZx15-00087M-Hb
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:47:20 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:45811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nZx13-0002y5-PK
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:47:19 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.235])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8E202F1DDF4D;
 Thu, 31 Mar 2022 17:47:14 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 31 Mar
 2022 17:47:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003d22a0566-0e0d-431c-8234-d6f57373ec20,
 FC9088D273F6636B0CAAD4892A2C3D02B7ACC8E0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6e563c03-1551-4da6-efdb-1b12e03b3c39@kaod.org>
Date: Thu, 31 Mar 2022 17:47:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v2 0/5] Port PPC64/PowerNV MMU tests to QEMU
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, <qemu-devel@nongnu.org>, 
 <qemu-ppc@nongnu.org>, Fabiano Rosas <farosas@linux.ibm.com>
References: <20220331145813.21719-1-leandro.lupori@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220331145813.21719-1-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: afcd42af-05a1-4353-9c54-e41d8b199181
X-Ovh-Tracer-Id: 14772369730072841138
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Leandro,

I think we should start looking at semihosting like Richard proposed
and for it, rework the QEMU attn implementation or may be use a special
form of scv.

It should not change too much the tests, only exit and output which
would remove the dependency on the platform console. In the long run,
it looks like  a good investment for more low level tests.

Thanks,

C.

On 3/31/22 16:58, Leandro Lupori wrote:
> Changes from v1:
> - added new files to MAINTAINERS, under PowerPC TCG CPUs, and added
>    myself as a reviewer (not sure if this is the right procedure)
> - removed the "virtual" ppc64le-softmmu target.
>    ppc64/Makefile.softmmu-target now builds all tests in both BE and LE
> 
> Cédric Le Goater (2):
>    target/ppc: Add support for the Processor Attention instruction
>    ppc/pnv: Activate support for the Processor Attention instruction
> 
> Leandro Lupori (3):
>    tests/tcg/ppc64: add basic softmmu test support
>    tests/tcg/ppc64: add MMU test sources
>    tests/tcg/ppc64: build PowerNV and LE tests
> 
>   MAINTAINERS                              |   2 +
>   hw/ppc/pnv_core.c                        |   6 +
>   include/hw/ppc/pnv_core.h                |   1 +
>   target/ppc/cpu.h                         |   8 +
>   target/ppc/excp_helper.c                 |  27 +
>   target/ppc/helper.h                      |   1 +
>   target/ppc/translate.c                   |  14 +
>   tests/tcg/ppc64/Makefile.softmmu-rules   |  34 +
>   tests/tcg/ppc64/Makefile.softmmu-target  | 124 ++++
>   tests/tcg/ppc64/system/include/asm.h     |  62 ++
>   tests/tcg/ppc64/system/include/console.h |  15 +
>   tests/tcg/ppc64/system/include/io.h      |  61 ++
>   tests/tcg/ppc64/system/include/pnv.h     |  21 +
>   tests/tcg/ppc64/system/include/uart.h    |  54 ++
>   tests/tcg/ppc64/system/lib/boot.S        |  68 ++
>   tests/tcg/ppc64/system/lib/console.c     | 173 +++++
>   tests/tcg/ppc64/system/lib/powerpc.lds   |  27 +
>   tests/tcg/ppc64/system/mmu-head.S        | 142 +++++
>   tests/tcg/ppc64/system/mmu.c             | 764 +++++++++++++++++++++++
>   tests/tcg/ppc64/system/mmu.h             |   9 +
>   20 files changed, 1613 insertions(+)
>   create mode 100644 tests/tcg/ppc64/Makefile.softmmu-rules
>   create mode 100644 tests/tcg/ppc64/Makefile.softmmu-target
>   create mode 100644 tests/tcg/ppc64/system/include/asm.h
>   create mode 100644 tests/tcg/ppc64/system/include/console.h
>   create mode 100644 tests/tcg/ppc64/system/include/io.h
>   create mode 100644 tests/tcg/ppc64/system/include/pnv.h
>   create mode 100644 tests/tcg/ppc64/system/include/uart.h
>   create mode 100644 tests/tcg/ppc64/system/lib/boot.S
>   create mode 100644 tests/tcg/ppc64/system/lib/console.c
>   create mode 100644 tests/tcg/ppc64/system/lib/powerpc.lds
>   create mode 100644 tests/tcg/ppc64/system/mmu-head.S
>   create mode 100644 tests/tcg/ppc64/system/mmu.c
>   create mode 100644 tests/tcg/ppc64/system/mmu.h
> 


