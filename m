Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E674A5C4C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 13:31:36 +0100 (CET)
Received: from localhost ([::1]:49212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEsJo-00036I-7w
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 07:31:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nErOT-0004zN-07; Tue, 01 Feb 2022 06:32:20 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:52777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nErOP-0006bX-L9; Tue, 01 Feb 2022 06:32:15 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DE2EC745720;
 Tue,  1 Feb 2022 12:32:08 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C1670745708; Tue,  1 Feb 2022 12:32:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BFF197456FE;
 Tue,  1 Feb 2022 12:32:08 +0100 (CET)
Date: Tue, 1 Feb 2022 12:32:08 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 00/11] target/ppc: powerpc_excp improvements [BookE] (6/n)
In-Reply-To: <4c9d1067-441c-7640-09cb-5e3a26b7e8e2@kaod.org>
Message-ID: <2f5661b4-cbca-748f-e5e0-47935e7cf050@eik.bme.hu>
References: <20220128224018.1228062-1-farosas@linux.ibm.com>
 <c9bb63f8-c2e8-31e5-fe24-b9923c2c1821@eik.bme.hu>
 <4c9d1067-441c-7640-09cb-5e3a26b7e8e2@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1356313181-1643715128=:49132"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1356313181-1643715128=:49132
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 1 Feb 2022, Cédric Le Goater wrote:
> On 1/29/22 01:07, BALATON Zoltan wrote:
>> On Fri, 28 Jan 2022, Fabiano Rosas wrote:
>>> This series handles the BookE exception code.
>>> 
>>> Tested the following machines/CPUs:
>>> 
>>> == bamboo ==
>>> 440ep, 460ex, 440-xilinx-w-dfpu
>>> 
>>> == sam460ex ==
>>> 440ep, 460ex, 440-xilinx-w-dfpu
>> 
>> What OS did you test with? Other than the 460ex may not make much sense on 
>> this board but checking it never hurts. If you only tried Linux kernel then 
>> something else to give more coverage could be the same MorphOS iso that 
>> used for pegasos2 which should also boot on sam460ex as shown here:
>> 
>> http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos
>> 
>> or the AROS iso further up that page that should also boot on sam460ex.
>
> I didn't see any issue.
>
> Could you please give a try to this branch :
>
>  https://gitlab.com/legoater/qemu/-/tree/ppc-7.0

Thanks for testing. It should be fine if it still boots so just go ahead 
and put the series in the next pull request. If I find anything I'll 
report when it's in master, I don't have the resources to follow branches 
but we have a long freeze time to find any bugs so ir should be OK.

Regards,
BALATON Zoltan
--3866299591-1356313181-1643715128=:49132--

