Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD7A5FB76D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 17:38:37 +0200 (CEST)
Received: from localhost ([::1]:39722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiHL1-0002aw-Kb
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 11:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oiH5c-0001He-70
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:22:40 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oiH5a-0001z1-Gv
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:22:39 -0400
Received: by mail-pl1-x634.google.com with SMTP id h10so13516792plb.2
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 08:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H21Nio4D2xn0RvfXYxXa/PUcol8n63P73+yyaGf437U=;
 b=iuRbfPeOBfszd1n0ONgHWaX5FsEggz9de5H404yoFgQ6veehM1sihh4ekroiQ4dXeh
 ECmCdqyntasMITc7JH89yJ9BXbPJpwV8iMH15bwEwlMDj1fPkmPlzb/NIUFeDtDeIDXh
 kNdnguV1AgQJ9ChOfPXUqVRBstBwH1OeNTxFgQYfXdCVh6JZ+/Fj6Qr5u4CK9Mvhx/R8
 UEw5pFMGik5ldUeIulalRLCt4eTwAh4vBSAz7YfyhyZFuWsiKnCEVumxw9kFeVa25pxK
 wOg+LKmDxCNuRPPHl1hEq4jjiiGEJODYixCYdwXl2cAHlBjQbG9c5I5CKhy/29foVEqZ
 BMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H21Nio4D2xn0RvfXYxXa/PUcol8n63P73+yyaGf437U=;
 b=0ac3gadqjqTqCdiv7GS8YtV3bTFQ0M6SuNJ0lXJ9AQ48aGmPBB2EinaME42s7toXXS
 KjQBr8Y5sQ6xZ+whfEoEfivqbkLRaEfYSo3AbBY/+WmMDx+U9cES6Ar0lQVmC5EuXa3b
 9v/Xr9P5jVqMWFX0cyHQpZIaTXuZdNCjnwpZLLGPoPi+Fxu6DsMHXSMzEcWVyuvKdBxz
 ugklTuUhXEBRPxpJyvPWC6J0ZoKSOMIMfBQzfRCmsRhlV+lofB02KoB1K33UczTiHEn8
 oTmumrd1FDTTVlVKNN1qRm+yFE+kKZNbnxsMwEH4GJCAlMcdahwE0TlJbF5xwO2fMfw1
 raoQ==
X-Gm-Message-State: ACrzQf1Qa7baGEj02HG5z4+jRctj+6QeoiD8SFKGTINHMQGZNTQrCQZN
 dnJ0emUKd9m4vup05Lpul51Jtw==
X-Google-Smtp-Source: AMsMyM7R67b2kprMTt7x7ehl96nSBL+sKbYVyNdo/8R2YjOZHWijiIPvfBmdnRXv7OmqjGKMUML4jA==
X-Received: by 2002:a17:902:b589:b0:179:f8c5:7212 with SMTP id
 a9-20020a170902b58900b00179f8c57212mr24833426pls.174.1665501756241; 
 Tue, 11 Oct 2022 08:22:36 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:67e1:640e:ccb8:1a4a?
 ([2602:47:d49d:ec01:67e1:640e:ccb8:1a4a])
 by smtp.gmail.com with ESMTPSA id
 x20-20020aa79ad4000000b00562a5f29ac1sm9184207pfp.100.2022.10.11.08.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 08:22:35 -0700 (PDT)
Message-ID: <05ed1f6a-0771-798c-408b-272fb57b4582@linaro.org>
Date: Tue, 11 Oct 2022 08:22:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH 1/6] qemu/bswap: Add const_le64()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, ira.weiny@intel.com
Cc: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org
References: <20221010222944.3923556-1-ira.weiny@intel.com>
 <20221010222944.3923556-2-ira.weiny@intel.com>
 <CAFEAcA9yVKWCZ-PhCbHqpaEW7Tgtqoo=wSQLy6=U5yfq2uVfPA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9yVKWCZ-PhCbHqpaEW7Tgtqoo=wSQLy6=U5yfq2uVfPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.934,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 10/11/22 02:48, Peter Maydell wrote:
>> +# define const_le64(_x) (_x)
>>   # define const_le32(_x) (_x)
>>   # define const_le16(_x) (_x)
>>   #endif
> 
> This is kind of a weird API, because:
>   * it only exists for little-endian, not big-endian
>   * we use it in exactly two files (linux-user/elfload.c and
>     hw/input/virtio-input-hid.c)
> 
> which leaves me wondering if there's a better way of doing
> it that I'm missing. But maybe it's just that we never filled
> out the missing bits of the API surface because we haven't
> needed them yet. Richard ?

It's piecemeal because, as you note, very few places require a version of byte swapping 
that must be applicable to static data.  I certainly don't want to completely fill this 
out and have most of it remain unused.


r~


