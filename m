Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3EA6FF3DB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 16:18:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px76S-0008GM-PQ; Thu, 11 May 2023 10:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1px76N-0008G4-S1
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:17:05 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1px76G-00063N-N6
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:17:03 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:a884:0:640:947b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 8036460D00;
 Thu, 11 May 2023 17:16:42 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:203::1:7] (unknown [2a02:6b8:b081:203::1:7])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id eGXocd0OkuQ0-INxN8phr; Thu, 11 May 2023 17:16:40 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683814600; bh=Rta2sUsaLO/wd/LPf9nJPe+bIT7RlZav3RLlvPkJycs=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=QfODmgBY+9foXhRkkowey9ZPEVoaO9T5jx8fyLBYFOoDoZPbWAwJlZranyyGsezzu
 Mwv3TPIsiCJWvhnqwmFJLpGD+deLP0dwPsDL/3y5cnCYN2xTBINw8Y2bBilExgRYys
 dR8lvIUWIR/4t9LxmJHABUBQyK4N2lr2AiPzndhA=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <3e294e10-12ec-bb00-cf7d-c6b1574fc252@yandex-team.ru>
Date: Thu, 11 May 2023 17:16:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] migration: Add documentation for backwards compatiblity
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>,
 Peter Xu <peterx@redhat.com>, Avihai Horon <avihaih@nvidia.com>,
 Thomas Huth <thuth@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20230511082701.12828-1-quintela@redhat.com>
 <2912b2c8-41c2-4a9d-64ac-b3a05e66028f@yandex-team.ru>
 <87o7mr3wo4.fsf@secure.mitica>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <87o7mr3wo4.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 11.05.23 15:00, Juan Quintela wrote:
>>> +Now we start with the more interesting cases.  Let start with the
>>> +same qemu but not the same machine type.
>> sounds like "different machine type on source and target" for me..
>>
>> Maybe, "not latest machine type" ?
> Now we start with the more interesting cases.  Let start with a the
> same QEMU process and a different QEMU version machine type.
> 
> Better?

No)

Neither I have good wording in mind. That doesn't really matter I think, so don't worry, meaning is obvious from the context anyway.

I just mean, that for me:

"same" here: source.qemu.version == target.qemu.version

"different" here: source.qemu.machine_type != target.qemu.machine_type  -- but you don't mean this and this case doesn't work anyway

What you mean by "different" that machine type is not equal to qemu version.. But formally, it's never "equal", actually, latest machine type of the qemu version "corresponds" to that qemu version.

Maybe:

"Consider the case with same QEMU version (5.2) but not latest (not 5.2) machine type:"

-- 
Best regards,
Vladimir


