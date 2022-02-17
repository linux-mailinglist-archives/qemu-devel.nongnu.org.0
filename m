Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097284B9F4F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 12:42:52 +0100 (CET)
Received: from localhost ([::1]:39896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfBQ-0004pN-IG
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 06:42:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKf9Y-00047r-Cb
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:40:52 -0500
Received: from [2a00:1450:4864:20::629] (port=42681
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKf9W-0006sr-8s
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:40:51 -0500
Received: by mail-ej1-x629.google.com with SMTP id hw13so6506539ejc.9
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 03:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=twlLy/wJzg0KP0ubj7sCiXTjQ2AKEYCj0IJ9Tb1irno=;
 b=KBaplW+6mVhvyCTSxYz+NkdEnnwMkmVB72pHK0IciJZ/2eOXJMjqL+yvr0OUce3oxd
 kuwCQuGy/x+krDAfh3sm1szyUwhtlbPEVPXCoxd0OUXg9eTi0PlG0pKPeCxYGUxdfpc/
 Za2IvsOCEPmPPV4eD27JLnrA210ZAi5sebCPGcIib+9GVgk0AWB4vWZWJMFf2azf7lqa
 Z4Ml4SWrG0oPVvOpdBb8ER5sodeGK51Xxj27Z3zc7vH+Qi/UTs0qLiONf/F/7bhkF+gf
 IvfAcfptTHMJmuCMAiEf3G7UklBK+GUFwEi/Z5J9cJa6TsiRDeFJ+7jK0qnUmpfVpywg
 2c5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=twlLy/wJzg0KP0ubj7sCiXTjQ2AKEYCj0IJ9Tb1irno=;
 b=6bxAEib6Zhjy50SJczP9TCk3nV0SJhrZGA3pJ8hTex0sywGSMlQzGzSQitBNSWCzzd
 of4Gc8LW3VXIP/iMsl80Ypf/Cr4W04JKyEHyl//Gs8MFYZM0CEMnLQgZWHRBp686/eEW
 fokRkvlXSrCnmXhZkCTXGYWs9vAC/tfj/w7Zf8jc5/fmgMNu8yizba97RA9gugo2MCjw
 s7h+2cYw158Yf9nSqpPT0H47sWrMkrh3uKrNoG+FbLpoQdSqUMqA/9ptgEAZY6SBFo+j
 9ssGpaaj3giX4sZA/xNHaZ0Eiu+aUi5UfKDP3wb+ywwQfEE+Bc56FderQq9fTwAxLH0b
 FxxQ==
X-Gm-Message-State: AOAM5301WRQ7Y1Q1sa/jJfbT/ULlBsQn2VMi66JV4GkPNcuT+9oAD2bX
 +YPMjpxXzTxKJcCmMjT8Ff4=
X-Google-Smtp-Source: ABdhPJwN87XPsrho4b1i1+PcpuZJgzGHdnA3uCxtih5RvH+GTrIA4jjX+qyTIelfRnIq3QNhq3IMPg==
X-Received: by 2002:a17:906:b887:b0:6ce:36cb:1e18 with SMTP id
 hb7-20020a170906b88700b006ce36cb1e18mr2037719ejb.95.1645098043697; 
 Thu, 17 Feb 2022 03:40:43 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id vs2sm1053725ejb.64.2022.02.17.03.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 03:40:43 -0800 (PST)
Message-ID: <1a17e6e5-fd03-a01b-9692-4dd9d7bffcb0@redhat.com>
Date: Thu, 17 Feb 2022 12:40:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Portable inline asm to get address of TLS variable
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, Florian Weimer <fweimer@redhat.com>
References: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
 <87leyaznm6.fsf@oldenburg.str.redhat.com>
 <CAJSP0QXmF=AKtaZO7GjxFtd7o5iQ9JC2xYGYDo-zC0Ea1POS5w@mail.gmail.com>
 <877d9uzgsd.fsf@oldenburg.str.redhat.com>
 <Yg4VV+VFe3Bc1BQ6@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yg4VV+VFe3Bc1BQ6@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/22 10:28, Stefan Hajnoczi wrote:
>> But going against ABI and toolchain in this way is really no long-term
>> solution.  You need to switch to stackless co-routines, or we need to
>> provide proper ABI-level support for this.  Today it's the thread
>> pointer, tomorrow it's the shadow stack pointer, and the day after that,
>> it's the SafeStack pointer.  And further down the road, it's some thread
>> state for garbage collection support.  Or something like that.
> 
> Yes, understood :(. This does feel like solving an undefined behavior
> problem by adding more undefined behavior on top!

Yes, this is the kind of thing that I generally despise when I see other 
programs do it...  it's easy to dig ourselves in the same hole.

> I took a quick look at C++20 coroutines since they are available in
> compilers but the primitives look hard to use even from C++, let alone
> from C.

They're C++ only in GCC, too.  I really think that QEMU should be 
compilable in C++, but I'm not sure how easy a sell it is.

Paolo


