Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ED22BB092
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:30:50 +0100 (CET)
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9JA-0004eE-Vo
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:30:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg99l-0001o4-5O
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:21:05 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg99j-0005aV-Dx
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:21:04 -0500
Received: by mail-wr1-x443.google.com with SMTP id c17so10555597wrc.11
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 08:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qqVSdaoa2t2ux725Ucw/DJ7DLyHpNKTEUGBbMeeZ+uc=;
 b=As9NCOV3l7x+J1nAxOjrTrGPACKqom5uEfKyIf10SWMraqy0eVCXBMatJyhJAVs4K+
 EJm8xCd3m2A4hoFGeqMdkMYQBrUhdJoVWMwNL2uiqZIJfs39aqyQeRVeKNoGljoPOnkD
 ays7LYwcCGjQVfqd778VOT3XsLrVGoepPrxkoXZ/uUHPEz+LPbSDqQtY9bRMsEH2a2aL
 MP9xBc5Fbnw+EOkrI/cwLSQjEsqhlGL0yWGlwn5XyML+DOGxsTaW1pDzlUyzUT5Xc1AS
 pc/Fth8C+MqLzQNe0H2cXHKDSE7Gk/pT/Jn9NQGx2YOywVeb1cHRguvSVfcsIOrzDrQp
 iYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qqVSdaoa2t2ux725Ucw/DJ7DLyHpNKTEUGBbMeeZ+uc=;
 b=jf786xWjhVYeipZEuB+4CNLe3V2zf62glMNydOf/7rTKFCFk2xAKWZWXRhz5dKqGXW
 kofwu0tuUK9tij7o4HAgfkZ+qS1r/Y5VDgN/qk/bBQQwocb6T70BAtnBe31Jb9Pl0Z5s
 5j1l5/UkaTM2GwhBc7QBvNuIZ3bvGVbAxArKiy6NpVIvvG+wfr0pF8Bpe/qu3pOZ7xzA
 7fvDHHNF+cyqNQmg8eC7sFP9SaeVM9z7r+7smb3HbY/tnwt9UWSb7jNOsOQ/nvW4WEjZ
 3jmt3i8l2wmPavhJpwW44vq+gdRoaOd7LJGKXVvEM4ieW03adt4xyZZZv014d8IzhTdn
 rHjg==
X-Gm-Message-State: AOAM530vuadSMufpp8DezpwayGq6PkbAclve39QXkRF4+65wW6dNkHRm
 LZ37iaHUD4s+8AqY/KxZKO8/Id+mz+U=
X-Google-Smtp-Source: ABdhPJxCioSJ32sJqdQLJz2r34LvaKmIMhxWUTodvk5na0/IZMB5bsgeY3ob4UjBwK8XyjOT5nOM1w==
X-Received: by 2002:a5d:694f:: with SMTP id r15mr16602729wrw.165.1605889261721; 
 Fri, 20 Nov 2020 08:21:01 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id k20sm4928850wmi.15.2020.11.20.08.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 08:21:01 -0800 (PST)
Subject: Re: [PATCH v5 7/7] block: check availablity for preadv/pwritev on mac
To: Joelle van Dyne <j@getutm.app>
References: <20201108232425.1705-1-j@getutm.app>
 <20201108232425.1705-8-j@getutm.app>
 <abb6c2d9-d375-1963-e0a0-627636643860@amsat.org>
 <CA+E+eSC0hj=hOhpLForn9KQw39-ZcOMRRG-D__iYDneqDOcZ3g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1a1dab52-fb82-64e7-0067-7957aae37281@amsat.org>
Date: Fri, 20 Nov 2020 17:20:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CA+E+eSC0hj=hOhpLForn9KQw39-ZcOMRRG-D__iYDneqDOcZ3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 4:49 PM, Joelle van Dyne wrote:
> No, because if you build on a macOS 11 host but try to run it on macOS
> 10.15 then it will crash.

I'm not asking to move the check to configure/build time,
but to do it only once at runtime...

> 
> -j
> 
> On Fri, Nov 20, 2020 at 4:32 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 11/9/20 12:24 AM, Joelle van Dyne wrote:
>>> macOS 11/iOS 14 added preadv/pwritev APIs. Due to weak linking, configure
>>> will succeed with CONFIG_PREADV even when targeting a lower OS version. We
>>> therefore need to check at run time if we can actually use these APIs.
>>>
>>> Signed-off-by: Joelle van Dyne <j@getutm.app>
>>> ---
>>>  block/file-posix.c | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/block/file-posix.c b/block/file-posix.c
>>> index d83219df55..a9d69746a0 100644
>>> --- a/block/file-posix.c
>>> +++ b/block/file-posix.c
>>> @@ -1394,12 +1394,24 @@ static bool preadv_present = true;
>>>  static ssize_t
>>>  qemu_preadv(int fd, const struct iovec *iov, int nr_iov, off_t offset)
>>>  {
>>> +#ifdef CONFIG_DARWIN /* preadv introduced in macOS 11 */
>>> +    if (!__builtin_available(macOS 11, iOS 14, watchOS 7, tvOS 14, *)) {
>>
>> Can we change the CONFIG_PREADV ifdef'ry to run this check once
>> on macOS 11?
>>
>>> +        preadv_present = false;
>>> +        return -ENOSYS;
>>> +    } else
>>> +#endif
>>>      return preadv(fd, iov, nr_iov, offset);
>>>  }
>>>
>>>  static ssize_t
>>>  qemu_pwritev(int fd, const struct iovec *iov, int nr_iov, off_t offset)
>>>  {
>>> +#ifdef CONFIG_DARWIN /* pwritev introduced in macOS 11 */
>>> +    if (!__builtin_available(macOS 11, iOS 14, watchOS 7, tvOS 14, *)) {
>>> +        preadv_present = false;
>>> +        return -ENOSYS;
>>> +    } else
>>> +#endif
>>>      return pwritev(fd, iov, nr_iov, offset);
>>>  }
>>>
>>>
>>
> 

