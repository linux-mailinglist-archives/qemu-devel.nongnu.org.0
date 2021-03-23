Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C643346AFC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 22:23:55 +0100 (CET)
Received: from localhost ([::1]:45646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOoVG-0008TE-9x
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 17:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOoSN-0006Ou-RI
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:20:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOoSL-0003W5-WC
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:20:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616534451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UAfEXFB90xZa/vUNf661lL0dEcPhUaEbFoBJLHOhRSY=;
 b=cK7QQqo1/mA1xtEXmx0Mydm/Jl7BnfBHv7nY+0vu5qL0K9J6I27bP30q7kPviW1zOtUxcc
 QmlsAlf+GizkRL6dMr/iflXM7onVV6cukww2QbW6zpm2WYR2Jpqw+ZH5qBePSktLvo4CpA
 P2W/evapmS5vLzlUmlHYTRTQwagLyJs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-CH1-yaYrNuK5Fv2I0fM4Dw-1; Tue, 23 Mar 2021 17:20:49 -0400
X-MC-Unique: CH1-yaYrNuK5Fv2I0fM4Dw-1
Received: by mail-wr1-f70.google.com with SMTP id p15so1687646wre.13
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 14:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UAfEXFB90xZa/vUNf661lL0dEcPhUaEbFoBJLHOhRSY=;
 b=JE51CuQzodEeZQUkOI5two5pNIlXRsjPtQq9Lz9Ek7ighCdnaXHuXTlmyXCxx8PcNj
 nWkAAVm/rCfL+wKIuxDrLbrTJxlHjGv379Gwnp9GaGT3saM+1Db8NoHsp99nFN9uiADk
 UhtFhMccraI3MtxiE7GFCJWtmC2yYzpH8OhlYnoi+QOeX7iS5qJ5gM6/Gx1s0TpuZ1Jz
 kRn9qT79WI61u8i2yznRC6JZ/JsYvcf90R9mK9HnfOevdizwNKXcAvH4vIWBsJ5htxMi
 c3fSq4sMTz3nNMJ0EZBwoVJPbqIn2T57T/Cr4FM1Wi+lQbLLZHofcyfQvF6P1NeQDX/y
 jUtQ==
X-Gm-Message-State: AOAM533jsh61tAhAs3KzxF+7eh0fTw+md0up3BaM+zwuSM24l5wDMO/h
 H/sosNXNeA6+Q1ovzhKaxLPVW9SCcoe+eatlyLWZL88TOx9rNblz9i6SMp+5TvBpMqtcEryvAEd
 S6MvdZjsjhZKPOYY=
X-Received: by 2002:a1c:4e0f:: with SMTP id g15mr13316wmh.144.1616534448863;
 Tue, 23 Mar 2021 14:20:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJe3IHZAvykP83WdKK/8ociKf3ZqVee5WQTvzFPi+vY3RJ6k1SHJ0MsijCQjFgU/eX4MJTZA==
X-Received: by 2002:a1c:4e0f:: with SMTP id g15mr13296wmh.144.1616534448608;
 Tue, 23 Mar 2021 14:20:48 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id u8sm193580wrr.42.2021.03.23.14.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 14:20:47 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] qemu-iotests: let "check" spawn an arbitrary test
 command
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210323181928.311862-1-pbonzini@redhat.com>
 <20210323181928.311862-5-pbonzini@redhat.com>
 <5ba856d3-8325-dc28-4806-7f5cce4d5522@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a19c681e-94ee-f69d-53b0-14239bdc5d01@redhat.com>
Date: Tue, 23 Mar 2021 22:20:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <5ba856d3-8325-dc28-4806-7f5cce4d5522@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: eesposit@redhat.com, kwolf@redhat.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/21 20:12, Vladimir Sementsov-Ogievskiy wrote:
>>
>>
>> Move the trailing empty line to print_env(), since it always looks better
>> and one caller was not adding it.
> 
> Seems you've moved this fix from one unrelated commit to another.. And 
> it touches two extra files. I'd just make it a separate commit. 
> Nitpicking. Separate or as is:

Well, now I add the third caller so it's time to make up our mind on the 
trailing line.  A two-line commit didn't seem worth it.

Paolo

> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


