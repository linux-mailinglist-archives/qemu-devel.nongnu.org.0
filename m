Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409BA39E800
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:04:02 +0200 (CEST)
Received: from localhost ([::1]:46764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLTd-0000YZ-BF
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqLSL-00088r-ON
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:02:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqLSK-0003aw-B4
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/xutDqlmGs1ex4yHTW2RXyvEpeYWmIy4tU368dstec4=;
 b=A+jKFao2C2noCnHXdRy16p8VD/p1iU/rZ/xDYNtXkafqZwaZok/x5q8SAY6Ku208B8GtNp
 TVgB8vGB3mxT9xILoSwvFa+rZ1X6otkM0rTpxKB4S1ndATmvN8y+O5CTCncjxhcSbyzzdp
 ++s9B/nvoO/34OEtdEDOEwB1tPOpzRg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590--0nyoUdtPU67yBu4jhS3cg-1; Mon, 07 Jun 2021 16:02:38 -0400
X-MC-Unique: -0nyoUdtPU67yBu4jhS3cg-1
Received: by mail-wr1-f70.google.com with SMTP id
 x9-20020a5d49090000b0290118d8746e06so8314176wrq.10
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 13:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/xutDqlmGs1ex4yHTW2RXyvEpeYWmIy4tU368dstec4=;
 b=KvfwtSQjDHNG7CUYXSywsdC5FbRbwF3WGuxHzd+Fpk3npUTuG64C66bMO7wKazz0RR
 9UzlB6okLc762nvQmpcl98vYplJ4KYmOeN5myBqFy0tUkCVfqYsMlCDP46ZCjUlAZGAj
 tO0/tMbpXrHF/HEkW0sCuTapwv92fu4Wh3etG1h17BeIuAzQSmeG5e/X7xgZi7Va9Qg5
 48oXJruHTOhwgeueLuP4fNon/bJbiIRilm4GA8mA+UN0b62fBFCaVBoTOz5PRg6R3ItG
 5CjysTYz3YG4Z8qp0TbU8jnvaTgFcv70yO68C1Vnqf7exnfWLTyoN+XiwZwwesikUUaD
 eyCA==
X-Gm-Message-State: AOAM531MmWobqfsb+E01RaUSzJ2U5OmplIhNUgeF6IYTrLWYHzPbwbb+
 y65vMJVvMs2Rrh7M0s+c7dWUuzLncozSxSON4WSVWk/a2T00qD7epbaPWauJlgEbPjz6xpVbdAk
 TIo2R81M2R4zUnTg=
X-Received: by 2002:a05:600c:5125:: with SMTP id
 o37mr684493wms.175.1623096157549; 
 Mon, 07 Jun 2021 13:02:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF0uOBm0maN8LNSJrTCVBps9bsdk4PVY9RPLMnVoZv33PUCyRJIAOFCRhcFeAfuQZrB98u5A==
X-Received: by 2002:a05:600c:5125:: with SMTP id
 o37mr684465wms.175.1623096157274; 
 Mon, 07 Jun 2021 13:02:37 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6188.dip0.t-ipconnect.de. [91.12.97.136])
 by smtp.gmail.com with ESMTPSA id
 b62sm15979942wmh.47.2021.06.07.13.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 13:02:36 -0700 (PDT)
Subject: Re: [PATCH v3 23/26] s390x/tcg: Implement VECTOR FP (MAXIMUM|MINIMUM)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210607110338.31058-1-david@redhat.com>
 <20210607110338.31058-24-david@redhat.com>
 <f8495083-ac37-1b5b-74a6-164d628cf1f2@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <98ecc2c3-0487-43e6-c5be-47907bc067a0@redhat.com>
Date: Mon, 7 Jun 2021 22:02:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f8495083-ac37-1b5b-74a6-164d628cf1f2@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.06.21 18:20, Richard Henderson wrote:
> On 6/7/21 4:03 AM, David Hildenbrand wrote:
>> +static S390MinMaxRes vfmin_res(uint16_t dcmask_a, uint16_t dcmask_b,
>> +                               S390MinMaxType type, float_status *s)
>> +{
>> +    const bool neg_a = dcmask_a & DCMASK_NEGATIVE;
> 
> Minor nits:
> Only used in the zero block.
> 
>> +    const bool nan_a = dcmask_a & DCMASK_NAN;
>> +    const bool nan_b = dcmask_b & DCMASK_NAN;
> 
> Only used in the nan block.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~
> 

Indeed, will move these into the blocks -- thanks!

-- 
Thanks,

David / dhildenb


