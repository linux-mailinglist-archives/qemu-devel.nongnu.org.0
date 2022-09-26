Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CB95EAC27
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 18:13:52 +0200 (CEST)
Received: from localhost ([::1]:55136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocqjv-0006u9-4A
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 12:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocqdn-0000pR-Ks
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:07:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocqdi-0003IL-K9
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664208444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UMjBcdeDnBlk3z00qmA+xjP6VMd4/uXFb215J6x/Jbg=;
 b=NX/1EJmAQUVu0qBT9wFGmUGb8ru2GL+F7MDj3zVdUBAJxBqx8r0HbcAADErwBxCvFlIrLF
 FKExZ8Hy23v7+p1keZB9OCadl6sEhORSRAw2/cyiZjTf9kF9LtVBfd1DxCZkr1dKlnMb0+
 /r9QOQHiYgWaF/gNYVjpXuZPB3LVz/A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-qj-adP-XN3GU0JrhKouIfw-1; Mon, 26 Sep 2022 12:07:23 -0400
X-MC-Unique: qj-adP-XN3GU0JrhKouIfw-1
Received: by mail-wm1-f72.google.com with SMTP id
 p9-20020a05600c23c900b003b48dc0cef1so2049317wmb.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 09:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=UMjBcdeDnBlk3z00qmA+xjP6VMd4/uXFb215J6x/Jbg=;
 b=y7+4xsJzeipKkBncfajI1w++irybUNG5SsNb8TvYU7oFD11Ctqr20ZfbGtSNJHRI08
 z6ShM/L+D2ioihCtYGveao0IPUB2Q/lgd04kApgD3ly/INjN3JwaG8tBNs57OlSESm5U
 EYQEbwpPUZ2zHA+++3N/uiU8qHsi+brVbGINCn1u+rD2bzjXjK+jKpccfPmzi8iYiALf
 icIDofBcu4LoDwEXjqN0HwLDSp5th+1E7W79Q26Abc+Ig7SQV3QMnpYi8vzSRwvmLrzY
 MInZOBgrrNxw2NJN1KpR2x9C6XQmS06XE02pUMumdZ1l2MIvnAJAMWV6U8TbKw5RMbu/
 by8A==
X-Gm-Message-State: ACrzQf3/hQ83t83kIwXLMZPkF9WkghEsxGsqykjIeaGNoBLWtblKxet7
 IiduHV3mIVmTCQsjvrE5SHE32JBv+xzU2b4nPXxm/l8qo1nyAml4b0N2rDcTr6XSb4+7b4acetP
 mpc2vssiqx/uvZWU=
X-Received: by 2002:a05:600c:510b:b0:3b5:4a6:9a32 with SMTP id
 o11-20020a05600c510b00b003b504a69a32mr14655848wms.81.1664208442546; 
 Mon, 26 Sep 2022 09:07:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6E0/TCjUjohgfjDu0P6RPwjWs/o+BZuMgHL+nh6nTzTe8Y8ra6pGpH9FDJUSGJXfh+S2tCBA==
X-Received: by 2002:a05:600c:510b:b0:3b5:4a6:9a32 with SMTP id
 o11-20020a05600c510b00b003b504a69a32mr14655823wms.81.1664208442332; 
 Mon, 26 Sep 2022 09:07:22 -0700 (PDT)
Received: from [192.168.8.103] (tmo-064-141.customers.d1-online.com.
 [80.187.64.141]) by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c35d200b003a5ffec0b91sm12299597wmq.30.2022.09.26.09.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 09:07:21 -0700 (PDT)
Message-ID: <fad48d57-d197-858a-39ad-3a1b489aa40d@redhat.com>
Date: Mon, 26 Sep 2022 18:07:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 32/54] tests/qtest: libqtest: Adapt global_qtest
 declaration for win32
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng
 <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-33-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220925113032.1949844-33-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 25/09/2022 13.30, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> Commit dd2107497275 ("tests/libqtest: Use libqtest-single.h in tests that require global_qtest")
> moved global_qtest to libqtest-single.h, by declaring global_qtest
> attribute to be common and weak.
> 
> This trick unfortunately does not work on Windows, and building
> qtest test cases results in multiple definition errors of the weak
> symbol global_qtest, as Windows PE does not have the concept of
> the so-called weak symbol like ELF in the *nix world.
> 
> However Windows does provide a trick to declare a variable to be
> a common symbol, via __declspec(selectany) [1]. It does not provide
> the "strong override weak" effect but we don't need it in our use
> case anyway. So let's use it for win32.
> 
> [1] https://docs.microsoft.com/en-us/cpp/cpp/selectany
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Use __declspec(selectany) for the common weak symbol on Windows
> 
>   tests/qtest/libqtest-single.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/qtest/libqtest-single.h b/tests/qtest/libqtest-single.h
> index 4e7d0ae1dc..851724cbcb 100644
> --- a/tests/qtest/libqtest-single.h
> +++ b/tests/qtest/libqtest-single.h
> @@ -13,7 +13,11 @@
>   
>   #include "libqtest.h"
>   
> +#ifndef _WIN32
>   QTestState *global_qtest __attribute__((common, weak));
> +#else
> +__declspec(selectany) QTestState *global_qtest;
> +#endif
>   
>   /**
>    * qtest_start:

Good to know that it works also on Windows somehow!

Reviewed-by: Thomas Huth <thuth@redhat.com>


