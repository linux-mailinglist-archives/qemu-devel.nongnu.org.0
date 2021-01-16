Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30442F8EEA
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 20:37:44 +0100 (CET)
Received: from localhost ([::1]:35834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0rOJ-00028U-En
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 14:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l0rMf-0001Y5-Jm; Sat, 16 Jan 2021 14:36:01 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:31826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l0rMd-00057I-43; Sat, 16 Jan 2021 14:36:00 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0ACE47456E3;
 Sat, 16 Jan 2021 20:35:55 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D747D7456B8; Sat, 16 Jan 2021 20:35:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D5F1B7456B7;
 Sat, 16 Jan 2021 20:35:54 +0100 (CET)
Date: Sat, 16 Jan 2021 20:35:54 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Recent TCG commit breaks PPC
In-Reply-To: <5310dc77-6fa6-36b2-dd51-cd6e1bebaddb@linaro.org>
Message-ID: <81ac448f-d94f-2764-b96b-30209955a416@eik.bme.hu>
References: <cd52c38c-4b9-791d-fca0-87f99bb0a011@eik.bme.hu>
 <5310dc77-6fa6-36b2-dd51-cd6e1bebaddb@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1903694754-1610825754=:56046"
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1903694754-1610825754=:56046
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 16 Jan 2021, Richard Henderson wrote:
> On 1/16/21 4:38 AM, BALATON Zoltan wrote:
>>
>> Commit 8fe35e0444be (tcg/optimize: Use tcg_constant_internal with constant
>> folding) seems to break PPC emulation for me:
>>
>> Thread 3 "qemu-system-ppc" received signal SIGSEGV, Segmentation fault.
>> [Switching to Thread 0x7ffff51e7700 (LWP 22636)]
>> 0x0000555555afd4ee in ts_are_copies (ts2=0x7fff8c008f90, ts1=0x7fff8c001510) at
>> ../tcg/optimize.c:68
>> 68        return ts_info(ts)->next_copy != ts;
>
> I don't replicate this assertion.
>
> Interestingly, I replicate a different assertion:
>
> qemu-system-ppc: ../qemu/tcg/tcg.c:1210: tcg_temp_alloc: Assertion `n < 512'
> failed.
> Aborted (core dumped)
>
> What compiler version(s) are you guys using?

I'm getting this with gcc 8.4.0

Regards,
BALATON Zoltan
--3866299591-1903694754-1610825754=:56046--

