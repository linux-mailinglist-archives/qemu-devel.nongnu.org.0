Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958DB4DB3CB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:57:44 +0100 (CET)
Received: from localhost ([::1]:40452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUV5r-0007Xw-F7
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:57:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUUpa-000172-KC
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:40:54 -0400
Received: from [2a00:1450:4864:20::631] (port=43647
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUUpZ-00015s-3V
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:40:54 -0400
Received: by mail-ej1-x631.google.com with SMTP id d10so4613917eje.10
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 07:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gj9PZGpDp6jgnYHOgBBEhpPiyWO4nrIpHKDBsCMsc0U=;
 b=YsXQBGvd9XvU2TKkpucovd7Y9Xvr0mUeOmHc9Zw//o1W5Hlef2HgVP90TnCsciBZGs
 L8FTR547J2obgZ5e3Zgx4AhDJD0cP8I+qSS6xlxm0Q4OyjrPKW5Ft1jCNzei4cIa4Mvb
 H/FLSJQi5T8aTcdvR9kY3/Qk6mmcwwBr3n85PPKIYM4SWRIpKwq4zlCl+kP/cgEWReMK
 mP1MFbzuqFgNw/1mGoBxa6SKNmkdQX8MECNc6FScCauoAiHntnNqWiujBm2pPT5mjJDa
 UFyM3GtGTCryFOmDuCVQzByvso6js/4Ymg/fJfywng8SmRb6jqtQePayeNjk++P5TGNi
 Ogog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gj9PZGpDp6jgnYHOgBBEhpPiyWO4nrIpHKDBsCMsc0U=;
 b=wQebzU1KXU7aembxkytZN/7miZzEf3Rh/LJk1LLUFk1OnT3Mc+Zo4mdI6xnmulkb8r
 D4ob//QGWNF7q0z8NjcAG1pEdqWoaCNSUVLLDne7KA6isQtoibtl9u3pvnhGOT7xuc56
 w0qn2qDAjC+P2WO3szJrXlaHfS/Lt5wQAgrayGYTzei0fNIMCThvJS63BI+WOIqccNpC
 lWH3m/jAlxe7U1Zyzexo5PJF+fC5yl1vA6PlvAZYzMAqMKhH3JNTHdV4sYwQa1t8NXdk
 iPfYAyL5BZ87CJVAMV1VsItn/uhUGg2oPPjyav2LV13V6zeRnwxYCXClLlzR54EgUgHD
 V+Xg==
X-Gm-Message-State: AOAM532Ot7hEtI2pQQNsIE153Wky9UfU+94vIMS4dFv+cDfdyJsUJjom
 O5OtWypNjEYPdEhAdJSyGCM=
X-Google-Smtp-Source: ABdhPJz14oGZVDlj0UTaZTiiA3yypoXWsxoH/3OpLINz0j3GCGXUSc5wiS8iyk1zJ5ZTJ4GFfR6Qfg==
X-Received: by 2002:a17:906:4c83:b0:6b7:b321:5d54 with SMTP id
 q3-20020a1709064c8300b006b7b3215d54mr252022eju.676.1647441649958; 
 Wed, 16 Mar 2022 07:40:49 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 f3-20020a1709067f8300b006ce051bf215sm962522ejr.192.2022.03.16.07.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 07:40:49 -0700 (PDT)
Message-ID: <50cece3d-37ac-7fe4-db14-1116e9665594@redhat.com>
Date: Wed, 16 Mar 2022 15:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/27] meson: remove bsd_oses
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220316095221.2613526-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220316095221.2613526-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/16/22 10:52, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> It is unused.

It's fine to remove it now, but I'll bring it back in 7.1. :)  You decide.

Paolo

> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   meson.build | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index bae62efc9c33..784e91753630 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -44,7 +44,6 @@ config_host_data = configuration_data()
>   genh = []
>   qapi_trace_events = []
>   
> -bsd_oses = ['gnu/kfreebsd', 'freebsd', 'netbsd', 'openbsd', 'dragonfly', 'darwin']
>   supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
>   supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv', 'x86', 'x86_64',
>     'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc', 'sparc64']


