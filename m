Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EA44DCAD2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 17:10:14 +0100 (CET)
Received: from localhost ([::1]:46424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUshZ-0000gP-Jq
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 12:10:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUsbm-0002eG-Rg
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:04:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUsbi-0000Ha-1F
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647533048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZDIt7RiIOKlRRGpdtVg5f/EyD5pK60vaMrdD8mvKJ/M=;
 b=M0+FToIRqBefx1XK+fqk7bs0fjCXyoFAkto4guHVF4aryRarGywYHeVY4b5cVNAu/uPEpn
 kCNdk/XpZtmMqBjJyzorE97XA2G3QQDxhGxDdVOfW864YLCV0vaDzsMSfGfMElyNmgzy2e
 npXW+Qgw1cIdF5orjtp9GGVdNltovug=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-aK1gYMQ_Py2zvXqAzCjoEA-1; Thu, 17 Mar 2022 12:04:07 -0400
X-MC-Unique: aK1gYMQ_Py2zvXqAzCjoEA-1
Received: by mail-ed1-f69.google.com with SMTP id
 cm27-20020a0564020c9b00b004137effc24bso3390661edb.10
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 09:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZDIt7RiIOKlRRGpdtVg5f/EyD5pK60vaMrdD8mvKJ/M=;
 b=08nbdt+vQBvAaF6oopzjWQNCVepmbNfd2deI4MDzj869iFYrJirBncEWWX9z84IlYs
 mOHmufBN7oNxi7UW9F8Ocw5DSu6uTSk878DicUd6izDmSNzEU1lx6eAZ/oK0R9di2rUt
 /bk/lTVcpYs8vDDZFlIYAx0hXQivmqLByzubhBbLmX0WYPIbfDSnmY2RF3giAOEMtaK7
 kQX3lYmXMk7ThZSv5CYg2ve07m9EgwxnbdTHbdBcQzeR0DKt0S/EbLm5j0EVc5s5u2Cs
 W2gP3EjKOTyg/76LHkJnG1G60zhXsXpSIIYrfLyY3+CyUKZm6rnOkVVcUN2PaC5czY6O
 H7mw==
X-Gm-Message-State: AOAM532KVbp6O+jjU53aixjMKZZxfMCT07OlK0X7sJ92oUb/Tp/hXGeQ
 vhSvDWYbXhMfy2LW5+GDRsj5LP79IY1M0JjBeiQttexcWbhJYqEPEl8WP34xMuZcxmdSuV0QJHI
 2MsEdT5E7N+5vRAg=
X-Received: by 2002:a17:906:2991:b0:6cd:ac19:ce34 with SMTP id
 x17-20020a170906299100b006cdac19ce34mr5194599eje.746.1647533046057; 
 Thu, 17 Mar 2022 09:04:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3SDre2ufDruHrZeLLXJv069wbIHW8PA2W6S1FIhIWRgLeFChbl8N6JS/8sARU6AcGddWmvg==
X-Received: by 2002:a17:906:2991:b0:6cd:ac19:ce34 with SMTP id
 x17-20020a170906299100b006cdac19ce34mr5194565eje.746.1647533045776; 
 Thu, 17 Mar 2022 09:04:05 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1709066b8200b006bbea7e566esm2560040ejr.55.2022.03.17.09.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 09:04:05 -0700 (PDT)
Message-ID: <1683432d-771e-2ffa-accd-916aaf3801dd@redhat.com>
Date: Thu, 17 Mar 2022 17:04:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 12/14] iotests: remove qemu_img_pipe_and_status()
To: John Snow <jsnow@redhat.com>
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-13-jsnow@redhat.com>
 <71c3d99f-f273-ac32-d644-4b2d3eee6ffb@redhat.com>
 <CAFn=p-ZpoF+QVZv0Quq8NmYVSvXOtVMxPmynDFSr7hG54aV-CA@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-ZpoF+QVZv0Quq8NmYVSvXOtVMxPmynDFSr7hG54aV-CA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.03.22 16:58, John Snow wrote:
> On Thu, Mar 17, 2022 at 11:28 AM Hanna Reitz <hreitz@redhat.com> wrote:
>> On 09.03.22 04:54, John Snow wrote:
>>> With the exceptional 'create' calls removed in the prior commit, change
>>> qemu_img_log() and img_info_log() to call qemu_img() directly
>>> instead.
>>>
>>> In keeping with the spirit of diff-based tests, allow these calls to
>>> qemu_img() to return an unchecked non-zero status code -- because any
>>> error we'd see from the output is going into the log anyway.
>> :(
>>
>> I’d prefer having an exception that points exactly to where in the test
>> the offending qemu-img call was.  But then again, I dislike such
>> log-based tests anyway, and this is precisely one reason for it...
>>
>> I think Kevin disliked my approach of just `assert qemu_img() == 0`
>> mainly because you don’t get the stderr output with it.  But you’ve
>> solved that problem now, so I don’t think there’s a reason why we
>> wouldn’t want a raised exception.
>>
>> Hanna
>>
> I thought you and Kevin actually preferred diff-based tests, maybe I
> misunderstood. I know that there was a strong dislike of the unittest
> based tests,

Oh gosh not from me.  I really like them, because they allow skipping 
test cases so easily (and because reviewing patches for such tests tend 
to be easier, because the code is explicit about what results it expects).

> and that the new script-style was more preferred. I
> thought inherent to that was an actual preference for diff-based
> itself, but maybe not?
>
> I'd say negative tests are easier with the diff-based as one benefit.
> I'm a little partial to that kind of test. (I noticed that bitmap
> tests were the most habitual user of negative tests involving
> qemu-img, haha.) Otherwise, I guess I don't really care what the test
> mechanism is provided that the error output is informative. Happy to
> defer to consensus between you and Kevin.

I don’t think we have a consensus. :)

But AFAIU the main disagreement was based on what each of us found more 
important when something fails.  Kevin found it more important to see 
what the failing process wrote to stderr, I found it more important to 
see what call failed exactly.  Since your exception model gives us both, 
I believe we can both be happy with it.

> Anyway, this patch (and the ones that follow it, I haven't read your
> feedback on 13-14 yet) doesn't close the door on making everything
> Except-by-default, it would just be further work that needs to happen
> after the fact. How do you want to move forward?
>
> - Replace calls to qemu_img_log() with qemu_img()
> - Make qemu_img_log() raise by default, but log output on success cases
> - Something else?

Second one sounds good to me for this series, because I’d expect it’d 
mean the least amount of changes...?

Hanna


