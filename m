Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BA02FF1DF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:27:51 +0100 (CET)
Received: from localhost ([::1]:38196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2dkM-0004cq-7s
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2dgu-0002oR-Fk
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:24:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2dgs-0001sf-Kp
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611249853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UU6aQO+ehPrz4kWiGayLP8pgwbf9GGIuL/BhK89kROE=;
 b=iPUHSO/zQX3vmKepT+T3GYkV8aTtLM4qh7ISZmnypqdnT+DKAKoEw4l+EyyRAeYixMQEuY
 1LVFE3z7FPKdB6I/3tRicn2mF7fHsnWscKQ20kS/7HwPx/0/yBwSMPVeMf59sRBS0YI8Um
 aS8/I13tM+n+db3AHznJTVHNREGQz08=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-oy0vRZggNI2oy6PnJucLBA-1; Thu, 21 Jan 2021 12:24:11 -0500
X-MC-Unique: oy0vRZggNI2oy6PnJucLBA-1
Received: by mail-ed1-f70.google.com with SMTP id t9so1521569edd.3
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 09:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UU6aQO+ehPrz4kWiGayLP8pgwbf9GGIuL/BhK89kROE=;
 b=ftnTdecw/0ut7kCybozsetsynm7w0qVxvkbwpxJBdQQXVTrZCNnIsbJQHteUFZ8ZsI
 d9zrUjB02p0kcDySUuF8rQNr00AMOCD9a0irrHOTPJ4wkfDxOOtn35zLp92OaqRoLseT
 JKMHjF/vvn/DYqNDdlLL9l/Is5EgFazQ2L40KOw+3tmQDm0rsphBERy1ApmyOQjR2uY2
 bk3TDNO+abTk0BA1jKMN0PP+VsSVelp9+96X7Usm24fUut4c8JO++bAl77FZyiXQLwnZ
 HDXkvTt/Wl4u6QIKwgEHU+UJUvv9GxlD2ikQLDYISJwFjVkZIDEQNghgLQJQYObTOUR9
 z8KA==
X-Gm-Message-State: AOAM5324LJe+EDAczMJjk3oRbnzCzt+p90h0UkfFwWmb4IypXCdDqi+x
 LrQB+Axq0O2SJH1dwWVW2D/i302kF49mYVY5KaG0QLrHONajACemzxFckPhWb/FBBSekFLMHKyf
 scrFg6bvoz+KFN7Y=
X-Received: by 2002:a17:906:5254:: with SMTP id
 y20mr366949ejm.174.1611249849699; 
 Thu, 21 Jan 2021 09:24:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYmwQRMwd2/QcUCkRtUxVhlkkBY1hds5a4TEXZ0s2KmtKhoS+1yss9gj/AtFCoxG8FomzrnQ==
X-Received: by 2002:a17:906:5254:: with SMTP id
 y20mr366935ejm.174.1611249849527; 
 Thu, 21 Jan 2021 09:24:09 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f17sm3039333edu.25.2021.01.21.09.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 09:24:08 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
 <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
 <62d5d33c-fe2a-228b-146d-632c84d09fd5@redhat.com>
 <30457fa0-6d7c-4e81-2623-8551d8bf2674@redhat.com>
 <20210121160733.GP3125227@redhat.com>
 <CAFEAcA-zVvu+16xxjCvXqeZxZMqppUUb7aQkL-5nBTNY+JeyGg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Thread safety of coroutine-sigaltstack
Message-ID: <a944d86c-2871-3301-6f42-f5368a122593@redhat.com>
Date: Thu, 21 Jan 2021 18:24:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-zVvu+16xxjCvXqeZxZMqppUUb7aQkL-5nBTNY+JeyGg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/01/21 17:44, Peter Maydell wrote:
> On Thu, 21 Jan 2021 at 16:10, Daniel P. Berrangé <berrange@redhat.com> wrote:
>> FWIW The libucontext impl is all ASM based and has coverage for all the
>> arches we care about:
>>
>>     https://github.com/kaniini/libucontext
>>
>> so doesn't seem like there's a need for  coroutine-asm if we can rely
>> on libucontext for portability where neede.
> 
> The README for that notes a couple of pretty major omissions:
>   * it doesn't handle floating point registers
>   * it doesn't do anything about the signal mask
> I'm pretty sure that not handling the fp regs could cause breakage
> for Arm at least (depending on what the compiler chooses to do
> in the functions that work with the ucontext functions). The
> signal mask stuff might be OK for us because of the carefully
> limited use we make of the ucontext functions, but it would be
> a bit of a pain to have to analyse that code for both sets of semantics.

The lack of signal mask handling is an improvement for us. :)  We want 
the signal mask to be per thread, not per coroutine.

Floating point however is an issue if they don't save-restore v8-v15 
(for aarch64, I don't remember what the AAPCS32 says).

Paolo


