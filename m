Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE7B4FE80D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 20:31:51 +0200 (CEST)
Received: from localhost ([::1]:49304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neLIs-0003wg-16
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 14:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1neLEI-0008N5-VG
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 14:27:09 -0400
Received: from smtp59.i.mail.ru ([217.69.128.39]:34798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1neLEF-0000qI-RQ
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 14:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=53hal0tlAvgx7RZZ9+o+bARFqvp/UST4JQf5TVwzsWg=; 
 t=1649788023;x=1650393423; 
 b=p3xgPf3OonoHgvyJMlNTJbXGhby9TA68O7mKZxBKps3AykushjU3tJ6JM18oWF6zjmhenMhSqTNseCev9WSqzN4p31POnlCbe/dPGqvh21892YxBgF8bSWphk6W6V4TF95bwzKyBCBpILNJ6qq8pA0ezkS7UELzgubCDhkC4URnKA4ITzYk1p508pGm9DErpW9gva3Sd+sqjDaQMXafJXoxPk7LQMbcegrF4t/g3f5LKVY2QD5vMOva20sVk6N7f4mIZ2xmWdiouM7BMJYHnRi5W9w2MfqIY52vJzZ/XvYLprSTDDOmqCU8IijYCMCZh9/9g2lRwRMFi9KJ1+qLXSA==;
Received: by smtp59.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1neLEA-00068q-Ou; Tue, 12 Apr 2022 21:26:59 +0300
Message-ID: <70776c6a-a171-6005-4fb6-e489534ef3b4@mail.ru>
Date: Tue, 12 Apr 2022 21:26:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for-7.1 0/8] nbd: actually make s->state thread-safe
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com
References: <20220412173216.308065-1-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220412173216.308065-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp59.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD916C41472748AFA04EBDE724ED28760BCE1E77EE8C88B302900894C459B0CD1B934FC5C3F3DDA6A6F9936C5D17208969644B7D62D624EBF22BDDFA93EA4B3182B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78E8764B5BC580342EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063764345650F0BBEB0B8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8D45C36E613E0656B7A9A2ED56A0628E56F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7ECC8AC47CD0EDEFF8941B15DA834481FA18204E546F3947CB861051D4BA689FCF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637FD2911E685725BF8389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637F6F01CEC6E9B433FD81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE77E1C1A36D5859E4ACD04E86FAF290E2D7E9C4E3C761E06A71DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B645423645B6F85954089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A516F8D14099FAEDA9C1E8D64B4202071AB5B7EF38A05118E1D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75B66DA94168EAEAEF8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34103A2CD2CFC42C6759D52A63DEE682E26A56C2CC7FAC64A4D9D24D78C1393AC47620B5193C4EE7771D7E09C32AA3244CCD973FDF4389BFA528BF1C8E0AF476BA8A6D4CC6FBFAC251FACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojGJUQSLYIeTJBqs/7xduU7A==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C391356CFB6D5FF2EC574453CA5F6B43A3BBCF8D39AE32677A80AE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.39;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp59.i.mail.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

12.04.2022 20:32, Paolo Bonzini wrote:
> The main point of this series is patch 6, which removes the dubious and
> probably wrong use of atomics in block/nbd.c.  This in turn is enabled
> mostly by the cleanups in patches 3-5.  Together, they introduce a
> QemuMutex that synchronizes the NBD client coroutines, the reconnect_delay
> timer and nbd_cancel_in_flight() as well.
> 
> The fixes happen to remove an incorrect use of qemu_co_queue_restart_all
> and qemu_co_enter_next on the s->free_sema CoQueue, which was not guarded
> by s->send_mutex.
> 
> The rest is bugfixes, simplifying the code a bit, and extra documentation.
> 
> Paolo Bonzini (8):
>    nbd: actually implement reply_possible safeguard
>    nbd: mark more coroutine_fns
>    nbd: remove peppering of nbd_client_connected
>    nbd: keep send_mutex/free_sema handling outside
>      nbd_co_do_establish_connection
>    nbd: use a QemuMutex to synchronize reconnection with coroutines
>    nbd: move s->state under requests_lock
>    nbd: take receive_mutex when reading requests[].receiving
>    nbd: document what is protected by the CoMutexes
> 
>   block/coroutines.h |   4 +-
>   block/nbd.c        | 303 +++++++++++++++++++++++----------------------
>   2 files changed, 157 insertions(+), 150 deletions(-)
> 

Hmm, no patches come to me except for cover-letter. Neither here: https://patchew.org/QEMU/20220412173216.308065-1-pbonzini@redhat.com/

-- 
Best regards,
Vladimir

