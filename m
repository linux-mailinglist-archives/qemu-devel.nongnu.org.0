Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C655EC737
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:06:15 +0200 (CEST)
Received: from localhost ([::1]:59612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCA2-0007vK-Eg
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odAjJ-0006Qp-UF
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:34:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odAjG-0007W2-TZ
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664285669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7QuIfy0ourmHiOwUCud+TGd8dspDUkjw9Zk7z+1eiAA=;
 b=XV12y/8J47X5Gptmk6OziDFQbePTz2ups9kxyXe2ieC+k8X+fV/X0BTaFG5kd5Fd+NRLfc
 gbKtZ2B0KIOTdCF6Q2M27VjRy+eoga0BDInwC8ePdqiYrXf2D+KucWvf4hqZrzdcTzkf8j
 hi6kbXzn1SS8T5+ahOEcfHRf03XD3vc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-102-V7SOXZ0ePbyWtn11Dc0kCA-1; Tue, 27 Sep 2022 09:34:28 -0400
X-MC-Unique: V7SOXZ0ePbyWtn11Dc0kCA-1
Received: by mail-wm1-f69.google.com with SMTP id
 t14-20020a1c770e000000b003b4856a6ecaso2775124wmi.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 06:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=7QuIfy0ourmHiOwUCud+TGd8dspDUkjw9Zk7z+1eiAA=;
 b=5TSbNPHJGhbj5p4WuSA5YYvzitwiBfhZWZz6BVvu3TEb/8IvVMSAN+9Zo8FcpmjXGL
 Ja/Xopc9GSbv6GyNg56IpEIRp7vAfWheGLo+YH1chnhUG6saVBebOUxFrKXoxbYW9YmB
 LEwO6O/3n16jDfzaYa6NbEKIIwSlemcOqTjbSL9MjYw56Qlgygeahq/kES0XnS1B46CO
 1bUmlXBhYTb2tsSrmaAIkwLKpm6j2B8xPNPEst/LYdYc6p9PATEjxaxqYdA6NyqwQfTO
 BAMkxRIrPP4LKy5ex2qIzUCYuXcr+ohsLmBfOgC6FpP1oattQMazD3xifbJXlBbXhZYt
 0y3Q==
X-Gm-Message-State: ACrzQf2OUfrfkau5A5iAzzPm8Mya4H8fUoqeF8Z/sQRWWl5+0r4ZDILZ
 oq7axMnz8ax8g6mEDT7e+AqXNkrTTH0rNBcjozOdW+QG/3H9UmHB0ATqk/qxF4KWwt8+MiltbcY
 /cUFa1h2ep2+B9ck=
X-Received: by 2002:a05:600c:6003:b0:3b5:aef:d8d7 with SMTP id
 az3-20020a05600c600300b003b50aefd8d7mr2758326wmb.50.1664285667411; 
 Tue, 27 Sep 2022 06:34:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5IUJFhAadMgMGJfoMPS3KQuAQ4V2C2/Qq6lXJnluDj/msDUQ+AIOrYjWvosGe4sZWzcX8IiQ==
X-Received: by 2002:a05:600c:6003:b0:3b5:aef:d8d7 with SMTP id
 az3-20020a05600c600300b003b50aefd8d7mr2758312wmb.50.1664285667232; 
 Tue, 27 Sep 2022 06:34:27 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-30.web.vodafone.de.
 [109.43.179.30]) by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b003a83ca67f73sm2000007wmb.3.2022.09.27.06.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 06:34:26 -0700 (PDT)
Message-ID: <6af0a22b-d6ce-5ed9-f938-b2ed109b639c@redhat.com>
Date: Tue, 27 Sep 2022 15:34:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 53/54] tests/qtest: Enable qtest build on Windows
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-54-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220927110632.1973965-54-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 27/09/2022 13.06, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Now that we have fixed various test case issues as seen when running
> on Windows, let's enable the qtest build on Windows.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Drop the host test
> 
> Changes in v2:
> - new patch: "tests/qtest: Enable qtest build on Windows"
> 
>   tests/qtest/meson.build | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 455f1bbb7e..8701c3a8e7 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -1,9 +1,3 @@
> -# All QTests for now are POSIX-only, but the dependencies are
> -# really in libqtest, not in the testcases themselves.
> -if not config_host.has_key('CONFIG_POSIX')
> -  subdir_done()
> -endif
> -
>   slow_qtests = {
>     'ahci-test' : 60,
>     'bios-tables-test' : 120,

Reviewed-by: Thomas Huth <thuth@redhat.com>


