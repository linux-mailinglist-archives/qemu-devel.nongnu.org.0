Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015F95F9BAD
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 11:12:42 +0200 (CEST)
Received: from localhost ([::1]:55464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohoq0-0004KM-2n
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 05:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ohoap-0006Lg-S5
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:57:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ohoaV-00070D-Kf
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665392198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VkKJMtS8FuKsVQNxcc3TubEv6RoZVioyfXpfod7hDTs=;
 b=XZ9FgOt28KYUOstVXfGKOSj7bt9IiGznXORa1jOYbFZej375zw9kj/6FYCd2OL1/eL5M9Z
 pFztxdlBtIn0S/3jrZIKr28hOhzM6UeyiLmHNJcKgW8WAPxYbAjuz1CTiq2XsTSNZC0wSe
 QeWKE9k5UF2rC6dpgUaSKH4G79emekA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-eKUulibLONGWnxpENGRJBQ-1; Mon, 10 Oct 2022 04:56:37 -0400
X-MC-Unique: eKUulibLONGWnxpENGRJBQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v23-20020a1cf717000000b003bff630f31aso2905849wmh.5
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 01:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VkKJMtS8FuKsVQNxcc3TubEv6RoZVioyfXpfod7hDTs=;
 b=75vVHYiHjAzkzYdRe9Horjkyb8vrkUyuUwmnLYe0ev9Oe1z9mfukhcxeBvaVhkwHmO
 luov+iupSHXQ+0Omg1+oWg8TRK7D2npHyTCRd1I62C89/HhJTpi3K7a2piwMs8XqZojs
 GlPpTOGotyTK/ktucaZDbYLNpG9Y2Tiwx768DLhKIXEygZtUMFXcz3WCtegMOnTskcTD
 AfvHpEoVM8IRadvmaOE6C/o6jhGlX2/AQi2roj3XzhikASKu572gvnN7VO7Za0bQEQct
 3Y1S4lLqPvC75LvtInyFS4zMO5Qqyi/jpmm0rj7RJbnjjX0Wzp7/yDDf8qYv2EkSn/zE
 Tj8w==
X-Gm-Message-State: ACrzQf39hHd66Q4G7Vjpoq4FIRpTq2ZE/Dosne/DLTdmboZIXLmil3fq
 gjSvRXalYKZTK901dLwlErJX+mYUwTjY9wioy2to9GZF4o8tD6dES4lWJp1C9p4kocCDuYk5cGj
 eJiU8hmFwrQ2OlaE=
X-Received: by 2002:adf:eecc:0:b0:22e:3e6d:fb62 with SMTP id
 a12-20020adfeecc000000b0022e3e6dfb62mr10610454wrp.302.1665392196309; 
 Mon, 10 Oct 2022 01:56:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5JWunRY1NZsSU+6MhHze+djD0jxXTZjrUsvpNvwpWuqt2HBeOIueLz+inJCAqFajl6EdEpVQ==
X-Received: by 2002:adf:eecc:0:b0:22e:3e6d:fb62 with SMTP id
 a12-20020adfeecc000000b0022e3e6dfb62mr10610439wrp.302.1665392196071; 
 Mon, 10 Oct 2022 01:56:36 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-99.web.vodafone.de.
 [109.43.178.99]) by smtp.gmail.com with ESMTPSA id
 k16-20020adfe8d0000000b0022cd0c8c696sm8088934wrn.103.2022.10.10.01.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 01:56:35 -0700 (PDT)
Message-ID: <07a72a1c-6dd1-a776-56d5-95880c295f48@redhat.com>
Date: Mon, 10 Oct 2022 10:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Igor M <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>
References: <20221010075439.4146972-1-ani@anisinha.ca>
 <CAARzgwwKthMvty72SkG_zt9rpuAek-PMS3+aK9dUKS_e50EDxA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAARzgwwKthMvty72SkG_zt9rpuAek-PMS3+aK9dUKS_e50EDxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.934, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/2022 10.13, Ani Sinha wrote:
> On Mon, Oct 10, 2022 at 1:24 PM Ani Sinha <ani@anisinha.ca> wrote:
>>
>> Please see the README file added in patch 10 for more details.
>> Sample runs are as follows:
>>
>> $ ./tests/venv/bin/avocado run -t acpi tests/avocado --tap -
>> ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (smbios.py, line 92)
>> ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (smilatency.py, line 47)
>> ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (testacpi.py, line 158)
> 
> None of the above files are avocado tests or avocado related python
> scripts. They are run from within bits in a python 2.7 environment. I
> could not find a mechanism to exclude a directory from avocado tests.
> I also do not think making those scripts python 3 compliant is a good
> use of my time since upgrading bits to use python 3 would be a major
> task unrelated to QEMU testing.

Maybe you could at least switch those three lines to use the new print() 
syntax to silence at least these ugly errors? ... Python 2.7 should cope 
very well with the new syntax, as far as I know...

Otherwise, it might be better to put the non-avocado python files into 
another directory under tests/ ?

  Thomas



