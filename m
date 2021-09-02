Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0563FE9F3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:24:51 +0200 (CEST)
Received: from localhost ([::1]:39402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLh5e-0005g1-8l
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mLh4J-0003la-II
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:23:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mLh4G-0001Op-0P
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:23:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630567403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gn3dtaaeJCkb1/K5OTAL3Ly5UUGlT/TErw8dDmhJrOA=;
 b=QXiHfIGPxf4ZivPeNtRIHDK88XvLDM5jl6/p1nM96wlJncPOW6n1EyZZqyvz/vKINOZRiu
 86cjXUMHA08rbLVmqgv0oz84+vyU8VAnyw1f7aXPPsLRurD3xw3AH6ewTNqJ80PweHxF6D
 5Q7Pt2TUhSGAaWD8KbgnoZmgw7nZIKY=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-VwLTXg7yNky4WhCCWKBjaw-1; Thu, 02 Sep 2021 03:23:21 -0400
X-MC-Unique: VwLTXg7yNky4WhCCWKBjaw-1
Received: by mail-pf1-f197.google.com with SMTP id
 a24-20020a62e218000000b003fdd5bdf6baso708594pfi.1
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Gn3dtaaeJCkb1/K5OTAL3Ly5UUGlT/TErw8dDmhJrOA=;
 b=QqlokEsJBLAs05huZhJpqoBPubOwbI95wxeghL7ttfhBuN29864kZqz7kMvaWX8KIo
 ILuPj2/sU9TV59FmKyrv6b2nqCJJL02WMtL5TYxE0QOA5LbxhwGYgVmq+3hkb4kljXJq
 btjUAIYsJr2clT0nIIsbsO1dx1lG8yTSurSpUWYuDu9tfhTmQTxqiW39fa1Fn9yEBCN6
 m1fUZMTNHL193vIauRoKviH3G+6tU/TYQwnn9izTSpxOmXbu8H+Q54byPP4Gsj5rQ7Uf
 aAG7oGSb4YViVJPcjee/VDP004vyba8DCuXmMxGPgjncGEDF/9kJtw5vgjU6oGsBU0wS
 AzIA==
X-Gm-Message-State: AOAM531a6GWu5iRRKcj7+l2W7/guqVlylgw0yIn1SuStGTZIKahmr2AT
 VEcUCFoDd0DlUjK0fnPlgiwHXy3Jws9ACDoKSYy4+9ju/Bdcq2+S3x4ye1nZSLhkiX5DJhd7/ZN
 kjHmvHZ1NykYOiFg=
X-Received: by 2002:a17:903:22d0:b0:137:630b:5d7e with SMTP id
 y16-20020a17090322d000b00137630b5d7emr1741856plg.51.1630567400612; 
 Thu, 02 Sep 2021 00:23:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPG11xdAYB39b7MIPxmTfVyg4WUOXGmUkfmjDSbuLz4FEtlskSX2XQswnsGDVKQk7FWhBu9w==
X-Received: by 2002:a17:903:22d0:b0:137:630b:5d7e with SMTP id
 y16-20020a17090322d000b00137630b5d7emr1741829plg.51.1630567400254; 
 Thu, 02 Sep 2021 00:23:20 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w18sm1221195pjg.50.2021.09.02.00.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 00:23:19 -0700 (PDT)
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
To: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com> <YS4rulGV9eueB04H@redhat.com>
 <YS6RFcQnZEhE8XpG@t490s> <YS8/cxTtiC7QIxTD@redhat.com>
 <YS+dxUBrhogJQkEY@t490s>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <517ed9ad-7e80-098c-52b4-566c6644df31@redhat.com>
Date: Thu, 2 Sep 2021 15:23:14 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YS+dxUBrhogJQkEY@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras <leobras@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/9/1 下午11:35, Peter Xu 写道:
> On Wed, Sep 01, 2021 at 09:53:07AM +0100, Daniel P. Berrangé wrote:
>> On Tue, Aug 31, 2021 at 04:29:09PM -0400, Peter Xu wrote:
>>> On Tue, Aug 31, 2021 at 02:16:42PM +0100, Daniel P. Berrangé wrote:
>>>> On Tue, Aug 31, 2021 at 08:02:39AM -0300, Leonardo Bras wrote:
>>>>> Call qio_channel_set_zerocopy(true) in the start of every multifd thread.
>>>>>
>>>>> Change the send_write() interface of multifd, allowing it to pass down
>>>>> flags for qio_channel_write*().
>>>>>
>>>>> Pass down MSG_ZEROCOPY flag for sending memory pages, while keeping the
>>>>> other data being sent at the default copying approach.
>>>>>
>>>>> Signed-off-by: Leonardo Bras <leobras@redhat.com>
>>>>> ---
>>>>>   migration/multifd-zlib.c | 7 ++++---
>>>>>   migration/multifd-zstd.c | 7 ++++---
>>>>>   migration/multifd.c      | 9 ++++++---
>>>>>   migration/multifd.h      | 3 ++-
>>>>>   4 files changed, 16 insertions(+), 10 deletions(-)
>>>>> @@ -675,7 +676,8 @@ static void *multifd_send_thread(void *opaque)
>>>>>               }
>>>>>   
>>>>>               if (used) {
>>>>> -                ret = multifd_send_state->ops->send_write(p, used, &local_err);
>>>>> +                ret = multifd_send_state->ops->send_write(p, used, MSG_ZEROCOPY,
>>>>> +                                                          &local_err);
>>>> I don't think it is valid to unconditionally enable this feature due to the
>>>> resource usage implications
>>>>
>>>> https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
>>>>
>>>>    "A zerocopy failure will return -1 with errno ENOBUFS. This happens
>>>>     if the socket option was not set, the socket exceeds its optmem
>>>>     limit or the user exceeds its ulimit on locked pages."
>>>>
>>>> The limit on locked pages is something that looks very likely to be
>>>> exceeded unless you happen to be running a QEMU config that already
>>>> implies locked memory (eg PCI assignment)
>>> Yes it would be great to be a migration capability in parallel to multifd. At
>>> initial phase if it's easy to be implemented on multi-fd only, we can add a
>>> dependency between the caps.  In the future we can remove that dependency when
>>> the code is ready to go without multifd.  Thanks,
>> Also, I'm wondering how zerocopy support interacts with kernel support
>> for kTLS and multipath-TCP, both of which we want to be able to use
>> with migration.
> Copying Jason Wang for net implications between these features on kernel side


Note that the MSG_ZEROCOPY is contributed by Google :)


> and whether they can be enabled together (MSG_ZEROCOPY, mptcp, kTLS).


I think they can. Anyway kernel can choose to do datacopy when necessary.

Note that the "zerocopy" is probably not correct here. What's better is 
"Enable MSG_ZEROCOPY" since:

1) kernel supports various kinds of zerocopy, for TX, it has supported 
sendfile() for many years.
2) MSG_ZEROCOPY is only used for TX but not RX
3) TCP rx zerocopy is only supported via mmap() which requires some 
extra configurations e.g 4K MTU, driver support for header split etc.

[1] https://www.youtube.com/watch?v=_ZfiQGWFvg0

Thanks


>
>  From the safe side we may want to only enable one of them until we prove
> they'll work together I guess..
>
> Not a immediate concern as I don't really think any of them is really
> explicitly supported in qemu.
>
> KTLS may be implicitly included by a new gnutls, but we need to mark TLS and
> ZEROCOPY mutual exclusive anyway because at least the userspace TLS code of
> gnutls won't has a way to maintain the tls buffers used by zerocopy.  So at
> least we need some knob to detect whether kTLS is enabled in gnutls.
>


