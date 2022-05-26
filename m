Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B348753524D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 18:49:01 +0200 (CEST)
Received: from localhost ([::1]:44572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuGfU-0003YR-BH
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 12:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nuGdl-00026G-A1; Thu, 26 May 2022 12:47:13 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:39496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nuGdh-0002rS-Ba; Thu, 26 May 2022 12:47:11 -0400
Received: from iva4-7f38d418d11a.qloud-c.yandex.net
 (iva4-7f38d418d11a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:740d:0:640:7f38:d418])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 9AD0E2E0DB6;
 Thu, 26 May 2022 19:46:58 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva4-7f38d418d11a.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 OoYtura7g5-kvJucKIn; Thu, 26 May 2022 19:46:58 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1653583618; bh=tNIaAm8RIhaSOJ2bS3+/zPUTMcO9Jil6ubwKdf+2tVg=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=HlIrVR4/7zqKKRb2WbmIZI5DtrcCOWsvAgdQ6neiWlxlXgAUZ7u+LPruNO03dENTV
 0VA2XmSkytMeAMYROrXCg+SrdyBcDcnzZjGpnL74+Sq7LFh1xso8vULjrx/UJsikE6
 0esIkDMTE+OM85ndk1djvSul046sxkounAag5ncU=
Authentication-Results: iva4-7f38d418d11a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:b53f::1:17] (unknown
 [2a02:6b8:b081:b53f::1:17])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 kcNF3H4tJv-kvNWXEDl; Thu, 26 May 2022 19:46:57 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <e9bb5d3a-edd4-d259-fd9b-ca03e71d0760@yandex-team.ru>
Date: Thu, 26 May 2022 19:46:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 0/7] copy-before-write: on-cbw-error and cbw-timeout
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 stefanha@redhat.com, hreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@openvz.org
References: <20220407132726.85114-1-vsementsov@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220407132726.85114-1-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/22 16:27, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> v4: Now based on master
> 01: add assertion and r-b
> 02: s/7.0/7.1/ and r-b
> 03: switch to QEMUMachine, touch-up pylintrc,  drop r-b
> 04,05,06: add r-b
> 07: switch to QEMUMachine
> 
> 
> Here are two new options for copy-before-write filter:
> 
> on-cbw-error allows to alter the behavior on copy-before-write operation
> failure: not break guest write but break the snapshot (and therefore
> backup process)
> 
> cbw-timeout allows to limit cbw operation by some timeout.
> 
> So, for example, using cbw-timeout=60 and on-cbw-error=break-snapshot
> you can be sure that guest write will not stuck for more than 60
> seconds and will never fail due to backup problems.
> 
> Vladimir Sementsov-Ogievskiy (7):
>    block/copy-before-write: refactor option parsing
>    block/copy-before-write: add on-cbw-error open parameter
>    iotests: add copy-before-write: on-cbw-error tests
>    util: add qemu-co-timeout
>    block/block-copy: block_copy(): add timeout_ns parameter
>    block/copy-before-write: implement cbw-timeout option
>    iotests: copy-before-write: add cases for cbw-timeout option
> 
>   qapi/block-core.json                          |  31 ++-
>   include/block/block-copy.h                    |   4 +-
>   include/qemu/coroutine.h                      |  13 ++
>   block/block-copy.c                            |  33 ++-
>   block/copy-before-write.c                     | 111 ++++++---
>   util/qemu-co-timeout.c                        |  89 ++++++++
>   tests/qemu-iotests/pylintrc                   |   5 +
>   tests/qemu-iotests/tests/copy-before-write    | 213 ++++++++++++++++++
>   .../qemu-iotests/tests/copy-before-write.out  |   5 +
>   util/meson.build                              |   1 +
>   10 files changed, 466 insertions(+), 39 deletions(-)
>   create mode 100644 util/qemu-co-timeout.c
>   create mode 100755 tests/qemu-iotests/tests/copy-before-write
>   create mode 100644 tests/qemu-iotests/tests/copy-before-write.out
> 

Thanks for review, applied to my new block branch at https://gitlab.com/vsementsov/qemu.git

-- 
Best regards,
Vladimir

