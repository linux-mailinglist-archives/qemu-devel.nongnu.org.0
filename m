Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA43C4CD7D2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:31:36 +0100 (CET)
Received: from localhost ([::1]:60368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9u3-0000GL-OT
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:31:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nQ9PN-0006q5-IL
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:59:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nQ9PL-0001y8-FQ
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646405990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tw3tLbTH2JCCMiTiaF2z1vppS/rlHHIxj4dj6drERFQ=;
 b=I7UEOqTbAZceG0UfoRXk++NpGqMsy74QmUanj9t1ReJq+nMjjDvllsG1gxZUHftaYRwabf
 UNeq7V35K1NnqnOe3vVz01MrbRCBIcZxfcgT7iMfIdzrMhZgJ0BIqtC5w/UtGCYvI8/Tw/
 7GaItHqx30rJNonPEgRVcenJ4Sr0Ye0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-KVsuSwq1NI6DnxK_viD3pg-1; Fri, 04 Mar 2022 09:59:48 -0500
X-MC-Unique: KVsuSwq1NI6DnxK_viD3pg-1
Received: by mail-ej1-f70.google.com with SMTP id
 m4-20020a170906160400b006be3f85906eso4531082ejd.23
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 06:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tw3tLbTH2JCCMiTiaF2z1vppS/rlHHIxj4dj6drERFQ=;
 b=8O6EkkrwQM5+b/9zN57fhQdZ+pSlPn/zYjh+9D5NPT1015enfTGYiemBg3CajjnLbu
 3xXwdHO4wSt/njTw0TMMJEvaJQMuHPPBlZcH0H9tV3GdYegaN5oIDCHwlJ3Xllosse75
 FeLj7FwaXGPuuu8cButVNXYz68XNxMoKqSyqHsg6qIu4uJvl/RXbfcwzfuNDD7CrUEcf
 qfgeobbK71nhB9YWGRk/fWXdP8+6+QbkvmnVpk1wlQQaUHx/zHaSTvI4X963MkkMnTYl
 SA2DLvndGEmqWZ3WsXWTb601X4RFJoh2AUa7RoQtvIXSRO0CvMwGLtBDEEqBXL/na46t
 dwEQ==
X-Gm-Message-State: AOAM532meKW2yoH14+q04jxnJLM91sfXWRqsU9FQvgnGYHHZQMiWyVbp
 HxOYrk0lW5PlSuVYWJxgJ9eJj07wa54evHcx8FkIRRSYfnSiXOHwsAZuGw6uWvekgGmDnqnZHqQ
 GovQCj01SjolW02Y=
X-Received: by 2002:a05:6402:369c:b0:413:2bc0:3f00 with SMTP id
 ej28-20020a056402369c00b004132bc03f00mr39363842edb.126.1646405986856; 
 Fri, 04 Mar 2022 06:59:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztl3nopGAJPsbztaonasOIUeGooRUaJtzkkxZKvzNC/3gbHVQiYyJCxnKnXSUOhAe5Z6eEug==
X-Received: by 2002:a05:6402:369c:b0:413:2bc0:3f00 with SMTP id
 ej28-20020a056402369c00b004132bc03f00mr39363812edb.126.1646405986461; 
 Fri, 04 Mar 2022 06:59:46 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 s14-20020aa7cb0e000000b00410bf015567sm2119780edt.92.2022.03.04.06.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 06:59:46 -0800 (PST)
Message-ID: <492f0db3-751b-4ac5-d55e-784c7b44d594@redhat.com>
Date: Fri, 4 Mar 2022 15:59:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] block: Make bdrv_refresh_limits() non-recursive
To: Kevin Wolf <kwolf@redhat.com>
References: <20220216105355.30729-1-hreitz@redhat.com>
 <20220216105355.30729-2-hreitz@redhat.com> <YiDzOnUmNYy9sABR@redhat.com>
 <597e457f-2e41-8883-0bd0-97ccc49f17b4@redhat.com>
 <YiIevvycAAzQZpmn@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <YiIevvycAAzQZpmn@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.03.22 15:14, Kevin Wolf wrote:
> Am 04.03.2022 um 13:44 hat Hanna Reitz geschrieben:
>> On 03.03.22 17:56, Kevin Wolf wrote:
>>> Am 16.02.2022 um 11:53 hat Hanna Reitz geschrieben:
>>>> bdrv_refresh_limits() recurses down to the node's children.  That does
>>>> not seem necessary: When we refresh limits on some node, and then
>>>> recurse down and were to change one of its children's BlockLimits, then
>>>> that would mean we noticed the changed limits by pure chance.  The fact
>>>> that we refresh the parent's limits has nothing to do with it, so the
>>>> reason for the change probably happened before this point in time, and
>>>> we should have refreshed the limits then.
>>>>
>>>> On the other hand, we do not have infrastructure for noticing that block
>>>> limits change after they have been initialized for the first time (this
>>>> would require propagating the change upwards to the respective node's
>>>> parents), and so evidently we consider this case impossible.
>>> I like your optimistic approach, but my interpretation would have been
>>> that this is simply a bug. ;-)
>>>
>>> blockdev-reopen allows changing options that affect the block limits
>>> (most importantly probably request_alignment), so this should be
>>> propagated to the parents. I think we'll actually not see failures if we
>>> forget to do this, but parents can either advertise excessive alignment
>>> requirements or they may run into RMW when accessing the child, so this
>>> would only affect performance. This is probably why nobody reported it
>>> yet.
>> Ah, right, I forgot this for parents of parents...  I thought the
>> block limits of a node might change if its children list changes, and
>> so we should bdrv_refresh_limits() when that children list changes,
>> but forgot that we really do need to propagate this up, right.
> I mean the case that you mention is true as well. A few places do call
> bdrv_refresh_limits() after changing the graph, but I don't know if it
> covers all cases.
>
>>>> If this case is impossible, then we will not need to recurse down in
>>>> bdrv_refresh_limits().  Every node's limits are initialized in
>>>> bdrv_open_driver(), and are refreshed whenever its children change.
>>>> We want to use the childrens' limits to get some initial default, but
>>>> we can just take them, we do not need to refresh them.
>>> I think even if we need to propagate to the parents, we still don't need
>>> to propagate to the children because the children have already been
>>> refreshed by whatever changed their options (like bdrv_reopen_commit()).
>>> And parent limits don't influence the child limits at all.
>>>
>>> So this patch looks good to me, just not the reasoning.
>> OK, so, uh, can we just drop these two paragraphs?  (“On the other hand...”
>> and “If this case is impossible…”)
>>
>> Or we could replace them with a note hinting at the potential bug that would
>> need to be fixed, e.g.
>>
>> “
>> Consequently, we should actually propagate block limits changes upwards,
>> not downwards.  That is a separate and pre-existing issue, though, and
>> so will not be addressed in this patch.
>> ”
> Ok, I'm replacing this in my tree.
>
>> Question is, if we at some point do propagate this upwards, won’t this cause
>> exactly the same problem that this patch is trying to get around, i.e. that
>> we might call bdrv_refresh_limits() on non-drained parent nodes?
> Drain also propagates upwards, so at least those callers that drain the
> node itself won't have the problem. And the other cases from the commit
> messages look like they shouldn't have any parents.

Finally some good news today :)


