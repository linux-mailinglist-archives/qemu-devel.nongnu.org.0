Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB9369DBC2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 09:18:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUNqM-0003E9-8l; Tue, 21 Feb 2023 03:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNqE-00036A-Sm
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:17:40 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNqD-0005gZ-2W
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:17:38 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so2801433wms.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 00:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oZQxKUnPu/Ys9S1C5mpNQ4df+74bmRL2aTdwWmue2hY=;
 b=F2WXX6jKx2XLacGMSr10k6RcZLWFq3Ft6pOMsOXYkGareNOAVr9Ti/YoQd8OmJ4Yt+
 WORRFpiveKhzIrF+MvTp8HMHPDzQkwxhsr+dT/sAE1wUCSXsjLACG7U09YozUE6QXR7S
 pmCHyHhGM+6EKvpcOjt6EBW5J8x0yJh87lKNJK32qnJpbPxq40TygeHP+F62vEmLNl2M
 jhhbnf9i8fIc2MWg8atQ/hVkH4233fjVUR7fQk/Kn0NnnA9fMjxggVLtKAFDhWEiVuBU
 48eiun5Bxl8xqJoFJA622RoZ8wOoc1Rm3qtfgVVkF9L7psMB11GJ6KhPG6Id/zLj3ZOp
 OyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oZQxKUnPu/Ys9S1C5mpNQ4df+74bmRL2aTdwWmue2hY=;
 b=o2CMAA4w2UYuSEmzgFb35dNOa2yHVeq6LdwWFeJd6L7dGjfypdcxSVtUE3/LJ4tzbO
 aGyXrULaZoY03rg88qrmsdNVquPQlLO2i5kXeocTV3sSk19LPKI+6LuQL/C4HMLo7/xK
 bEOsNike7Dq/wzJTkp4QJqHiWtQPNgNk8Vrcun4w62yqdq2w0Xf7m/qFo5CuTOh5gxjH
 /KxZvPjj+SHyCaw0HslyqQ4u7R/uQKWLq3goAb/ZXvTnToAyfwvvK491/AakMinZYeXm
 UX5tUgcGbhdJH0LU2SS650pxjiLlETtqNXlnR/c/nZCHfhviEvNOis6qHaHC3ORSdcWu
 08ow==
X-Gm-Message-State: AO0yUKWZzRdwEIu/QDad1hVBT1J9C7m54+8h3VNrY2f28j8q9ZSt8NHA
 QIyY3zY+U4UPqV5ZT5N/Q1j8Dg==
X-Google-Smtp-Source: AK7set/+DcD/O4qglEGGiapZDbBh/JYv+kUE4BjGI9xgCD7pQhHf2dZh/GplEOxkrVhL3TK1Dobuqw==
X-Received: by 2002:a05:600c:330a:b0:3e2:232b:a05d with SMTP id
 q10-20020a05600c330a00b003e2232ba05dmr2521059wmp.20.1676967455508; 
 Tue, 21 Feb 2023 00:17:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k31-20020a05600c1c9f00b003dc42d48defsm4483381wms.6.2023.02.21.00.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 00:17:35 -0800 (PST)
Message-ID: <25bc9541-a074-2bd5-4feb-ed00f2962bb8@linaro.org>
Date: Tue, 21 Feb 2023 09:17:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 28/29] MAINTAINERS: Add e1000e test files
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Yan Vugenfirer
 <yvugenfi@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
 <20230201033539.30049-29-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230201033539.30049-29-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/2/23 04:35, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


