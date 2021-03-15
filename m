Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C64A33AE3D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:12:43 +0100 (CET)
Received: from localhost ([::1]:49716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjHG-0005uD-EO
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLjFU-0005T2-Aa
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:10:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLjFM-0005J6-NZ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615799442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qAHkxS9nLgaUPXZZQiT0qgr4ulu70IhgXwjtlLuxKlU=;
 b=Cm00L+A1CbhUfyfdtmHsHCH/R1Vtt4PIDjP+w5NgR13kJIespYpFvddy+TiigFtcLR+h2b
 bHe7lcFP9x1jz9iwwskfdEfSNSATwCVgAMNtB2Udhmtr/L6TEEUk+uPjhf7WTFgal1DwjM
 +l/nO2NlOL11BQuOmE0BW3Zo16aaI2w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-u_kYgO4xNyi51FYGptvcuQ-1; Mon, 15 Mar 2021 05:10:40 -0400
X-MC-Unique: u_kYgO4xNyi51FYGptvcuQ-1
Received: by mail-wr1-f69.google.com with SMTP id p12so12220440wrn.18
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 02:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qAHkxS9nLgaUPXZZQiT0qgr4ulu70IhgXwjtlLuxKlU=;
 b=k4as2AW+ULQb5jh28OYzrZG+2dCIH85D0QdgMAIYem3fsBXu9xmnnmgjF2+w2e1lro
 yshaASd3cs/D5o4pcWpEOmmfyXTN+0BiICJ460MGDKe9AdqNo+mm0bDkjVAL4tVM8l8U
 r5n5RY633f6YkB8+1TaUVndeJwjcb4bgf52WPPfvZ/lJ7pcc1EfrE6roXWD/3k5hsdbc
 j0OSCTxzbfmXe5dKHB8BgLFQcSMsczuI+Y3mkssr9ct36nQhy7Ka4m6jVCcTabBbUV/Q
 owY6HNAu4QUVZCC7n133zWYNNSdPwsztaTYq3ikmFXDP5kF6MqQkdtPfHQdG2JjIkDVo
 R0eA==
X-Gm-Message-State: AOAM533sRNtGSQTwYq2KON7XBm6OYlJx5g3pL10sf9fU4bvlHDtlre8p
 09x0742DqBXU6idMQ/bOBLo9+9Y4+A5tclKc2OPSkn0p7CjhHzrdvh+RdgR5IszTD2N+yP6dnhm
 2Jc1/1NiVRYSjnBI=
X-Received: by 2002:adf:e74a:: with SMTP id c10mr27230932wrn.409.1615799439692; 
 Mon, 15 Mar 2021 02:10:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOFskJqDb97QQ+izfvbolfGjSu0wMSYsSVH8p97d+Cqaashafug0M3QU96s9iWtVn9X/439g==
X-Received: by 2002:adf:e74a:: with SMTP id c10mr27230912wrn.409.1615799439468; 
 Mon, 15 Mar 2021 02:10:39 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j16sm35246581wmi.2.2021.03.15.02.10.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 02:10:39 -0700 (PDT)
Subject: Re: [PATCH] utils: Use fma in qemu_strtosz
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210314234821.1954428-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0697b6d1-0a64-3d71-2f7f-3c52a005b77b@redhat.com>
Date: Mon, 15 Mar 2021 10:10:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210314234821.1954428-1-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 12:48 AM, Richard Henderson wrote:
> Use fma to simulatneously scale and round up fraction.

"simultaneously"

> The libm function will always return a properly rounded double precision
> value, which will eliminate any extra precision the x87 co-processor may
> give us, which will keep the output predictable vs other hosts.
> 
> Adding DBL_EPSILON while scaling should help with fractions like
> 12.345, where the closest representable number is actually 12.3449*.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  util/cutils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/cutils.c b/util/cutils.c
> index d89a40a8c3..f7f8e48a68 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -342,7 +342,7 @@ static int do_strtosz(const char *nptr, const char **end,
>      if (val > (UINT64_MAX - ((uint64_t) (fraction * mul))) / mul) {

Shouldn't we use fma() here too? ^^^^^^^^^^^^^^^^^^^^^^^^^^

>          retval = -ERANGE;
>          goto out;
>      }
> -    *result = val * mul + (uint64_t) (fraction * mul);
> +    *result = val * mul + (uint64_t)fma(fraction, mul, DBL_EPSILON);
>      retval = 0;
>  
>  out:
> 


