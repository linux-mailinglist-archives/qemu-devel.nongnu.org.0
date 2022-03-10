Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637A24D4750
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:53:18 +0100 (CET)
Received: from localhost ([::1]:59058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSII9-0007y1-EO
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:53:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSH8j-0003CM-5o
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:39:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSH8g-0001PG-78
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646912365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pmboh3SVtXZq4VZADJ42jzidlwhuODU1o89BxIFu7aM=;
 b=B1+n9Fxk5mpNkM+He+0535oKn2QAr0vYsHwavM5akHHa8ddRtxRhTl+QDz+qUSTP+x+u92
 ewNO0Y33Ey9ZRpndYvi0ggrZz6sApsZ9TDr2sqJWwgqBbf1QxknQwNmOmldKL9n3Vtuz3y
 Ufac/jXtNxMOIkfQwjRgVXXAbHChWXw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-HQBr8n5kN02TFx3xlyB3SA-1; Thu, 10 Mar 2022 06:39:24 -0500
X-MC-Unique: HQBr8n5kN02TFx3xlyB3SA-1
Received: by mail-wr1-f69.google.com with SMTP id
 m18-20020a5d4a12000000b00203731460e6so1592570wrq.3
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Pmboh3SVtXZq4VZADJ42jzidlwhuODU1o89BxIFu7aM=;
 b=6yW3ZBVUsZ9byREUg3DtK7xcSSVni2UuUWu/Ikxd1lBY0Y1PV1wCaul17Sff4dAmh9
 HsMce/4i9dEU/mxFEwqxe6Tcn5STz0mvHiL7lMfAsSHM3aUNnDA6Rc+ZgILLjD+bakL5
 UKgv3RtjH/EpEGFtWNOCI8JM/ply6+tsJTSICtw+K/c8o2mooEPDtW1pVNBoZ6ShFBxY
 WOW8xxUWa/T+0SYbYBy0Ig1byPLlzSzPsFBTLSKmR3P5WYpCaKnnOj/7oUBrE/jPoCRV
 ZjnfTv+9SUHz3eEGfmfySEmMTCVqqeF7sNEkrpZM0eVeAawwXHwoiUTeIWX1X7nbpdAZ
 3M2w==
X-Gm-Message-State: AOAM533PDzcsWP47u7leogWq7dJfQ+oF0YW6oJgtTLNvPZjBJd92+gif
 YJVQHT2CQ5/Jon/lanG7L82GOK4a46H7jF7UUtFqnCsI8gC8ypkJZ4AvPNdLdlWFMDr22/mFzXA
 zDN14elIiQSprAWg=
X-Received: by 2002:a5d:6cc2:0:b0:1f1:dc97:d87e with SMTP id
 c2-20020a5d6cc2000000b001f1dc97d87emr3221582wrc.470.1646912363063; 
 Thu, 10 Mar 2022 03:39:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdNtWTUBw1fcYhs6LNorguFYN1niL3WbjWPfUWhtFxxTZt37XixFo4en/MODjbzWCkzExkxA==
X-Received: by 2002:a5d:6cc2:0:b0:1f1:dc97:d87e with SMTP id
 c2-20020a5d6cc2000000b001f1dc97d87emr3221568wrc.470.1646912362841; 
 Thu, 10 Mar 2022 03:39:22 -0800 (PST)
Received: from [192.168.42.76] (tmo-097-147.customers.d1-online.com.
 [80.187.97.147]) by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c3b8700b00389a6241669sm8470812wms.33.2022.03.10.03.39.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 03:39:22 -0800 (PST)
Message-ID: <d67532fe-367d-daae-1edc-b3ea0a5edc2e@redhat.com>
Date: Thu, 10 Mar 2022 12:39:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: qemu-softmmu -cpu help broken
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel <qemu-devel@nongnu.org>
References: <CAMo8BfKsLmdjRzmX6+nD3u-+8-6dx5VuU-kNH9gwx04NhQ5fGA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAMo8BfKsLmdjRzmX6+nD3u-+8-6dx5VuU-kNH9gwx04NhQ5fGA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2022 12.10, Max Filippov wrote:
> Hello,
> 
> I've noticed that the command
>   qemu-system-xtensa -cpu help
> no longer prints anything. Apparently because cpu_list is no longer defined
> in list_cpus inside softmmu/cpus.c
> 
> Bisection points to the following commit:
> e0220bb5b200 ("softmmu: Build target-agnostic objects once")
> 
> Reverting the change for the cpus.c fixes it for me:
> 
> diff --git a/softmmu/meson.build b/softmmu/meson.build
> index 8138248661a2..adede5e604db 100644
> --- a/softmmu/meson.build
> +++ b/softmmu/meson.build
> @@ -1,5 +1,6 @@
> specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
>    'arch_init.c',
> +  'cpus.c',
>    'ioport.c',
>    'memory.c',
>    'physmem.c',
> @@ -13,7 +14,6 @@ specific_ss.add(when: ['CONFIG_SOFTMMU',
> 'CONFIG_TCG'], if_true: [files(
> softmmu_ss.add(files(
>    'balloon.c',
>    'bootdevice.c',
> -  'cpus.c',
>    'cpu-throttle.c',
>    'cpu-timers.c',
>    'datadir.c',
> 
> I can send a proper patch if this is the right fix, please
> let me know.

Since we're in soft-freeze now already, I think your patch is the best way 
to go forward, so yes, please post it as a proper patch!

  Thomas



