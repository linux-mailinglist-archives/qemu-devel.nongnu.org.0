Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946DB4DAE4B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 11:33:30 +0100 (CET)
Received: from localhost ([::1]:43368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUQy9-0001H5-Ga
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 06:33:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUQtx-0006kd-A8
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 06:29:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUQtu-0004nB-Cv
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 06:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647426543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ZG73wxzWLfcdWLW67pCExjrwvhATcoBiJyt8lfU9V8=;
 b=AJV3EFp0R9uHiCpDKv+uEm52VgGWUcT29na+MvWenRxx3NE/pAawCFW82fDJnhYoSrBatx
 n0XZ5Nq6CQvvSWxRJ/tFoo/VDWQUjoXuZayUPynYXCNZUA4TITR9lBv5ZjmFl9BJiNDDup
 DEbqz9hor5iTxcxxfZwhNnCwvkn5RYY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-rttZFwfONuK5I3d0tm9__A-1; Wed, 16 Mar 2022 06:29:02 -0400
X-MC-Unique: rttZFwfONuK5I3d0tm9__A-1
Received: by mail-wr1-f72.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so394775wrg.19
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 03:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3ZG73wxzWLfcdWLW67pCExjrwvhATcoBiJyt8lfU9V8=;
 b=UGyGr+Xcq8RiGusa36Hu551HBPFCdzmhrkNWPAu3YX+X5E6HxKsso9iEOvuv6oxn/G
 TucXx+6GI1Vg3YyTKKcIgtfYDhTv64Qt65HJZayspJhO2Un9cFwE9ko+VayI4JII744Y
 HI4Ir38nn1V4yF30gtXEQQ0Hu+eTaHAph9r23YVSfUvhUpwJ9/fKY97Dash7XEsmRp8k
 orbIkfZ2jU0F8nJxENMMPoSZHKE1Tbj5xAbWZxyk5ckBny5TL+AQ2cj0xY7Xw1euhHhp
 8rjdLDqzQvJS946FfPqUrt17OScEiyG2iOuniZ2PAZARbP23G6JJvIO1G5zdIG3Qq8px
 4Oug==
X-Gm-Message-State: AOAM5337QRnfhpW2SyOV9ttffyPjEL8S0f6EbGKD9AheFEatg+y9gRvG
 1wT7eNeaYpmCxyiGNHzFPqFETlepI+K3EFiP1OkCRHOkJjjxHcQiq5A9D+xWtgmKm9aocJjD/Ug
 hwsPjsBkVVJKJS9g=
X-Received: by 2002:adf:efc6:0:b0:1f1:e397:44b with SMTP id
 i6-20020adfefc6000000b001f1e397044bmr23848639wrp.298.1647426541675; 
 Wed, 16 Mar 2022 03:29:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWc3yVEpZmzNiooTnfHTcTX/OjyOlZh11TgDwn9mo+DvgXsgZ+n28MBUHxJT6ufumaLGgdfA==
X-Received: by 2002:adf:efc6:0:b0:1f1:e397:44b with SMTP id
 i6-20020adfefc6000000b001f1e397044bmr23848591wrp.298.1647426541370; 
 Wed, 16 Mar 2022 03:29:01 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a5d5988000000b00203d5f1f3e4sm1366873wri.105.2022.03.16.03.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 03:29:00 -0700 (PDT)
Message-ID: <9c101703-6aff-4188-a56a-8114281f75f4@redhat.com>
Date: Wed, 16 Mar 2022 11:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 10/27] Replace config-time define HOST_WORDS_BIGENDIAN
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220316095308.2613651-1-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220316095308.2613651-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Peter Xu <peterx@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 "open list:virtio-blk" <qemu-block@nongnu.org>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Huacai Chen <chenhuacai@kernel.org>, Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 "open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/03/2022 10.53, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Replace a config-time define with a compile time condition
> define (compatible with clang and gcc) that must be declared prior to
> its usage. This avoids having a global configure time define, but also
> prevents from bad usage, if the config header wasn't included before.
> 
> This can help to make some code independent from qemu too.
> 
> gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
[...]
> @@ -188,7 +188,7 @@ CPU_CONVERT(le, 64, uint64_t)
>    * a compile-time constant if you pass in a constant.  So this can be
>    * used to initialize static variables.
>    */
> -#if defined(HOST_WORDS_BIGENDIAN)
> +#if HOST_BIG_ENDIAN
>   # define const_le32(_x)                          \
>       ((((_x) & 0x000000ffU) << 24) |              \
>        (((_x) & 0x0000ff00U) <<  8) |              \
> @@ -211,7 +211,7 @@ typedef union {
>   
>   typedef union {
>       float64 d;
> -#if defined(HOST_WORDS_BIGENDIAN)
> +#if HOST_BIG_ENDIAN
>       struct {
>           uint32_t upper;
>           uint32_t lower;
> @@ -235,7 +235,7 @@ typedef union {
>   
>   typedef union {
>       float128 q;
> -#if defined(HOST_WORDS_BIGENDIAN)
> +#if HOST_BIG_ENDIAN
>       struct {
>           uint32_t upmost;
>           uint32_t upper;
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index 0a5e67fb970e..7fdd88adb368 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -7,6 +7,8 @@
>   #ifndef COMPILER_H
>   #define COMPILER_H
>   
> +#define HOST_BIG_ENDIAN (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)

Why don't you do it this way instead:

#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
#define HOST_WORDS_BIGENDIAN 1
#endif

... that way you could avoid the churn in all the other files?

  Thomas


