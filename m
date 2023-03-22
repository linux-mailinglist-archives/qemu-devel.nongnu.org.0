Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ACC6C492D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 12:31:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pewfs-000614-KF; Wed, 22 Mar 2023 07:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pewfp-0005tw-H5
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:30:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pewfn-0007gV-LQ
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679484630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnTsaQa2o7rMYyBD15PYSfzs14xkp2ngduIqc1prexk=;
 b=GweJ1Tiv+ve+5U/VKXldgRtwOAc9bValNHNgPV6zcyO0xKB8o88PXmR/wGSHv6HU0a4djc
 fbdDeRG3uB4uFz6LQxtcHLarKKOInpkjoyrg5dUFjDdyCiiqsg9onTrJ5SdXxXcBMrqLpV
 Kfz2cAB4jGB7Nfpc+3JQbOZie6+Q5J0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-eA6lx3FTOSCqAacP37ZqtQ-1; Wed, 22 Mar 2023 07:30:29 -0400
X-MC-Unique: eA6lx3FTOSCqAacP37ZqtQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 i24-20020ac84f58000000b003bfe3358691so10618031qtw.21
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 04:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679484629;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xnTsaQa2o7rMYyBD15PYSfzs14xkp2ngduIqc1prexk=;
 b=aRHTShIOWyI3zt8dXMcFVOCn4P5gxU+y+sisql3r4P0Nbt7lz2mMWtKh8Z15FcMcSE
 kLQZopmhryiGGtcjrfdi8waAn9HcmUYODT9LGTOIIMMTVvhbZcMg1vt2ERxQLUMGU8Qa
 6nKHvVWwZiVCccMuyzxXg3xeWhkimSx4IxCRFGoAHIbNWZasul1SLVpkI1dECNtA9OGV
 IKOqlRHdy+n+13SUpQo+5PJxQBn+GalE+nuID1zUwaiXqQxTZ9RJ5jQ0aBm24mnoZh0D
 OrxLmeNCXdkwkF3tXvkXQiTFPoA/mWdBfsxPf26wIFGWVAmsqFBYV3MdTXYEGdE3lAtj
 lSRQ==
X-Gm-Message-State: AO0yUKVhSQKMn3H+4lqCUDWMzz2th+RcUe5m2Et6T5V+1DT+CrklvBjX
 tntlM4P6a0TiXhVXUlt8Kqx191oHjYmKnsP9ZxxrEoAjeAN1j5Ns8rNBizjUIwHRt1hz3UEJd2Z
 iP6asWPRypklJVxs=
X-Received: by 2002:a05:622a:1491:b0:3d9:218a:3390 with SMTP id
 t17-20020a05622a149100b003d9218a3390mr5416318qtx.8.1679484628800; 
 Wed, 22 Mar 2023 04:30:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set/jHDewuEOf5q8dxkaDt4jgjmkoscoTkWeus/UaVg90yPLUqJ2AkZj2gsvuzmcgpqcxkdx48w==
X-Received: by 2002:a05:622a:1491:b0:3d9:218a:3390 with SMTP id
 t17-20020a05622a149100b003d9218a3390mr5416291qtx.8.1679484628554; 
 Wed, 22 Mar 2023 04:30:28 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-44.web.vodafone.de.
 [109.43.177.44]) by smtp.gmail.com with ESMTPSA id
 m4-20020ac866c4000000b003e30aec0b70sm4274388qtp.64.2023.03.22.04.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 04:30:28 -0700 (PDT)
Message-ID: <91fda177-fdb4-e3be-7cd7-e231c97a9300@redhat.com>
Date: Wed, 22 Mar 2023 12:30:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] cirrus.yml: Cover SPICE in the MSYS2 job
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Yonggang Luo <luoyonggang@gmail.com>, Jintao Yin <nicememory@gmail.com>,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20230322110521.59949-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230322110521.59949-1-philmd@linaro.org>
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

On 22/03/2023 12.05, Philippe Mathieu-Daudé wrote:
> Include the mingw-w64-x86_64-spice package so SPICE is covered:
> 
>    C compiler for the host machine: cc -m64 -mcx16 (gcc 12.2.0 "cc (Rev10, Built by MSYS2 project) 12.2.0")
>    ...
>    Run-time dependency spice-protocol found: YES 0.14.4
>    Run-time dependency spice-server found: YES 0.15.1
> 
> In particular this would have helped catching the build issue
> reported as https://gitlab.com/qemu-project/qemu/-/issues/1553:

Well, hardly anybody is looking at the output on cirrus-ci.com, so this 
patch here likely would not have prevented the merging of this bug... for 
that, you rather have to add it to .gitlab-ci.d/windows.yml instead.

But anyway, the patch here is still a good idea, too, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>


>    [1851/5253] Compiling C object libcommon.fa.p/ui_spice-core.c.obj
>    FAILED: libcommon.fa.p/ui_spice-core.c.obj
>    ../ui/spice-core.c: In function 'watch_remove':
>    ../ui/spice-core.c:152:5: error: implicit declaration of function 'qemu_close_to_socket' [-Werror=implicit-function-declaration]
>    152 |     qemu_close_to_socket(watch->fd);
>        |     ^~~~~~~~~~~~~~~~~~~~
>    ../ui/spice-core.c:152:5: error: nested extern declaration of 'qemu_close_to_socket' [-Werror=nested-externs]
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> See https://cirrus-ci.com/task/6189732569284608?logs=main#L891
> 
> Based-on: <20230322075256.2043812-1-marcandre.lureau@redhat.com>
> ---
>   .cirrus.yml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 5fb00da73d..eb1640814d 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -41,6 +41,7 @@ windows_msys2_task:
>         mingw-w64-x86_64-curl
>         mingw-w64-x86_64-gnutls
>         mingw-w64-x86_64-libnfs
> +      mingw-w64-x86_64-spice
>       "
>       CHERE_INVOKING: 1
>     msys2_cache:


