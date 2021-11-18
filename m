Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440AF455F34
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 16:18:37 +0100 (CET)
Received: from localhost ([::1]:48212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnjBL-0005G2-TX
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 10:18:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnjAB-0004Mx-5E
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 10:17:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnjA4-0003Ci-7y
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 10:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637248634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QlwuIWQzZ4c0/ffSd+yvQpDSg2FbH2w05Z/Aad0Opg8=;
 b=SQKfR/gXZJ1hQ620ybUelx1sRFuRu8YAWap0giNAasrD/xbIhbWHwNN4yC0Q4OEP98K5jg
 MZt68vKYsWpMD0UJPb1dR1XZ3FxfxxARhgYbXPhOn+WDvm0CAFWIp1pQ42w6eMJz5fJB+I
 uUhPhkeCVmvYHooLfeJXqboNnp7OFSU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-WGQAEgHDPc-42gJtmvt-bQ-1; Thu, 18 Nov 2021 10:17:12 -0500
X-MC-Unique: WGQAEgHDPc-42gJtmvt-bQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so2715502wme.6
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 07:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QlwuIWQzZ4c0/ffSd+yvQpDSg2FbH2w05Z/Aad0Opg8=;
 b=DW7UifaadiA5VgutRYktQQeEd6T/uXUQ76AzvesVdwr26FKpsRkzMmRBUQu5A9fOOo
 GGUf/hZ72en+zDvU45PDAJpa7SpsBKxM0yrOImWyIZ0iBbLtqjwXPzDEJlfamd7lhnj1
 ko6hTtJQvsRggRmrdIE9oKbcJM+O+IbYflpmGUpfyxWRao2QRX7h6Uq1SwzP2b/9NCdh
 9LeNeGAAllHTArZNAeKRFoeAH7pQPHUiGHktUw6XSvzQJfroEdryMQ2RnQJI2MeHgLPP
 QOr6GdetTGpum2sZ1W8rltmtzeVDzAcNiaGjAjE8+SllBpwa+olIW/UvaLZ+K/moJynw
 aDdQ==
X-Gm-Message-State: AOAM531g5CF95Gd+D/kJ80hGqzmfpo1c/KSTsv/eppvhKFqvbslUxIUF
 vigFiRcQoIIBvEjjbBjtpPOAy/guCV9hdvuQs9fjovtQsyyhfLNlnm4VuIaPepugRhfDXNrtCrJ
 rkaWOCpvEoUXlcYA=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr10503956wmi.173.1637248630570; 
 Thu, 18 Nov 2021 07:17:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxR84707b3zjO51ItrqMC/nb4ZVVo+NI8Hzo8UFABPOb1PwJxrsVs+ls/V/IzQ3EvQNLesEPA==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr10503896wmi.173.1637248630270; 
 Thu, 18 Nov 2021 07:17:10 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id g13sm206183wrd.57.2021.11.18.07.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 07:17:09 -0800 (PST)
Message-ID: <16aeb003-d96f-ac59-5605-b8490f9d07ce@redhat.com>
Date: Thu, 18 Nov 2021 16:17:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 08/25] block: introduce assert_bdrv_graph_writable
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-9-eesposit@redhat.com>
 <734073bb-80e6-3caf-d6b5-c8f2ade86044@redhat.com>
 <ff4a4c8e-93c3-2954-27ef-68587f3868ec@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <ff4a4c8e-93c3-2954-27ef-68587f3868ec@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.11.21 10:55, Emanuele Giuseppe Esposito wrote:
