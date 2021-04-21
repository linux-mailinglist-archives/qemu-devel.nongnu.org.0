Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003CB366652
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 09:38:51 +0200 (CEST)
Received: from localhost ([::1]:50332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ7Rj-0001s7-3I
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 03:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lZ7PT-0000vJ-B8
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 03:36:31 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:15762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lZ7PQ-0000zz-Ls
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 03:36:31 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618990579; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=XYnwc/KouSUoj9yAacizwaNcjcsntLXiqn/3QC06ZAPfnQXzkOVyuZfUcCEq8uKcWp
 QvPURwtWA56rEsiTMZ4fORcw52RwW9KGOi8Xk5H6kxCSrfqPTQyYOFneU3MR3DzLr6EP
 hUW8QQe06EhonJP8yJ19L+Ace4RA09r8+0GZYNzSJUEhqCpgRfCEQ4ASUBbpjQtqoyKF
 vsCAFqcGc2l2ElwCPValcD0uwXmfc6/+Hk0vNJX7AXhbf3IFjOOO7gEOWW6dAyfdYN+b
 5WS2eD3LummMlezO6LUkHBAWlVYpJ+TsXrRFjfmfvY8qPtSYvwqvUjnNSB2fsLw1GFaH
 aZYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1618990579;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=Vp8Yq3XNWEv9Esu1MxarFxhzttR5WQUPqpvSWqi+nig=;
 b=eHbLv6LowG4cNfM0ie/4cu8oyZWLtSgO6FHGZzDVTSlI/S9tPhCLNiaj5AwttyLSrx
 MGMyp0jPI/soGAoTNTCyH0ZZiFxGSy+ng4Sb2/3cbFyUEe1dApFgQ5NLiOEcMkKcTdUH
 ZS73J1ijq9+I2hWNciiuy7TuJWDMpGN8mrDz4Grnyyu+4i4XLaoovOtFsnTD5qFg0BV3
 /wPgGr22wMpwjqAOvfd9dSDz2FSzpV5lLlrEh6w6h3CQBbX1ekYZBe9YXX7pBfO/aCnH
 fspAR80kAr8Q6msPgqHWN/wEaxa8dH0KXkpYEMFxHctSPNYh3VzwY5jxEBMBiuFKTBTf
 SzuQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":LWABbUGmf/p3d3fx281mbpk9zOkHG9L8L9MnY9md4b2JSSHyzkN3ON0Uun6F+zrkVqc/ZmTClqC4x8TtiRZHkgvdiKE9vpOcNvUp/CcHtmvnEw=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2003:c3:9710:2300:1761:34f8:11a8:6e99]
 by smtp.strato.de (RZmta 47.24.3 AUTH)
 with ESMTPSA id U051a9x3L7aHLNZ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 21 Apr 2021 09:36:17 +0200 (CEST)
Subject: Re: [PATCH v2] hw/riscv: Fix OT IBEX reset vector
To: Alistair Francis <alistair23@gmail.com>
References: <20210420080008.119798-1-alexander.wagner@ulal.de>
 <CAKmqyKNhDyO+jLgKnH6ixZkfzCCJYhVG7KUfrs5vzSSKwjCSTw@mail.gmail.com>
From: Alexander Wagner <alexander.wagner@ulal.de>
Message-ID: <835877d6-6ed9-b0d9-2579-bbf48ce68bde@ulal.de>
Date: Wed, 21 Apr 2021 09:36:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNhDyO+jLgKnH6ixZkfzCCJYhVG7KUfrs5vzSSKwjCSTw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: none client-ip=85.215.255.21;
 envelope-from=alexander.wagner@ulal.de; helo=mo4-p00-ob.smtp.rzone.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 21.04.21 02:00, Alistair Francis wrote:
> On Tue, Apr 20, 2021 at 6:01 PM Alexander Wagner
> <alexander.wagner@ulal.de> wrote:
>> The IBEX documentation [1] specifies the reset vector to be "the most
>> significant 3 bytes of the boot address and the reset value (0x80) as
>> the least significant byte".
>>
>> [1] https://github.com/lowRISC/ibex/blob/master/doc/03_reference/exception_interrupts.rst
>>
>> Signed-off-by: Alexander Wagner <alexander.wagner@ulal.de>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Thanks!
>
> Applied to riscv-to-apply.next

Perfect, thank you :)

Regards

Alex


