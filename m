Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BCE43A76F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 00:47:43 +0200 (CEST)
Received: from localhost ([::1]:53388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf8ko-0006sM-Q3
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 18:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mf8jT-0006CQ-ED
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 18:46:19 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:40975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mf8jR-0002cG-RE
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 18:46:19 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6471A746353;
 Tue, 26 Oct 2021 00:46:16 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E28C0746333; Tue, 26 Oct 2021 00:46:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DD2507462D3;
 Tue, 26 Oct 2021 00:46:15 +0200 (CEST)
Date: Tue, 26 Oct 2021 00:46:15 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: Commit abb0cd93494 breaks -singlestep -d in_asm,cpu with
 qemu-system-sh4
In-Reply-To: <2f43f570-6ff6-610d-ff98-e566a0cfd0cb@amsat.org>
Message-ID: <d03b87-c341-bc9e-693e-aad0741397f@eik.bme.hu>
References: <ec65bc8f-2f99-9f49-d6ee-7b96e67a3a1b@eik.bme.hu>
 <2f43f570-6ff6-610d-ff98-e566a0cfd0cb@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-390510809-1635201975=:53658"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-390510809-1635201975=:53658
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 25 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/25/21 23:16, BALATON Zoltan wrote:
>> Hello,
>>
>> Commit abb0cd93494 (accel/tcg: Split out log_cpu_exec) seems to have
>> broken -singlestep -d in_asm,cpu output with qemu-system-sh4 after a
>> delay slot.
> [...]
>> However I still don't understand how the delayed branch ends up at
>> 0x8c800964 instead of 0x8c801528 above. Is this ouput not showing some
>> already translated TBs even with -singlestep -d in_asm,cpu,nochain and
>> that's why I see those cpu dumps without instructions? What's the
>> correct way to get a trace of all executed instructions?
>
> IIUC this commit you now need to use both cpu,exec to get the output?

Nope, I get the same even adding exec. I think it now also prints 
registers for already translated instructions where in_asm produces no 
ouput whereas before it was only dumping state when in_asm also had ouput. 
So now we get a lot more cpu state but we don't really know what they are 
for. Not sure what's the use of that, the previous output looked more 
useful.

Regards,
BALATON Zoltan
--3866299591-390510809-1635201975=:53658--

