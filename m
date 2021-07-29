Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FE03DA4B2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 15:48:53 +0200 (CEST)
Received: from localhost ([::1]:51932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m96P6-0003O2-SI
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 09:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m96NX-0002Ub-9f
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:47:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m96NU-0006wP-F6
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627566430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Agwwc/0oXUaQMLg7jYTKBrw9CDR1NlXgP5oZukPgYs=;
 b=SLbwhf92sdMmfarSSSqLK2fC7nSWYJAaqmek6wJxFWNlTR2xOaheVYpbpxORC74FlpfsBS
 un8I0vKSqVW4FnLrGv7yRNsacwsrRWogwRu2GNv9B9t0bY6EOjaK4hJ2FTUOXxfd2O8Wkf
 2l75sBTMVBLQ0cFcmfIQ8m+t4lBoW3o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-LBfH0C7cNpiw2Gpc37c-OQ-1; Thu, 29 Jul 2021 09:47:09 -0400
X-MC-Unique: LBfH0C7cNpiw2Gpc37c-OQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 f6-20020adfe9060000b0290153abe88c2dso2264115wrm.20
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 06:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4Agwwc/0oXUaQMLg7jYTKBrw9CDR1NlXgP5oZukPgYs=;
 b=Z7hWRlsIOB4dQkgEA92FuixPs6QN+GM/B53LWk283Wy8eDseJIbSPbO/nYQeCB9hIC
 vpkN+sB6InRgFnhVTiyQItHC5SXf0kFRdwKWUBDVrGcML7QWbL2MKGRLJTy73gIyYySM
 K/JNPGteTq6QCX/a6vdeSujJWjduZpJONNFk99S/vJB6Wp8m978DF5/27VKeJ1JGDoeC
 /GwogmFZGtq1YnSn1UnHGEpo6AO4gx1/tQW4XRc12Fh+hIPrttttMqX/5HS+zm9Nr1/6
 6xLOKTlsq/3xs5cAYd8MQQLiTbv5EjlKIVsfwCSq+/VrZn/lrE3mfxSa9drZS3QGvzXB
 0I0A==
X-Gm-Message-State: AOAM530kGcjzBbh8AOBENpKkowEKTwDzpM3ppISinV1zo897CU1/fGb/
 bSeWAm+OsLt9G/74ZOsGP8H9imFYP1crAue7TIzVz6x4aqpOQFzpOd/Yy+w6RHiS+jxipqxmtsI
 deRl1nJGmznAQvYc=
X-Received: by 2002:a5d:61c8:: with SMTP id q8mr4904239wrv.151.1627566428139; 
 Thu, 29 Jul 2021 06:47:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0T/XMivCC1kCl7cJUOuT6E2jGDC6ucQ6gjKI5NJ0fgAobbdzz4rrvlFFvlYX1+O59ABr54Q==
X-Received: by 2002:a5d:61c8:: with SMTP id q8mr4904207wrv.151.1627566427913; 
 Thu, 29 Jul 2021 06:47:07 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 l14sm4619913wrs.22.2021.07.29.06.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 06:47:07 -0700 (PDT)
Subject: Re: [PATCH RFC 0/3] mirror: rework soft-cancelling READY mirror
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210727164754.62895-1-vsementsov@virtuozzo.com>
 <eb6db91e-9b6b-331e-8a8d-ee4fcf60ff2f@redhat.com>
 <19e149dc-ff1a-09b3-2d6c-2d046e9daabb@virtuozzo.com>
 <660d9a7b-beb9-c2a2-33eb-d894aae8b1e0@redhat.com>
 <af37e046-46d3-2791-f91d-bdbaec9ee5e5@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a8e6f5d7-2bf8-6214-3689-6350592eab07@redhat.com>
Date: Thu, 29 Jul 2021 15:47:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <af37e046-46d3-2791-f91d-bdbaec9ee5e5@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.07.21 13:35, Vladimir Sementsov-Ogievskiy wrote:
> 29.07.2021 13:38, Max Reitz wrote:
>> On 29.07.21 12:02, Vladimir Sementsov-Ogievskiy wrote:
>>> 28.07.2021 10:00, Max Reitz wrote:
>>>> On 27.07.21 18:47, Vladimir Sementsov-Ogievskiy wrote:
>>>>> Hi all!
>>>>>
>>>>> That's an alternative to (part of) Max's
>>>>> "[PATCH for-6.1? v2 0/7] mirror: Handle errors after READY cancel"
>>>>> and shows' my idea of handling soft-cancelling READY mirror case
>>>>> directly in qmp_block_job_cancel. And cleanup all other job 
>>>>> cancelling
>>>>> functions.
>>>>>
>>>>> That's untested draft, don't take it to heart :)
>>>>
>>>> Well, I would have preferred it if you’d rebased this on top of 
>>>> that series, precisely because it’s an alternative to only part of 
>>>> it. And if it’s just an untested draft, that would have been even 
>>>> better, because it would’ve given a better idea on what the cleanup 
>>>> looks like.
>>>>
>>>> There are also things like this series making cancel internally 
>>>> always a force-cancel, where I’m not sure whether we want that in 
>>>> the replication driver or not[1].  With my series, we add an 
>>>> explicit parameter, so we’re forced to think about it, and then in 
>>>> this series on top we can just drop the parameter for all 
>>>> force-cancel invocations again, and for all non-force-cancel 
>>>> invocations we would have to think a bit more.
>>>
>>> I now don't sure that patch 5 of your series is correct (see my last 
>>> answer to it), that's why I decided to not base on it.
>>
>> Well, we can always take patch 5 from v1.  (Where I changed any 
>> job_is_cancelled() to job_cancel_requested() when it influenced the 
>> external interface.)
>>
>>> My series has the benefit of handling soft-mirror-cancel case the 
>>> other way and handles mirror finalization in case of soft-cancel 
>>> properly.
>>>
>>>>
>>>> Specifically as for this series, I don’t like job_complete_ex() 
>>>> very much, I think the parameter should be part of job_complete() 
>>>> itself.
>>>
>>> That was my idea. But job_complete is passed as function pointer, so 
>>> changing its prototype would be more work.. But I think it's possible.
>>>
>>>>   If we think that’s too specific of a mirror parameter to include 
>>>> in normal job_complete(), well, then there shouldn’t be a 
>>>> job_complete_ex() either, and do_graph_change should be a property 
>>>> of the mirror job (perhaps as pivot_on_completion) that’s cleared 
>>>> by qmp_block_job_cancel() before invoking job_complete().
>>>
>>> This way users will lose a way to make a decision during job running..
>>
>> On the contrary, it would be a precursor to letting the user change 
>> this property explicitly with a new QMP command.
>>
>>> But probably they don't need actually. Moving the option to mirror 
>>> job parameter seems a good option to me.
>>>
>>>>
>>>> Max
>>>>
>>>> [1] Although looking at it again now, it probably wants force-cancel.
>>>>
>>>
>>>
>>> What do you think of my idea to keep old bugs as is and just 
>>> deprecate block-job-cancel and add a new interface for 
>>> "no-graph-change mirror" case?
>>
>> I don’t see a reason for that.  The fix isn’t that complicated.
>>
>> Also, honestly, I don’t see a good reason for deprecating anything.
>>
>
> Current interface lead to mess in the code, that's bad. Cancellation 
> mode that is actually a kind of completion (and having comments in 
> many places about that) - that shows for me that interface is not 
> good.. It's a question of terminology, what to call "cancel". Also, 
> that's not the first time this question arise. Remember my recent 
> cancel-in-flight-requests series, when I thought that "cancel is 
> cancel" and didn't consider soft-cancel of mirror.. And reviewers 
> didn't caught it. I don't think that interface is good, it will always 
> confuse new developers and users. But that's just my opinion, I don't 
> impose it )
>
> If not deprecate, i.e. if we consider old interface to be good, than 
> no reason for this my series and for introducing new interface :)

