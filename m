Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796264B8ED3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:08:01 +0100 (CET)
Received: from localhost ([::1]:44632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNma-0000vi-5J
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:08:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKN8Y-0003pk-HS
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 11:26:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKN8V-0001kF-BE
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 11:26:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645028794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dcPGgfoMcu0RQ4ibYM9fG7IkgtZ/NhmDBpyzd/EnPAw=;
 b=DXfRQ7rWtPdO8jOtYtWKFtdC7yY1RFis/uTm4sCUTUfS8uQuU0Dc392UvGjndbn5skUl/Y
 71BIytScO1jHZmue2VO0QrGM36sc8A+1zUDOZokWOvQyOEX+HEVfyQmXtz5CGEGLRldT1z
 5X1prvaTy0Wl3eQnCk1IW7unHeL/14Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-D5r9CNuZPP2RkGuUvvhfyQ-1; Wed, 16 Feb 2022 11:26:23 -0500
X-MC-Unique: D5r9CNuZPP2RkGuUvvhfyQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 d8-20020a05600c34c800b0037e3cd6225eso303196wmq.6
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 08:26:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=dcPGgfoMcu0RQ4ibYM9fG7IkgtZ/NhmDBpyzd/EnPAw=;
 b=4B2ocOVGPrKJpb3YT/1ElDZJlqlP676JGrxU3Qnfcb79N4wz00nvJFHlOEmmcN+tnt
 058kzhe3trMwGEoAJpivPyLqCstXYPQsbjS/FB4kjAut40YD65KJXFJ97874FwUb9gbg
 GLHrElg4OIUtn/k471gl2Tf6rKyrEoV+Pp08NAhjnQJ2d+lTb0wZGhUWy1bagxU64Zco
 3jeaDv84Y7bqDuFm9oPOMN1z3cwczo9w5Su8J2AOWeVrCEmRiVsBsy6ykeo8oGykDOvP
 wWOBGkLkcxu7IKn52y93JYLfeQu465lhBWZ80xXS/4biffTrWEss6oWICqPWub3disHy
 kClw==
X-Gm-Message-State: AOAM533Jlz5igevRm/SSNJ/qX7EWPdCfLIzENQ7q8goll1mgb4/29RFH
 kTTwWg1CQR6nWcGubgcwC4ImxB+ItMrOMcr3xihmc16OIJOqtCd3U08F4iwE4C60zq9eHDsOzds
 YfzjAiHuC9fPE0CA=
X-Received: by 2002:a5d:5887:0:b0:1d7:36e4:e40f with SMTP id
 n7-20020a5d5887000000b001d736e4e40fmr2990811wrf.298.1645028782195; 
 Wed, 16 Feb 2022 08:26:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSikIXUpjA64AhaCYLMHaLRWluSWDn29vlTdihC5Qw3eSTtjfs4Ejq8gGhu/XTVpMz5sq3cA==
X-Received: by 2002:a5d:5887:0:b0:1d7:36e4:e40f with SMTP id
 n7-20020a5d5887000000b001d736e4e40fmr2990796wrf.298.1645028781960; 
 Wed, 16 Feb 2022 08:26:21 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id i3sm38731734wrq.72.2022.02.16.08.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 08:26:21 -0800 (PST)
Message-ID: <2d597b24-2b00-3e4c-27ed-3265a38a48a6@redhat.com>
Date: Wed, 16 Feb 2022 17:26:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests/vm: Update haiku test vm to R1/Beta3
To: Alexander von Gluck IV <kallisti5@unixzen.com>, qemu-devel@nongnu.org
References: <20220216154208.2985103-1-kallisti5@unixzen.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220216154208.2985103-1-kallisti5@unixzen.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2022 16.42, Alexander von Gluck IV wrote:
> ---
>   tests/vm/haiku.x86_64 | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/vm/haiku.x86_64 b/tests/vm/haiku.x86_64
> index 2eb736dae1..936f7d2ae2 100755
> --- a/tests/vm/haiku.x86_64
> +++ b/tests/vm/haiku.x86_64
> @@ -2,7 +2,7 @@
>   #
>   # Haiku VM image
>   #
> -# Copyright 2020 Haiku, Inc.
> +# Copyright 2020-2022 Haiku, Inc.
>   #
>   # Authors:
>   #  Alexander von Gluck IV <kallisti5@unixzen.com>
> @@ -48,8 +48,8 @@ class HaikuVM(basevm.BaseVM):
>       name = "haiku"
>       arch = "x86_64"
>   
> -    link = "https://app.vagrantup.com/haiku-os/boxes/r1beta2-x86_64/versions/20200702/providers/libvirt.box"
> -    csum = "41c38b316e0cbdbc66b5dbaf3612b866700a4f35807cb1eb266a5bf83e9e68d5"
> +    link = "https://app.vagrantup.com/haiku-os/boxes/r1beta3-x86_64/versions/20220216/providers/libvirt.box"
> +    csum = "e67d4aacbcc687013d5cc91990ddd86cc5d70a5d28432ae2691944f8ce5d5041"
>   
>       poweroff = "shutdown"
>   
> @@ -99,7 +99,7 @@ class HaikuVM(basevm.BaseVM):
>   
>           self.print_step("Extracting disk image")
>   
> -        subprocess.check_call(["tar", "xzf", tarball, "./box.img", "-O"],
> +        subprocess.check_call(["tar", "xzf", tarball, "box.img", "-O"],
>                                 stdout=open(img, 'wb'))
>   
>           self.print_step("Preparing disk image")

Thank you very much for the quick fix, that indeed helps to compile-test 
Haiku again! (the unit tests are failing, though, but IIRC that was already 
the case before)

Tested-by: Thomas Huth <thuth@redhat.com>



