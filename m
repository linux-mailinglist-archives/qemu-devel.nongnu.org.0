Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E356A2C5522
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 14:20:25 +0100 (CET)
Received: from localhost ([::1]:44632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiHCC-0007eW-W3
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 08:20:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiH89-0005ZY-FT; Thu, 26 Nov 2020 08:16:13 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiH85-0007ZM-1k; Thu, 26 Nov 2020 08:16:13 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4ChdY616Fqz6vVv;
 Thu, 26 Nov 2020 21:15:38 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 26 Nov 2020 21:15:51 +0800
Message-ID: <5FBFAA87.5000400@huawei.com>
Date: Thu, 26 Nov 2020 21:15:51 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] virtfs-proxy-helper: Fix a resource leak in main()
References: <20201126101624.55714-1-alex.chen@huawei.com>
 <20201126130734.56f2a84a@bahia.lan>
In-Reply-To: <20201126130734.56f2a84a@bahia.lan>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=alex.chen@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Greg,

Thanks for your review.

On 2020/11/26 20:07, Greg Kurz wrote:
> On Thu, 26 Nov 2020 10:16:24 +0000
> Alex Chen <alex.chen@huawei.com> wrote:
> 
>> Only one of the options -s and -f can be used. When -f is used,
>> the fd is created externally and does not need to be closed.
> 
> The process running virtfs-proxy-helper has its own copy of
> the fd inherited from its parent. And this fd will be closed
> eventually when the process terminates.
> 
>> When -s is used, a new socket fd is created, and this socket fd
>> needs to be closed at the end of main().
>>
> 
> Same here, the new socket fd is closed when the process
> terminates.

IMO, it's best to explicitly release resources before the process terminates,
just as the variable 'rpath' is explicitly freed in main(),
so socket fd also needs to be explicitly closed here.

Looking forward to your reply.

> 
> The only justification to merge such a change would be if
> the code was sitting in some other function, in which
> case we should indeed do proper rollback. But it is main()
> here, so this patch isn't needed.
> 
>> Reported-by: Euler Robot <euler.robot@huawei.com>
> 
> Can you provide a copy of the report in case I'm
> missing something ?
> 

Our codecheck tool reports a resource leak here, which is relatively simple,
like the one below, I did not attach it.

---------------------
"Resource leak: sock"
---------------------

Thanks,
Alex


