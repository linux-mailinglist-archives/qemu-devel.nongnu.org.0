Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F1C43600C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 13:14:42 +0200 (CEST)
Received: from localhost ([::1]:59366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdW1x-0004St-S4
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 07:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mdVzw-0003ah-R5; Thu, 21 Oct 2021 07:12:37 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:41686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mdVzu-0001er-Ip; Thu, 21 Oct 2021 07:12:36 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 9224241562;
 Thu, 21 Oct 2021 13:12:28 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 7D18D60067;
 Thu, 21 Oct 2021 13:12:28 +0200 (CEST)
Received: from [147.171.132.208] (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id CD9D340063;
 Thu, 21 Oct 2021 13:12:27 +0200 (CEST)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-22-frederic.petrot@univ-grenoble-alpes.fr>
 <c3434f40-830b-f762-b1c5-55e10726271d@linaro.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH v3 21/21] target/riscv: support for 128-bit satp
Message-ID: <aae9696e-3d3e-14fe-9207-5e9bb547b5b2@univ-grenoble-alpes.fr>
Date: Thu, 21 Oct 2021 13:12:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c3434f40-830b-f762-b1c5-55e10726271d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (40)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 195.83.24.62
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.267,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/10/2021 à 01:09, Richard Henderson a écrit :
> On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
>> Support for a 128-bit satp. This is a bit more involved than necessary
>> because we took the opportunity to increase the page size to 16kB, and
>> change the page table geometry, which makes the page walk a bit more
>> parametrizable (variables instead of defines).
>> Note that is anyway a necessary step for the merging of the 32-bit and
>> 64-bit riscv versions in a single executable.
>>
>> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
>> Co-authored-by: Fabien Portas<fabien.portas@grenoble-inp.org>
>> ---
>>   target/riscv/cpu-param.h  |   9 +++-
>>   target/riscv/cpu_bits.h   |  10 ++++
>>   target/riscv/cpu_helper.c |  54 ++++++++++++++------
>>   target/riscv/csr.c        | 105 ++++++++++++++++++++++++++++++++------
>>   4 files changed, 144 insertions(+), 34 deletions(-)
> 
> Is there a spec for this?  I don't see anything in the 2021-10-06 draft...

  Indeed, there is nothing close to be standardized on that matter, so we are
  clearly out of bounds, I should probably not have added this in the series.
  FWIW, we wrote a small specification of the schemes we implemented.
  (https://github.com/fpetrot/128-test/blob/main/kernel/vm_spec_short.pdf).

  Frédéric
> 
> 
> r~-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

