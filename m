Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010B464D950
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 11:13:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5lE8-0006QO-GQ; Thu, 15 Dec 2022 05:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5lE1-0006Q2-8v
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 05:12:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5lDz-0005rt-Eu
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 05:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671099141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KnMdY7tguRxveFjfw85oU9k4dw1/dC1aK2J9U+soPKc=;
 b=ZyepG5KOV++KPvoSKxzMoVTugVmm+d11SM2+cx2pQSdC8+f8RF7iPOL1xZ140CZobqF7Sd
 2Kz/DJVCz6vZNfJhPxITL0BLVjiM+z5UrvW6rtgmbM361+nd970dpPzesh+cVhXtnto0gs
 8NMdQi5MImsHByJVurMvxtigrgIaST0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-671-Q7a1-rlEPMyC_bg5J0de9w-1; Thu, 15 Dec 2022 05:12:18 -0500
X-MC-Unique: Q7a1-rlEPMyC_bg5J0de9w-1
Received: by mail-wm1-f69.google.com with SMTP id
 i132-20020a1c3b8a000000b003d0f49bc21bso939404wma.6
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 02:12:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KnMdY7tguRxveFjfw85oU9k4dw1/dC1aK2J9U+soPKc=;
 b=xGzsb2yOEHajI2whpznxx42vWEIjnbdPuL4TUyuAnIMZQAr7WR/q1KjYl0+sajHJys
 ZXfGrEMKn9f7yWYzp4ENsRYy9J9gkZhLVYirPhCBE2Zr/h8314qzFWQRbByyxwR51dT/
 jD0ibAG53erq7uO3T+XhHaNJfmzzEHjrw57aa0UzgiBjJeLK586DYbPpntOuhSNZeqxm
 yzmMGtOBHxYDzq4pvzZEDC86M/FLyVKeCK/E6hBNCRjiX94K7qzN25S9peMdd1ZrVRpL
 1Vyl+SbO82sScZp34qnyaT90afU2Q68TNsBUsTghiDEbP/mkDm9ixwPbLL9zdZICmhA2
 vDug==
X-Gm-Message-State: ANoB5pm3ddqrnKIHYSTHJA7lsSAc4Ta6C6I5OTB3d9gZultg9On4ommo
 aC12+nUcggpY/8idl9tlBA1vZtvSAp9m8QslhEQ/aVXP8aU1K99n5s803NPEtwvSNRa0BWhvYFe
 IKSWB4064ui2quP4=
X-Received: by 2002:a05:600c:3c90:b0:3cf:6f4d:c259 with SMTP id
 bg16-20020a05600c3c9000b003cf6f4dc259mr22337387wmb.39.1671099137504; 
 Thu, 15 Dec 2022 02:12:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7ur3eF7VseX+1i8oYt7/yyXT9OEEHw/FR+aLwIy2V4/9t5KEh10dr+FI6eLDDFfqsm2ceOjg==
X-Received: by 2002:a05:600c:3c90:b0:3cf:6f4d:c259 with SMTP id
 bg16-20020a05600c3c9000b003cf6f4dc259mr22337371wmb.39.1671099137322; 
 Thu, 15 Dec 2022 02:12:17 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a05600c491800b003c6bbe910fdsm6302711wmp.9.2022.12.15.02.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 02:12:16 -0800 (PST)
Message-ID: <aaf97e80-1f1d-7a3a-ab08-0fc1aabc2c72@redhat.com>
Date: Thu, 15 Dec 2022 11:12:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH-for-8.0] tests/vm: Update get_default_jobs() to work on
 non-x86_64 non-KVM hosts
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>
References: <20221209164743.70836-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221209164743.70836-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09/12/2022 17.47, Philippe Mathieu-Daudé wrote:
> On non-x86_64 host, if KVM is not available we get:
> 
>    Traceback (most recent call last):
>      File "tests/vm/basevm.py", line 634, in main
>        vm = vmcls(args, config=config)
>      File "tests/vm/basevm.py", line 104, in __init__
>        mem = max(4, args.jobs)
>    TypeError: '>' not supported between instances of 'NoneType' and 'int'
> 
> Fix by always returning a -- not ideal but safe -- '1' value.
> 
> Fixes: b09539444a ("tests/vm: allow us to take advantage of MTTCG")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/vm/basevm.py | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
> index 2276364c42..23229e23d1 100644
> --- a/tests/vm/basevm.py
> +++ b/tests/vm/basevm.py
> @@ -569,8 +569,7 @@ def get_default_jobs():
>                   # more cores. but only up to a reasonable limit. User
>                   # can always override these limits with --jobs.
>                   return min(multiprocessing.cpu_count() // 2, 8)
> -        else:
> -            return 1
> +        return 1
>   
>       parser = argparse.ArgumentParser(
>           formatter_class=argparse.ArgumentDefaultsHelpFormatter,

Reviewed-by: Thomas Huth <thuth@redhat.com>


