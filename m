Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0872D494B95
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 11:24:51 +0100 (CET)
Received: from localhost ([::1]:35346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAUcb-0002oQ-Mb
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 05:24:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1nATbr-0000Bd-AR; Thu, 20 Jan 2022 04:19:59 -0500
Received: from kerio.kamp.de ([195.62.97.192]:51814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1nATbp-0008Tz-Gj; Thu, 20 Jan 2022 04:19:58 -0500
X-Footer: a2FtcC5kZQ==
Received: from [172.20.250.7] ([172.20.250.7]) (authenticated user pl@kamp.de)
 by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Thu, 20 Jan 2022 10:19:28 +0100
Subject: Re: [PATCH V2 for-6.2 0/2] fixes for bdrv_co_block_status
To: Stefano Garzarella <sgarzare@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20220113144426.4036493-1-pl@kamp.de>
 <CAOi1vP9r3_aWPdvxWxcivC57f74G418=7esi6xd5ydBeOENmQQ@mail.gmail.com>
 <20220119145735.qkuxqnnfqws7xbme@steredhat>
From: Peter Lieven <pl@kamp.de>
Message-ID: <cc75ea76-fbc6-1f88-6d07-09cc65a06d60@kamp.de>
Date: Thu, 20 Jan 2022 10:19:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220119145735.qkuxqnnfqws7xbme@steredhat>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu block <qemu-block@nongnu.org>, qemu-devel@nongnu.org,
 Christian Theune <ct@flyingcircus.io>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Dryomov <idryomov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.01.22 um 15:57 schrieb Stefano Garzarella:
> On Fri, Jan 14, 2022 at 11:58:40AM +0100, Ilya Dryomov wrote:
>> On Thu, Jan 13, 2022 at 3:44 PM Peter Lieven <pl@kamp.de> wrote:
>>>
>>> V1->V2:
>>>  Patch 1: Treat a hole just like an unallocated area. [Ilya]
>>>  Patch 2: Apply workaround only for pre-Quincy librbd versions and
>>>           ensure default striping and non child images. [Ilya]
>>>
>>> Peter Lieven (2):
>>>   block/rbd: fix handling of holes in .bdrv_co_block_status
>>>   block/rbd: workaround for ceph issue #53784
>>>
>>>  block/rbd.c | 52 +++++++++++++++++++++++++++++++++++++++++++++-------
>>>  1 file changed, 45 insertions(+), 7 deletions(-)
>>>
>>> -- 
>>> 2.25.1
>>>
>>>
>>
>> These patches have both "for-6.2" in the subject and
>> Cc: qemu-stable@nongnu.org in the description, which is a little
>> confusing.  Just want to clarify that they should go into master
>> and be backported to 6.2.
>
> Yeah, a bit confusing. These are for 7.0, so @Kevin can these patches go with your tree?


Yes, sorry, my fault. It should be 7.0


Peter




