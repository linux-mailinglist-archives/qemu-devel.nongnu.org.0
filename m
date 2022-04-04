Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFFE4F1265
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 11:54:30 +0200 (CEST)
Received: from localhost ([::1]:52838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbJPp-0002jh-4V
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 05:54:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nbJNO-0000qX-MM
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 05:52:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nbJNM-0003PW-B8
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 05:51:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649065915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c+B+xzJlCAlVh/XnC2DYEa/PSdBH2WXL7iJXanmZ6LI=;
 b=iI+29pm5CL4MbjiOLed+5S9BTveRgoRmj0sbqTBNAlBNHA4BPBydhQiKW8+3OQ0b3E0Hz3
 8uR/W1Bvar9oFzl8P6mza7nq3N4fjLFf0NqmMuP7Xx4fwu+evFZQdExjXOWxEUbAEhE8Ox
 BBNE3RvGtO6ltTte7EMUFk5593ULF9o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-741cNPP2Pmyez37mR7j6ug-1; Mon, 04 Apr 2022 05:51:54 -0400
X-MC-Unique: 741cNPP2Pmyez37mR7j6ug-1
Received: by mail-wr1-f72.google.com with SMTP id
 r16-20020adfbb10000000b002060d469943so535238wrg.4
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 02:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c+B+xzJlCAlVh/XnC2DYEa/PSdBH2WXL7iJXanmZ6LI=;
 b=8AZViZmpIdmOcOfJkJBbwdnVvIS5LV1oHD7qQ53iXHRf236JnUhur3UKVdWYQI5Dur
 6uT13J3H6XNai8crwJSijNyOEDjtm9mfA/UUcxFT9XafgLTH7lJJYnVjSRis1sagpd0w
 M0l7RqzFlz7TWalcxSWdaoMX/Al/eKjFbQQEYfT5lW+yJjRFU71utBOxrZpiXAzZaDtX
 wtIbxXqJfKkVlHxF0jYJU+YbU3zmp2SO/MLKfNtYgzYt9HS/HfSd6rYsqH+g/EvlUR1E
 e8QCoPKtg0qfEXtLWFIlSzYaEbnOwrUyly1eHBni6QXmRvPJnfnsRa9a5sdw3RAvRc7I
 JUBw==
X-Gm-Message-State: AOAM531gVbDLJBLlv5Z4IE+vt2owykB1OqlsYp44HknM+B2aQodR5LC0
 LOzVokviptQBxNH70i/cU9cQZDJWfbFWIwMM9ejN+eLRZ46bSBws9s8rZlYC0xjNX32avgCS1xD
 FZXe3Nj6PjeN80u0=
X-Received: by 2002:adf:c6c1:0:b0:206:db8:c40 with SMTP id
 c1-20020adfc6c1000000b002060db80c40mr4600576wrh.29.1649065913390; 
 Mon, 04 Apr 2022 02:51:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkiE1jbpgQLlMhpUuDWyrwmsB8ycfj3olUh2WCIvCy2hsjUCNlmdcSl/sPQfsGe03Dpxi6zw==
X-Received: by 2002:adf:c6c1:0:b0:206:db8:c40 with SMTP id
 c1-20020adfc6c1000000b002060db80c40mr4600556wrh.29.1649065913048; 
 Mon, 04 Apr 2022 02:51:53 -0700 (PDT)
Received: from [192.168.149.120]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm10477851wry.102.2022.04.04.02.51.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 02:51:52 -0700 (PDT)
Message-ID: <7d82deaa-e34e-c3b4-0d1a-80fe9053c1a8@redhat.com>
Date: Mon, 4 Apr 2022 11:51:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <Yh89L8gT46MbSJCQ@stefanha-x1.localdomain>
 <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
 <e9eeec7b-d03e-5e8e-cc42-568c670726ca@redhat.com>
 <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
 <c6a12090-b6c3-31d8-fb90-a76c9dd2e949@redhat.com>
 <88f2798b-9327-e54f-5792-e37404b94ef7@redhat.com>
 <8ae70388-ff46-6ec1-7f84-14d41ca9a6dd@redhat.com>
 <311c2e0a-fb2c-241c-cbd1-1162f7e74e18@redhat.com>
 <9d3c36f0-0834-ec9c-8473-d052d64a61dd@redhat.com>
 <69b2ce82-4826-71ed-9c32-d323df69b7c4@redhat.com>
 <Ykq5cZPiC9uw9T1a@stefanha-x1.localdomain>
 <CABgObfZ96TOf9nxdrHrtKtrfyG0sZS9rPqAaReQgxNQ+AkKKpA@mail.gmail.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <CABgObfZ96TOf9nxdrHrtKtrfyG0sZS9rPqAaReQgxNQ+AkKKpA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 04/04/2022 um 11:41 schrieb Paolo Bonzini:
> 
> 
> On Mon, Apr 4, 2022 at 11:25 AM Stefan Hajnoczi <stefanha@redhat.com
> <mailto:stefanha@redhat.com>> wrote:
> 
>     - The new API doesn't stop more I/O requests from being submitted, it
>       just blocks the current coroutine so request processing is deferred.
> 
> 
> New I/O requests would not complete until the write-side critical
> section ends. However they would still be accepted: from the point of
> view of the guest, the "consumed" index of the virtio ring would move
> forward, unlike bdrv_drained_begin/end().
> 
>     - In other words, is_external is a flow control API whereas the new API
>       queues up request coroutines without notifying the caller.
> 
> 
> Yes, I think this is the same I wrote above.
> 
>     - The new API still needs to be combined with bdrv_drained_begin/end()
>       to ensure in-flight requests are done.
> 
> 
> I don't think so, because in-flight requests would take the lock for
> reading. The write side would not start until those in-flight requests
> release the lock.
> 
>     - It's not obvious to me whether the new API obsoletes is_external.
>     I think it probably doesn't.
> 
> 
> I agree that it doesn't. This new lock is only protecting ->parents and
> ->children. 

Side note: it will also be used to protect other fields, like
.aio_context I think. I haven't checked if there is something else we
might want to protect that is currently protected by AioContext lock.

At least, I think we are going to use the same lock, right?

Emanuele

bdrv_drained_begin()/end() remains necessary, for example,
> when you need to send a request during the drained section. An example
> is block_resize.
> 
> In addition, bdrv_drained_begin()/end() ensures that the callback of
> blk_aio_*() functions has been invoked (see commit 46aaf2a566,
> "block-backend: Decrease in_flight only after callback", 2018-09-25). 
> This new lock would not ensure that.
> 
> As an aside, instead of is_external, QEMU could remove/add the ioeventfd
> handler in the blk->dev_ops->drained_begin and blk->dev_ops->drained_end
> callbacks respectively. But that's just a code cleanup.
> 
> Paolo


