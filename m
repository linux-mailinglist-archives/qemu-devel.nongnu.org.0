Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9093C3738E1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:56:45 +0200 (CEST)
Received: from localhost ([::1]:47070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFCu-0002UG-Mr
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1leFBd-0001wd-Hk
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:55:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1leFBb-0000nA-VX
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620212123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+7PCOOsFSoGUOHpV6P0YNgSZRnExQlaAQKmSYmKPik=;
 b=bQM/xQrNoBMH+czckHdU5GPS58v1FR+7ieUSfExbV9IjpDJw2zVAWHQ23LnC2GgzzmyAJG
 +1s0MH6LA17Gch8ETjGAejctGbgpOSAtBRmCFGtH/+1Sx8jrLZzgdXkZiHBoBEKDkgMQix
 eOxskLYCSDVYMj+77If0HolJWPl52SI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-pbXtDMm8Obqyem4fvrtgDQ-1; Wed, 05 May 2021 06:55:21 -0400
X-MC-Unique: pbXtDMm8Obqyem4fvrtgDQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 n9-20020a1c40090000b02901401bf40f9dso1470703wma.0
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 03:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=S+7PCOOsFSoGUOHpV6P0YNgSZRnExQlaAQKmSYmKPik=;
 b=oXDp4K7hgj4m0zY5A7UMUP1sVsvMPsEyGpoy3TPQKnd3rjdDEh/JUuYreRgDy6P2YA
 Yl4L/38y2SpKwG8KGSw4xTdJadKDX4NqaeIIsKlEQ3rqpeJZQdIXCDgKoYA6m2GlzvkW
 39yBWFR3uYHfMWtZruglx7Ipbfxs/4e1NYGZEI5IuEQ/plUvtvkEoXClAcI5LNu7qTnj
 kRsGrYh1pRkgQ0VM0KZowFgVbtDk3HicX8gBJYcEpxEPKaRIRfw1UmzQsTvCdCp0sUQY
 z2KpFzr3uEU+U8fp+zTHXHdszhTo89PZ+wyE6D8l7hHcRhfemnU1eRkLwTDTRnPqFr5+
 6n3g==
X-Gm-Message-State: AOAM533jx6xTv3pSt/i0iWf0tryUC5F83DEXSfelVT7DxNeen9+89SQa
 n9CC7X3OAlhuQ1S/CRPWHmAxSG0tOa0F4p+R/014qAHZCWVxJd+dLuNWnB15vBTaz172DrkpUQi
 QTeV+O/Sirtoi3kY=
X-Received: by 2002:adf:9d88:: with SMTP id p8mr37092217wre.138.1620212120532; 
 Wed, 05 May 2021 03:55:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR6NlttxqIPPI7Xx1D4xRBUU56HyHd8RLvjWp8hPh/jN2/8gR+yTQ6AaHwxry0Y+cFFWx7ng==
X-Received: by 2002:adf:9d88:: with SMTP id p8mr37092181wre.138.1620212120266; 
 Wed, 05 May 2021 03:55:20 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c63bc.dip0.t-ipconnect.de. [91.12.99.188])
 by smtp.gmail.com with ESMTPSA id
 r2sm18643304wrt.79.2021.05.05.03.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 03:55:19 -0700 (PDT)
Subject: Re: [PATCH v1 00/20] s390x/tcg: Implement Vector enhancements
 facility and switch to z14
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20200930145523.71087-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <66f538df-2e8e-52af-7241-96aa0cc00024@redhat.com>
Date: Wed, 5 May 2021 12:55:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20200930145523.71087-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.09.20 16:55, David Hildenbrand wrote:
> This series adds support for the "Vector enhancements facility" and bumps
> the qemu CPU model tp to a stripped-down z14.
> 
> I yet have to find a way to get more test coverage - looks like some of
> the functions aren't used anywhere yet (e.g., VECTOR FP MAXIMUM), writing
> unit tests to cover all functions and cases is just nasty. But I might be
> wrong - I'm planning to at least test basic functionality of all new added
> instructions.
> 
> I have to make excessive use of c macros again to cover different element
> sizes (32/64/128bit). Any advise to clean things up are welcome.
> 
> This is based on:
>      "[PATCH v2 0/9] s390x/tcg: Implement some z14 facilities"
>      "[PATCH v2 00/10] softfloat: Implement float128_muladd"
> 
> Based-on: 20200928122717.30586-1-david@redhat.com
> Based-on: 20200925152047.709901-1-richard.henderson@linaro.org

Hi Richard,

I'll have a new series ready soonish. I did what you suggested and 
started generating random (valid) Vector FP instructions with (valid) 
random parameters, executed on randomly generated vectors. It's looking 
pretty good by now.

I'll still have to see to which degree I can address feedback on 
"softfloat: Implement float128_(min|minnum|minnummag|max|maxnum|maxnummag)"

Anyhow, I'd need your "softfloat: Implement float128_muladd" series -- 
any idea when you might get to continue working on that? Thanks!

-- 
Thanks,

David / dhildenb


