Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE649318CFB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:11:28 +0100 (CET)
Received: from localhost ([::1]:60932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACgp-0001VK-Tt
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:11:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lACO1-00066c-A6
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 08:52:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lACNt-0004up-83
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 08:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613051511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SHpeAii8YHconR4YP1GN3xC/KmwIPZwCz4BbMxa8vXo=;
 b=AXhEKFnf+JpOSJqRlel7cY3qr7XKUcs+pfsdnbfwQTgABEmNcrh18rRIOvDY9iLfIKCAME
 IXx4Ow1DzWk/BwgTJ725KMz1b8EfgsYgPamdoXaCeFDkMsUqYHuydxtYvd0aaEhKeheblv
 DLD6xd4Y2iFJKT/5q2PIMVfO0LtutJQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-s6UXojT5MWapdxHdqDwlpw-1; Thu, 11 Feb 2021 08:51:46 -0500
X-MC-Unique: s6UXojT5MWapdxHdqDwlpw-1
Received: by mail-ed1-f71.google.com with SMTP id bo11so4676242edb.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 05:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SHpeAii8YHconR4YP1GN3xC/KmwIPZwCz4BbMxa8vXo=;
 b=VVUmL2phGTLMyy+sCjYreiXhQC2H4bSWXdk26FbPUB6efs5PGg7NGSEzaR2rKt8HA3
 20UcTVTRdAIZD45o6+fWZiuXJ3aeEeh+TZQEZqIeINLsXJ27i0J4xNtP3PNs8x6tF5UK
 lIhN3jAgD8dMgV3ERRI8u2FOTI/ZCln8Q6amYpidyrSQOEU8pHVZmADWeC6R2mN3fM8p
 6egXZ6nLunmJYuFV7ESoR8OEe4KCiAPcVPdaWou1nvNW1JBZGRwIhv6q+0rSgDbp9cwJ
 UX8MpB1CyWuWzOMYzZf/NQmBkhRAxrz8punyqRbHkAnUlxOWHy7YmE00ZRLr4GsJjK6V
 9LCw==
X-Gm-Message-State: AOAM532M2Orwb+B5QywY4Yv3J2UKZtLD57pch3Odf/P5erh2LZtMZ/Bt
 sIle00WxTdjhDgciFQyDDBCl4GS68zPwlMfmhkSX5RY3nQjBfukgsZSBmALycdajqP+B3nDSwLo
 qPQ+ruLgJK6t8Yrk=
X-Received: by 2002:a05:6402:1d39:: with SMTP id
 dh25mr8351140edb.142.1613051505490; 
 Thu, 11 Feb 2021 05:51:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxi0VCjv2aDIAe1/GlQhRLD74rqHNSkEuP4PmetgkeQtiDtTWOmlIrWGX2OcvgcgExRlLwjkQ==
X-Received: by 2002:a05:6402:1d39:: with SMTP id
 dh25mr8351130edb.142.1613051505341; 
 Thu, 11 Feb 2021 05:51:45 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id zk6sm4404388ejb.119.2021.02.11.05.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 05:51:44 -0800 (PST)
Subject: Re: [PULL 13/45] exec: Use uintptr_t in cpu_ldst.h
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
 <20210211125900.22777-14-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c53d5ef8-7299-fa6d-3ea7-f793403b3e75@redhat.com>
Date: Thu, 11 Feb 2021 14:51:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211125900.22777-14-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 2/11/21 1:58 PM, Peter Maydell wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> This is more descriptive than 'unsigned long'.
> No functional change, since these match on all linux+bsd hosts.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-id: 20210210000223.884088-5-richard.henderson@linaro.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I reviewed this (and following) patch in v4:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg778419.html
https://www.mail-archive.com/qemu-devel@nongnu.org/msg778412.html

No worries, not a big deal, just to mention there might be some
issue in your tooling.

Phil.


