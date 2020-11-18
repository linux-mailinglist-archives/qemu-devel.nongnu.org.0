Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793522B7E7B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 14:44:45 +0100 (CET)
Received: from localhost ([::1]:47610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfNlM-00041C-Iy
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 08:44:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfNk0-0003Eo-7r
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 08:43:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfNjv-0004eB-VZ
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 08:43:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605706994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/v+JtH+gXpqFQwQOJPhZnyh3LYWqD3XjhQdYlfGRgxQ=;
 b=S2IpRm08cojeFJJGymGx584PsAHBrKBj5ioxkdsVV30TMIjpLZqQwUiIY1r0X4697X3vpI
 DDzsKEqw6lrW20ToLPYeoI5S8/Q2Dlh17Lj3+eWCUcmNacKMzviLRva+zHMZRGrm32qNqC
 3E3Scrd0PNpa9iXg8lOFN013EKOzuAs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-lys6z8MSPmewRFehvGCBvw-1; Wed, 18 Nov 2020 08:43:12 -0500
X-MC-Unique: lys6z8MSPmewRFehvGCBvw-1
Received: by mail-ej1-f69.google.com with SMTP id a9so842452ejy.22
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 05:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/v+JtH+gXpqFQwQOJPhZnyh3LYWqD3XjhQdYlfGRgxQ=;
 b=oj8/BF6AKvv+N+s/oqj+D4QKM6JwMtFGb3+usUJaMXCi0MTwolsEcaiuArUei9WH5H
 8teVZRAhG0F/YZ4mUXaA2Ej6R+6qaLXIBnc+wSklVdIew2tDJqvKk6GUckjKFk3JGpxR
 l9KqUp6eYa5ALABrXd6M0Q7xtXUQDc3oAgpuGdEIc47rLkD6yobNKZbtTnxPP8rUM2rT
 PyiUv8U/gbc8Plpfn5u8RWSxMMtTOhPulxt1eRk2YHZ8DrOqjQE9Llh9+MAEgsF84OC/
 3bRnC5blXWqQ6LuLPuqSn9TCBaAF5ntfMzgHeI3ei8yOWxdpp87EF39/nH81UalMopMV
 iqMQ==
X-Gm-Message-State: AOAM53286S28E5cUIqadS+OrwSmIoJi7EKsKXyJJ/c92AyULRIEtkDlQ
 NWWO8RMTzmjiPc5e5lYrkRhb9+eaqMgCnB7JlOjXt08SBuksettJXxXPKdZwGiWl8NUmhMKJBMP
 YPWuOJUV284HTA73Es54HmhhqKn/MnqNYqqHTfVlFeaJ7XxgvV3gxbfSkKVELKfajmrI=
X-Received: by 2002:a50:e087:: with SMTP id f7mr13906737edl.29.1605706990825; 
 Wed, 18 Nov 2020 05:43:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGuBvFqMvTZODC+0VzKFcAc/VyoMSGV96TVYzhzfCGa4oledrNz7yfgW7ZuhgufBjBUSBDqQ==
X-Received: by 2002:a50:e087:: with SMTP id f7mr13906722edl.29.1605706990578; 
 Wed, 18 Nov 2020 05:43:10 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id mj12sm9256758ejb.117.2020.11.18.05.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 05:43:09 -0800 (PST)
Subject: Re: [PATCH] cirrus-ci: parallelize "make check"
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201118101821.132236-1-pbonzini@redhat.com>
 <875z62x21u.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3146024c-c4e2-8bbd-75ed-cb3537038adb@redhat.com>
Date: Wed, 18 Nov 2020 14:43:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <875z62x21u.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/20 13:49, Alex Bennée wrote:
> 
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> Otherwise, the tests risk failing due to timeouts.
> 
> This is a reversion of what we used to do because it's very hard to
> figure out which test broke when they are all mixed together. Maybe we
> could just up the timeouts.

Ah, I see.  Yeah, that's a problem too. :(

> That said the timeouts seem a bit random with macos taking around 53
> minutes and macos_xcode taking less at around 44 unless they get "stuck".

Yes, Cirrus load varies quite a bit.

Paolo


