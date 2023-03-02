Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633B16A7F42
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:58:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfgr-00024p-Cq; Thu, 02 Mar 2023 04:57:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clopez@suse.de>) id 1pXfgp-00024S-7x
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:57:31 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <clopez@suse.de>) id 1pXfgn-0003Ec-LM
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:57:30 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DF0BF21C0D;
 Thu,  2 Mar 2023 09:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677751045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x+spYAzPACDUWFORP0nXJ+VxTOgkjLe+sIidHUd2V64=;
 b=RclX6NG3X1Xn98fu9LNQ3tZPHIl7Xd9VlpXeYJO2aPnRl954UPPDiki/wtRf/FhVBdKzhw
 M+/KAsrArc0jcs5KFCn0Yus74IZEPqFdsF5aPK0/QApOzzqzT9PVAsJyJRoOMJeIDZgtFf
 +Tb6rxOus9edXxEE9KPaCdNrPN+X7aY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677751045;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x+spYAzPACDUWFORP0nXJ+VxTOgkjLe+sIidHUd2V64=;
 b=yqdIes91WstHbKOajxZascXA83MKOoVdd+hlZPA+B3zIxfLL31+EqMP/5/48BjG+J+RpZI
 8Waa99nqB8RlENAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B072813349;
 Thu,  2 Mar 2023 09:57:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +BTiJwVzAGT9SQAAMHmgww
 (envelope-from <clopez@suse.de>); Thu, 02 Mar 2023 09:57:25 +0000
Message-ID: <a536aad0-996a-7675-ac6f-28958799dfcc@suse.de>
Date: Thu, 2 Mar 2023 10:57:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] virtio: fix reachable assertion due to stale value of
 cached region size
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20230215221444.29845-1-clopez@suse.de>
 <20230301170016-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Carlos_L=c3=b3pez?= <clopez@suse.de>
In-Reply-To: <20230301170016-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=clopez@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,

On 1/3/23 23:03, Michael S. Tsirkin wrote:>> diff --git 
a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>> index f35178f5fc..db70c4976e 100644
>> --- a/hw/virtio/virtio.c
>> +++ b/hw/virtio/virtio.c
>> @@ -1071,6 +1071,7 @@ static void virtqueue_split_get_avail_bytes(VirtQueue *vq,
>>       VirtIODevice *vdev = vq->vdev;
>>       unsigned int max, idx;
>>       unsigned int total_bufs, in_total, out_total;
>> +    MemoryRegionCache *desc_cache;
> 
> why are you moving desc_cache here?

Just to make virtqueue_split_get_avail_bytes() and 
virtqueue_packed_get_avail_bytes() symmetrical, but I'll keep it out of v2.

>>       MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
>>       int64_t len = 0;
>>       int rc;
>> @@ -1078,15 +1079,13 @@ static void virtqueue_split_get_avail_bytes(VirtQueue *vq,
>>       idx = vq->last_avail_idx;
>>       total_bufs = in_total = out_total = 0;
>>   
>> -    max = vq->vring.num;
>> -
>>       while ((rc = virtqueue_num_heads(vq, idx)) > 0) {
>> -        MemoryRegionCache *desc_cache = &caches->desc;
>> -        unsigned int num_bufs;
>> +        unsigned int num_bufs = total_bufs;
>>           VRingDesc desc;
>>           unsigned int i;
>>   
>> -        num_bufs = total_bufs;
> 
> nice cleanup but not a bugfix. Keep cleanups separate from fixes pls.

Ok makes sense.

>> +        desc_cache = &caches->desc;
> 
> init as part of declaration seems cleaner.
> 
>> +        max = vq->vring.num;
>>   
> 
> can we move declaration of max here within the loop?
> will make sure the problem does not recur.

Yes, sounds good.

>>           if (!virtqueue_get_head(vq, idx++, &i)) {
>>               goto err;
>> @@ -1218,14 +1217,14 @@ static void virtqueue_packed_get_avail_bytes(VirtQueue *vq,
>>       wrap_counter = vq->last_avail_wrap_counter;
>>       total_bufs = in_total = out_total = 0;
>>   
>> -    max = vq->vring.num;
>> -
>>       for (;;) {
>>           unsigned int num_bufs = total_bufs;
>>           unsigned int i = idx;
>>           int rc;
>>   
>>           desc_cache = &caches->desc;
>> +        max = vq->vring.num;
>> +
> 
> 
> same question can we move declaration into the loop?

Same as above.

-- 
Carlos López
Security Engineer
SUSE Software Solutions