I’m not against a better interface, I’m against using this current bug 
as an excuse to improve the interface.  We’ve known we want to improve 
the interface for quite a long time now, we don’t need an excuse for that.

If we use this bug as an excuse, I’m afraid of becoming hung up on 
interface discussions instead of just getting the bug fixed.  And we 
must get the bug fixed, it’s real, it’s kind of bad, and saying “it 
won’t appear with the new interface, let’s not worry about the old one” 
is not something I like.

OTOH, if we use this bug as an excuse, I’m also afraid of trying to rush 
the design instead of actually implementing the interface that we’ve 
always desired, i.e. where the user gets to choose the completion mode 
via yet-to-be-implemented some job property setter function.

As a final note (but this is precisely the interface discussion that I 
want to avoid for now), I said I don’t see a good reason for deprecating 
anything, because `job-cancel force=false` can just internally do 
`set-job-property .pivot_on_completion=false; job-complete`.  From an 
implementation perspective, that should be simple.

I understand that for users the existence of the `force` flag may still 
be confusing and so we might want to deprecate it for that reason, but 
again, this is the interface discussion that I think we don’t actually 
need right now.

And that’s why I’d prefer for any clean-up to come on top of fixing the 
existing bug, so we can have separate discussions and take our time with 
the interface without feeling driven by the need to fix a bug.

Max


