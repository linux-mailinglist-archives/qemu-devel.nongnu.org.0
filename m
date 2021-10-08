Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CD64265FA
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 10:32:44 +0200 (CEST)
Received: from localhost ([::1]:34138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYlJ4-0002bn-2n
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 04:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYlGu-0001m5-O6
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 04:30:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYlGq-0005Po-7C
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 04:30:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633681821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nmSCasPe/F/wDcqeUc4hlBpuUn7pRGwSjLlw5yK2p2w=;
 b=QrfpF2nwY8enppcZbfQf/8jKLAFqZ5KmFHhyjshlwPk/GNzMmIzO/wvTVvgHI+1heTE3a1
 gWDukQJJfjkYk68revfJGshXhACZdb+UmrxsKnOC54UAaX8wYjVRoe6F6CiSvNOflU21eO
 wI7sjX/R8y6AZdWO3hXbKoNgbvFtcTc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-46hlBnUlMeSJWm4UHjEaHg-1; Fri, 08 Oct 2021 04:30:16 -0400
X-MC-Unique: 46hlBnUlMeSJWm4UHjEaHg-1
Received: by mail-ed1-f71.google.com with SMTP id
 c8-20020a50d648000000b003daa53c7518so8443114edj.21
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 01:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nmSCasPe/F/wDcqeUc4hlBpuUn7pRGwSjLlw5yK2p2w=;
 b=3CpuSK6w35UJrPaVQEXVAp5CiPFmN1UcT704t7M4v9YaZcKOoa5bZ7TkfgkfdSyEUH
 wN/gXImOe85Ni0NBdhElI/PzuVRivcIQS3okWiWCAhSJSQTx0wvTWg/pUo95fXWJBZ5h
 SVpLqW7mnCrSV8lZ5p7RJEsMvKXUSle5stKORjlSPAN3IG5j+MoerL7MzcieJcL2zF1q
 0h1iK2QecOCg9ycI/rH8nu7tvGv28sgMYFqFgBDLtq59REztwO+bIPvrYqG/MTc8JP+X
 rksj9NS4zP+vrxpdMayYiJ4gKHUTW46uIwqeBPM/QHnZzVzns5dMUXFqa0Ek+ZENgX5Z
 WsjA==
X-Gm-Message-State: AOAM531w7eQyRpaugw2juCraOiNzAOiuSfWTa7/NUJNf6B9yFYtQSUO2
 vNbsPMlDO7yPoqz1AXoiQ2OyI0yf+BdYNQ+OZ9A8z8Necl3trksUJGWNd2y2ldjHIbl5akP2Wvg
 K5QHPZtYm1ibG0w4=
X-Received: by 2002:a05:6402:4384:: with SMTP id
 o4mr13382656edc.33.1633681815107; 
 Fri, 08 Oct 2021 01:30:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDaaZl4j0m/WOOsUoa59dRKupbzt+lV7Uj3oHLOiFFZSvCD1w282hfzLh6JWzSQoX0R6Ogng==
X-Received: by 2002:a05:6402:4384:: with SMTP id
 o4mr13382629edc.33.1633681814864; 
 Fri, 08 Oct 2021 01:30:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r6sm725076edv.42.2021.10.08.01.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 01:30:14 -0700 (PDT)
Message-ID: <52debbd6-574b-1f33-c880-28d229679eb0@redhat.com>
Date: Fri, 8 Oct 2021 10:30:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 15/24] configure, meson: move libaio check to meson.build
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-10-pbonzini@redhat.com>
 <dc8d3342-96fa-a0fb-f337-c87066eba911@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <dc8d3342-96fa-a0fb-f337-c87066eba911@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/10/21 21:24, Richard Henderson wrote:
> On 10/7/21 6:08 AM, Paolo Bonzini wrote:
>> +++ b/stubs/meson.build
>> @@ -20,7 +20,9 @@ endif
>>   stub_ss.add(files('iothread-lock.c'))
>>   stub_ss.add(files('isa-bus.c'))
>>   stub_ss.add(files('is-daemonized.c'))
>> -stub_ss.add(when: 'CONFIG_LINUX_AIO', if_true: files('linux-aio.c'))
>> +if libaio.found()
>> +  stub_ss.add(if_true: files('linux-aio.c'))
>> +endif
> 
> This bit doesn't look quite right, with the if_true.

It looks silly but it works ("when: []" is always-true, just like in 
python all([]) is true).  I'll remove the if_true in v2.

Paolo


