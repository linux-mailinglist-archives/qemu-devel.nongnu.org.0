Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE21699CF1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 20:22:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSjp0-0003Sg-Fv; Thu, 16 Feb 2023 14:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSjoy-0003Rp-5Y
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 14:21:32 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSjow-0006gT-Ni
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 14:21:31 -0500
Received: by mail-pg1-x52a.google.com with SMTP id r18so1898783pgr.12
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 11:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oiowY3BEaR5AcvwNJ3+5Yt+7D990ExrCQ4lZv6loti8=;
 b=ei+HIckx5uOXEf4dpZfU7Ya8/hMSdg+GThi5zb81bghY3gOnojao8tndzKn8swDeJj
 kh/c7XS3iMqujTD5KW2WKxH2ZiZNs9Y3gxiaRd02KJRGHbIDafi+sukm/wU3vUNWpOT6
 qSClTwXplqI7m3uMCLR1W0WeZzkMl3XI6A+SUXgJ59SwR1RS0OmO0TBBCMxsD/iRgG5S
 X9lEU2LaPpF87yR827D5eIAbXMwyAsh0Fop4Nn9pVxZgBDkz7SgQegiUFPPcTQKsZh75
 EfiyukU2yiLZicwbdhTgRx8a7nau70aI1l9CV1mN4w4rpjRnKkehO/0EPQhqwNugxhZV
 8nrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oiowY3BEaR5AcvwNJ3+5Yt+7D990ExrCQ4lZv6loti8=;
 b=emDQ+dGD0iUbzGzSs4rep/fIidRtl7Yh0BBGjFNv/DDtJ5qZeNgP05NIRVWYd0oY+H
 ArSAGW00Zaq0/lLsh0cJ+Xed3AqBepRuZ3qK28ItU1EcZiwYw3FhrAeeJexA7dHQafeP
 tdMf7bUXIN+Kc3dZQxXTLtbkbrcb1YQmaMNBzUsDHzZISuUCtGIDR3+LipalP/Uwl6zF
 spqckF9CXJ2WrfwdSWQ9Mf7f5c2FTWOn7UFaVCr5wQbC2bcPzPZM05+RUo8kG3J1pQPv
 LpREm5ZG2WVEAb7UNlX8k+lk7dDu0XFgl3Dzu14Ih+VXpbPqMFYAlftCtTfXRwtZmJ/R
 Ed/Q==
X-Gm-Message-State: AO0yUKVdiRLS1Clqa5Io2WRpCExgDUcuwT2ylHWGpH1RJOTBlK0b+Dal
 y/KsGjdUijy+1AKImyVELmbDgw==
X-Google-Smtp-Source: AK7set+chf/ANxx+AKS7bZEajq5zLIaLCxzAmuGGg+0YL+oCJOeHzgRc6jLi54u7+sMSANh2UNNvgg==
X-Received: by 2002:a62:7955:0:b0:5a8:bd6e:90fb with SMTP id
 u82-20020a627955000000b005a8bd6e90fbmr6295199pfc.19.1676575288855; 
 Thu, 16 Feb 2023 11:21:28 -0800 (PST)
Received: from ?IPV6:2607:fb90:8f62:8652:bed9:812b:5b9e:e49a?
 ([2607:fb90:8f62:8652:bed9:812b:5b9e:e49a])
 by smtp.gmail.com with ESMTPSA id
 v19-20020aa78093000000b0058e24050648sm1703459pff.12.2023.02.16.11.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 11:21:28 -0800 (PST)
Message-ID: <ebdd4b42-22c8-9903-79bc-1b106765198d@linaro.org>
Date: Thu, 16 Feb 2023 09:21:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RESEND v5 00/28] target/arm: Allow CONFIG_TCG=n builds
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230213202927.28992-1-farosas@suse.de>
 <CAFEAcA8yXgqdCvt6KWHQBUNrjca_n2gWeBG-=RGQQKR1vWrf6A@mail.gmail.com>
 <87357536br.fsf@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87357536br.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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

On 2/16/23 06:47, Fabiano Rosas wrote:
> I'll try to split it up, let's see how it goes, the ARMCPRegInfo arrays
> are huge, they might end up pulling everything with them.

Feel free to make static functions non-static in e.g. internals.h or cpregs.h as necessary 
to allow an array to be moved without all of the helper functions at the same time.


r~


