Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419B36FDEF1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:44:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwk6a-0000JT-Ve; Wed, 10 May 2023 09:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1pwk6P-0000Hr-0a
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:43:33 -0400
Received: from apollo.dupie.be ([51.159.20.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1pwk6H-0000QG-EZ
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:43:27 -0400
Received: from [IPV6:2a02:a03f:eaf7:ff01:cc6b:6666:e19c:b63f] (unknown
 [IPv6:2a02:a03f:eaf7:ff01:cc6b:6666:e19c:b63f])
 by apollo.dupie.be (Postfix) with ESMTPSA id 1D39A1520F2A;
 Wed, 10 May 2023 15:43:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dupond.be; s=dkim;
 t=1683726196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gO1T0xn2b/SBiu//6Pj9hknyrBdJptGRQWcQzhcM+D4=;
 b=GLcac/DXvY77aseU3XK2l3mQ6IcV+OjMkVuZoRYS7uPouwFK8qMyaF9RfTV9wBKbH3I8dm
 PjPHEQy3PeBBkNklAUxqa+RXt1eSv7Jn4yYfx7CsJAw/kozUqbQqCBXmtciVrA/Xpx/mAt
 c9bZA95lhixwCJtLBl5SFnomWrESsYMywmIMFCDEqP0Vohuu84n0MDkTVoQQjhOFoltaEd
 sPv2wSr0K0pyOtzXAQmhUVPEJGa0y78G8qG8K7BvXZiHz1bwmc3u0GCr7CRT2f86PdN8ej
 o/fGGqnO3c+ctHMsXxRg1udm/u9Pz6e4uCNDjZE2TLBIQD4pwV8kZWbVlOVO3Q==
Message-ID: <4639130c-584a-a7ce-fa3a-c4537b9d6217@dupond.be>
Date: Wed, 10 May 2023 15:43:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RFC PATCH] QCOW2: Add zeroes discard option
To: Hanna Czenczek <hreitz@redhat.com>, qemu-devel@nongnu.org
References: <20230509090118.358857-1-jean-louis@dupond.be>
 <0a51c480-204d-1103-317e-fd638584eb84@redhat.com>
Content-Language: nl-BE, en-US
From: Jean-Louis Dupond <jean-louis@dupond.be>
In-Reply-To: <0a51c480-204d-1103-317e-fd638584eb84@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=51.159.20.238; envelope-from=jean-louis@dupond.be;
 helo=apollo.dupie.be
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

Thanks for the feedback! :)

On 10/05/2023 12:45, Hanna Czenczek wrote:
> Thanks for the patch!
>
> As a note for hopefully many future patches ( :) ), you should run 
> scripts/checkpatch.pl on them to check for coding style issues. Here, 
> it reports two lines that are longer than 80 characters.
Fixed!
>
> Second, ideally, patches are not just sent to the qemu-devel list, but 
> also to the maintainers for the code base in question (because they’re 
> the ones who will have to look at patches eventually, and because 
> qemu-devel has so much traffic, more often than not they don’t monitor 
> it).  scripts/get_maintainer.pl can tell you who they are (including 
> their email addresses).
Check!
>
> On 09.05.23 11:01, Jean-Louis Dupond wrote:
>> When we have a sparse qcow2 image and discard: unmap is enabled, there
>> is a lot of fragmentation in the image after some time. Surely on VM's
>> that do a lot of writes/deletes.
>> This causes the qcow2 image to grow even over 110% of its virtual size,
>> this because the free gaps in the image get to small to allocate new
>> continuous clusters.
>>
>> There are multiple ways to properly resolve this. One way is to not
>> discard the blocks on a discard request, but just zero them. This causes
>> the allocation the still exist, and results in no gaps.
>> This should also cause a perfectly continuous image when using full
>> preallocation.
>
> I think you should also mention why you want discard to work at all.  
> As far as I remember, it was that guests tend to prefer discard over 
> write-zero when they don’t care about the data in some unused block, 
> and you want those blocks to be efficiently copied when doing a 
> back-up.  You’ve explained why discard=unmap doesn’t work well in your 
> case, so you want it to be a write-zero operation, which will still 
> have everything be handled efficiently while retaining the allocation.
>
> Did I get that right?

The main thing discard is needed is indeed to keep the incremental 
backup size low.
Without doing discards, the blocks are just still there in the qcow2 
image, and marked as dirty by the dirty-block-tracking. But as the 
blocks still contain data, this causes big incremental backups, which 
are not wanted.
The way to resolve this is to discard, which causes the blocks to be 
removed and not included in the incremental backup.

>
>> RFC because my knowledge of qcow2 is limited, and I think its best some
>> developer with qcow2 knowledge has a look at it :)
>> Tested and seems to zero the blocks correctly instead of unmapping them.
>
> Now that I’m actually reviewing this patch I wonder whether we need to 
> do it in qcow2 at all.  Would it be simpler and better (because it 
> would work not only for qcow2) to have bdrv_co_pdiscard() translate a 
> discard request with UNMAP_ZERO into a bdrv_co_pwrite_zeroes()?
>
While the use-case here is currently only relevant on qcow2, I think its 
not an issue to do just the same on other block backends.
So it's a good idea to just move this into io.c
>> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1621
>> Signed-off-by: Jean-Louis Dupond <jean-louis@dupond.be>
>> ---
>>   block.c                              |  2 +
>>   block/io.c                           |  2 +-
>>   block/qcow2-cluster.c                | 85 +++++++++++++++-------------
>>   include/block/block-common.h         |  1 +
>>   qapi/block-core.json                 |  3 +-
>>   qemu-nbd.c                           |  2 +-
>>   qemu-options.hx                      |  2 +-
>>   storage-daemon/qemu-storage-daemon.c |  2 +-
>>   8 files changed, 54 insertions(+), 45 deletions(-)
>
> I have a question for the patch as-is, though, too: What is supposed 
> to happen if you use discard=zero on a non-qcow2 block device?  As far 
> as I understand, they will just unmap the area then, not leaving it 
> allocated.  But I think that isn’t the intention; I don’t think we 
> want to have discard=zero fall back to discard=unmap, so for drivers 
> that don’t support discard=zero, we should just do nothing and not 
> call their discard function.  (We could achieve this by having 
> bdrv_co_pdiscard() call bdrv_co_pwrite_zeroes(), as described above.)
>
> I think the behavior we want should also be explicitly described in 
> the documentation, as well as a guideline on when people may want to 
> use this option over discard=unmap (i.e. what I’d also like to have in 
> the commit message).
>
> Finally, a technical thing: To keep the diff smaller, I wouldn’t move 
> the whole qcow2_cluster_discard() function down, but instead 
> forward-declare zero_in_l2_slice() above it.

I'll post a new patch!

>
> Hanna
>

Thanks
Jean-Louis


