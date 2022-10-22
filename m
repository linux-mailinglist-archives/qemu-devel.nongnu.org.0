Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EB06082D9
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 02:28:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om25E-0008Ta-So; Fri, 21 Oct 2022 20:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1om25C-0008Su-5U; Fri, 21 Oct 2022 20:09:46 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1om25A-0001Qk-4I; Fri, 21 Oct 2022 20:09:45 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 00EBB74638A;
 Sat, 22 Oct 2022 02:09:39 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 894FA74633D; Sat, 22 Oct 2022 02:09:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 87068746307;
 Sat, 22 Oct 2022 02:09:38 +0200 (CEST)
Date: Sat, 22 Oct 2022 02:09:38 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org, 
 philmd@linaro.org
Subject: Re: [PATCH v7 1/8] ppc440_uc.c: Move DDR2 SDRAM controller model to
 ppc4xx_sdram.c
In-Reply-To: <9cf98147-3ddb-c456-78e1-afcbc3e61881@gmail.com>
Message-ID: <8f8b5db8-8c69-7bac-617d-933ee040a0f6@eik.bme.hu>
References: <cover.1666194485.git.balaton@eik.bme.hu>
 <2f2900f93e997480e54b7bf9c32bb482a0fb1022.1666194485.git.balaton@eik.bme.hu>
 <9cf98147-3ddb-c456-78e1-afcbc3e61881@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1543829206-1666397378=:36122"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1543829206-1666397378=:36122
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 21 Oct 2022, Daniel Henrique Barboza wrote:
>> diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
>> new file mode 100644
>> index 0000000000..b49a7ed60a
>> --- /dev/null
>> +++ b/hw/ppc/ppc4xx_sdram.c
>> @@ -0,0 +1,348 @@
>> +/*
>> + * DDR2 SDRAM controller:
>> + * Copyright (c) 2012 François Revol
>> + * Copyright (c) 2016-2019 BALATON Zoltan
>
>
> Shouldn't your Copyright be 2016-2022 for this new file?
>
>
> The rest LGTM
>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Thanks for the review. I'm not sure about the date. I did not intend to 
increment this every year or with every little change. It mainly records 
the time it was originally wrritten or when major changes were made. I 
can't decide if these changes in this series are big enough to need a new 
copyright date but I don't mind either way so I let you decide. I'm OK 
with it as it is or also if you update it on merge.

Regards,
BALATON Zoltan
--3866299591-1543829206-1666397378=:36122--

