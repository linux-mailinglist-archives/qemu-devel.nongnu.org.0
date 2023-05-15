Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209C5702FAB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:26:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZ91-00052p-6h; Mon, 15 May 2023 10:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pyZ8y-000517-5y; Mon, 15 May 2023 10:25:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pyZ8w-0003ej-C5; Mon, 15 May 2023 10:25:43 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 2C3F75F81;
 Mon, 15 May 2023 17:25:31 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3871154EA;
 Mon, 15 May 2023 17:25:30 +0300 (MSK)
Message-ID: <df759372-7964-c5bc-e384-b56175543c02@msgid.tls.msk.ru>
Date: Mon, 15 May 2023 17:25:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PULL 09/28] block: bdrv/blk_co_unref() for calls in coroutine
 context
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
References: <20230510122111.46566-1-kwolf@redhat.com>
 <20230510122111.46566-10-kwolf@redhat.com>
 <e91bbebc-3b28-c05a-293c-c02f1fefe085@msgid.tls.msk.ru>
 <ZGIuk9w6t9m+sYbN@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <ZGIuk9w6t9m+sYbN@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -106
X-Spam_score: -10.7
X-Spam_bar: ----------
X-Spam_report: (-10.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.811,
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

15.05.2023 16:07, Kevin Wolf wrote:
> Am 11.05.2023 um 17:32 hat Michael Tokarev geschrieben:
>> 10.05.2023 15:20, Kevin Wolf wrote:
>>> These functions must not be called in coroutine context, because they
>>> need write access to the graph.
>>
>> How important for this and 2 surrounding changes to be for 7.2-stable
>> (if we'll ever release one)? It smells like real bugs are being fixed
>> here, is it ever possible to hit those in 7.2?
>>
>> Provided that whole no_coroutine_fn &Co infrastructure is missing there,
>> including the no_co_wrapper parts?  It's not difficult to back-port some
>> of that stuff to 7.2.
> 
> In theory this has always been wrong, but we've only seen actual bugs
> manifesting in 8.0 with the other multiqueue-related changes. So I think
> it's safe to skip them for 7.2.
> 
> The bug fixed by the previous patch (bdrv_activate()) might not even
> theoretically be a problem while bdrv_co_activate() didn't exist, though
> I haven't investigated this in detail.

Thank you very much for the reply Kevin.
This is basically what I suspected, but wanted a confirmation.
This definitely makes sense.

/mjt

