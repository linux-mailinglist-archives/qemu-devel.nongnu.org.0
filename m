Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F14552656
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 23:19:45 +0200 (CEST)
Received: from localhost ([::1]:60102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3OoB-0000kr-S6
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 17:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o3OlM-0007p9-Ji; Mon, 20 Jun 2022 17:16:48 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:39298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o3OlH-0007Jg-LV; Mon, 20 Jun 2022 17:16:46 -0400
Received: from sas2-6a1db1376cb6.qloud-c.yandex.net
 (sas2-6a1db1376cb6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bb0f:0:640:6a1d:b137])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 36DC92E1256;
 Tue, 21 Jun 2022 00:16:33 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 o2AzVEzrIR-GWJeLKLf; Tue, 21 Jun 2022 00:16:33 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655759793; bh=xjZZGTYwoc1PKFO1IlKuWUlSvmn3ugpuwg4YEJDp9sU=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=fDdwBuMdaHtyggdlKwo9cbrysIVAgnq+wgrsFGUhcYnsWy0sZ0vjDCzZHuHPt3/xK
 0O6aDw4UxQDWjPKRNUkS/kYEZHew4JFdu1PcjOwOdZFErpuLAi+vgnaex7pBINeeE4
 0DPPkBDE/6vHJRlhv8jDSv7dHkcyBiELLMYjBIdo=
Authentication-Results: sas2-6a1db1376cb6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:a527::1:24] (unknown
 [2a02:6b8:b081:a527::1:24])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 cNIBmbfJ0U-GWNWwSao; Tue, 21 Jun 2022 00:16:32 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <8e8c5b6b-9a41-2275-8003-51cdd7b77af2@yandex-team.ru>
Date: Tue, 21 Jun 2022 00:16:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 22/45] block: implemet bdrv_unref_tran()
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-23-vsementsov@openvz.org>
 <60566c7d-54da-eaec-647f-d05e96ead668@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <60566c7d-54da-eaec-647f-d05e96ead668@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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

On 6/13/22 12:07, Hanna Reitz wrote:
> On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
>> Now nodes are removed during block-graph update transactions now? Look
>> at bdrv_replace_child_tran: bdrv_unref() is simply postponed to commit
>> phase.
>>
>> What is the problem with it?
>>
>> We want to make copy-before-write permissions strict: it should unshare
>> write always, not only when it has at least one parent.
> 
> Looking over this patch in not too much detail (because I find it rather complicated), it looks OK to me; but this reason for why we need it doesn’t really satisfy me.  What is the problem with how CBW permissions work?  Is that really the only reason for this patch?

Currently, CBW don't unshare write, when have no parent. It's kind of "inactive" state.

That's not quite correct. For example, if we just don't have parents on start of the job, nothing prevents user of adding new parents that write directly to source, ignoring CBW filter. Of course, user is responsible for his actions. But ideally, CBW filter should guarantee, that we are doing correct thing. It become more important when we consider "snapshot-access" interface. CBW filter provides this interface, and it should guarantee that it works correctly.

And to achieve this we want to effectively remove nodes during transaction, not just postpone removal to commit(). And that's in good sync with global concept: do all modifications first, than update permissions.

The other way could be removing permissions from nodes "to be removed", but that seems less correct to me.

Does these strong permissions for CBW worh a complexity? Good question) And actually it's hard to estimate it in such a big series. I can try to split this thing out of the series and see, could we at least postpone it, keeping for now only the interfaces with weaker protection.

> 
>> But if so, we
>> can't neither insert the filter nor remove it:
>>
>> To insert the filter, we should first do blockdev-add, and filter will
>> unshare write on the child, so, blockdev-add will fail if disk is in
>> use by guest.
>>
>> To remove the filter, we should first do a replace operations, which
>> again leads to situation when the filter and old parent share one
>> child, and all parent want write permission when the filter unshare it.
>>
>> The solution is first do both graph-modifying operations (add &
>> replace, or replace & remove) and only then update permissions. But
>> that is not possible with current method to transactionally remove the
>> block node: if we just postpone bdrv_unref() to commit phase, than on
>> prepare phase the node is not removed, and it still keep all
>> permissions on its children.
>>
>> What to do? In general, I don't know. But it's possible to solve the
>> problem for the block drivers that doesn't need access to their
>> children on .bdrv_close(). For such drivers we can detach their
>> children on prepare stage (still, postponing bdrv_close() call to
>> commit phase). For this to work we of course should effectively reduce
>> bs->refcnt on prepare phase as well.
>>
>> So, the logic of new bdrv_unref_tran() is:
>>
>> prepare:
>>    decrease refcnt and detach children if possible (and if refcnt is 0)
>>
>> commit:
>>    do bdrv_delete() if refcnt is 0
>>
>> abort:
>>    restore children and refcnt
>>
>> What's the difficulty with it? If we want to transactionally (and with
>> no permission change) remove nodes, we should understand that some
>> nodes may be removed recursively, and finally we get several possible
>> not deleted leaves, where permissions should be updated. How caller
>> will know what to update? That leads to additional transaction-wide
>> refresh_list variable, which is filled by various graph modifying
>> function. So, user should declare referesh_list variable and do one or
>> several block-graph modifying operations (that may probably remove some
>> nodes), then user call bdrv_list_refresh_perms on resulting
>> refresh_list.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> 
> 


-- 
Best regards,
Vladimir

