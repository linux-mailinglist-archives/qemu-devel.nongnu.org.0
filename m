Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD0C6192ED
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 09:45:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqsJC-0007v4-7p; Fri, 04 Nov 2022 04:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqsJA-0007uj-8I
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 04:44:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqsJ8-0004zA-KE
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 04:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667551449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a17jxPgkWYFLveumbLwLPpwqCJiWdszz8EIHQDT3JNg=;
 b=Q3d87Gzon/ImQ8fA40DLF03dckae4HvQZOfbEh/qQgInU/1Au+gGfyoj0QEi7ZkVl3IL0x
 j2/grRq5A3/uATfH8U4JqyYi1JyIaVPEcgc3rIa2WELOvdQqzlb8pAiG8RyoZkbXQjjNPe
 HHnTXvI5I/1IjLfAYkYpdLLVl8xiqTY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-41-qybG9lBkMR-kbDIuLvwc9A-1; Fri, 04 Nov 2022 04:44:08 -0400
X-MC-Unique: qybG9lBkMR-kbDIuLvwc9A-1
Received: by mail-ed1-f71.google.com with SMTP id
 dz9-20020a0564021d4900b0045d9a3aded4so3069976edb.22
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 01:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a17jxPgkWYFLveumbLwLPpwqCJiWdszz8EIHQDT3JNg=;
 b=lPXowHT5AgdBCBmdgbQ0Z8k5HouGVT4K6Z8Yp0bpmnNz0iJIxrURlTK1A+BS8PUABv
 OUbp2P5yJYd/IZMMP0gcQ5GW+k8nbwnbl6fByPVSaRxP/lT8WxeY0TQshB3DzPmUwpJw
 OIo33UpseZZCGGDGT2Sjjay3zBV1A5g71c1O2WYo4pfbCC8cHdWkS9ykD00zYKE3sNgH
 z0okxTShFir84AWB/LP32iBikWx1YhbKOTBGDW5scYMUfB6sNZdmMHYKbwIjY3uZSsdU
 lGG6phqQkQsi9Z3fBvDuR2IvxCyN8ireDZVwrjfO2URyvHk8MJuHwsb6EjwnNPzImSnQ
 VAwg==
X-Gm-Message-State: ACrzQf30mUycLC3HaiOZ1Z7Jv/j4pO85n+2oZM+GEUDUD9Qnwko+NF+q
 6pSUx4BJmBdGLmECw6J0YT8KCTVfSU6GgRXz0mv/mOeqt6z7tFsVYs5PG9iFkP1WtaB3rf1yV0N
 5zgvntdNzlEUxsfE=
X-Received: by 2002:a17:906:9c82:b0:781:5752:4f2b with SMTP id
 fj2-20020a1709069c8200b0078157524f2bmr32587454ejc.561.1667551447197; 
 Fri, 04 Nov 2022 01:44:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6wdj+qBY6zA41npFBb75+1sYup9YxCerhLKjAKWrn9MK58zEELaq6sstLzH6ZZo/dx2avMvw==
X-Received: by 2002:a17:906:9c82:b0:781:5752:4f2b with SMTP id
 fj2-20020a1709069c8200b0078157524f2bmr32587438ejc.561.1667551446916; 
 Fri, 04 Nov 2022 01:44:06 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5?
 ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.googlemail.com with ESMTPSA id
 kx23-20020a170907775700b0078ba492db81sm1523733ejc.9.2022.11.04.01.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 01:44:06 -0700 (PDT)
Message-ID: <ac92cf1f-49c4-b263-f48f-4be17044d61e@redhat.com>
Date: Fri, 4 Nov 2022 09:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/9] block-copy: add missing coroutine_fn annotations
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
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
 <aa37a312-96c1-3bf7-29fe-fbe83eb48f61@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <aa37a312-96c1-3bf7-29fe-fbe83eb48f61@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/4/22 08:35, Emanuele Giuseppe Esposito wrote:
> But isn't it a bug also not to mark a function _only_ called by
> coroutine_fn? My point is that if this function is an implementation of
> a BlockDriver callback marked as coroutine_fn (like in patch 6 with
> vmdk), then it would make sense.

If a function implements a coroutine_fn callback but does not suspend, 
then it makes sense to mark it coroutine_fn.

In general it's not a bug.  In most cases it would only be a coincidence 
that the function is called from a coroutine_fn.  For example consider 
bdrv_round_to_clusters().  Marking it coroutine_fn signals that it may 
suspend now (it doesn't) or in the future.  However it's only doing some 
math based on the result of bdrv_get_info(), so it is extremely unlikely 
that this will happen.

In this case... oh wait.  block_copy_is_cluster_allocated is calling 
bdrv_is_allocated, and block_copy_reset_unallocated calls 
block_copy_is_cluster_allocated.  bdrv_is_allocated is a mixed 
coroutine/non-coroutine function, and in this case it is useful to 
document that bdrv_is_allocated will suspend.  The patch is correct, 
only the commit message is wrong.

Likewise for blockstatus_to_extents in patch 3, where the commit message 
does mention bdrv_* functions.  As I mentioned in my quick review of 
patch 3, this can also snowball into a series of its own to clean up all 
callees of bdrv_co_common_block_status_above, similar to what Alberto 
did for read/write functions back in June, so that they are properly 
marked as coroutine_fn.  If you want to do it, don't do it by hand 
though, you can use his static analyzer.  It's slow but it's faster than 
doing it by hand.

> This is actually the point of this serie (which I might not have
> explained well in the cover letter), every function marked here is
> eventually called by/calling a BlockDriver callback marked as coroutine_fn.

Again I don't think this is useful in general, but your three patches 
(2/3/6) did catch cases that wants to be coroutine_fn.  So my objection 
is dropped with just a better commit message.

> Currently we have something like this:
> BlockDriver {
>      void coroutine_fn (*bdrv_A)(void) = implA;
> }
> 
> void coroutine_fn implA() {
>      funcB();
>      funcC();
> }
> 
> void funcB() {}; <--- missing coroutine_fn?
> void funcC() {}; <--- missing coroutine_fn?
> 
> In addition, as I understand draining is not allowed in coroutines.

... except we have bdrv_co_yield_to_drain() to allow that, sort of. :/

> If a function/callback only running in coroutines is not marked as
> coroutine_fn, then it will be less obvious to notice that draining is
> not allowed there.

I think it has to be judged case by base.  Your patches prove that, in 
most cases, you have coroutine_fn for things that ultimately do some 
kind of I/O or query.  In general the interesting path to explore is 
"coroutine_fn calls (indirectly) non-coroutine_fn calls (indirectly) 
generated_co_wrapper".  The vrc tool could be extended to help finding 
them, with commands like

     label coroutine_fn bdrv_co_read
     label coroutine_fn bdrv_co_write
     ...
     label generated_co_wrapper bdrv_read
     label generated_co_wrapper bdrv_write
     paths coroutine_fn !coroutine_fn generated_co_wrapper

Paolo


