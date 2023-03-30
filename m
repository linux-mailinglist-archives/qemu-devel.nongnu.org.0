Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6996D0312
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 13:25:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phqOo-0005Dv-N4; Thu, 30 Mar 2023 07:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phqOn-0005Dc-0F
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:24:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phqOj-0006Qc-JM
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680175492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vVxE0YiY/pJew7u8XEESvw0oEQlcYwd5unRe6Vwv8Jo=;
 b=C+cQUQesDjMK0v9wMzpk/sSS7rwdpiNQ24M46DFYybyGfJYYpFI5Lw3qTijNgs6iv7uVTH
 lYtj1BEV2KbMl56545qwOwoS4mIESAgB9QIeold0ifhIe+uSiqnVImfsPXQCt+PIc8fAV2
 Ef/PDH67ql3fb1DGZcS93zt0+VjL7v8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-JitXVb07PX-rYaHNCRK_IA-1; Thu, 30 Mar 2023 07:24:51 -0400
X-MC-Unique: JitXVb07PX-rYaHNCRK_IA-1
Received: by mail-qv1-f71.google.com with SMTP id
 w2-20020a0cc242000000b00583d8e55181so8058045qvh.23
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 04:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680175491;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vVxE0YiY/pJew7u8XEESvw0oEQlcYwd5unRe6Vwv8Jo=;
 b=1nyyvdIi9TCCYg79GJlYfQWQqx5bPlqjnHN8W83kSNkc1I3MdzsWaLp1GcD2wr9HYm
 zdPnnrQrSucF6ntgZHaEbt0tp7tL2jvG4pODnL6OE+opgqzWETcUrKBDvqemnH1AIxMU
 Gqj2j1Xvf5zkwDHs1hoAfS9dXRuRK6rfP1zDew8HPWcs7arLCaHKjvc8SCLUo95HDKLk
 GS/66lgRJIgRbPoGwqo+90yJ2yN4XLXhVRRA+RwZ+pSGANyWJMRlOuql7QnMWQj4FCEW
 0bX8sigGnJkhlftnuVo7uZEEH/DIT330Fp+hBIj53ICg2/O8DkXZqf/R2Sl7nEs0Ffzt
 p24Q==
X-Gm-Message-State: AAQBX9dOiNWqiY0ZG9GlBq5WTTkFW2nA0pmyruLYr/cNbpUgn28t3G6Z
 fyhqyBw53nN5H8nfOId0T0L36giOWIZgPwaI93uRCO10U/whDDa2/eHjzAJp3h0H2j9VngY32z0
 5DDIgvI395n19RyE=
X-Received: by 2002:ad4:5dec:0:b0:5cc:4776:5abe with SMTP id
 jn12-20020ad45dec000000b005cc47765abemr35121065qvb.42.1680175491180; 
 Thu, 30 Mar 2023 04:24:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350YqBMrHvXU8q3KnntkQfyqBkYSPghcVf9TF+CfuAgzDmsbTR93tYMThnP/ORSBLaNwdVtTPuw==
X-Received: by 2002:ad4:5dec:0:b0:5cc:4776:5abe with SMTP id
 jn12-20020ad45dec000000b005cc47765abemr35121036qvb.42.1680175490927; 
 Thu, 30 Mar 2023 04:24:50 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 lw7-20020a05621457c700b005dd8b9345ebsm5363900qvb.131.2023.03.30.04.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 04:24:50 -0700 (PDT)
Message-ID: <16bc502f-7896-88e0-8a18-97cf8deafd20@redhat.com>
Date: Thu, 30 Mar 2023 13:24:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 04/11] qemu-options: finesse the recommendations around
 -blockdev
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230330101141.30199-5-alex.bennee@linaro.org>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 30/03/2023 12.11, Alex Bennée wrote:
> We are a bit premature in recommending -blockdev/-device as the best
> way to configure block devices, especially in the common case.
> Improve the language to hopefully make things clearer.
> 
> Suggested-by: Michael Tokarev <mjt@tls.msk.ru>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   qemu-options.hx | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 59bdf67a2c..9a69ed838e 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1143,10 +1143,14 @@ have gone through several iterations as the feature set and complexity
>   of the block layer have grown. Many online guides to QEMU often
>   reference older and deprecated options, which can lead to confusion.
>   
> -The recommended modern way to describe disks is to use a combination of
> +The most explicit way to describe disks is to use a combination of
>   ``-device`` to specify the hardware device and ``-blockdev`` to
>   describe the backend. The device defines what the guest sees and the
> -backend describes how QEMU handles the data.
> +backend describes how QEMU handles the data. The ``-drive`` option
> +combines the device and backend into a single command line options
> +which is useful in the majority of cases. Older options like ``-hda``
> +bake in a lot of assumptions from the days when QEMU was emulating a
> +legacy PC, they are not recommended for modern configurations.

Reviewed-by: Thomas Huth <thuth@redhat.com>



