Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28C46FE326
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 19:18:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwnRk-0004T9-M2; Wed, 10 May 2023 13:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pwnRh-0004Sn-HG; Wed, 10 May 2023 13:17:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pwnRf-0005zY-IZ; Wed, 10 May 2023 13:17:45 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 1EE054EF1;
 Wed, 10 May 2023 20:17:33 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id BFFB838BD;
 Wed, 10 May 2023 20:17:31 +0300 (MSK)
Message-ID: <cd499721-caa4-233e-2390-0bd4e88cd1ec@msgid.tls.msk.ru>
Date: Wed, 10 May 2023 20:17:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 19/89] target/riscv: Fix itrigger when icount is used
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Alistair Francis <alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
 <20230505010241.21812-20-alistair.francis@wdc.com>
 <CAKmqyKNSSbsBmTdTc3eAhu2umqR75_5qbugH5Kv=6dZTGQo+wQ@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <CAKmqyKNSSbsBmTdTc3eAhu2umqR75_5qbugH5Kv=6dZTGQo+wQ@mail.gmail.com>
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

08.05.2023 01:22, Alistair Francis wrote:
> On Fri, May 5, 2023 at 11:04 AM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>>
>> When I boot a ubuntu image, QEMU output a "Bad icount read" message and exit.
>> The reason is that when execute helper_mret or helper_sret, it will
>> cause a call to icount_get_raw_locked (), which needs set can_do_io flag
>> on cpustate.
>>
>> Thus we setting this flag when execute these two instructions.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>> Message-Id: <20230324064011.976-1-zhiwei_liu@linux.alibaba.com>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> 
> This is also a good candidate for 8.0.1

Queued for 8.0 (and for 7.2 if it will ever be).  Thanks!

/mjt

