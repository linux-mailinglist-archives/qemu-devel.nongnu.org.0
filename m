Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F526AC2A0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:11:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBYL-0000Cm-GD; Mon, 06 Mar 2023 09:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZBY5-0008Rk-2N
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:10:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZBY3-0008PA-Kl
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678111842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JvANkIPkV53Rok8miS0/Oe18jae1iOMUXDLf1AXkKl0=;
 b=awFWJd1vvlslprOPe1jHuRkqqy5Hm5SM2VoEmDeGtDHNJmL9nc1rlBWu/EIGem9koIG/rw
 Ox38+KHIn9deJcsedLVboj62E6pu1K2WT+o57Ax18R+n5teeMU9h923amG/L1BglAwpe0m
 eZTVs2mIomflx7mdXYO+STPYL32T+IU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-bjssi6tmPBeguq6FkOpx6Q-1; Mon, 06 Mar 2023 09:10:41 -0500
X-MC-Unique: bjssi6tmPBeguq6FkOpx6Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 u10-20020a056402064a00b004c689813557so13791111edx.10
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 06:10:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678111839;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JvANkIPkV53Rok8miS0/Oe18jae1iOMUXDLf1AXkKl0=;
 b=ohrNKAaH0hk/gPoVzzZuhtZTqqKVJE8gicfe6VE5la5vpq1nrKzuSI364FqFgfP4Bu
 8HjRfCfGD+oSxWYZ46MG/mANq0a8PE0emHmIyxFT0al/XDF15NZseig1jfkuuegoSZQs
 LO96+5T+uv0sQZ0ouqTy1P+6Pstt6uS0OjOfEAamOnDoeCMdzfwCYDlPeSqRgvg+yz0J
 tD52zcu1Nju7+SuKSc9kaqYZ6yvVP/VvvGlLl+o7OSSokfSz2H5PrUlBdynn3YuJtp7i
 0G4IkwvNBKppU+rTBN8qodOh8ju4AEmm9kRO4hSGuMSpSmQ+vH827l0QrYs8mkOlOws4
 Na0A==
X-Gm-Message-State: AO0yUKWzmiKaZLatwz7PYnjnfXq6q0paC2HWjvGSePecT4W/W6ct6ySh
 VHBQwnIuuX7EzfKsIsNvuMfPWI35eBWO6pK7BiiDhX8tqnmNy7jGmure+C/O/9bdLSq9rfNZHvZ
 TxwXqMPO93wJnOv36/nGDGWo=
X-Received: by 2002:a17:907:a0d2:b0:8b0:f277:5cde with SMTP id
 hw18-20020a170907a0d200b008b0f2775cdemr9656525ejc.32.1678111839718; 
 Mon, 06 Mar 2023 06:10:39 -0800 (PST)
X-Google-Smtp-Source: AK7set8S3UNfmSYtp7mdk0qFxN32OVy3e/DiPkk6LqB1TRCpJtA+L2Y6h4SM7mVFb86V4JRcFMoJ8g==
X-Received: by 2002:a17:907:a0d2:b0:8b0:f277:5cde with SMTP id
 hw18-20020a170907a0d200b008b0f2775cdemr9656507ejc.32.1678111839418; 
 Mon, 06 Mar 2023 06:10:39 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 bo6-20020a170906d04600b008eb5877a221sm4619137ejb.75.2023.03.06.06.10.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:10:38 -0800 (PST)
Message-ID: <71ed58bd-fb24-4eab-6638-a6a88676201b@redhat.com>
Date: Mon, 6 Mar 2023 15:10:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/8] edu: add smp_mb__after_rmw()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, gshan@redhat.com, eesposit@redhat.com,
 david@redhat.com, stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-5-pbonzini@redhat.com>
 <CAFEAcA961ZHCLAp2ZiZZ2iURFt7_FdcN_1rFtzJNdHs-sesHFg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA961ZHCLAp2ZiZZ2iURFt7_FdcN_1rFtzJNdHs-sesHFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/6/23 14:38, Peter Maydell wrote:
> On Fri, 3 Mar 2023 at 17:21, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> Ensure ordering between clearing the COMPUTING flag and checking
>> IRQFACT, and between setting the IRQFACT flag and checking
>> COMPUTING.  This ensures that no wakeups are lost.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Why is this device even messing around with multiple
> threads and atomics anyway ??

Because it is an example of deferring device work to another thread, 
just like on real hardware it may be deferred to an on-device 
microcontroller or CPU.

In particular, in this case I think it is useful to show a pitfall that 
is present in emulated hardware (where all loads and stores ultimately 
go through a store buffer and CPU cache) and not in real hardware (where 
I/O registers are always uncached).

> I'm quite tempted to suggest we should deprecate-and-drop
> this; it's not real hardware, it doesn't do anything
> useful, and it's not a good model to follow if you're
> implementing some other device.

I'm okay with deprecating it but I think it has educational value.

Paolo


