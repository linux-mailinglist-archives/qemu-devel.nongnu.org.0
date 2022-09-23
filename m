Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D3F5E76DB
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 11:24:53 +0200 (CEST)
Received: from localhost ([::1]:54348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obevU-0001ab-Ix
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 05:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obecI-0002a9-Ia
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 05:05:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obecG-0004q2-RF
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 05:05:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663923894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P113dUnmBNcW1h/LbSN17jo5EC/bcD+PMO654jIvy4g=;
 b=ONfQitPoBtQRBcN8SbOlEY2Rd14hxTZxdYeGr8UEI7xQ/ifS4NVjd1c0Yn1RN7BMEjzAFD
 L9AVhuLTERtbnbXFKOILvsLoYXA6E74YYQdbhVf7a/jaPDTxdz0PFJihQKWF4JAhQZOkdt
 U4vmA9xKoTEZPDGUQ0d8LqcqyqM+ex4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-452-fhgwet3KPH-HTLLlZ1SOxA-1; Fri, 23 Sep 2022 05:04:53 -0400
X-MC-Unique: fhgwet3KPH-HTLLlZ1SOxA-1
Received: by mail-wm1-f69.google.com with SMTP id
 y15-20020a1c4b0f000000b003b47578405aso1607274wma.5
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 02:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=P113dUnmBNcW1h/LbSN17jo5EC/bcD+PMO654jIvy4g=;
 b=R9CU6NfXLshh+JN9RKwOdfN2qFXGrRpIOjKK4e5rGCfo5O8B7+TG7OWWjajGE70wF/
 lRtemFa5RhyiKwEq8v+G2WzlIgjvkfMgvbIsTbEpDPkRe+Cy+Me7uOTwSQEfrFnADeuq
 EVKjsF0EA0pe6WDSyBWUDRI/k8ScGrDaD3S6E5oQWQEHy6lTsXmeXGb1lzLu+UwN6dE8
 llEDa2mUoz/kDKLAbHmjpTxcCPeyVSHIUgS+8PRCgOlifyxvUOjlK91Z5Ott+NlG6b6W
 ybDwyvooecaAJ4DkZMEUTWSv0dYPHjo3bpHkkTqRTeQ99Ju7lh3IOEbMjBCHASgFmvLt
 Flfg==
X-Gm-Message-State: ACrzQf1QVuRStdmgMXPx9I9ywl6CZxeePxuIV73T3Fe17wV2aTRzYPky
 KgdY0Q95OAizHt6BiWe0BD61uUEyDeCETIVw1frDa/WiCcR02ddO/wk0Dw8jmbeepe7tKBPgja6
 ngyWEEMFhwAju2Kk=
X-Received: by 2002:adf:fb8d:0:b0:225:4d57:17a6 with SMTP id
 a13-20020adffb8d000000b002254d5717a6mr4521634wrr.251.1663923892242; 
 Fri, 23 Sep 2022 02:04:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6jZ8McGdTLHNES5pBdYamv7kiEgZlwXZu4Mo4RgaybyczPgAE++EcDY5AgiCLhzGcMLRt3VQ==
X-Received: by 2002:adf:fb8d:0:b0:225:4d57:17a6 with SMTP id
 a13-20020adffb8d000000b002254d5717a6mr4521622wrr.251.1663923892059; 
 Fri, 23 Sep 2022 02:04:52 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-37.web.vodafone.de.
 [109.43.179.37]) by smtp.gmail.com with ESMTPSA id
 t25-20020a7bc3d9000000b003b47575d304sm2225815wmj.32.2022.09.23.02.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 02:04:51 -0700 (PDT)
Message-ID: <95d924c5-c55a-3514-2e35-a2b1074ee198@redhat.com>
Date: Fri, 23 Sep 2022 11:04:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] linux-user/host/s390: Add vector instructions to
 host_signal_write()
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>, 
 Richard Henderson <richard.henderson@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220920113907.334144-1-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220920113907.334144-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 20/09/2022 13.39, Ilya Leoshkevich wrote:
> The new noexec test fails on s390x with "unexpected SEGV". This test
> overwrites code using libc's memcpy(), which uses VSTL instruction.
> host_signal_write() does not recognize it, which causes SEGV to be
> incorrectly forwarded to the test.
> 
> Add all vector instructions that write to memory to
> host_signal_write().
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Fixes: ab12c95d3f19 ("target/s390x: Make translator stop before the end of a page")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   linux-user/include/host/s390/host-signal.h | 25 ++++++++++++++++++++++
>   1 file changed, 25 insertions(+)

Thanks, this fixes the segfault for me, indeed!

Tested-by: Thomas Huth <thuth@redhat.com>


