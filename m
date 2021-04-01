Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4AA352350
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 01:19:59 +0200 (CEST)
Received: from localhost ([::1]:52184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS6bW-0007wC-Ah
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 19:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <valesini@yandex-team.ru>)
 id 1lS2Zk-00084G-4b; Thu, 01 Apr 2021 15:01:52 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:43656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <valesini@yandex-team.ru>)
 id 1lS2Ze-0005nV-7t; Thu, 01 Apr 2021 15:01:50 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id F19B92E17F6;
 Thu,  1 Apr 2021 22:01:37 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 6XYDfr2HxM-1b0qLrEL; Thu, 01 Apr 2021 22:01:37 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1617303697; bh=jChTUh3R4jFS4ZUj/zeGj6DlJxt/Erl+oFnm5mZvC10=;
 h=In-Reply-To:References:Date:Message-ID:From:To:Subject:Cc;
 b=YnunnvL/OB1N9dYTYCKcyVzHKVGspOmF17uFse0KYIWI4JQiyrCsra/UFQGA0bDoc
 XA3zXXlbHB5K9/m6X/WgWSdrwCBC2d3g8NGxs8mKsj3E/cbbYYQNH2tObYF2a5nWmI
 GThyr3KMNcqA/nEsEzyRPQ/zWjXSfnh4EBkaG3BA=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:7425::1:19])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 zOZkVE9Zgz-1apa61N6; Thu, 01 Apr 2021 22:01:37 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: Re: [BUG FIX][PATCH v3 0/3] vhost-user-blk: fix bug on device
 disconnection during initialization
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>, qemu-devel@nongnu.org
References: <20210325151217.262793-1-den-plotnikov@yandex-team.ru>
 <a1ab7e04-86cd-7004-9687-c00382dc2e14@yandex-team.ru>
 <7735213d-f3ac-ab49-ecaf-0878808167aa@yandex-team.ru>
From: Valentin Sinitsyn <valesini@yandex-team.ru>
Message-ID: <1aa83c10-4290-b64e-c8c7-9aa4cbb70b3e@yandex-team.ru>
Date: Fri, 2 Apr 2021 00:01:36 +0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7735213d-f3ac-ab49-ecaf-0878808167aa@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=valesini@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 01 Apr 2021 19:18:58 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 raphael.norwitz@nutanix.com, yc-core@yandex-team.ru, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.2021 14:21, Denis Plotnikov wrote:
> This is a series fixing a bug in host-user-blk.
More specifically, it's not just a bug but crasher.

Valentine

> Is there any chance for it to be considered for the next rc?
> 
> Thanks!
> 
> Denis
> 
> On 29.03.2021 16:44, Denis Plotnikov wrote:
>>
>> ping!
>>
>> On 25.03.2021 18:12, Denis Plotnikov wrote:
>>> v3:
>>>    * 0003: a new patch added fixing the problem on vm shutdown
>>>      I stumbled on this bug after v2 sending.
>>>    * 0001: gramma fixing (Raphael)
>>>    * 0002: commit message fixing (Raphael)
>>>
>>> v2:
>>>    * split the initial patch into two (Raphael)
>>>    * rename init to realized (Raphael)
>>>    * remove unrelated comment (Raphael)
>>>
>>> When the vhost-user-blk device lose the connection to the daemon during
>>> the initialization phase it kills qemu because of the assert in the code.
>>> The series fixes the bug.
>>>
>>> 0001 is preparation for the fix
>>> 0002 fixes the bug, patch description has the full motivation for the series
>>> 0003 (added in v3) fix bug on vm shutdown
>>>
>>> Denis Plotnikov (3):
>>>    vhost-user-blk: use different event handlers on initialization
>>>    vhost-user-blk: perform immediate cleanup if disconnect on
>>>      initialization
>>>    vhost-user-blk: add immediate cleanup on shutdown
>>>
>>>   hw/block/vhost-user-blk.c | 79 ++++++++++++++++++++++++---------------
>>>   1 file changed, 48 insertions(+), 31 deletions(-)
>>>

