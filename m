Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2750C3AE49B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:15:06 +0200 (CEST)
Received: from localhost ([::1]:35250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvF5F-0007iV-6a
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvF4E-0006Jd-LC
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:14:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvF4C-0005Ab-Tz
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624263240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QABlAVtQb3+aArAdOYD8q+Cl1s+nTnIp/2z6vAMgaT4=;
 b=RbegD3eZH+R/LRbtH38tv0T/eR1Ltr0FUlma6StHhVAERIZ8m4gyii/RWmSzNwu47ZN/9C
 FC85oEyPKoXsMsmDOGe7fLp/LIunlhBD865KEEkTjAbQQ/8YxebkiQnCKbqqMTyqLOzeFs
 KQQkir35nTBXIJCk7dLZwvgz/d5aPAQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-7RNbCJHaMt6hdYcU4ly27Q-1; Mon, 21 Jun 2021 04:13:57 -0400
X-MC-Unique: 7RNbCJHaMt6hdYcU4ly27Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 ch5-20020a0564021bc5b029039389929f28so7314203edb.16
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 01:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QABlAVtQb3+aArAdOYD8q+Cl1s+nTnIp/2z6vAMgaT4=;
 b=J6ZVJt2TkvIrRK8U7+DXEWmg2oTeFCTHitx77JbYMt8oz6jCBuAOT3faL6+sEG8/45
 8iBBNfnd5EJwFPua0KEhrWBRCxNTiipxK//PiiTz132yTwMmH/ugXBin2uS+CXN9jRhZ
 9gBilzS10ic7Dx6No38rLCQW5vIN6f6lt31SQrY2Xht6X0oVZd6T/oJNjH2aqxfRIKHp
 H8VvXLqqGpWoL+PXquJWnC+H6bbTuxoo6pfQUYN01pjL6o/jwK9XdHfkkam3OxMik3zL
 b7NgtGvVKAFRd5pDOXCGzIlgo7jcGvrv2wb7s66UpmAMOfeole1MwgM4DOJrBVYWqKor
 GW5w==
X-Gm-Message-State: AOAM5328iDo1A4y4zDlVRhz4/l3oaJbDf2FtBPfftsn7Xw4ixlfdpOwv
 RN1B33TA4yt0uxcvepLCQUa6oVtXlet2l0fIdNAGG3YVRmVXQrzdOQrT68XlsmMIigdmqBtkHrJ
 rPoWi67+OvYcqT8LAEWdmC/rR7f7Jb8tMJbGPYEbc1F0YfUokyD3e3hpvYIH6mns/NvI=
X-Received: by 2002:a17:906:e03:: with SMTP id l3mr14250460eji.6.1624263235969; 
 Mon, 21 Jun 2021 01:13:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi6WTk/j5PY2chlkJNqGux+MRqqOxrjQQoNjh3GeLjymly0KgfuBpo48rVTm2WlcoDBaUAcw==
X-Received: by 2002:a17:906:e03:: with SMTP id l3mr14250434eji.6.1624263235623; 
 Mon, 21 Jun 2021 01:13:55 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 s4sm10341324edu.49.2021.06.21.01.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 01:13:55 -0700 (PDT)
Subject: Re: [PATCH v4 3/6] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-4-eesposit@redhat.com>
 <3ac5e749-2a8b-e2d2-f1a2-04452b4277a0@virtuozzo.com>
 <554f05bf-4ecf-e00e-e50a-ff2450e74b00@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <7e0ac9f6-bb8d-ccdf-04ea-81d88cded4ff@redhat.com>
Date: Mon, 21 Jun 2021 10:13:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <554f05bf-4ecf-e00e-e50a-ff2450e74b00@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 19/06/2021 20:31, Vladimir Sementsov-Ogievskiy wrote:
> 19.06.2021 18:23, Vladimir Sementsov-Ogievskiy wrote:
>>>   typedef struct BlockCopyTask {
>>>       AioTask task;
>>> +    /*
>>> +     * IN parameters. Initialized in block_copy_task_create()
>>> +     * and never changed.
>>> +     */
>>
>> That's just not true for method field :(
> 
> I think, we just need to document that @method is never accessed 
> concurrently
> 
Ok I got confused in the last patch. Method is read by 
block_copy_task_entry only after it is re-set in 
block_copy_dirty_clusters loop. Sorry for that.

Will leave it as IN and document it better.

Still, moving the lock granularity inside the while loop might not be 
too bad. Not sure though. At this point skip_unallocated can also be an 
atomic, even though I sense that you won't like that :)

Emanuele


