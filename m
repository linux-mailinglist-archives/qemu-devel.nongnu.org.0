Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09EC6D90CF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 09:52:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkKON-0003Oc-Lp; Thu, 06 Apr 2023 03:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pkKOL-0003Nz-He
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 03:50:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pkKOK-0004qV-0K
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 03:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680767443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zfpt1hWlJeW+De1zXUq58qE//gZcupovgtklglmgOFw=;
 b=CdXSE1zlSnfXN4yIK3R51Ko5+6TVHy7MPmZ0n1rOtqgtpI7fuSvd26qbCSBnX2+GSlgQGy
 u+GF5W+niaczqLX1HnAM97kpQ3Zhg+qXdI/f3C0/owUDX6pyB5sB9xd55tFwFO0mVgv7m3
 Bb+GmJIlELW7gIjUyH30Qnf1Uo9vfXQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-33yQ9FZ1Pk6SgkOHkLUKmA-1; Thu, 06 Apr 2023 03:50:41 -0400
X-MC-Unique: 33yQ9FZ1Pk6SgkOHkLUKmA-1
Received: by mail-qv1-f71.google.com with SMTP id
 h7-20020a0cd807000000b005dd254e7babso17504947qvj.14
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 00:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680767441;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zfpt1hWlJeW+De1zXUq58qE//gZcupovgtklglmgOFw=;
 b=Y+23aIo037aPju9bqQ87+i4J2RD0ZDP9fX/x0j5pfhM523/gmDZbhwadQgNJp17Be7
 8FpEhxlUCheBgmbHQSAb5XTp5IRA/pm5jmS0hYWOhU7CnJjiKLp6dvw5QerbUspIJTWm
 mjkK3yHpQi4Eggx6kWSVGQRpb2yLSb1qra6vQjkDmqu4x5/5ALsf8cNHUm6L3HaAxSnU
 /LoHlYDZBguFV4b5HmK/yiOFFURyvpOFDfDf65BWsvTvrcp+rIq8mRa+eMOVrGynTRko
 C2ClS+wF9Pb0DpEqlKIVjJ/M5vDHEWsewr/0+oChcCUXVFBmYI+4Y7Dy4xmP1FAknBaO
 0gGA==
X-Gm-Message-State: AAQBX9f5e5PktJro0FZtvT8xDRQnmgZ8FcMC6DTrHvdugfns0+xdzpVe
 ZuQw/OefL2eX/Uue1NX+Hx6LPr1S+4Wa931cSAOUF8QZZEcK2te4QnBZfejccQT3KuCh6cvnJCR
 MSoEQOsm4wVuivjI=
X-Received: by 2002:a05:6214:19c3:b0:5a5:b269:bfd7 with SMTP id
 j3-20020a05621419c300b005a5b269bfd7mr3536296qvc.8.1680767441138; 
 Thu, 06 Apr 2023 00:50:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350aOTMeFA6L3L3kDCyW2m/d0fTHZIJmC7P+sa1stPv6snl6xCxTWIR0yTmfZxFMazbqwU1fSEQ==
X-Received: by 2002:a05:6214:19c3:b0:5a5:b269:bfd7 with SMTP id
 j3-20020a05621419c300b005a5b269bfd7mr3536276qvc.8.1680767440725; 
 Thu, 06 Apr 2023 00:50:40 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-193.web.vodafone.de.
 [109.43.178.193]) by smtp.gmail.com with ESMTPSA id
 65-20020a370c44000000b00746777fd176sm297041qkm.26.2023.04.06.00.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 00:50:40 -0700 (PDT)
Message-ID: <3cccc7e6-3a39-b3b4-feaf-85a3faa58570@redhat.com>
Date: Thu, 6 Apr 2023 09:50:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 10/10] hw/s390x: Rename pv.c -> pv-kvm.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-11-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230405160454.97436-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.355, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 05/04/2023 18.04, Philippe Mathieu-Daudé wrote:
> Protected Virtualization is specific to KVM.
> Rename the file as 'pv-kvm.c' to make this clearer.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/s390x/{pv.c => pv-kvm.c} | 0
>   hw/s390x/meson.build        | 2 +-
>   2 files changed, 1 insertion(+), 1 deletion(-)
>   rename hw/s390x/{pv.c => pv-kvm.c} (100%)
> 
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv-kvm.c
> similarity index 100%
> rename from hw/s390x/pv.c
> rename to hw/s390x/pv-kvm.c
> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
> index f291016fee..2f43b6c473 100644
> --- a/hw/s390x/meson.build
> +++ b/hw/s390x/meson.build
> @@ -22,7 +22,7 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
>     'tod-kvm.c',
>     's390-skeys-kvm.c',
>     's390-stattrib-kvm.c',
> -  'pv.c',
> +  'pv-kvm.c',
>     's390-pci-kvm.c',
>   ))
>   s390x_ss.add(when: 'CONFIG_TCG', if_true: files(

Hmmm, maybe we should rather move it to target/s390x/kvm/ instead?

Janosch, what's your opinion?

  Thomas


