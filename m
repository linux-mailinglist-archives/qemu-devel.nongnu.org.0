Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5966A1786
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:53:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVSsq-00060M-Di; Fri, 24 Feb 2023 02:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVSso-0005zq-1m
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:52:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVSsm-0003ob-Ea
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677225163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAoR8iF0W4Nl4ddrpMtpWORQUA3+JLIbF5IrOG7OfE4=;
 b=gUaoemr9cpYlBZ4V7X8Nx37/jGBqj7pqRfHEYkavlZ/f1r6iadtyuhvwVE1teVwN2fvO/U
 9QqkyMLnkN+JqpzBLhsiM0dukJ5nV3GO1p7iOMkyfwcBIlnec1NTQhdOomd69Z7Raq4JmA
 DMZAcrbZXbuojjodIy08oZyuSUxcmFY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-113-T0esuzgcNx-IrGNU5KjKqg-1; Fri, 24 Feb 2023 02:52:42 -0500
X-MC-Unique: T0esuzgcNx-IrGNU5KjKqg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n27-20020a05600c3b9b00b003e9ca0f4677so708105wms.8
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 23:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lAoR8iF0W4Nl4ddrpMtpWORQUA3+JLIbF5IrOG7OfE4=;
 b=NRDyyCZ0Unixq6I2S39brihIDkdCNbXTDJhHv6OKMxGq1rjfCSIx7gWOQMnPrEjPMj
 yt6zeMILn5UPOGFAHwizE2XL5RA8YSa//+mL+5poXq75y3x2klH83sICLD+sw0qcjiV0
 NSQnTAc4DflO8DcPukpfnPHtYb841J4ixfwdp5vcKEnRAPJxWopUMTjAVa1gzo0tmhBw
 sFyJ+LTX+GUSZUoqTbjgNckbcjVsMbwqdV8FR8iEcatJzgdY3JUTNF79QGoglyA7BthA
 z5BeSk47CWG6lcr1cxu8uO42t8lYA984VzNRrsiRSfbB/kMCpHG1mgxj01tYUyhO1p5t
 x4iw==
X-Gm-Message-State: AO0yUKXgPyeBzno2XdHKwYvbZDBge2TvMOSv83HJptfq7OHwk37GihKg
 OF/tw9YeSfZuNVY2GryQ8m0c+5oJ9NxYtORzsfOAf4xec2wBbFdKUjECvHkIpYgmIAfgnEGvV3+
 ZdLeTWyeEQNGqG8w=
X-Received: by 2002:a5d:5646:0:b0:2c3:da3f:1def with SMTP id
 j6-20020a5d5646000000b002c3da3f1defmr13751210wrw.7.1677225161092; 
 Thu, 23 Feb 2023 23:52:41 -0800 (PST)
X-Google-Smtp-Source: AK7set97tSrKTGaj+sV3y0J6PD8Eobn8sVicDYV/teuGLQpxzIVhhqKgH9KsXcv2zkIwneXXyQpPYg==
X-Received: by 2002:a5d:5646:0:b0:2c3:da3f:1def with SMTP id
 j6-20020a5d5646000000b002c3da3f1defmr13751197wrw.7.1677225160801; 
 Thu, 23 Feb 2023 23:52:40 -0800 (PST)
Received: from [192.168.8.100] (tmo-115-119.customers.d1-online.com.
 [80.187.115.119]) by smtp.gmail.com with ESMTPSA id
 d21-20020a1c7315000000b003b47b80cec3sm1839411wmb.42.2023.02.23.23.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 23:52:40 -0800 (PST)
Message-ID: <dfa52df7-d67f-3442-5e5d-9893fe098cae@redhat.com>
Date: Fri, 24 Feb 2023 08:52:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 5/5] dump: Add create_win_dump() stub for non-x86
 targets
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230224073850.84913-1-philmd@linaro.org>
 <20230224073850.84913-6-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230224073850.84913-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 24/02/2023 08.38, Philippe Mathieu-Daudé wrote:
> Implement the non-x86 create_win_dump(). We can remove
> the last TARGET_X86_64 #ifdef'ry in dump.c, which thus
> becomes target-independent. Update meson accordingly.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   dump/dump.c      | 2 --
>   dump/meson.build | 2 +-
>   dump/win_dump.c  | 5 +++++
>   3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 0c96c6e735..7260558852 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -2020,9 +2020,7 @@ static void dump_process(DumpState *s, Error **errp)
>       DumpQueryResult *result = NULL;
>   
>       if (s->has_format && s->format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP) {
> -#ifdef TARGET_X86_64
>           create_win_dump(s, errp);
> -#endif
>       } else if (s->has_format && s->format != DUMP_GUEST_MEMORY_FORMAT_ELF) {
>           create_kdump_vmcore(s, errp);
>       } else {
> diff --git a/dump/meson.build b/dump/meson.build
> index f13b29a849..7b116f1bd7 100644
> --- a/dump/meson.build
> +++ b/dump/meson.build
> @@ -1,4 +1,4 @@
>   softmmu_ss.add(files('dump-hmp-cmds.c'))
>   
> -specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])
> +softmmu_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])
>   specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('win_dump.c'))
> diff --git a/dump/win_dump.c b/dump/win_dump.c
> index ff9c5bd339..0152f7330a 100644
> --- a/dump/win_dump.c
> +++ b/dump/win_dump.c
> @@ -487,4 +487,9 @@ bool win_dump_available(Error **errp)
>       return false;
>   }
>   
> +void create_win_dump(DumpState *s, Error **errp)
> +{
> +    win_dump_available(errp);
> +}
> +
>   #endif

Looks good now, indeed! Thanks for tackling this!

  Thomas


