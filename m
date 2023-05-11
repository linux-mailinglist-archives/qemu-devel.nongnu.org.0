Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87C66FEF5B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:52:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2xO-0001d9-BP; Thu, 11 May 2023 05:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1px2x7-0000zJ-KI; Thu, 11 May 2023 05:51:17 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1px2x4-0006iv-4s; Thu, 11 May 2023 05:51:13 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:a884:0:640:947b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 1936960895;
 Thu, 11 May 2023 12:50:57 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:203::1:7] (unknown [2a02:6b8:b081:203::1:7])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id toSq5a0Oi8c0-6FTTYHJe; Thu, 11 May 2023 12:50:56 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683798656; bh=R30xHNMlpgrxEfbtBK0Ax+AA80/F+vcmBYLTKCbf3hg=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=PcUOssHxXPQqvXAVTte8wDVtrTbb7XRNmRh03iH8lmyVqR8b5VfuVIBIhMmj/soks
 wbkwq+uCOLj9Wt4SxymPOLh5gLkq62H3kYT4u2HJOZWX6FsQfoa/StE0HiIgQRM1Hl
 Z6+Ezl1ZDO9dKYtBZ1jSAXoPOhyK6l/+SkTzoTvc=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <eedce29a-7f1e-aab2-27a1-db3f526fe707@yandex-team.ru>
Date: Thu, 11 May 2023 12:50:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v9 0/6] block: refactor blockdev transactions
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 den@openvz.org, alexander.ivanov@virtuozzo.com
References: <20230510150624.310640-1-vsementsov@yandex-team.ru>
 <ZFyuwBnsBz1chYdz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <ZFyuwBnsBz1chYdz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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

On 11.05.23 12:00, Kevin Wolf wrote:
> Am 10.05.2023 um 17:06 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Hi all!
>>
>> Let's refactor QMP transactions implementation into new (relatively)
>> transaction API.
>>
>> v9:
>> 01: fix leaks
> 
> That's a clever use of g_autofree. Wouldn't have thought of that. :-)
> 
>> 02-03: add r-b
>> 04: fix leak, s/Transaction/transaction/
>> 05: new, was part of 06
>> 06: rework of bitmap-add action moved to 05
> 
> I took the liberty of moving the removal of the 'prepared' field in
> BlockDirtyBitmapState from patch 6 to patch 5, I hope you agree.

I agree

> 
> Thanks, applied to the block branch.
> 

Thanks!

-- 
Best regards,
Vladimir


