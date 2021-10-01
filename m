Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E2B41EDFE
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 14:58:25 +0200 (CEST)
Received: from localhost ([::1]:42990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWI7M-0004rl-PC
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 08:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWI66-0003uG-Qp
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 08:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWI65-0006B8-0n
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 08:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633093024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0MfzHs7Bm6m1LQz1vTYHej0qiGwhtN1hXC5v8oM274E=;
 b=KA0XzCWyMRqb6OWA9jgQcXjnZcF5n7a1fvrXNM5JYRMey4uZziBBAE1Hk0GDas4uJ89owc
 3G+nNapEe1TN+YpjXUHlD0tK1U6WS64N8bY7f77ZC6kYNvPAktFM82iqVZ0BH5qiHoOPg3
 BSI0nKG4KkZIa0LPtfIpe1q4Z0uAYHI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-2aS8yjHXMa2hoQmAByNmtg-1; Fri, 01 Oct 2021 08:57:03 -0400
X-MC-Unique: 2aS8yjHXMa2hoQmAByNmtg-1
Received: by mail-wm1-f71.google.com with SMTP id
 k6-20020a05600c0b4600b0030d2a0a259eso3299253wmr.6
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 05:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0MfzHs7Bm6m1LQz1vTYHej0qiGwhtN1hXC5v8oM274E=;
 b=d1/WvIaSIbMRG93lnWlias/lbHNNofxPhQcoYs/JjgVL+rPnMpMecRdr7b+erMmmC4
 qyKJYdqbiMkkpDlQWpy62bXq7If0jxR37ntr86cLYzayt6OawyWVgsOXgd6roB2IdYUK
 ZB4F5iX3WvQVyGDXEeHeRrnE6F7hIv0DjJDeNa8F9gX0j5hEBkpQa3v8Zi+jvz6Wm7/d
 XwuY1WNuEZ9097ygvc4TorAnZlyQEr9YC+hM65zB5rBxG//yWfPyKsTVai7Zu+A/M4ag
 D6jZEDRZlint24gu+mJL7037oLdVPks1SQ4FeNsW/vtcY7jN4XqrGCQDk89ySNmWkhrT
 Ckcw==
X-Gm-Message-State: AOAM532r1T9EkAl/Hbel/a3ofkmBQqbveNMIBeDWXmrAHUP2m8gudgMJ
 jEmAoKRGOlJ8y6moZv6CXdsB2m80qkQBTC6wMjbPfPNOFPoCXXeVVv72SjFfMLd17tdQ9Uc1PtE
 sXtuWCkkG1imxOUo=
X-Received: by 2002:a1c:9a07:: with SMTP id c7mr4437970wme.106.1633093022160; 
 Fri, 01 Oct 2021 05:57:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3ONizNhPtgHZce2zY/GpjLkl9aEVUh4aEfwHLK4In1E8PRaawDCx+cepExbAnAfo/s/PKWw==
X-Received: by 2002:a1c:9a07:: with SMTP id c7mr4437955wme.106.1633093021983; 
 Fri, 01 Oct 2021 05:57:01 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id n68sm7570448wmn.13.2021.10.01.05.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 05:57:01 -0700 (PDT)
Message-ID: <fb1aa5e4-8dda-baa5-f48d-8743dccc3355@redhat.com>
Date: Fri, 1 Oct 2021 14:57:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hw/ppc: Deprecate the ref405ep and taihu machines and the
 405 CPU models
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20211001121943.1016447-1-thuth@redhat.com>
 <CAFEAcA_Vjvi8JvELyG1DghCoHbUR1fzodPoaU2n-QPcf9bGwCg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <CAFEAcA_Vjvi8JvELyG1DghCoHbUR1fzodPoaU2n-QPcf9bGwCg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 14:46, Peter Maydell wrote:
> On Fri, 1 Oct 2021 at 13:22, Thomas Huth <thuth@redhat.com> wrote:

>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 2f7db9a98d..27c03ef624 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -238,6 +238,11 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
>>  (the ISA has never been upstreamed to a compiler toolchain). Therefore
>>  this CPU is also deprecated.
>>
>> +PPC 405 CPU models (since 6.2)
>> +''''''''''''''''''''''''''''''
>> +
>> +The related boards ``ref405ep`` and ``taihu`` are marked as deprecated, too.
>> +
> 
> What is this "too" a reference to? The immediately preceding section
> in the document is about the MIPS I7200 CPU model.
> 
> The not-being-deprecated sam460ex board also uses the ppc405 CPU
> I think, so I don't think we can drop the CPU models.

>> +    mc->deprecation_reason = "ppc405 CPU is deprecated";
>>  }
> 
> We're not deprecating the machine types because we're deprecating
> the CPU types. We're deprecating them because we believe that
> nobody's using them.

OTOH we mostly test default CPUs. I am a bit worried about CPU
coverage in general. I'm not suggesting we should remove old
CPUs along with their machines, because we can still test an ISA,
just worried about having so many code paths uncovered.


