Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A93D4D8664
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:04:02 +0100 (CET)
Received: from localhost ([::1]:36666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlIm-00039c-Vv
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:04:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTkzc-0008U1-HQ; Mon, 14 Mar 2022 09:44:12 -0400
Received: from [2a00:1450:4864:20::536] (port=44886
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTkza-0002qs-9Y; Mon, 14 Mar 2022 09:44:11 -0400
Received: by mail-ed1-x536.google.com with SMTP id j25so6573342edj.11;
 Mon, 14 Mar 2022 06:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A9+/c99jLNNwa+RYqlv5ZLsOklHMUnZ+eQ0ykfc/70w=;
 b=JBElYxsGv2B7C/K0RvpV75DJBzBjFwsDNNrACsPlpEapDTgvwPMDZCIvYojuCEnyDK
 V3vRQWJy0JkgEpAmdouC6ht3oCSFQ/Q9PpAyyReN2wobDJq393bEnMC3NjsiIHe4JCR3
 Bwgr4MJiLH1Ojhv+lkh29ygjy9KabrtNZ/CyKJg8Arp34MgUcBqASZgXKDHnUq4uZm6O
 11YSqsuZKx5GOWLYrGM1LbfGsca0cZVRohp8pb5sd2UUw9O/IhkjjdNYKagZBozubPkK
 h9CR0a+6Zaq1Y/5Ak4B6nV5zOxRCkN+X3Nu42RWljPdDAuazUfuyDO6ndT/GEhQyh1RL
 BUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A9+/c99jLNNwa+RYqlv5ZLsOklHMUnZ+eQ0ykfc/70w=;
 b=PtrFOt0RLjbEVZearpggrHJc2GUdjGnJrWCBqnA+vP3ex18leP+VW6iE4DBKbmxu+d
 CDvpcTfU4LuDIUeE8pv5OWEpKEv7BZRjzVZ3FT7dmxAU5y6qV1Pd1JHIZ70Xpi1tmnTh
 sX3pMwVWPFphd8YD302HL6qNWbl1yEx1Y8DsXyU0lse08FEJRkUYG9tbUv25t60j6GYc
 j0NsT19MNt+mK5M9/1ZCYI1B6m62tTmArKmCq78i8NOM53JKwQhKhoIGaUVeeix4juQW
 QnILzLsGlBE3ofINwvpNRLI6U39D1vEkpNUrwShHKs+1gKL1UAqz0EOGlMkVPaU5DRGk
 77pQ==
X-Gm-Message-State: AOAM533tBSjc9/RLMq8cn7GKH9zcuhj6jvqWGTvzNxhPNhCrnkhouhui
 lqcwBK8BOYwgP6YLbI7BHYA=
X-Google-Smtp-Source: ABdhPJxXEPpHv7D8KJaKCFvfi/QPRCpEfeXMD9AHVrYAmYI1SCXpP6e5H/RbsI9EJe9LrrgmRzVObg==
X-Received: by 2002:a05:6402:440d:b0:412:9e8a:5e51 with SMTP id
 y13-20020a056402440d00b004129e8a5e51mr21241015eda.362.1647265448602; 
 Mon, 14 Mar 2022 06:44:08 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 lj2-20020a170906f9c200b006da6f29bc01sm6721383ejb.158.2022.03.14.06.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 06:44:08 -0700 (PDT)
Message-ID: <54d63649-7c6e-f953-d842-a0384bcecd17@redhat.com>
Date: Mon, 14 Mar 2022 14:44:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH experiment 08/16] tracetool: add extern "C" around
 generated headers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <20220314093203.1420404-9-pbonzini@redhat.com>
 <4db1e2b9-819b-4a08-0f18-4d2f78ac1015@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <4db1e2b9-819b-4a08-0f18-4d2f78ac1015@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/22 14:33, Philippe Mathieu-Daudé wrote:
> On 14/3/22 10:31, Paolo Bonzini wrote:
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   scripts/tracetool/format/h.py | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/tracetool/format/h.py 
>> b/scripts/tracetool/format/h.py
>> index e94f0be7da..2d92fa8bd2 100644
>> --- a/scripts/tracetool/format/h.py
>> +++ b/scripts/tracetool/format/h.py
>> @@ -27,6 +27,9 @@ def generate(events, backend, group):
>>           '#define TRACE_%s_GENERATED_TRACERS_H' % group.upper(),
>>           '',
>>           '#include "%s"' % header,
>> +        '#ifdef __cplusplus',
>> +        'extern "C" {',
>> +        '#endif'
> 
> Why not use G_BEGIN_DECLS?

I wasn't sure if tracetool dependend on glib.  It's more a philosophical 
question than an actual difference, of course.

Paolo


