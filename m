Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB1169D1F1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 18:12:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU9h7-0000kQ-KH; Mon, 20 Feb 2023 12:11:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pU9h5-0000jS-Sz
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:11:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pU9h3-0004K9-3l
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:11:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676913072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1sG+4IMv0xjCF7dlOw+HEYiyxcd3ITUURBDL9idgal0=;
 b=VJJjIf0LQW5JTUCrGUC609qFeuvtEXdfmuqNWTcuKwupQxycrbW9c5wVyFn1r+kTacOUBQ
 qNP171p3PV9I5roFBEA+KO3MYsFMgOGN+Rx5mAlUb5jfQD3V/OcjIVPLHixYEEz9IMFXx6
 ccrJRJCNZ/g3wQwNmYM+KYha2iieDXg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-FDeUPiQBNIej8198fm5YAQ-1; Mon, 20 Feb 2023 12:11:10 -0500
X-MC-Unique: FDeUPiQBNIej8198fm5YAQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n15-20020a05600c500f00b003dd07ce79c8so711799wmr.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 09:11:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1sG+4IMv0xjCF7dlOw+HEYiyxcd3ITUURBDL9idgal0=;
 b=WjL2gl8GKaqT5sfXOMLhmWSyHYuL6j5vKYkFO/Hn4/FtpyqZGJx2Hx/NZzzD207uDk
 KNBnuWtzbGZluFnQam8uThVUdYjZdN24nQarYHZmp3JaW9PbGoJxXizAfkKgZBsOPwSm
 5A+x1sedbttCdDZjot0LaU2oHTPKCRGAef9kJGrA2Er78bw9fNOg9GepeJMy6ne7Z3bP
 fQPLeY0PuGpms/tIFdXNf1dWMS0CJTV+k5/dOysFzBKi17hz3H3kBN8SfdqMKeFNoA1n
 Ep00cyVmEZF6XGtjxrj20rN9eBXJJsY5/TQ09JJezX3ISrlhlQ4Ilmjyjhj+GOEJ3hk+
 C0Tg==
X-Gm-Message-State: AO0yUKUEF7mLh4if7Sad7D4UW1wKidwCAv2obgIDMJPTyn2umv2q+L3G
 ZVhyim6SDMagaZQlDkf9tjMwZtPJ/KDtN17iSAwlSbTZYs/vCMyqh0NN1SSW1vi5yWE5xqJzTAS
 tyCgNL7ZxgowSxeE=
X-Received: by 2002:a5d:4208:0:b0:2c5:4d8f:7193 with SMTP id
 n8-20020a5d4208000000b002c54d8f7193mr806448wrq.56.1676913069661; 
 Mon, 20 Feb 2023 09:11:09 -0800 (PST)
X-Google-Smtp-Source: AK7set9eY3JRT9FZlH8DPHLZ9bazqUARFit218NHFflevE6nyJf0GRQv1F7Z3b3EDg9Jysix8a7hYQ==
X-Received: by 2002:a5d:4208:0:b0:2c5:4d8f:7193 with SMTP id
 n8-20020a5d4208000000b002c54d8f7193mr806433wrq.56.1676913069297; 
 Mon, 20 Feb 2023 09:11:09 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d6289000000b002c56af32e8csm1059248wru.35.2023.02.20.09.11.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 09:11:08 -0800 (PST)
Message-ID: <0b1d2845-ae0c-d235-205f-f360387b9ad0@redhat.com>
Date: Mon, 20 Feb 2023 18:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 00/27] target/s390x: pc-relative translation blocks
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
 <e7b799a4-c718-00a4-9107-9ea222fdd162@redhat.com>
 <9599dcdc-d413-215a-941c-79ed61ec6ef2@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <9599dcdc-d413-215a-941c-79ed61ec6ef2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 20/02/2023 18.02, Richard Henderson wrote:
> On 2/19/23 21:57, Thomas Huth wrote:
>> On 09/01/2023 21.07, Richard Henderson wrote:
>>> This is the S390 specific changes required to reduce the
>>> amount of translation for address space randomization.
>>>
>>> Changes for v3:
>>>    * Rebase and fixup conflicts.
>>>
>>> All patches are reviewed.
>>
>>   Hi Richard,
>>
>> as far as I can see, this series has not been merged yet? Were there any 
>> issues left here? ... soft freeze is coming rather sooner than later ... 
>> do you want me to take this trough my s390x tree, or will you take it 
>> through your tcg tree?
> 
> No, not merged.  I had assumed this would go through s390x tree.

Ah, you didn't put me on CC:, so I assumed it would go through your tcg tree 
... ok, I'll queue it for my next pull request.

  Thomas


