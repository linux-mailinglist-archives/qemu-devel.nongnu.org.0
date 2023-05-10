Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB806FE327
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 19:18:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwnSH-0004zB-MU; Wed, 10 May 2023 13:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pwnSF-0004yc-Gd; Wed, 10 May 2023 13:18:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pwnSC-00062g-U9; Wed, 10 May 2023 13:18:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id B28DA4EF3;
 Wed, 10 May 2023 20:18:15 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 59CAF38BE;
 Wed, 10 May 2023 20:18:14 +0300 (MSK)
Message-ID: <09e05ecb-dd32-2e6d-fcaf-4ef246a5b2e8@msgid.tls.msk.ru>
Date: Wed, 10 May 2023 20:18:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 86/89] target/riscv: Restore the predicate() NULL check
 behavior
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Cc: Bin Meng <bmeng@tinylab.org>, Fei Wu <fei2.wu@intel.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Alistair Francis
 <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
 <20230505010241.21812-87-alistair.francis@wdc.com>
 <CAKmqyKM2rpOOG4r0NmbBhU79o4_DQjAD7Y1P-fx7GjTW5Z6DGg@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <CAKmqyKM2rpOOG4r0NmbBhU79o4_DQjAD7Y1P-fx7GjTW5Z6DGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

08.05.2023 01:21, Alistair Francis wrote:
> On Fri, May 5, 2023 at 11:08 AM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> From: Bin Meng <bmeng@tinylab.org>
>>
>> When reading a non-existent CSR QEMU should raise illegal instruction
>> exception, but currently it just exits due to the g_assert() check.
>>
>> This actually reverts commit 0ee342256af9205e7388efdf193a6d8f1ba1a617.
>> Some comments are also added to indicate that predicate() must be
>> provided for an implemented CSR.
>>
>> Reported-by: Fei Wu <fei2.wu@intel.com>
>> Signed-off-by: Bin Meng <bmeng@tinylab.org>
>> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> Message-Id: <20230417043054.3125614-1-bmeng@tinylab.org>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> 
> Sorry, I didn't realise I should have done this with the PR, but this
> is a good candidate for going into 8.0.1

Queued for 8.0, with minor context tweak. Thank you!

/mjt

