Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AB76F712D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:38:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoR-00070Y-0n; Thu, 04 May 2023 13:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1puZdS-0001tE-9c
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:08:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1puZdQ-0005nA-GO
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:08:42 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id B4D19400FE;
 Thu,  4 May 2023 17:08:37 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id B57549E;
 Thu,  4 May 2023 17:08:36 +0300 (MSK)
Message-ID: <5b9408e9-be75-17ce-e2f0-71a4ba7caf41@msgid.tls.msk.ru>
Date: Thu, 4 May 2023 17:08:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 0/8] memory: prevent dma-reentracy issues
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20230427211013.2994127-1-alxndr@bu.edu>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230427211013.2994127-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -111
X-Spam_score: -11.2
X-Spam_bar: -----------
X-Spam_report: (-11.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.28,
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

28.04.2023 00:10, Alexander Bulekov wrote:
..
> These patches aim to solve two types of DMA-reentrancy issues:
> 
> 1.) mmio -> dma -> mmio case
> To solve this, we track whether the device is engaged in io by
> checking/setting a reentrancy-guard within APIs used for MMIO access.
> 
> 2.) bh -> dma write -> mmio case
> This case is trickier, since we dont have a generic way to associate a
> bh with the underlying Device/DeviceState. Thus, this version allows a
> device to associate a reentrancy-guard with a bh, when creating it.
> (Instead of calling qemu_bh_new, you call qemu_bh_new_guarded)

Should this patchset (with any follow-up fixes) go to 8.0-stable?

Thanks,

/mjt