>
> On 12/11/2021 15:40, Hanna Reitz wrote:
>> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
>>> We want to be sure that the functions that write the child and
>>> parent list of a bs are under BQL and drain.
>>>
>>> BQL prevents from concurrent writings from the GS API, while
>>> drains protect from I/O.
>>>
>>> TODO: drains are missing in some functions using this assert.
>>> Therefore a proper assertion will fail. Because adding drains
>>> requires additional discussions, they will be added in future
>>> series.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>   block.c                                |  5 +++++
>>>   block/io.c                             | 11 +++++++++++
>>>   include/block/block_int-global-state.h | 10 +++++++++-
>>>   3 files changed, 25 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/block.c b/block.c
>>> index 41c5883c5c..94bff5c757 100644
>>> --- a/block.c
>>> +++ b/block.c
>>> @@ -2734,12 +2734,14 @@ static void 
>>> bdrv_replace_child_noperm(BdrvChild *child,
>>>           if (child->klass->detach) {
>>>               child->klass->detach(child);
>>>           }
>>> +        assert_bdrv_graph_writable(old_bs);
>>>           QLIST_REMOVE(child, next_parent);
>>
>> I think this belongs above the .detach() call (and the QLIST_REMOVE() 
>> belongs into the .detach() implementation, as done in 
>> https://lists.nongnu.org/archive/html/qemu-block/2021-11/msg00240.html, 
>> which has been merged to Kevin’s block branch).
>
> Yes, I rebased on kwolf/block branch. Thank you for pointing that out.
>>
>>>       }
>>>       child->bs = new_bs;
>>>       if (new_bs) {
>>> +        assert_bdrv_graph_writable(new_bs);
>>>           QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
>>
>> In both these places it’s a bit strange that the assertion is done on 
>> the child nodes.  The subgraph starting from them isn’t modified 
>> after all, so their subgraph technically doesn’t need to be 
>> writable.  I think a single assertion on the parent node would be 
>> preferable.
>>
>> I presume the problem with that is that we don’t have the parent node 
>> here?  Do we need a new BdrvChildClass method that performs this 
>> assertion on the parent node?
>>
>
> Uhm I am not sure what you mean here.
>
> Just to recap on how I see this: the assertion 
> assert_bdrv_graph_writable(bs) is basically used to make sure we are 
> protecting the write on some fields (childrens and parents lists in 
> this patch) of a given @bs.

Oh, OK.  I understood it to mean that the subgraph starting at `bs` is 
mutable, i.e. including all of its recursive children.

And yes, you’re right, the child BDSs are indeed modified, too, so we 
should check them, too.

> It should work like a rwlock: reading is allowed to be concurrent, but 
> a write should stop all readers to prevent concurrency issues. This is 
> achieved by draining.

Draining works on a subgraph, so I suppose it does mean that the whole 
subgraph will be mutable.  But no matter, at least new_bs is not in the 
parent’s subgraph, so it wouldn’t be included in the check if we only 
checked the parent.

> Let's use the first case that you point out, old_bs (it's specular for 
> new_bs):
>
> >> +        assert_bdrv_graph_writable(old_bs);
> >>           QLIST_REMOVE(child, next_parent);
>
> So old_bs should be the child "son" (child->bs), meaning 
> old_bs->parents contains the child. Therefore when a child is removed 
> by old_bs, we need to be sure we are doing it safely.
>
> So we should check that if old_bs exists, old_bs should be drained, to 
> prevent any other iothread from reading the ->parents list that is 
> being updated.
>
> The only thing to keep in mind in this case is that just wrapping a 
> drain around that won't be enough, because then the child won't be 
> included in the drain_end(old_bs). Therefore the right way to cover 
> this drain-wise once the assertion also checks for drains is:
>
> drain_begin(old_bs)
> assert_bdrv_graph_writable(old_bs)
> QLIST_REMOVE(child, next_parent)
> /* old_bs will be under drain_end, but not the child */
> bdrv_parent_drained_end_single(child);
> bdrv_drained_end(old_bs);
>
> I think you agree on this so far.
>
> Now I think your concern is related to the child "parent", namely 
> child->opaque. The problem is that in the .detach and .attach 
> callbacks we are firstly adding/removing the child from the list, and 
> then calling drain on the subtree.

It was my impression that you’d want bdrv_replace_child_noperm() to 
always be called in a section where the subgraph starting from the 
parent BDS is drained, not just the child BDSs that are swapped (old_bs 
and new_bs).

My abstract concern is that bdrv_replace_child_noperm() does not modify 
only old_bs and new_bs, but actually modifies the whole subgraph 
starting at the parent node.  A concrete example for this is that we 
modify not only the children’s parent lists, but also the parent’s 
children list.

That’s why I’m asking why we only check that the graph is writable for 
the children, when actually I feel like we’re modifying the parent, too.

> We would ideally need to do the opposite:
>
> assert_bdrv_graph_writable(bs);
> QLIST_REMOVE(child, next);
> bdrv_unapply_subtree_drain(child, bs);
>
> In this case I think this would actually work, because removing/adding 
> the child from the ->children list beforehand just prevents an 
> additional recursion call (I think, and the fact that tests are 
> passing seems to confirm my theory).
>
> Of course you know this stuff better than me, so let me know if 
> something here is wrong.

Well.  I’m mostly wondering why you’re discussing how to do the drain 
right when I was mostly curious about why we check the children and not 
the parent for whether the graph is mutable at their respective 
position. O:)

It was my impression that so far we mostly wrapped graph change 
operations in drained sections (starting at the parent) and not leave it 
to bdrv_replace_child_noperm() to do so.  That function only deals with 
drain stuff because it balances the drain counters on old_bs and new_bs 
to match the counter on the parent’s subgraph.

Hanna


