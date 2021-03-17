Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389E333EFD8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 12:54:17 +0100 (CET)
Received: from localhost ([::1]:54360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMUki-0000x1-9j
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 07:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMUjg-0000WV-Ay
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:53:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMUje-00022R-0Q
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615981988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YYTTx7kAOiJGFP6nG+vmCbHbIIyS4lTNIizdzpM+cvU=;
 b=gIv/Px+hOG8kGn5tTEH8D+ARlTkaBwMJCYmHdTj/anK8GqItmS8Oj9kV/m1IVYS1gs1ECA
 fv9AOjXTzbzV6/jobojfrrSZyA7L4Jx3QfxzSkBVPsKAyOzCBPw6iCreXlaylqpJfyDyiB
 ghOXO79TS2uTThjjref2I/fSZPPhZ5Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-pClucwtnNBmUt32jgdWR1w-1; Wed, 17 Mar 2021 07:53:07 -0400
X-MC-Unique: pClucwtnNBmUt32jgdWR1w-1
Received: by mail-wr1-f71.google.com with SMTP id m9so18317919wrx.6
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 04:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YYTTx7kAOiJGFP6nG+vmCbHbIIyS4lTNIizdzpM+cvU=;
 b=R4xJNTawRdZtD9cPe70+SApqk92yfNNIZMntzOCbDZS1xJM3eycUNPBEbdBJ64PnK4
 ziy+SvEQHz/5yhunSFMt3ysavVDLPs2GnwjxIVPHPu0Bg8qHeM5fmydYQsHM0v1IFz8Y
 WpZ+2pgzqUkWl4ubB4ZtU5tKU3mE9+xdA+bZOGWTXESuMggw12mlYip39IodKmpDufO4
 CqxuR2Eoghyet5ek2U4YllxsTJU24zCtqhS7/VJDM9QcIlb8E/Ej2CnVdACitWXu2nJI
 EAwhYoBwAaHFoB3sclZr1LbH8JfB/pVgwHWwpNuZ49MHY/tqGz4hLG5U9GHb/j16S5yW
 mxMA==
X-Gm-Message-State: AOAM532eZ/6qtjRclPg0o3R8HNumn7411lbtqO0Qrux9RLb1fAbunU8N
 gkwSpKURPn2T0CaXE6CuyK/SA41S5JZuRANV5G4jyqnwxaFHZxLj3PhTMgsBfJ6V15nsi37zuS1
 D2KrM7ZbqNG+kHp4sGmL26QvOEPOWX27JuFV3zcRwZRQpMJy47Eu1EPZwANhvq8G8
X-Received: by 2002:adf:e391:: with SMTP id e17mr4011164wrm.285.1615981985704; 
 Wed, 17 Mar 2021 04:53:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxeMVMbxrPutw0zW8F6CvOkoMq6vYEjrc2YDL8i1q/QeVaWIiCf/+Gi8WdX/kwltGrhnMCMg==
X-Received: by 2002:adf:e391:: with SMTP id e17mr4011133wrm.285.1615981985414; 
 Wed, 17 Mar 2021 04:53:05 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id m17sm25844107wrx.92.2021.03.17.04.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 04:53:05 -0700 (PDT)
Subject: Re: [PULL v2 01/15] utils: Use fixed-point arithmetic in qemu_strtosz
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20210317072216.16316-1-alex.bennee@linaro.org>
 <20210317072216.16316-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a6e34081-89bd-2af1-fa0d-72a8fc8daa04@redhat.com>
Date: Wed, 17 Mar 2021 12:53:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317072216.16316-2-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 3/17/21 8:22 AM, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Once we've parsed the fractional value, extract it into an integral
> 64-bit fraction.  Perform the scaling with integer arithmetic, and
> simplify the overflow detection.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210315185117.1986240-2-richard.henderson@linaro.org>

Something is odd with your tooling, the '---' separator is missing.

The covers' tag is OK although.

> 
> diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
> index bad3a60993..e025b54c05 100644
> --- a/tests/unit/test-cutils.c
> +++ b/tests/unit/test-cutils.c
> @@ -2128,7 +2128,7 @@ static void test_qemu_strtosz_float(void)
>      str = "12.345M";
>      err = qemu_strtosz(str, &endptr, &res);
>      g_assert_cmpint(err, ==, 0);
> -    g_assert_cmpint(res, ==, (uint64_t) (12.345 * MiB));
> +    g_assert_cmpint(res, ==, (uint64_t) (12.345 * MiB + 0.5));
>      g_assert(endptr == str + 7);
>  }


