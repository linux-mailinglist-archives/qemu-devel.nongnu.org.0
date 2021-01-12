Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148002F34D5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 16:57:25 +0100 (CET)
Received: from localhost ([::1]:58592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzM2t-0003Ms-Jj
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 10:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzM1I-0002kg-ED
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 10:55:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzM1E-0000OK-Sx
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 10:55:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610466939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TLzapb1caPyu4xvuUlIPQ66jajn7eHGo0LkwH30G7nY=;
 b=f5tJtbDFstXAdxCOyv/7Ay4kh8o9dCPv7Q5eQZjiqSSYeF1EkqSlNivDMUyQPlxdHiDfJD
 v9JdXlfXxX8i/a9GUegsr3z0DwXlBmA8NUgVC594ClqTx8h4dS6CKvC1E8lmzlbZUHhZBt
 T5qgR8uQ3uikwZCIYrRBTM7KfWTwpMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-E8Ayx1DUOUOttF59Zpyedw-1; Tue, 12 Jan 2021 10:55:37 -0500
X-MC-Unique: E8Ayx1DUOUOttF59Zpyedw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01D37802B42;
 Tue, 12 Jan 2021 15:55:36 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-161.ams2.redhat.com
 [10.36.115.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 973E36E416;
 Tue, 12 Jan 2021 15:55:33 +0000 (UTC)
Subject: Re: [PATCH v3 20/25] qapi: backup: disable copy_range by default
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201026171815.13233-1-vsementsov@virtuozzo.com>
 <20201026171815.13233-21-vsementsov@virtuozzo.com>
 <c7c8350e-10cd-c8fa-552c-e3ced98ef861@redhat.com>
 <b94c695f-4c1e-2a5f-278e-78cf76782b03@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <60372c92-aad9-7adb-dd51-d0b733d1f7cf@redhat.com>
Date: Tue, 12 Jan 2021 16:55:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <b94c695f-4c1e-2a5f-278e-78cf76782b03@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.01.21 16:44, Vladimir Sementsov-Ogievskiy wrote:
> 12.01.2021 17:05, Max Reitz wrote:
>> On 26.10.20 18:18, Vladimir Sementsov-Ogievskiy wrote:
>>> Further commit will add a benchmark
>>> (scripts/simplebench/bench-backup.py), which will show that backup
>>> works better with async parallel requests (previous commit) and
>>> disabled copy_range. So, let's disable copy_range by default.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   qapi/block-core.json | 2 +-
>>>   blockdev.c           | 2 +-
>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> Uh, well, er, then why did you add it as true in patch 2?
>>
>> Do you mean this patch as the basis for a discussion whether it should 
>> be true or false by default? 
> 
> Yes, I just kept the change in separate, to make it simpler to discuss.. 
> Hmm, or seems I've tried to keep it close to the point when we are going 
> to increase performance anyway (and making default false is needed for 
> good final performance), when if we do the change earlier it would like 
> a degradation during previous 20 commits.

Hm, yes, before this series, copy_range is effectively the default, right.

>> I don’t have anything to contribute, though, ergo I don’t mind either 
>> way.
>>
>> Do you have an idea why copy offloading isn’t better?
>>
> 
> As I understand, it may be really fast for filesystem which will avoid 
> data copying, like btrfs. Why it works slower for others when we enable 
> async + block-status things, I don't know. It should depend on kernel 
> implementation.
> 
> I have two additional thoughts:
> 
> 1. for backup we usually want to do a copy on another node, or at least 
> another hard drive, so we really going to copy the data, not just create 
> some metadata links in fs.
> 
> 2. even if fs can just create some links to existing clusters instead of 
> copying data, IMHO it is not good for backup:
> 
> Main difference of backup from snapshot is that we don't touch active 
> disk: it works in the same way like without backup job running. But if 
> we do create fs-metadata links in backup image to original clusters, it 
> means that on next guest write fs will have to do COW operation, so 
> backup file will reference old cluster from active disk, and new cluster 
> will be allocated for active disk. This means, that backup job influence 
> on active vm disk, increasing its fragmentation.. Possibly I'm wrong, 
> I'm not really good in how filesystems works.

Both sound like good points to me.  So as far as I’m concerned, 
disabling copy offloading sounds good to me.

So now this separate patch here makes sense to me:

Reviewed-by: Max Reitz <mreitz@redhat.com>

Perhaps it deserves some explanation in a commit message, though.  I.e., 
that originally, this defaulted to true, as it was before, but now that 
async copying is implemented, we should let it default to false.

Max


