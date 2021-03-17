Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D0433FBCB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 00:27:30 +0100 (CET)
Received: from localhost ([::1]:33242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMfZZ-0003TP-9S
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 19:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMfYb-0002zL-EG
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:26:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMfYZ-0007BP-2x
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616023586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hft1h2BP1K4v3XHZgMIZz6H7kWEzlDJ39RSSSjp9dWo=;
 b=ZnaFUrcjGtuC8e6sl3cUPLaZbQMi9JmjFN3eL3JLl2GYiuH2NkworlXiMqBM154VtL5YPW
 Uus8NK1CA/xCApcml5M34KtAnNj/uD41RBpOCWjJ+O+dLIBMqjxo4bUXjI93CmXMC4M0gJ
 9AvBBu52tfLXZ+03wW7NIniaiQQmKXk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-MEucZQALOe-inQMZQgQohQ-1; Wed, 17 Mar 2021 19:26:22 -0400
X-MC-Unique: MEucZQALOe-inQMZQgQohQ-1
Received: by mail-wr1-f70.google.com with SMTP id z6so19076134wrh.11
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 16:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hft1h2BP1K4v3XHZgMIZz6H7kWEzlDJ39RSSSjp9dWo=;
 b=rbkABFNKzPMogR4KMCjWupDotZ65QqivIJ2h9ufbfrTOJ/+yCJgFyeHNK9PlkmfzXK
 W8tU3iqU9nKPbrXuZHzobTyG2fSU/X0IoEp1joS+ql1OFM0cmT2bL1wSLq6i+EvPjJC8
 4kxna5GckwQI+YFeLBqAlbLLsStvfg/C7veh9mzNGOWg6FRd8b+/Row3srZXSoJT7lEd
 VpqoWQfJ8dCd3Tp9fKQslR0DnqrsTEzmQYGAl76KN26ah7So3MCBE/+KVeLa2fo7TOop
 s2v+g+0dpqn4RKk6BhZJ44ILvzIsOBwNobWrOHmqbO8oaEGmJyL79oBwoDAKlYyvr9EX
 R8iQ==
X-Gm-Message-State: AOAM531uaqzFk7NtStOadt3QH3xc6XYrLi32Xpu194Zjpz5n9igZMvbw
 dVDTVsidc/4yJsIPBj5EUNQ9wc51UWm2rMPI6GCK/+3lRJ69gzhBZUr7s7wTo69plFtcx3iowov
 HqHAolmRpZdPVrTE=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr6839501wrr.118.1616023581252; 
 Wed, 17 Mar 2021 16:26:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0q3h2g8sMEUBtkV2LIF5IezjLepa5//ca42tuZC8ZCJhPIMp/GaMUfh4PjP7Ns65p+IiiSw==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr6839487wrr.118.1616023580967; 
 Wed, 17 Mar 2021 16:26:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id k11sm333751wmj.1.2021.03.17.16.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 16:26:20 -0700 (PDT)
Subject: Re: iotests failing on gitlab CI check-system-fedora job
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA_cZYF9u8RfW5mUY7TgOLsRYh1sN7oioztfSV8_990peg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6f3cd467-5013-a372-28f7-f1ca0b1f1d03@redhat.com>
Date: Thu, 18 Mar 2021 00:26:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_cZYF9u8RfW5mUY7TgOLsRYh1sN7oioztfSV8_990peg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/03/21 23:23, Peter Maydell wrote:
> The check-system-fedora job in the gitlab CI seems to have
> started reliably failing on iotests 040 041 127 256 267:
>   https://gitlab.com/qemu-project/qemu/-/jobs/1106977551
> 
> Could somebody have a look at what's happening, please?
> (This is probably a regression that's got into master because
> I stopped using "did gitlab CI pass" as a gate because gitlab
> was running massively too slowly to be usable for that.)

It's caused by adding virtio devices to the m68k target.  Probably it 
can be fixed by moving i386-softmmu to Fedora and m68k-softmmu to Debian.

But really, most of the tests we run are not ever going to fail in 
isolation.  Do we really gain anything by building all or almost all 
targets for each cross (as opposed to just one 32-bit and one 64-bit 
target), or by running check-block many times on similar or identical 
configurations?

Paolo


