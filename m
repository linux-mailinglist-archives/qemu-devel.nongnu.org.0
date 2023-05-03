Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3FE6F5EC3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 21:02:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puHig-0007LM-Va; Wed, 03 May 2023 15:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1puHiU-0007G9-72; Wed, 03 May 2023 15:00:44 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1puHiR-0003pK-Du; Wed, 03 May 2023 15:00:41 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 844BE5E946;
 Wed,  3 May 2023 22:00:26 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b43b::1:1a] (unknown
 [2a02:6b8:b081:b43b::1:1a])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id O0UuBc0MciE0-F45RuVu1; Wed, 03 May 2023 22:00:25 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683140425; bh=lQV542/23D2qpaz5lwecjJx82vJKQf2mHQtz2eNFa/k=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=zUYCfTSMU7p5fYdLubmddF3VPPNv3VJ1awpn7//69ptZGfHN77cxMg3mvBqU7rp2E
 JrZQho+g1RV/eQLp7+YsP8Fikwd33pT6ppQYVOdNT917xG0AqNGoVBJG3jM/voe6P6
 wfiJr2oVRFfGuhGWF1TMVRGiut2DvEJZku5fnLuk=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <69c663fe-8f43-9002-0735-a55dfb4fdf2f@yandex-team.ru>
Date: Wed, 3 May 2023 22:00:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PULL 11/18] migration: Create migrate_block_bitmap_mapping()
 function
Content-Language: en-US
To: quintela@redhat.com, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Peter Xu <peterx@redhat.com>,
 John Snow <jsnow@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>
References: <20230427152234.25400-1-quintela@redhat.com>
 <20230427152234.25400-12-quintela@redhat.com> <ZFJw1lSMcQ5sqZBD@redhat.com>
 <87bkj1qqu5.fsf@secure.mitica>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <87bkj1qqu5.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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

On 03.05.23 20:15, Juan Quintela wrote:
> Kevin Wolf <kwolf@redhat.com> wrote:
>> Am 27.04.2023 um 17:22 hat Juan Quintela geschrieben:
>>> Notice that we changed the test of ->has_block_bitmap_mapping
>>> for the test that block_bitmap_mapping is not NULL.
>>>
>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>>
>>> ---
>>>
>>> Make it return const (vladimir)
>>
>> (I don't think this part was actually meant for the commit message)
> 
> yeap.  My understandig has always been that this is the way to put
> commenst for the email.
> 
>> This commit broke qemu-iotests 300 on master. Please have a look.
> 
>      if (s->parameters.has_block_bitmap_mapping)
>          return s->parameters.block_bitmap_mapping;
> 
> The test has a case where s->parameters.has_block_bitmap_mapping is true
> but s->parameters.block_bitmap_mapping is false.
> 
> If that combination is right, then we need two functions becase the
> asumtion that I did is false.
> 
> Vladimir?
> 

Ah right. I forget that the field is list and for lists it's OK to be NULL with corresponding has_* = false, as that's the only way to distinguish specified empty list and unspecified list.


-- 
Best regards,
Vladimir


