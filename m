Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0251E4DCA94
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:56:48 +0100 (CET)
Received: from localhost ([::1]:51320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUsUY-0001ET-Po
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:56:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUsRH-0007dT-Am
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:53:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUsRC-0007B6-KH
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:53:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647532397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mDYTFcyhzpfMemdyX4M9wlK+berWYyGv6SEREeJNQGc=;
 b=MZMuBVyWqP3K7+p2s5tuBs2qZ8pj5lR+B4fp9CZ03ObsJwG1OyS7GOMe88gGhdSyvqmJy5
 sbSCV3pf59b268EGejzmieTLS0t0DpZdZZD0RCYtGauYaO0tbNMrD4tElWTJYnC2rykIaf
 AUIlu6ir5NX/VxTvBJkWFCUdVx4JsFM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-Q8g8LGoxPUmlnEzgmhuk2g-1; Thu, 17 Mar 2022 11:53:16 -0400
X-MC-Unique: Q8g8LGoxPUmlnEzgmhuk2g-1
Received: by mail-ed1-f71.google.com with SMTP id
 w15-20020a50c44f000000b00418f00014f8so2242093edf.18
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mDYTFcyhzpfMemdyX4M9wlK+berWYyGv6SEREeJNQGc=;
 b=HNR6IZuW3WtKs+xPV77n4Z+6plK2n+LmYx9L3/v2B/2smLuTxMfp+DkQ3khRu+oy0x
 lutIfwJiJHPfoNdVuj+PbUF84nV3hgYn/HLGXfYbojbtReRRnuI2OLeLBQoeDiswC8c/
 hWdQ/6jebwn9nu8wH47brUtd+vVR79xnqbIIt5YbasPJ8Sv5Oe4GMpKTTS0LOSC5zKEm
 QSPJxneXCzuMNzCeZzdYgtVjTfnbdE3pqXBcThKDCtkuA/d8fOcvfGwhAYkmBvFfGsEr
 rfy9vNuSy+X+bFYpMI5h9yYpj5TExXDizV0vkL9w0X3b4to5eGUp1bykuzejcmBTOKfg
 UC5Q==
X-Gm-Message-State: AOAM533NAiQwJPrxh4EU0X/xRADqNxau1QZVo9h44szthdh6rZl2wjpD
 X5cUTve1MC88mQRXM/4ZaCTc1mRhnWSXUiKBetws+xiV/5/lV68pTuUvYLluf7DIl5Z3GMgJMoH
 Dj7vHpQRbRtybjwg=
X-Received: by 2002:a17:907:7711:b0:6ce:e03c:e1e2 with SMTP id
 kw17-20020a170907771100b006cee03ce1e2mr5055229ejc.769.1647532395110; 
 Thu, 17 Mar 2022 08:53:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytMZqg+R4chw09RW2vSjRSoxF71C4PrkDpFo/Q5dRAiNkI1jugXzWE16pT+fJYmXz57DLcwQ==
X-Received: by 2002:a17:907:7711:b0:6ce:e03c:e1e2 with SMTP id
 kw17-20020a170907771100b006cee03ce1e2mr5055203ejc.769.1647532394882; 
 Thu, 17 Mar 2022 08:53:14 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a170906538b00b006ae38eb0561sm2584333ejo.195.2022.03.17.08.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 08:53:14 -0700 (PDT)
Message-ID: <66f70dc8-2899-b837-0a9f-572737d64856@redhat.com>
Date: Thu, 17 Mar 2022 16:53:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
 <CAFEAcA8zongmSfDAgorr=RfKK6Qsgyi1xNz5KBzdB0RGeSBSWA@mail.gmail.com>
 <dca7d15b-2f24-cfb2-9a31-47b5ffd9c3d5@redhat.com>
 <YjHY8GA52MzjBxLK@stefanha-x1.localdomain>
 <d041cc7c-f437-3092-2485-ec9b2b0f8c96@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <d041cc7c-f437-3092-2485-ec9b2b0f8c96@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.03.22 16:11, Paolo Bonzini wrote:
> On 3/16/22 13:32, Stefan Hajnoczi wrote:
>> You can define rules and a way to enforce a subset of C++, but I think
>> over time the code will be C++. A policy that is complicated discourages
>> contributors.
>>
>> For these reasons I think that if code runs through a C++ compiler we
>> should just allow C++. Either way, it will take time but that way no one
>> will feel betrayed when C++ creeps in.
>
> Fair enough.  We even already have some conventions that will make any 
> C++ that creeps in less weird (for example, mandatory typedef of 
> structs).
>
> I don't think it would be a big deal overall.  I actually agree that 
> we should "just allow C++", what matters more to have style rules that 
> make QEMU's flavors of C and C++ consistent.

I just want to throw in that I personally am absolutely not confident in 
reviewing C++ code.  As for Rust, you keep mentioning that we don’t have 
anyone who would “shepherd us through the learning experience”, but I 
find the very same argument applies to C++.

C++ may start out looking like C, but if used ideally, then it is a very 
different language, too.  I understand the difference is that we can 
incrementally convert our C code to C++, but I’m not comfortable 
overseeing that process, which I would have to do as a maintainer.  
Assuming our overall stance does change to “just allowing C++”, I’d feel 
unjust if I were to reject C++isms just based on the fact that I don’t 
know C++, so I’d be forced to learn C++.  I’m not strictly opposed to 
that (though from experience I’m more than hesitant), but forcing 
maintainers to learn C++ is something that has a cost associated with it.

My biggest gripe about C++ is that as far as I understand there are many 
antipatterns, many of which I think stem from the exact fact that it is 
kind of compatible with C, and so you can easily accidentally write 
really bad C++ code; but without years of experience, I’m absolutely not 
confident that I could recognize them.  Now, I might say I’d just 
disallow complicated stuff, and keep everything C-like, but from what 
I’ve heard, C-like C++ seems to be exactly one case that is considered 
bad C++.  I’m really under the impression that I’d need years of 
experience to discern good from bad C++, and I don’t have that experience.

Hanna


