Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B3C4773F0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 15:06:06 +0100 (CET)
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrOX-00048e-2Z
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 09:06:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mxrK4-00081O-My
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:01:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mxrK2-0003Qj-6e
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639663285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bq6mbfsujRdIyF7vSAQXUxVT+yBnlPNNDeeoxN5jeEw=;
 b=PXjnrnc5cR8tfHiCCVLSVxnN3u39KMy3Eu2/eaemGPs+1qNSYk+vNX6J4RADMKUvH3GWbw
 yWJxGOrb3Dl282Fls6kabGeSiv7Ene48J9WpWSf4wjd5tP8Zl29dkoldOH2jjQCd91nIqS
 2CHAn+4rz/Zil0o662whLv5KUk8YwmM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-jDXrsRRVNx-ZvpsmhSQBvQ-1; Thu, 16 Dec 2021 09:01:24 -0500
X-MC-Unique: jDXrsRRVNx-ZvpsmhSQBvQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r10-20020a1c440a000000b003456b2594e0so1698782wma.8
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 06:01:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bq6mbfsujRdIyF7vSAQXUxVT+yBnlPNNDeeoxN5jeEw=;
 b=ZfgkK2pJ9VPHjnUtndZY5D/Jry6EHDR0BQZgApKylXDXFfRpTajC+O0QIghHVNhdsJ
 xQDGka8zXCsj/tENh/TtMmpLMJDQ+3hdLxdyVSblGRdWtfAoxAe8FMP253GZxyKlHctW
 dASVnuCq9cIKD5W8HzONqZtsDo46drcveZaxk06iMjhHnONUDfvwBa16xE9i3PDd2hfT
 b/O71DfEMcPmb4c4DrZuXup9CVrwTJ83DnSQgQtN9UI2qQsV1Nqt+6d/W1T+eI5uzjJN
 nCkGRCsFQVfQnUllsLHbw6bjpTf5A0vsKbWZZ64KjoZdHsxW1EcOw7CNGjGulE247RWp
 rEbA==
X-Gm-Message-State: AOAM532SI5AwASGcG88oOyMz9CTAHVOn/4la3nSPeWzVv9S7VzqOzKBp
 OCKm2ANJScWebiBDfX+ecT4bxW6m5EOTW25CYqnki3Zm6LwzecweRQNW8at/zO85IUwjH7EonXN
 piqsWWs8mu5RFcDM=
X-Received: by 2002:a05:6000:144a:: with SMTP id
 v10mr2356892wrx.357.1639663283054; 
 Thu, 16 Dec 2021 06:01:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytozbo/6hfv9J8ipL72lOPkENF7w6I+he3Yv+TqS+kXP5A7//F7UZgHNOeF7URJ2tk0pfIEQ==
X-Received: by 2002:a05:6000:144a:: with SMTP id
 v10mr2356872wrx.357.1639663282828; 
 Thu, 16 Dec 2021 06:01:22 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id g16sm5576073wmq.20.2021.12.16.06.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 06:01:22 -0800 (PST)
Message-ID: <8970014e-000b-475e-e782-68a1dc50587e@redhat.com>
Date: Thu, 16 Dec 2021 15:01:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 09/31] block: introduce assert_bdrv_graph_writable
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-10-eesposit@redhat.com>
 <6dd02c7c-5f0e-9dce-28b8-6ed7fb834a50@redhat.com>
 <9b8fae21-9263-7db6-1f51-cae4662395ab@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <9b8fae21-9263-7db6-1f51-cae4662395ab@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On 14.12.21 20:48, Emanuele Giuseppe Esposito wrote:
>
>
> On 10/12/2021 18:43, Hanna Reitz wrote:
>> On 24.11.21 07:43, Emanuele Giuseppe Esposito wrote:
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
>>> ---
>>>   include/block/block_int-global-state.h | 10 +++++++++-
>>>   block.c                                |  4 ++++
>>>   block/io.c                             | 11 +++++++++++
>>>   3 files changed, 24 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/block/block_int-global-state.h 
>>> b/include/block/block_int-global-state.h
>>> index a1b7d0579d..fa96e8b449 100644
>>> --- a/include/block/block_int-global-state.h
>>> +++ b/include/block/block_int-global-state.h
>>> @@ -312,4 +312,12 @@ void 
>>> bdrv_remove_aio_context_notifier(BlockDriverState *bs,
>>>    */
>>>   void bdrv_drain_all_end_quiesce(BlockDriverState *bs);
>>> -#endif /* BLOCK_INT_GLOBAL_STATE*/
>>
>> This looks like it should be squashed into patch 7, sorry I missed 
>> this in v4...
>>
>> (Rest of this patch looks good to me, for the record – and while I’m 
>> at it, for patches I didn’t reply to so far, I planned to send an R-b 
>> later.  But then there’s things like patches 2/3 looking good to me, 
>> but it turned out in my review for patch 4 that bdrv_lock_medium() is 
>> used in an I/O path, so I can’t really send an R-b now anymore...)
>>
> Sorry I don't understand this, what should be squashed into patch 7? 
> The assertion? If so, why?

No, the

-#endif /* BLOCK_INT_GLOBAL_STATE*/
+#endif /* BLOCK_INT_GLOBAL_STATE */

part of the hunk.

Hanna


