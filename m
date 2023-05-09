Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CB36FC8C3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:21:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOCl-000544-Dn; Tue, 09 May 2023 10:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pwOCZ-0004yP-0M; Tue, 09 May 2023 10:20:27 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pwOCW-000482-2E; Tue, 09 May 2023 10:20:26 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 5724647CBC;
 Tue,  9 May 2023 16:20:19 +0200 (CEST)
Message-ID: <b431b9b8-a68d-9b49-8df3-b5e1b424b648@proxmox.com>
Date: Tue, 9 May 2023 16:20:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Question about graph locking preconditions regarding
 qemu_in_main_thread()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Hanna Czenczek <hreitz@redhat.com>, eesposit@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers
 <qemu-devel@nongnu.org>, Thomas Lamprecht <t.lamprecht@proxmox.com>
References: <9d413dd9-a606-8e80-2ae7-a068cd582bb5@proxmox.com>
 <ZFjRbW4+gsz65vqn@redhat.com>
 <8af6f1ef-9b91-7024-36a1-e98ba87a9feb@proxmox.com>
 <ZFpQXPqW0s95/guu@redhat.com>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <ZFpQXPqW0s95/guu@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.421,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Am 09.05.23 um 15:53 schrieb Kevin Wolf:
> Am 09.05.2023 um 12:26 hat Fiona Ebner geschrieben:
>> Am 08.05.23 um 12:40 schrieb Kevin Wolf:
>>> Am 05.05.2023 um 11:35 hat Fiona Ebner geschrieben:
>>>> Hi,
>>>> I noticed that the bdrv_graph_co_rd_lock() and bdrv_graph_co_rd_unlock()
>>>> functions use qemu_in_main_thread() as a conditional to return early.
>>>> What high-level requirements ensure that qemu_in_main_thread() will
>>>> evaluate to the same value during locking and unlocking?
>>>
>>> I think it's actually wrong.
>>>
>>> There are some conditions under which we don't actually need to do
>>> anything for locking: Writing the graph is only possible from the main
>>> context while holding the BQL. So if a reader is running in the main
>>> contextunder the BQL and knows that it won't be interrupted until the
>>> next writer runs, we don't actually need to do anything.
>>>
>>> This is the case if the reader code neither has a nested event loop
>>> (this is forbidden anyway while you hold the lock) nor is a coroutine
>>> (because a writer could run when the coroutine has yielded).
>>
>> Sorry, I don't understand the first part. If bdrv_writev_vmstate() is
>> called, then, because it is a generated coroutine wrapper,
>> AIO_WAIT_WHILE()/aio_poll() is used. And that is the case regardless of
>> whether the lock is held or not, i.e. there is a nested event loop even
>> if the lock is held?
> 
> With "lock" you mean the graph lock here, not the BQL, right?

Oh, I actually meant the BQL. Since your "lock" refers to the graph
lock, that explains my confusion :)

> 
> These generated coroutine wrapper are a bit ugly because they behave
> different when called from a coroutine and when called outside of
> coroutine context:
> 
> * In coroutine context, the caller MUST hold the lock
> * Outside of coroutine context, the caller MUST NOT hold the lock
> 
> The second requirement comes from AIO_WAIT_WHILE(), like you say. If you
> hold the lock and you're not in a coroutine, you simply can't call such
> functions.
> 
> However, as bdrv_graph_co_rdlock() is a coroutine_fn, you won't usually
> hold the lock outside of coroutine context anyway. But it's something to
> be careful with when you have a writer lock.
> 

Best Regards,
Fiona


