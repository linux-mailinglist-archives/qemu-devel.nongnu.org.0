Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38254F3D0C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 19:55:42 +0200 (CEST)
Received: from localhost ([::1]:43620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbnP3-0007Am-RT
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 13:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nbnNR-0006BN-5y
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 13:54:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nbnNL-00025J-9B
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 13:53:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649181234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBOJS+k6R90jcwiu/ZvtQmz6jxzhhNmLKzcYzzh5jcQ=;
 b=WYtlzetps3KkBLT5nqkDwaedt0AhGmg6noodekUQCPLhjKlG3C4LCMNShCGDN5hFtolwAg
 6AjK19RT2OVmCh1ZqPHDSRbj6ho0rDBH75EQbNPWEKdEztb0qcgn+B3o0Y4e09UAU7x3ET
 XAMwD6fPDl7p/QIVTTIMrY4oaT/hhek=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-ISWJZhP3OiGfIm5dToS0IQ-1; Tue, 05 Apr 2022 13:53:51 -0400
X-MC-Unique: ISWJZhP3OiGfIm5dToS0IQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 l22-20020adfa396000000b0020612097035so1525726wrb.8
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 10:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FBOJS+k6R90jcwiu/ZvtQmz6jxzhhNmLKzcYzzh5jcQ=;
 b=8CI+31ylq4Ps5SEB8g28wMVT86iyb/Or+Hzi3Ewl5hkDtejDYyAmdCcOnVx+g3d7l1
 nWKXK+2pxvifqpQfkyBTpbxzji+dfUZrXoX2JhcqxYQ8+hVZ0kKCKFP/Exj4siBD9Lm8
 aI0fZtTwuHCysPytgovFya06ZF8HLnj4Xxd6SxvU6HuWi8CNhfjq0Y1VslJHyphWjki9
 aSGbqYA+1rlLxE/Ltq3SBj6paBuHWhL32tDkwq7ErvFv+IP1hasV9TvFaQ1ATaPidg2T
 fDZ4t0T6qWimbgNuUXZWojxUqePo5aZ02DIDLzeXxAjhtKLIUZ9sdliSiNBetcBsnHKl
 fdAA==
X-Gm-Message-State: AOAM533YP7phRABZ1da1+ZzB8mwawYJh0Pilw17cBEHVMmGfDt4k8DMm
 tDwPkpLOC5kppcPexOM38DJJy6HRZvG26ATnZ693XfR/0zVqpuIhUSf6UgZidjwXBdnoxBESYri
 fgaIVaLR7KvRgO0E=
X-Received: by 2002:a5d:59ab:0:b0:205:7e81:53f9 with SMTP id
 p11-20020a5d59ab000000b002057e8153f9mr3677720wrr.457.1649181230151; 
 Tue, 05 Apr 2022 10:53:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyw6EuerBeTEztVmVBDuzY24z8pIhYNKgOkp7+KzNjFX6T0TEGSIlsT3C6NDb0hcaWm4SLN7Q==
X-Received: by 2002:a5d:59ab:0:b0:205:7e81:53f9 with SMTP id
 p11-20020a5d59ab000000b002057e8153f9mr3677708wrr.457.1649181229922; 
 Tue, 05 Apr 2022 10:53:49 -0700 (PDT)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a7bcc0b000000b0037e0c362b6dsm2752871wmh.31.2022.04.05.10.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 10:53:49 -0700 (PDT)
Message-ID: <014d1e09-0e75-f7e3-cef8-9bb36d1cb48d@redhat.com>
Date: Tue, 5 Apr 2022 19:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] block/stream: Drain subtree around graph change
To: Kevin Wolf <kwolf@redhat.com>
References: <20220324125756.9950-1-hreitz@redhat.com>
 <YkwWbAoYmkVuHlQA@redhat.com>
 <87fb6a17-c1e8-cb50-5f0f-3979b8cc5ca6@redhat.com>
 <YkxagL00suVaVipU@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YkxagL00suVaVipU@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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
Cc: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 05/04/2022 um 17:04 schrieb Kevin Wolf:
> Am 05.04.2022 um 15:09 hat Emanuele Giuseppe Esposito geschrieben:
>> Am 05/04/2022 um 12:14 schrieb Kevin Wolf:
>>> I think all of this is really relevant for Emanuele's work, which
>>> involves adding AIO_WAIT_WHILE() deep inside graph update functions. I
>>> fully expect that we would see very similar problems, and just stacking
>>> drain sections over drain sections that might happen to usually fix
>>> things, but aren't guaranteed to, doesn't look like a good solution.
>>
>> Yes, I think at this point we all agreed to drop subtree_drain as
>> replacement for AioContext.
>>
>> The alternative is what Paolo proposed in the other thread " Removal of
>> AioContext lock, bs->parents and ->children: proof of concept"
>> I am not sure which thread you replied first :)
> 
> This one, I think. :-)
> 
>> I think that proposal is not far from your idea, and it avoids to
>> introduce or even use drains at all.
>> Not sure why you called it a "step backwards even from AioContext locks".
> 
> I was only referring to the lock locality there. AioContext locks are
> really coarse, but still a finer granularity than a single global lock.
> 
> In the big picture, it's still be better than the AioContext lock, but
> that's because it's a different type of lock, not because it has better
> locality.
> 
> So I was just wondering if we can't have the different type of lock and
> make it local to the BDS, too.

I guess this is the right time to discuss this.

I think that a global lock will be easier to handle, and we already have
a concrete implementation (cpus-common).

I think that the reads in some sense are already BDS-specific, because
each BDS that is reading has an internal a flag.
Writes, on the other hand, are global. If a write is happening, no other
read at all can run, even if it has nothing to do with it.

The question then is: how difficult would be to implement a BDS-specific
write?
From the API prospective, change
bdrv_graph_wrlock(void);
into
bdrv_graph_wrlock(BlockDriverState *parent, BlockDriverState *child);
I am not sure if/how complicated it will be. For sure all the global
variables would end up in the BDS struct.

On the other side, also making instead read generic could be interesting.
Think about drain: it is a recursive function, and it doesn't really
make sense to take the rdlock for each node it traverses.
Even though I don't know an easy way to replace ->has_waiter and
->reading_graph flags...

Emanuele


