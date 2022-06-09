Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7BD5451BF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:21:02 +0200 (CEST)
Received: from localhost ([::1]:54860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKu4-0006G5-2j
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nzJtI-0005gJ-Vk; Thu, 09 Jun 2022 11:16:09 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:35776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nzJtC-0006rj-Fk; Thu, 09 Jun 2022 11:16:07 -0400
Received: from iva4-7f38d418d11a.qloud-c.yandex.net
 (iva4-7f38d418d11a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:740d:0:640:7f38:d418])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id A40232E2018;
 Thu,  9 Jun 2022 18:15:50 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva4-7f38d418d11a.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 R2vKMWRJ1h-FmKWMIde; Thu, 09 Jun 2022 18:15:50 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1654787750; bh=Rm5OVW8KR5ELhtSZd7ji3+4kEQzRezptZSEGTefjFyo=;
 h=In-Reply-To:To:From:Subject:Cc:Message-ID:References:Date;
 b=fWDEaD1pZ21yubBUSDdkf31yLw7XkHUNrRSNO/k85jTFc5kuGNpeGbglLD5YZBb7N
 w/w7uUmoaDSvyie2eOCGzBHWQYMdrKPvO2mbCQAbBXAdJsXiXypG9aj6CajpyXny+u
 VO3IkXN8g8vZsPXuCt82bViREmH/52cZ/6kjc2TU=
Authentication-Results: iva4-7f38d418d11a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:219::1:1f] (unknown
 [2a02:6b8:b081:219::1:1f])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 zcsSjAcDOx-FmN00oVP; Thu, 09 Jun 2022 18:15:48 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <fe529c46-4b0f-d70a-be1d-f352ae7c030c@yandex-team.ru>
Date: Thu, 9 Jun 2022 18:15:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 0/7] copy-before-write: on-cbw-error and cbw-timeout
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 stefanha@redhat.com, hreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@openvz.org
References: <20220407132726.85114-1-vsementsov@openvz.org>
 <e9bb5d3a-edd4-d259-fd9b-ca03e71d0760@yandex-team.ru>
 <d4f15897-2509-34dc-8b26-8ee2a3f5f2a5@yandex-team.ru>
In-Reply-To: <d4f15897-2509-34dc-8b26-8ee2a3f5f2a5@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/22 21:51, Vladimir Sementsov-Ogievskiy wrote:
> On 5/26/22 19:46, Vladimir Sementsov-Ogievskiy wrote:
>> On 4/7/22 16:27, Vladimir Sementsov-Ogievskiy wrote:
>>> Hi all!
>>>
>>> v4: Now based on master
>>> 01: add assertion and r-b
>>> 02: s/7.0/7.1/ and r-b
>>> 03: switch to QEMUMachine, touch-up pylintrc,  drop r-b
>>> 04,05,06: add r-b
>>> 07: switch to QEMUMachine
>>>
>>>
>>> Here are two new options for copy-before-write filter:
>>>
>>> on-cbw-error allows to alter the behavior on copy-before-write operation
>>> failure: not break guest write but break the snapshot (and therefore
>>> backup process)
>>>
>>> cbw-timeout allows to limit cbw operation by some timeout.
>>>
>>> So, for example, using cbw-timeout=60 and on-cbw-error=break-snapshot
>>> you can be sure that guest write will not stuck for more than 60
>>> seconds and will never fail due to backup problems.
>>>
>>> Vladimir Sementsov-Ogievskiy (7):
>>>    block/copy-before-write: refactor option parsing
>>>    block/copy-before-write: add on-cbw-error open parameter
>>>    iotests: add copy-before-write: on-cbw-error tests
>>>    util: add qemu-co-timeout
>>>    block/block-copy: block_copy(): add timeout_ns parameter
>>>    block/copy-before-write: implement cbw-timeout option
>>>    iotests: copy-before-write: add cases for cbw-timeout option
>>>
>>>   qapi/block-core.json                          |  31 ++-
>>>   include/block/block-copy.h                    |   4 +-
>>>   include/qemu/coroutine.h                      |  13 ++
>>>   block/block-copy.c                            |  33 ++-
>>>   block/copy-before-write.c                     | 111 ++++++---
>>>   util/qemu-co-timeout.c                        |  89 ++++++++
>>>   tests/qemu-iotests/pylintrc                   |   5 +
>>>   tests/qemu-iotests/tests/copy-before-write    | 213 ++++++++++++++++++
>>>   .../qemu-iotests/tests/copy-before-write.out  |   5 +
>>>   util/meson.build                              |   1 +
>>>   10 files changed, 466 insertions(+), 39 deletions(-)
>>>   create mode 100644 util/qemu-co-timeout.c
>>>   create mode 100755 tests/qemu-iotests/tests/copy-before-write
>>>   create mode 100644 tests/qemu-iotests/tests/copy-before-write.out
>>>
>>
>> Thanks for review, applied to my new block branch at https://gitlab.com/vsementsov/qemu.git
>>
> 
> Or not. I still need an acc for QAPI interface (Eric or Markus could you please look?).
> 
> Also, may be I should rename qemu-co-timeout.c to qemu-coroutine-timeout.c, to match "F: util/*coroutine*" in MAINTAINERS.. Stefan, Kevin, could you please look at it?
> 
> 

OK, I think, I can stage it, if no more comments. API changes are quite usual and new qemu_co_timeout is isolated. Applied to my block branch https://gitlab.com/vsementsov/qemu/-/commits/block

I think, I'll prepare a pull request on Monday, and include also my "[PATCH] MAINTAINERS: update Vladimir's address and repositories" if Stefan don't send it earlier.

-- 
Best regards,
Vladimir

