Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8856F20F5
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 00:38:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psWiJ-0002TH-D5; Fri, 28 Apr 2023 18:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psWiH-0002T1-OJ
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:37:13 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psWiF-0006zx-VO
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:37:13 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f315712406so76803535e9.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 15:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682721430; x=1685313430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NJbJykr/INsV1uYXaU0jMtwgdpc2qfAaY6+u7ZR54vc=;
 b=A8LDqMDZwDmGhmDwKQPfphgYlax3mJYMZMZuxC+uTHHvPO0SOdv8rgO0s+1WpEWcn3
 BPSBWHrh6L4XaAjD7TxUrYC0PfnVomRs0kgWBJqtQ9QWSN2g9SZFBZ1W9iuFeggX/qBE
 eP4hhv6MfB2tIJVVrstc02g4m3zOH3+RODCx9T51F/nWxEZqho323djF/fbUxPqEwl++
 SiLd+haaUVFcLtjdSkrjNb5t+ta1qbS5Gwbk0ahWz+/l8rDMrMmQcaA1Zf363OLZHzOz
 0x1NVgLss+o8s03FRrP6W8l+PxIT7BSVaYEUKjwEuIqrdR5mrGHgQA4DLKSyu45dCHE0
 ER6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682721430; x=1685313430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NJbJykr/INsV1uYXaU0jMtwgdpc2qfAaY6+u7ZR54vc=;
 b=DZAmH3yyvgaZUEY7WSfk02taqAYfZQkint4YZwJSwJQdm2ggxHNU6Bl+Y9u4yekNx1
 435u2mAOYJhYNPbe98+lEfPLEMAn3g7A58ZRPHfqmBwCpzooA5MfrVJPok/Uh+WCcXMy
 P8TosJtvzSqvQMI01K7VEkejH11l8DULuMBQsiqxTpIIN8aHKpMpP+zOwQvJcVm1wvii
 6Q8ZuCCMgrXnsLX+EIsfJBwdcxavfEMg4A8Sxlghdn79rdmTc0jOdx2fel1kdN9FYydq
 Pe/4a8xx4wbaz5/CBzWHJAjWLqoIZmcyMmWA1ANVQixA+LgVO7G/VZzNCHlMIU97+CIY
 KhuQ==
X-Gm-Message-State: AC+VfDwp8njE7PFmajSMN2CVE5mhiOvKbp+TlQIpwM4x1BbdWDOClLMr
 WCQEP9VXrhY7z62WPyBeF31yfg==
X-Google-Smtp-Source: ACHHUZ5dElpqekjLlyXw1SjTa6Nj5mZQXAJmbiZhTMbxSVPzfLqct84A9IWpxt8DHDhh7YQxR4RVKw==
X-Received: by 2002:adf:ff81:0:b0:2d0:58f9:a6b with SMTP id
 j1-20020adfff81000000b002d058f90a6bmr8122633wrr.13.1682721430504; 
 Fri, 28 Apr 2023 15:37:10 -0700 (PDT)
Received: from [192.168.192.175] (47.red-88-28-19.dynamicip.rima-tde.net.
 [88.28.19.47]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c000900b003f0aa490336sm28797891wmc.26.2023.04.28.15.37.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 15:37:10 -0700 (PDT)
Message-ID: <f29b7c51-97d2-96b6-077d-71ceb246f41c@linaro.org>
Date: Fri, 28 Apr 2023 23:37:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v11 07/13] target/arm: move cpu_tcg to tcg/cpu32.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-8-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230426180013.14814-8-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/4/23 20:00, Fabiano Rosas wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> move the module containing cpu models definitions
> for 32bit TCG-only CPUs to tcg/ and rename it for clarity.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Acked-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/arm/virt.c                         |  2 --
>   target/arm/meson.build                |  1 -
>   target/arm/{cpu_tcg.c => tcg/cpu32.c} | 13 +++----------
>   target/arm/tcg/cpu64.c                |  2 +-
>   target/arm/tcg/meson.build            |  1 +
>   5 files changed, 5 insertions(+), 14 deletions(-)
>   rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (99%)

I think it took almost 3 years to get this in... :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



