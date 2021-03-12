Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6563390F4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 16:16:07 +0100 (CET)
Received: from localhost ([::1]:57516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKjWB-0000C3-Nm
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 10:16:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lKjU1-00075G-1H
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:13:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lKjTy-0000Kj-TW
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:13:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615562022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jCfdjtLlM2fztly+RUtxUkASATiuDH4cqCLwzOYuBRE=;
 b=UpsIHGiX0rX0oNObCZyYwYfBjOSLt9PyZPP05lqpROLb9+RB03yguMDQf6j6YCq1NtSqRI
 m0GxoGeaHvjNWANCJB2vP+XSCALelClbMiz7r5WDPNNrU8UfY0GS/z110OBOnRzVNAfnPD
 MWUp/Eb46IovG8sAkbdKBcvdmkLyTyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-ndnl9mR1PV2yGrTuMpPG1A-1; Fri, 12 Mar 2021 10:13:40 -0500
X-MC-Unique: ndnl9mR1PV2yGrTuMpPG1A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18008101F003;
 Fri, 12 Mar 2021 15:13:39 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-148.ams2.redhat.com
 [10.36.113.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAEE81001281;
 Fri, 12 Mar 2021 15:13:37 +0000 (UTC)
Subject: Re: [PATCH v3 4/6] util: implement seqcache
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-5-vsementsov@virtuozzo.com>
 <d9a75e53-0791-2cd7-f530-d07ea59fbe59@redhat.com>
 <f0acd8b3-4f43-1a37-b08c-27f710fb3a60@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <f53fc06c-38df-f9fe-e927-b4f1b9bd5263@redhat.com>
Date: Fri, 12 Mar 2021 16:13:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <f0acd8b3-4f43-1a37-b08c-27f710fb3a60@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.03.21 15:37, Vladimir Sementsov-Ogievskiy wrote:
> 12.03.2021 16:41, Max Reitz wrote:
>> On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
>>> Implement cache for small sequential unaligned writes, so that they may
>>> be cached until we get a complete cluster and then write it.
>>>
>>> The cache is intended to be used for backup to qcow2 compressed target
>>> opened in O_DIRECT mode, but can be reused for any similar (even not
>>> block-layer related) task.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   include/qemu/seqcache.h |  42 +++++
>>>   util/seqcache.c         | 361 ++++++++++++++++++++++++++++++++++++++++
>>>   MAINTAINERS             |   6 +
>>>   util/meson.build        |   1 +
>>>   4 files changed, 410 insertions(+)
>>>   create mode 100644 include/qemu/seqcache.h
>>>   create mode 100644 util/seqcache.c
>>
>> Looks quite good to me, thanks.  Nice explanations, too. :)
>>
>> The only design question I have is whether there’s a reason you’re 
>> using a list again instead of a hash table.  I suppose we do need the 
>> list anyway because of the next_flush iterator, so using a hash table 
>> would only complicate the implementation, but still.
> 
> Yes, it seems correct for flush iterator go in same order as writes 
> comes, so we need a list. We can add a hash table, it will only help on 
> read.. But for compressed cache in qcow2 we try to flush often enough, 
> so there should not be many clusters in the cache. So I think addition 
> of hash table may be done later if needed.

Sure.  The problem I see is that we’ll probably never reach the point of 
it really being needed. O:)

So I think it’s a question of now or never.

[...]

>>> + */
>>> +bool seqcache_get_next_flush(SeqCache *s, int64_t *offset, int64_t 
>>> *bytes,
>>> +                             uint8_t **buf, bool *unfinished)
>>
>> Could be “uint8_t *const *buf”, I suppose.  Don’t know how much the 
>> callers would hate that, though.
> 
> Will do. And actually I wrote quite big explanation but missed the fact 
> that caller don't get ownership on buf, it should be mentioned.

Great, thanks.

>>> +{
>>> +    Cluster *req = s->next_flush;
>>> +
>>> +    if (s->next_flush) {
>>> +        *unfinished = false;
>>> +        req = s->next_flush;
>>> +        s->next_flush = QSIMPLEQ_NEXT(req, entry);
>>> +        if (s->next_flush == s->cur_write) {
>>> +            s->next_flush = NULL;
>>> +        }
>>> +    } else if (s->cur_write && *unfinished) {
>>> +        req = s->cur_write;
>>
>> I was wondering whether flushing an unfinished cluster wouldn’t kind 
>> of finalize it, but I suppose the problem with that would be that you 
>> can’t add data to a finished cluster, which wouldn’t be that great if 
>> you’re just flushing the cache without wanting to drop it all.
>>
>> (The problem I see is that flushing it later will mean all the data 
>> that already has been written here will have to be rewritten.  Not 
>> that bad, I suppose.)
> 
> Yes that's all correct. Also there is additional strong reason: qcow2 
> depends on the fact that clusters become "finished" by defined rules: 
> only when it really finished up the the end or when qcow2 starts writing 
> another cluster.
> 
> For "finished" clusters with unaligned end we can safely align this end 
> up to some good alignment writing a bit more data than needed. It's safe 
> because tail of the cluster is never used. And we'll perform better with 
> aligned write avoiding RMW.
> 
> But when flushing "unfinished" cluster, we should write exactly what we 
> have in the cache, as there may happen parallel write to the same 
> cluster, which will continue the sequential process.

OK, thanks for the explanation.

Max


