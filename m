Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6151495D31
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 11:02:52 +0100 (CET)
Received: from localhost ([::1]:49912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAqkt-0004gb-PR
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 05:02:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAomz-0001iP-6g
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 02:56:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAomw-0005NG-60
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 02:56:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642751806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JMjqOul6tZaC4sLI9bUp+kUJOLUdq23eao3zVKg+tGI=;
 b=CpDwHkXunCRAQC4dm8baIXamxYKI9yLGegHp8uAVslosFK99L+bD+noovqKyfUZAiJlIWo
 ZqTLz1Bd9VgLi2NB8/WRJ7/7PQba0CbTGUmfAGzbuR0SK6u9GOd0z1dJrhWOE8KIubqrPH
 TRaZK4udqeCewbEU8ZovYqnvssHUn5I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658--EriU--qNbGbM-YtK38kLg-1; Fri, 21 Jan 2022 02:56:44 -0500
X-MC-Unique: -EriU--qNbGbM-YtK38kLg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l20-20020a05600c1d1400b0034c29cad547so8903913wms.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 23:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JMjqOul6tZaC4sLI9bUp+kUJOLUdq23eao3zVKg+tGI=;
 b=ow5h+dV7oEMStHlwAn7TqCTyPdZCGR13zpguZwAWE6kHO0mO4CxaJYQWbvV7Jos0jx
 OzP4RxnYCQgaEBz5f9pMhTR7M3s+SYlN8nQDhWHZO7Ot2ixXCtbbgLfz5WZPV5wWVcd5
 Skd06I2gRKXB/pPPU2+jaWkFLLB03dsnvDwMlvFGYGv7lnV0uugy1CcFeUot1cQomUJS
 Z+JBIellA1Bow1cDwY4vyhtDzjrWUCixYvU5XgLdv98AD2nNlTfJakOepnFQ+zmrLHc6
 sOVMU7EfbIsNfhLaH9deTv9NJToI6ObWgrf93pTZo3f3UU/1zN18M2dYNprb7+fBkyTT
 mqqA==
X-Gm-Message-State: AOAM531iGfntLxdUdPrDSLrZDOTSWpg9GkfN8FeTTTMOLlLclVSEBPiF
 mShgIC6jCvaG8OeY5QF0l+J4Q8p9dKkkalsJFqSltb7Mq7WrGKmN8G3cW1yvqt5hrWSGCzy0XBH
 ZAjM+5TbVU27Q9+M=
X-Received: by 2002:a7b:c00d:: with SMTP id c13mr12952727wmb.99.1642751803707; 
 Thu, 20 Jan 2022 23:56:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQ6xPkOwYMLBKHVGHvjvIDbQcSvbLO4Gvqgpec6h607kdH8Lxe2TmUIS+KISORIVu3wDGn6g==
X-Received: by 2002:a7b:c00d:: with SMTP id c13mr12952714wmb.99.1642751803516; 
 Thu, 20 Jan 2022 23:56:43 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id f13sm4753093wrp.105.2022.01.20.23.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 23:56:43 -0800 (PST)
Message-ID: <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
Date: Fri, 21 Jan 2022 08:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: "make check-acceptance" takes way too long
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/01/2022 16.13, Peter Maydell wrote:
> On Fri, 30 Jul 2021 at 16:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> "make check-acceptance" takes way way too long. I just did a run
>> on an arm-and-aarch64-targets-only debug build and it took over
>> half an hour, and this despite it skipping or cancelling 26 out
>> of 58 tests!
>>
>> I think that ~10 minutes runtime is reasonable. 30 is not;
>> ideally no individual test would take more than a minute or so.
>>
>> Output saying where the time went. The first two tests take
>> more than 10 minutes *each*. I think a good start would be to find
>> a way of testing what they're testing that is less heavyweight.
> 
> Does anybody have some time to look at this? It makes
> 'check-acceptance' almost unusable for testing fixes locally...

We could start using the "SPEED" environment variable there, too, just like 
we already do it in the qtests, so that slow tests only get executed with 
SPEED=slow or SPEED=thorough ...?

  Thomas


