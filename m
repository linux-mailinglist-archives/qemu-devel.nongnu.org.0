Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4386A16EF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:09:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVSCS-0000Sh-Qf; Fri, 24 Feb 2023 02:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVSCQ-0000SR-Hq
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:08:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVSCP-00067O-5f
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677222536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FSxKLMg6q9Fun7M7NQp6sVs4blr4HAX2q6FuhxCk4J4=;
 b=ETq13NQHvy1xntPzz1xBvky5Rqs9zBk3uj9f8ZAF0H93i5NEPvVsgFuDhbAtmcVwRBJqmV
 spgfcMztYLRKnDEvffBM5sriPS/MG3+J5BL+MiUtAlbSIO1UdrZKcPrC1IVf16hFSpRk10
 4d4SjPPSg36XQFsGh191YWlFuhiKJfA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-xiOpxGQZPSCGm50GrjrD0Q-1; Fri, 24 Feb 2023 02:08:54 -0500
X-MC-Unique: xiOpxGQZPSCGm50GrjrD0Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 m31-20020a05600c3b1f00b003e9de8c95easo2605966wms.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 23:08:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FSxKLMg6q9Fun7M7NQp6sVs4blr4HAX2q6FuhxCk4J4=;
 b=siqf21UwBPUIiphMbPwbM+MXKuMMuAtG/XMxBHCgN5oo3UirKhszh59c5r8ZpM1ecM
 eXvxKpCq/+pVWNNNKGOxnozlfYC5iTWyXkwlftv4bI/v+lRAahcqY98MGVFvIc1eS1tw
 Di/SkySYazuI5ZS2oTltZQrj/xTt1gdaWdyBKPsIYo2DwWtKRQijS8jHEd3jmkysS+62
 Eh+qlHe3HZegHuLFHig26m1GThBswI7sXPPygwO+HetJ4pE48ADkEKd81pprRKKzmBLP
 sbIpeLdV5mzQdrRkyyMKuwqN78jMEXA16N+eaQ7CwMNVfNOdgUaVRiWa3H7vpvZbBq+3
 /Nhg==
X-Gm-Message-State: AO0yUKXVEQm+WSffp8POdsLNNlVTe7Q/GmYz6UXu1489Kf7uGAWyxoGL
 rf3aJToFueEY8b/Z6SXwZHiTu/ZEVtcSvm5UfztwMynxvCHg+XVkbIMrXS4mKZtVL5xSPHuEi0O
 orXdwJU6gfbcR9RA=
X-Received: by 2002:adf:f344:0:b0:2c7:1740:629b with SMTP id
 e4-20020adff344000000b002c71740629bmr2668743wrp.13.1677222533814; 
 Thu, 23 Feb 2023 23:08:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+BKLnLmFMgLPP+fppE7tsuIoiQ1G1ZPWL7tT1LQzsSYY/4gCGbx6QywcEKVXyt3IeQvuVnjg==
X-Received: by 2002:adf:f344:0:b0:2c7:1740:629b with SMTP id
 e4-20020adff344000000b002c71740629bmr2668730wrp.13.1677222533620; 
 Thu, 23 Feb 2023 23:08:53 -0800 (PST)
Received: from [192.168.8.100] (tmo-115-119.customers.d1-online.com.
 [80.187.115.119]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056000118400b002c5544b3a69sm8766793wrx.89.2023.02.23.23.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 23:08:53 -0800 (PST)
Message-ID: <9c5fd343-d035-ede1-17bc-7dcb0f9ad198@redhat.com>
Date: Fri, 24 Feb 2023 08:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 5/7] dump: Introduce create_win_dump()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230223231755.81633-1-philmd@linaro.org>
 <20230223231755.81633-6-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230223231755.81633-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 24/02/2023 00.17, Philippe Mathieu-Daudé wrote:
> Remove another TARGET_X86_64 #ifdef'ry by introducing
> a create_win_dump() stub. We'll extract it to a stub
> file for non-x86 targets in the next commit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   dump/dump.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index c356a88be1..b33a613d45 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -39,6 +39,11 @@ bool win_dump_available(Error **errp)
>   
>       return false;
>   }
> +
> +void create_win_dump(DumpState *s, Error **errp)
> +{
> +    win_dump_available(errp);
> +}
>   #endif
>   
>   #include <zlib.h>
> @@ -2031,9 +2036,7 @@ static void dump_process(DumpState *s, Error **errp)
>       DumpQueryResult *result = NULL;
>   
>       if (s->has_format && s->format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP) {
> -#ifdef TARGET_X86_64
>           create_win_dump(s, errp);
> -#endif
>       } else if (s->has_format && s->format != DUMP_GUEST_MEMORY_FORMAT_ELF) {
>           create_kdump_vmcore(s, errp);
>       } else {

Reviewed-by: Thomas Huth <thuth@redhat.com>


