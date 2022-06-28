Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4F855F16A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 00:37:04 +0200 (CEST)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6JpP-0004Fk-7C
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 18:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6Jnh-00030Y-SZ; Tue, 28 Jun 2022 18:35:17 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:39687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6Jng-0003L2-5b; Tue, 28 Jun 2022 18:35:17 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N0X4c-1nlNC81nTI-00wSOD; Wed, 29 Jun 2022 00:34:56 +0200
Message-ID: <cbd043e0-0fe6-5540-c78d-dc2e3cb42179@vivier.eu>
Date: Wed, 29 Jun 2022 00:34:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RESEND PATCH] hw/dma: fix crash caused by race condition
Content-Language: fr
To: Tong Zhang <t.zhang2@samsung.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "ztong0001@gmail.com" <ztong0001@gmail.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Francisco Londono <f.londono@samsung.com>
References: <CGME20220506163106uscas1p20aa8ba0a290a9b50be54df6ec4f9cee0@uscas1p2.samsung.com>
 <20220506163059.2517-1-t.zhang2@samsung.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220506163059.2517-1-t.zhang2@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yIuuQwWfkdJX3v3izuMGkhesk1QaQKLrcsyjXugUqMRU50OergO
 Z5D0oj9ykKYHzAQe6CZe0ZO3er9KWV5SQ5ZgngfUEZMkU1bKI2Ysg1jL0yWNlKcOLm+RQPt
 hks0NadWuOlqY8f+2VFWjPqfZqdf8+0woXVR38rtSsBOeRanVod9Fs40mGa7UxKtv7wNtpO
 NUpS2h2PNhv+VcEbsWfWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RExie5HD0l8=:kTG+4ocKmViUXL984hRVGC
 LYBprfpzL+5BrkrhdpZLC/0kPBl78wUE1K3WrNIr7cqAkkiAlK/XTCrFhlD5ra9vp/TrbTew2
 Mt0KrwHp+yv9qblUtwsBy4qKUsl1szxuh4Nc3E+kLaC/y6tSfi9RTDO2YggVVIsql5XDiq24T
 JQ38fqYN7M+AJHyd2SMrNUXBVDvV30kWkaqgeGExS4DcIZyZcp9GAhpxQM0ptKwF/XrgKCqmS
 u3MwEBZTL1lAs0wH0YZ8oEDKaQWES0W9w2xomFh4bw0gMQ7FozVND6axkfx9e1BeajQYKBaqC
 jyIk78hTaV6hbAZLtMjtXowp1J8OpkaGXQjGNzNM+rmkft21pW9Wi5n3TPh7muGF/OGoRyPq2
 oBmuox9D7z+T82qLCZHHMZx4odVFVBJKBTaS5Zg9DyudH6jWcVh5qePTVfptaUhok8yb4ANwW
 ryJNpEOdkwOhSuGDkJWrkeruqRfhkNOuJhEe7XBFbxB36wL7YnX5AAs4acc5pF5o+Dgi6N6V7
 SNio//QYzVPh766IHyEEIOdRyJND8BtLCfDU2/RVZuAmkkHhSpf5ps9d+DMP7lPXVbAntewr/
 oABxN+1Pm6JHDKPG85jIxG4lA35TYB5/y758SLIMpQ1z8gpOWJYnDZ9BV2JwxPXB0ZZO1mLTi
 hX+9jaqSqGDwCUbY8oZ+EUyVmsfME1oeXoZLRjAEXrPSAgpfHxVxChD9qhkQ0zB4KePH8I5UD
 R+AwOrLfKeO/H9uukcoqJzC59SX62YAz1x8Bow==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 06/05/2022 à 18:31, Tong Zhang a écrit :
> assert(dbs->acb) is meant to check the return value of io_func per
> documented in commit 6bee44ea34 ("dma: the passed io_func does not
> return NULL"). However, there is a chance that after calling
> aio_context_release(dbs->ctx); the dma_blk_cb function is called before
> the assertion and dbs->acb is set to NULL again at line 121. Thus when
> we run assert at line 181 it will fail.
> 
>    softmmu/dma-helpers.c:181: dma_blk_cb: Assertion `dbs->acb' failed.
> 
> Reported-by: Francisco Londono <f.londono@samsung.com>
> Signed-off-by: Tong Zhang <t.zhang2@samsung.com>
> ---
>   softmmu/dma-helpers.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> index 7820fec54c..cb81017928 100644
> --- a/softmmu/dma-helpers.c
> +++ b/softmmu/dma-helpers.c
> @@ -177,8 +177,8 @@ static void dma_blk_cb(void *opaque, int ret)
>       aio_context_acquire(dbs->ctx);
>       dbs->acb = dbs->io_func(dbs->offset, &dbs->iov,
>                               dma_blk_cb, dbs, dbs->io_func_opaque);
> -    aio_context_release(dbs->ctx);
>       assert(dbs->acb);
> +    aio_context_release(dbs->ctx);
>   }
>   
>   static void dma_aio_cancel(BlockAIOCB *acb)

Fixes: 1919631e6b55 ("block: explicitly acquire aiocontext in bottom halves that need it")
Reviewed-by: Laurent Vivier <laurent@vivier.eu>


