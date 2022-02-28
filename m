Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2CA4C7848
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:46:52 +0100 (CET)
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOl2p-0008St-4a
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:46:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOkz3-0007e7-Dv
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:42:57 -0500
Received: from [2607:f8b0:4864:20::42c] (port=37698
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOkz1-0006xH-He
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:42:56 -0500
Received: by mail-pf1-x42c.google.com with SMTP id t5so2744107pfg.4
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wpSS5cXt+CJCFzPSogJtA6zD0Ltmzmgl675X1SscL2U=;
 b=d6nMy7/M//lHEqyue6W4mLfqFbvI0x+SLyM23cb4Zuoq0/HFF4dZbvZYv+saOrYcgN
 HvTQemx+1xHj43/wogcwg9v/xyVmMXFyfvVgOMcF3DG6MysJJ4WFMMpFeEsVU+1xGR8q
 o5II1x4PmbYR8Q/YltO7ixGB4Ipqre6dAFipixXrXMqAHkpdchERu8T9ibp2b7+ds0NM
 RZ8XWFZOgMhwGbuHCEKjK/3eR7QfvRCJq9Yv5vaWEW3UMzVB1hi6LTFu9/NEAzlXfBDR
 A0Qpa2RuGpgD1/8iYeYw7CwhVVe9yZ9E8HVq5dam69+7jfl6dzL88T2+CAV1W63hAqgI
 6Wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wpSS5cXt+CJCFzPSogJtA6zD0Ltmzmgl675X1SscL2U=;
 b=i4PFSQk/1gaW+lcwWYrJH4d3dOVqNgOkTNaoXxgw+w7b49zGEC/JVpX6dvMliGcdhQ
 jSAi5Bv1wdP1W58yfHVVrgWj6kowb3OEVDNMUIeG/J9OoKY7g/W8JSWNq6ltTEn7m5Wp
 6uukCfyHb0yMS58AnQ7Lg8AaGTI1xmbtl60z39GsGlW4J7PiQPNNFUz5DQkw4c5LH7Ab
 4VMnCgSRV4YbIK7edM12Jfvq1n9lHJu9NUngXUsPTtNJBOyTHlXDzPkAYlrnlRHdnPXj
 /pyGK4+CEdvR7TqHcSizRbQtWOpiHWD9HxlpvnN5qM6Q6ey89jKrRc8h2yKE9y+x20L1
 0Bog==
X-Gm-Message-State: AOAM531leR7YMymemfgO4MoQaTn+4WBKHeqfTISi+U3Yrk3MP9DPyEye
 vSzxlskQOYnZ9hT1067jGC68FQ==
X-Google-Smtp-Source: ABdhPJwo7bxdSU6zQSkLDe+XUIfOkkNkIATgnRaGkPltRLwKOVTFEAAuAsEVx6Ds/lAhBdiZk1oQzA==
X-Received: by 2002:a65:61ad:0:b0:378:8f01:7674 with SMTP id
 i13-20020a6561ad000000b003788f017674mr6383863pgv.314.1646073774170; 
 Mon, 28 Feb 2022 10:42:54 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a056a00213200b004e17d967d13sm13386554pfj.124.2022.02.28.10.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 10:42:53 -0800 (PST)
Message-ID: <1de62df7-be40-c8b1-dfcf-ae57096ba19c@linaro.org>
Date: Mon, 28 Feb 2022 08:42:51 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] meson: fix CONFIG_ATOMIC128 check
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220228120720.722632-1-marcandre.lureau@redhat.com>
 <20220228120720.722632-2-marcandre.lureau@redhat.com>
 <CAFEAcA_a+0Nz5b3uU052FquVLOLRTvejPD13NSxvHTu_yZTBiQ@mail.gmail.com>
 <CAMxuvaw-q06u7TfjzueZWwiiXCjwFh+QfQaM+cTKHQcmYBW-iQ@mail.gmail.com>
 <CAFEAcA8Qz1gpb+m7c4isagPG357NjwLtm3hfrmrnG8zYqEqKdw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8Qz1gpb+m7c4isagPG357NjwLtm3hfrmrnG8zYqEqKdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/22 03:36, Peter Maydell wrote:
> I think we should have the 128-bit atomics check in meson.build
> look the same as the existing one for 64-bit atomics, though,
> unless there's a reason why they should look different.
> For the 64-bit version we explicitly pass __ATOMIC_RELAXED,
> and we use __atomic_load_n(), not __atomic_load().

Yep, since that's what we use in qatomic_read__nocheck, etc.


r~

