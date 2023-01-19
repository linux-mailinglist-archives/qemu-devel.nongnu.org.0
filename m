Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD0E674371
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 21:20:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIbON-0003pp-7t; Thu, 19 Jan 2023 15:20:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIbOI-0003m7-1R
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:20:06 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIbOG-0004jb-Eu
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:20:05 -0500
Received: by mail-pj1-x1035.google.com with SMTP id bj3so3581023pjb.0
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 12:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qDEPZ9c1isVtSzeWj/rSxR8HgWG3faQQ5ZvSq8wlgd0=;
 b=auF4XVSjI5lwvXUVrNoC5q6KGvWjvRTI9peqmGPG1btlYt3ty3+W5nNRplRvv+I1Lq
 etgeKEl6gu8OzOWFNO+AomF0SF1ZW8jnrkJmxjFeDaX9zbvCIz5aHSnprhTb5T4VDyux
 vREX0K+1UnV66GnB+VW9/rmATKU+3S6Y1kbEz1tQcCqnnLR4xQjvqWLH6ZQdbE2f+BRb
 2+sPvBmdwP+EVwUqZtq58z9yCBILJFt8SbccJxWBw1REKZPhloE6iuOjjIK5dO3a1ygS
 1A8+0L9TvjZNRdf35xB8kyOnObXGizcqIxuQPB3S+suFiNDVraZ31P3337mAjYaYtQZl
 SIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qDEPZ9c1isVtSzeWj/rSxR8HgWG3faQQ5ZvSq8wlgd0=;
 b=NTvdaLogjCvFdRI+YOCVfef3OolKmgP2imsHMqbvppAp7LXHwn27OND/qLyX775x1l
 vHrx0TPl5htNyYD88UE1lCuDwlv6eORrpq8BrchEhzbvKa+GZ26uVTxHTQBqiypD1Csn
 0Zw+Am/wM/T0l1Z+m47oVMES1/VmL1NJrzUiqbkgDzvJBOxPUAMwyCFMwP72upu/2z4R
 /E/nMUpAB27PBWdcrDQORfB1gyPwSC5POKazQMU8zeLwBEwPDQf7nMKo/3WmhIHZ0qRu
 WFodLlTixR54Y+BkCRk3lv4ugvqF1DClwMzBhxj7nI0/ycCmPboNqHt+1ry3ZADVRAgZ
 wBFg==
X-Gm-Message-State: AFqh2kpmu9Md/OBWlhKclJHVBVqhsI/XhKwMklxYJkW2tKJ0L5auiQcz
 2QrC5uNHTAG8v7+loCIWsd2F+Q==
X-Google-Smtp-Source: AMrXdXt7Qb0TyPCF4N0ejCqNvWD95lZndAQD0kgBOEeMQNBIxB27x4Hb2HsxzwDBMXEOHAok3mdbvQ==
X-Received: by 2002:a17:90a:fd06:b0:229:9ffe:fa7c with SMTP id
 cv6-20020a17090afd0600b002299ffefa7cmr12619603pjb.12.1674159602288; 
 Thu, 19 Jan 2023 12:20:02 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a2c0400b00229ff1fd7e0sm56403pjd.14.2023.01.19.12.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 12:20:01 -0800 (PST)
Message-ID: <235622c8-5f08-33fe-c1fd-a39b4ca96175@linaro.org>
Date: Thu, 19 Jan 2023 10:19:57 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 03/15] target/arm: Remove default cpu for KVM-only
 builds
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-4-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/19/23 03:54, Fabiano Rosas wrote:
> We'd prefer if the user always had to specify the machine and cpu
> options in the command line instead of relying on defaults.
> 
> Since the KVM build already doesn't work with the current default of
> cortex-a15, remove the default altogether for KVM builds.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   hw/arm/virt.c                  |  9 +++++++++
>   tests/qtest/arm-cpu-features.c | 12 +++++++++---
>   2 files changed, 18 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

