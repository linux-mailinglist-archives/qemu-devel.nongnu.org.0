Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB6B6AC464
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:06:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCQJ-000892-0a; Mon, 06 Mar 2023 10:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZCQH-00088r-DN
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:06:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZCQF-0004IK-UL
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:06:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678115202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H8taTCi/xo9FbyIdO/UEkBHjnmIbpy7veZzv7Ya4O9c=;
 b=g0eKJtyQpykxZxQPVcFIujhSyZZ53PbTvRA8DA9rEA/5KrFr2J1+x8mWNQYU3bQAHaouYW
 uzKaROK7n5NYVpVCXHMjxxpYbRs9Wx+rgZJg9OC9qxr95ktdQmwbiAe4K4cjHfwXEMXyY2
 zyy6POcyOgq9iNc35KEa8RjsGQr/ma4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-S1_G0nkkP1iR1-YVFWYcUg-1; Mon, 06 Mar 2023 10:06:37 -0500
X-MC-Unique: S1_G0nkkP1iR1-YVFWYcUg-1
Received: by mail-ed1-f70.google.com with SMTP id
 b7-20020a056402350700b004d2a3d5cd3fso9048552edd.8
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678115188;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H8taTCi/xo9FbyIdO/UEkBHjnmIbpy7veZzv7Ya4O9c=;
 b=LDX1wRlRYKTOcrIyo9WAwtzR6SRdDzUuu09hlh/1pCZzZAOXFEV3+/b6KbMVuZ8SOl
 Xa+z9uV7fjbsKQZrvZYzWuHOC4vtcoogF4SrqjJYJfYT8QVMhEm1fUuPf+XIGOlNJ1s/
 5yI2BnaTumYAEosXbEtxDNFVJQHFd3Wy8KiHgcoUI2jkj6TdLdTgBFlx1WPE2gqqnovl
 /s7kvw6NrYjBdBzsEtgfzRalCXxVYceUKNXRuTumyyQNPV7q8v8fv6S2mqV1xDKY7Bwe
 8WcgSFFt7rJEIP9aI7BCio7B0hPTPFxeO3wEAUnZ0mXdZPAIJr/RZZhuollscYp5azHI
 HkUA==
X-Gm-Message-State: AO0yUKXdV/KDLu527+UfpfzzBfejvqXOFprJOHE5zs0u/JjjMGVfTGSj
 09Jy92zL4tfs8+Yywxf3r1fTYNSMqcqWVliuoUsUXTSOWJe0TYyfGUDGm9dFcZ9d38OxnNua4Lr
 hug7++tXtav2Kpjs=
X-Received: by 2002:a17:907:d14:b0:8f6:711b:8d67 with SMTP id
 gn20-20020a1709070d1400b008f6711b8d67mr16517548ejc.26.1678115188047; 
 Mon, 06 Mar 2023 07:06:28 -0800 (PST)
X-Google-Smtp-Source: AK7set+eit1sHJcN93TKcJqyF+btXXJgYKcOZR2aKJuiPk/0OKGs3tNyIaCrii7zfl4ruw9I9PThow==
X-Received: by 2002:a17:907:d14:b0:8f6:711b:8d67 with SMTP id
 gn20-20020a1709070d1400b008f6711b8d67mr16517515ejc.26.1678115187729; 
 Mon, 06 Mar 2023 07:06:27 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 fy5-20020a170906b7c500b008b17662e1f7sm4706440ejb.53.2023.03.06.07.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:06:27 -0800 (PST)
Message-ID: <c756dc04-0b37-a02c-7359-1636e1c7256c@redhat.com>
Date: Mon, 6 Mar 2023 16:06:26 +0100
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
 <71ed58bd-fb24-4eab-6638-a6a88676201b@redhat.com>
 <CAFEAcA9SfBnBaAL3P2VPGh0Mjx59Fgp+RP1vdLtezruT=Sh4aA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA9SfBnBaAL3P2VPGh0Mjx59Fgp+RP1vdLtezruT=Sh4aA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On 3/6/23 15:24, Peter Maydell wrote:
>>> Why is this device even messing around with multiple
>>> threads and atomics anyway ??
>> Because it is an example of deferring device work to another thread,
>> just like on real hardware it may be deferred to an on-device
>> microcontroller or CPU.
> If we want to be able to do that, we should probably have
> infrastructure and higher-level primitives for it that
> don't require device authors to be super-familiar with
> QEMU's memory model and barriers... The fact there are only
> half a dozen other uses of qemu_thread_create() under hw/
> suggests that in practice we don't really need to do this
> very often, though.

Yes, you're totally right about that.  I have never needed this kind of 
higher-level primitive so I haven't thought much about what it would 
look like.

The usage of barriers isn't great, but all this patch does is correctness...

Paolo


