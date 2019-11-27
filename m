Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AC110A8DD
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 03:50:37 +0100 (CET)
Received: from localhost ([::1]:60716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZnPY-0007SE-0e
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 21:50:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1iZnOg-0006za-Sm
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 21:49:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1iZnOf-0006SS-R2
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 21:49:42 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2268 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1iZnOc-0006Mf-Kv; Tue, 26 Nov 2019 21:49:38 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D9770BB001FF679B3F50;
 Wed, 27 Nov 2019 10:49:28 +0800 (CST)
Received: from [127.0.0.1] (10.120.177.99) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Wed, 27 Nov 2019
 10:49:19 +0800
Subject: Re: [PATCH] throttle-groups: fix memory leak in
 throttle_group_set_limits
To: Alberto Garcia <berto@igalia.com>, <kwolf@redhat.com>, <mreitz@redhat.com>
References: <1574756222-43976-1-git-send-email-pannengyuan@huawei.com>
 <w51o8wz555u.fsf@maestria.local.igalia.com>
From: pannengyuan <pannengyuan@huawei.com>
Message-ID: <66c1cc2f-a125-a5c6-fb97-157c02304047@huawei.com>
Date: Wed, 27 Nov 2019 10:47:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <w51o8wz555u.fsf@maestria.local.igalia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.120.177.99]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: liyiting@huawei.com, kuhn.chenqun@huawei.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks, I think it can be removed, I will send a new version later.

On 2019/11/26 17:59, Alberto Garcia wrote:
> On Tue 26 Nov 2019 09:17:02 AM CET, pannengyuan@huawei.com wrote:
>> --- a/block/throttle-groups.c
>> +++ b/block/throttle-groups.c
>> @@ -912,6 +912,7 @@ static void throttle_group_set_limits(Object *obj, Visitor *v,
>>  unlock:
>>      qemu_mutex_unlock(&tg->lock);
>>  ret:
>> +    qapi_free_ThrottleLimits(argp);
>>      error_propagate(errp, local_err);
>>      return;
> 
> Thanks, but I also think that 'arg' is not used so it can be removed?
> 
> diff --git a/block/throttle-groups.c b/block/throttle-groups.c
> index 77014c741b..37695b0cd7 100644
> --- a/block/throttle-groups.c
> +++ b/block/throttle-groups.c
> @@ -893,8 +893,7 @@ static void throttle_group_set_limits(Object *obj, Visitor *v,
>  {
>      ThrottleGroup *tg = THROTTLE_GROUP(obj);
>      ThrottleConfig cfg;
> -    ThrottleLimits arg = { 0 };
> -    ThrottleLimits *argp = &arg;
> +    ThrottleLimits *argp;
>      Error *local_err = NULL;
>  
>      visit_type_ThrottleLimits(v, name, &argp, &local_err);
> @@ -912,6 +911,7 @@ static void throttle_group_set_limits(Object *obj, Visitor *v,
>  unlock:
>      qemu_mutex_unlock(&tg->lock);
>  ret:
> +    qapi_free_ThrottleLimits(argp);
>      error_propagate(errp, local_err);
>      return;
>  }
> 
> Berto
> 
> .
> 


