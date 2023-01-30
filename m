Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D6668136A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:34:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMVEF-0003g2-UU; Mon, 30 Jan 2023 09:33:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMVDy-0003af-4V
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:33:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMVDw-0004Pt-4l
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675089211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f2UWpSg/0w3jyfZ0M6ETKEjw3TSMIRMYHuS3iey7/Fo=;
 b=ClKj7ksjxGR71wviRosXAneHjqiwRI3SqJvfuOfMI00bShDJ1qGI2Cvrt0Z52hVhB53Waz
 go44mCK+nGQGXmF7F18ybPuVd9xT2xif9uFBubctX5fcJkX6Q/lz8hPH5w2ACAfjq4WN5a
 YsGaregyb1ZT108ycAFT11cGtjilLP0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-21-pGW3VszqO9uxseTjTbqDWQ-1; Mon, 30 Jan 2023 09:33:28 -0500
X-MC-Unique: pGW3VszqO9uxseTjTbqDWQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 bm30-20020a05620a199e00b007090f3c5ec0so7220404qkb.21
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:33:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f2UWpSg/0w3jyfZ0M6ETKEjw3TSMIRMYHuS3iey7/Fo=;
 b=EzBNoeG/S1zlwI6PYadUxfqaD8KRZxsX/rVvZpdyj2G1VjJ3emboPo4Bj5cqqA8qE/
 eL2WXTSJoinPMVCGVuh13TFZrD4hbzA+r4AE6ltn1NV87I8siT6VwRi5/+qwSUDrB1Z2
 7Kh0EUjBHP8714Tb8Fmp/gyU/fxBYFqht4CQhWtq49hHYmdRlktmtyZFqQHB97B/lczA
 LtqMYF6BOqOX3TTfa6Ury8NwoaxHZ4kzFJdg8Kq6d/S6H/j/86/R328Q4hG+2IWJr0OH
 9mH9VLNJ/0A5z3MonZ1hrV7W6Y07DxLO/NvbiYElQBUVPBY+yVq23WW+VhvHRvAHccpY
 lnMQ==
X-Gm-Message-State: AO0yUKXochzkgeWoXs01mUFaPXjpuRT5BX2iH7NgVh+fHmDoWsBx+pC2
 N9YYl82q29UOwnn8Z8B7QwXsf3vgva1L4t87g3gwYcJyUNsOIvJ2jio9Vljw61pCeGZ2Zbb2F3j
 3+nCLXSBrvtMPCYM=
X-Received: by 2002:a05:622a:10f:b0:3b8:6b6b:28c2 with SMTP id
 u15-20020a05622a010f00b003b86b6b28c2mr5184300qtw.68.1675089207981; 
 Mon, 30 Jan 2023 06:33:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+K2c5NiESxeGHyIh/hvIZWVgMiKyfj22K0zIkQAvr6H+7B5UzeKvraD15cA/7bpb9yr9NEqQ==
X-Received: by 2002:a05:622a:10f:b0:3b8:6b6b:28c2 with SMTP id
 u15-20020a05622a010f00b003b86b6b28c2mr5184266qtw.68.1675089207662; 
 Mon, 30 Jan 2023 06:33:27 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-179.web.vodafone.de.
 [109.43.178.179]) by smtp.gmail.com with ESMTPSA id
 i2-20020ac87642000000b003b6a17e1996sm8050325qtr.83.2023.01.30.06.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 06:33:22 -0800 (PST)
Message-ID: <c341f40c-59f6-754b-1323-b3343ee40cad@redhat.com>
Date: Mon, 30 Jan 2023 15:33:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/3] accel/tcg: Add debuginfo support
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
References: <20230112152013.125680-1-iii@linux.ibm.com>
 <20230112152013.125680-3-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230112152013.125680-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 12/01/2023 16.20, Ilya Leoshkevich wrote:
> Add libdw-based functions for loading and querying debuginfo. Load
> debuginfo from the system and the linux-user loaders.
> 
> This is useful for the upcoming perf support, which can then put
> human-readable guest symbols instead of raw guest PCs into perfmap and
> jitdump files.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
...
> diff --git a/meson.build b/meson.build
> index 175517eafde..cab8c67d961 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1648,6 +1648,12 @@ if libbpf.found() and not cc.links('''
>     endif
>   endif
>   
> +# libdw
> +libdw = dependency('libdw',
> +                   method: 'pkg-config',
> +                   kwargs: static_kwargs,
> +                   required: false)
> +

  Hi,

I recently did a build with "configure --without-default-features" and I 
noticed that this new libdw does not get disabled automatically there, which 
looks kind of weird. Is there a reason that there is no config knob here to 
disable it like we have it with all the other optional libraries that we 
support?

  Thomas


