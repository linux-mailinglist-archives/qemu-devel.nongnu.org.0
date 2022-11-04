Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEE761921E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 08:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqrFx-0000Yx-No; Fri, 04 Nov 2022 03:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqrET-0007z6-JG
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 03:35:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqrEQ-0003xM-WF
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 03:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667547313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSoA1e7ZzxP68EwlMejZ/wGgfswP4eLGZ9/MvjWUHmc=;
 b=SoU82T5vLwp6Vra6lgDmnqiGseAHDD2WO7wQvKaTcKTdGDu41pFoqFyBjL+1hYkwKKRUXk
 EfddzQ1aP5bpNRUAEh3VLqfkPF2E78DgoHOSp5T+4q/qT/gBelWKo80VDuWsN+o589XUpJ
 yv3NxKSW/wufwqDFbmpBzQW6+4bhgZg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-57-0kP_p2VDNQSatqTKUb0JOA-1; Fri, 04 Nov 2022 03:35:12 -0400
X-MC-Unique: 0kP_p2VDNQSatqTKUb0JOA-1
Received: by mail-wr1-f72.google.com with SMTP id
 u20-20020adfc654000000b0022cc05e9119so954727wrg.16
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 00:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vSoA1e7ZzxP68EwlMejZ/wGgfswP4eLGZ9/MvjWUHmc=;
 b=hHxhfAWLB2j/Xg7sFftN+xGuqIWNe97IHYbbCHLUP2uEpzH/CGcym/4TPR6QnJgNx0
 wBgB2+tfDKdn9KJo62mGhja4cAIyqQE6Ha2IHySWKBpqWRALmdoUnm6HaIgs9IOfd6wz
 tmEO9arpTsj+uss4RxRa6wR3b7WngLO5oApvci4rWYUha0VHdqR3AjzFVXd9kNPRQUgr
 E/gJcaFHDUUSx5WZ/pb149P+QISq/+cMa2BzfZmsMrz5RcmEblyF5JhRiFZ2m5qYRKUr
 f4No4ejc3GSKe7rdNM2pNiE4fBCdEAadXGVC1udpSan2+uEe7bkT5TMYlmdDvCPRXu0r
 sUXQ==
X-Gm-Message-State: ACrzQf213jeTN5qJVMKZF0SlbwHoPD/xZRTNGjPKr4eKridszQSso5J0
 pBGHfUmnkpfybTsIsTgUquE6dbbvsFt6tDezp4B/sD731x7Kf0ldDWphnbcIRl0bykmlaKRJZ1B
 O2l5KH7ZhOZvxed0=
X-Received: by 2002:a05:600c:3c92:b0:3b5:62e4:e423 with SMTP id
 bg18-20020a05600c3c9200b003b562e4e423mr22595292wmb.162.1667547311014; 
 Fri, 04 Nov 2022 00:35:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6AMJcstaksTnVLzfF+ZDwogh8c3JDwnrKbIinto5Vsy5xcsPkq4/cYVSIQCWIprU5V914MSA==
X-Received: by 2002:a05:600c:3c92:b0:3b5:62e4:e423 with SMTP id
 bg18-20020a05600c3c9200b003b562e4e423mr22595266wmb.162.1667547310681; 
 Fri, 04 Nov 2022 00:35:10 -0700 (PDT)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 bj9-20020a0560001e0900b002365cd93d05sm2731613wrb.102.2022.11.04.00.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 00:35:10 -0700 (PDT)
Message-ID: <aa37a312-96c1-3bf7-29fe-fbe83eb48f61@redhat.com>
Date: Fri, 4 Nov 2022 08:35:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/9] block-copy: add missing coroutine_fn annotations
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221103134206.4041928-1-eesposit@redhat.com>
 <20221103134206.4041928-3-eesposit@redhat.com>
 <8f24c24c-ca61-108c-924b-39465a3c67fe@redhat.com>
 <Y2QDPXegFTdpBy6S@redhat.com>
 <dfb4906f-5fff-0430-a3c8-c1f660d3497d@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <dfb4906f-5fff-0430-a3c8-c1f660d3497d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 03/11/2022 um 19:36 schrieb Paolo Bonzini:
> On 11/3/22 19:06, Kevin Wolf wrote:
>> I think it can make sense to have coroutine_fn as a documentation for
>> things that are only ever called in a coroutine even if they could
>> theoretically also work outside of coroutine context.
>>
>> Otherwise, when we want to introduce a coroutine_fn call somewhere, it's
>> not only less obvious that it's even possible to do, but we'll have to
>> add potentially many additional coroutine_fn annotations in the whole
>> call chain in an otherwise unrelated patch.
> 
> This is true.  On the other hand, coroutine_fn also means "this is
> allowed to suspend", which may have implications on the need for locking
> in the caller.  So you need to judge case-by-case.
> 
> If there are good reasons to add the note, you could add an assertion
> that you are qemu_in_coroutine(), which notes that you are in a
> coroutine but you don't suspend.  In this case however I don't think
> it's likely that there will be a coroutine_fn call added later.
> 
> I guess I tend to err on the side of "it's good that it's not obvious
> that you can call a coroutine_fn", but I also need to correct myself as
> qemu_coroutine_yield() is not the only leaf; there is also
> qemu_co_queue_next() and qemu_co_queue_restart_all(), which are
> coroutine_fn because they rely on the queuing behavior of
> aio_co_enter().  In this case I violated my own rule because it is
> always a bug to call these functions outside coroutine context.
> 

But isn't it a bug also not to mark a function _only_ called by
coroutine_fn? My point is that if this function is an implementation of
a BlockDriver callback marked as coroutine_fn (like in patch 6 with
vmdk), then it would make sense.

This is actually the point of this serie (which I might not have
explained well in the cover letter), every function marked here is
eventually called by/calling a BlockDriver callback marked as coroutine_fn.

Currently we have something like this:
BlockDriver {
    void coroutine_fn (*bdrv_A)(void) = implA;
}

void coroutine_fn implA() {
    funcB();
    funcC();
}

void funcB() {}; <--- missing coroutine_fn?
void funcC() {}; <--- missing coroutine_fn?

In addition, as I understand draining is not allowed in coroutines. If a
function/callback only running in coroutines is not marked as
coroutine_fn, then it will be less obvious to notice that draining is
not allowed there.

Emanuele


