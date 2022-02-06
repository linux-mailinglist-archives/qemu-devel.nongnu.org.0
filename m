Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D384AB19A
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 20:17:41 +0100 (CET)
Received: from localhost ([::1]:35126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGn2a-0000t3-DV
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 14:17:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1nGmwN-0006uo-5r
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 14:11:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1nGmwH-0002Ue-MY
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 14:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644174668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7e5X70NrbW+O2+J8f688sQFfXBwQzY0sh9ZdsFtYQxE=;
 b=B++ru5X/pMUPpR5lQgdAovBmvieSTIK95s9iuw45G8ldN8rRt6inNLlYaErOcrzfqwJw5f
 haTSqLO0ZqNncr5hfDKUPMkcYHn0P6KQZSw4cT/XU19N11Dm1JWSPRTjQDEAAiUoJOx6hD
 eozeD9ncAvk48Oebch/KqTuxdVQXsmE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-KbGrNn5JOwS5ZRcCeAcFhQ-1; Sun, 06 Feb 2022 14:11:05 -0500
X-MC-Unique: KbGrNn5JOwS5ZRcCeAcFhQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 u9-20020ae9c009000000b0049ae89c924aso6976383qkk.9
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 11:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=7e5X70NrbW+O2+J8f688sQFfXBwQzY0sh9ZdsFtYQxE=;
 b=uKB+pvrvDSRlsgVICjsZPe86HjMphYPpfXVvHa9vwPgKoxpMiBx9N7Mc1hBblXY7Yh
 UV78+nm6JVErCuPsFtXy8bIbpJDPSLK4zw63G7WkM64aE4KSn39f0QqXw0uzpTJs+LSs
 V9MUwSxn/9P8M5qo+ZglqO8ClJfe569NCZ2Y3ufPhqog1v4DDeq9TpzXg6bJiW+owgo8
 qTbwKXX4qp/NfDL9lePFEW1dJOLOOH6E2+oHZZwgAtC26i5yVNdtrp50rj4pLSwcr+gr
 smTeIzSssjeY3/EJ2+nbrVtCo3YVITQIUi+7taqPQQJPXKpUhAT71VvJLs9efi4sFRsh
 6AAA==
X-Gm-Message-State: AOAM532ba9uPjalk4OY9licdnXA+xa6a3BV506DP4s5uvcpCRvt4R7OB
 /8cGM6wRWnEl5T4SveNq09a742FcgK3QWuT7kMCD/ONH92bXESUiWWu1JxuH0BPDDGCa7sq7BgF
 j28NTFpZuPRgF39o=
X-Received: by 2002:a05:6214:230e:: with SMTP id
 gc14mr8425055qvb.55.1644174664717; 
 Sun, 06 Feb 2022 11:11:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdmGGrqjwvESrzYFTvxqFisRrcZqKkrBclL7BzoKi1qy3YxArXLS+YKn3uRatmBeXv0RJzpw==
X-Received: by 2002:a05:6214:230e:: with SMTP id
 gc14mr8425039qvb.55.1644174664426; 
 Sun, 06 Feb 2022 11:11:04 -0800 (PST)
Received: from [10.0.0.97] ([24.225.241.171])
 by smtp.gmail.com with ESMTPSA id y20sm4330604qta.9.2022.02.06.11.11.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 11:11:03 -0800 (PST)
Message-ID: <1c5dfae3-1c3c-bd2f-d2b5-06dbe75c04c8@redhat.com>
Date: Sun, 6 Feb 2022 14:15:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 0/2] hw/block/fdc: Fix CVE-2021-3507
From: Jon Maloy <jmaloy@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211118115733.4038610-1-philmd@redhat.com>
 <7153eadf-3c43-b62c-aaa1-919abf0634ca@redhat.com>
In-Reply-To: <7153eadf-3c43-b62c-aaa1-919abf0634ca@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jmaloy@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jmaloy@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/27/22 15:14, Jon Maloy wrote:
>
> On 11/18/21 06:57, Philippe Mathieu-Daudé wrote:
>> Trivial fix for CVE-2021-3507.
>>
>> Philippe Mathieu-Daudé (2):
>>    hw/block/fdc: Prevent end-of-track overrun (CVE-2021-3507)
>>    tests/qtest/fdc-test: Add a regression test for CVE-2021-3507
>>
>>   hw/block/fdc.c         |  8 ++++++++
>>   tests/qtest/fdc-test.c | 20 ++++++++++++++++++++
>>   2 files changed, 28 insertions(+)
>>
> Series
> Acked-by: Jon Maloy <jmaloy@redhat.com>

Philippe,
I hear from other sources that you earlier have qualified this one as 
"incomplete".
I am of course aware that this one, just like my own patch, is just a 
mitigation and not a complete correction of the erroneous calculation.
Or did you have anything else in mind?

Regards
///jon


