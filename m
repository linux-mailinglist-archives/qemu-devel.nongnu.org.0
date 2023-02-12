Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984E169355A
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 01:09:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQzun-0000n3-Ux; Sat, 11 Feb 2023 19:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzum-0000mm-Fu
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 19:08:20 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzuk-0001HU-LF
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 19:08:20 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso13711062pjj.1
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 16:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A4YU9H9iyDQkLuGwiGD8LGQACWCwxDP/251C2WOg68o=;
 b=NT7yIr+SK9wloOXtec8Jlv5NcZ1TC/gHtwaZrDjpvSeP8v58R0dMfxPgcA2hZxYj59
 qfPhQkRPM7IpkHWiS0F4T+uWXC6hroNk0wtr80EPgXmwhk8qEiOpk4XUTMo9/lu0mZSF
 w/Ohjs8BejkbEqqzI+T2wgQ6xaf4HdPY/DNRcPnwLsDjfptSLStYYjbJOJQ9fR6HsEWq
 gySmf2ajlG3I3gs6NzLnD89dXLWeKag4YmaN/epp30CtAUTnO0FcUZmqHo/v934mwOOi
 pKPJ7A/jpNQCXof0M0MKfpijIhOjwneyraRDU+MnPDiokrxT1pETraaJJFufmBGnm7Ii
 lLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A4YU9H9iyDQkLuGwiGD8LGQACWCwxDP/251C2WOg68o=;
 b=aeA+xcMu7Wftn7RemMQ+5uFOxdZLM90qbQ/xnBqsyJu4e65ryXeHxQpTl9D17y1P8z
 r5RxJjs2yybpQDLN6OkO9rXdnAOsK6Tg7q0bEsTpOLButtp9TmsyPud43WMKYTCJN3N5
 Kd3IVZFbisGrpD2FKmZH2rWUpgr7OxfM9ALDZxXcX6eb6S23eufTFLp+58vd0l4UBe0E
 i+qK3ogieDZlXD7WVCr/QaSMGrGJjPqZR4Qdb5pPSE8MD61zSCmZReKYAq7/miigVrX7
 LxD71IXK8WgWB7sMf4LrlTtBCvm3NDSknZ0Wos+MPAGoc+IOQO/7mPYkgwN74z8JwfqC
 6niQ==
X-Gm-Message-State: AO0yUKXYBgaT8JgkgYo7kK6VJFV0U/re6ALyMVD2/C07Oyux2ltyvF8C
 eh1GX+NYfXJKQwTacrphdjiOKQ==
X-Google-Smtp-Source: AK7set/O8TF2y+g6fkWt0zAXoC+v+14gjsEEbkENK+Dndz0UtPcQAIgIrlFHDhMIi/i/yaGq+zx4wg==
X-Received: by 2002:a05:6a20:7f8f:b0:be:e450:69b3 with SMTP id
 d15-20020a056a207f8f00b000bee45069b3mr28306938pzj.0.1676160497081; 
 Sat, 11 Feb 2023 16:08:17 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 d6-20020a170902c18600b0019a83f2c99bsm1712185pld.28.2023.02.11.16.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 16:08:16 -0800 (PST)
Message-ID: <586b26cb-6fa3-1ef0-5941-de00523f3399@linaro.org>
Date: Sat, 11 Feb 2023 14:08:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] hw/rtc: Rename rtc_[get|set]_memory ->
 mc146818rtc_[get|set]_cmos_data
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230210233116.80311-1-philmd@linaro.org>
 <20230210233116.80311-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210233116.80311-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/10/23 13:31, Philippe Mathieu-Daudé wrote:
> rtc_get_memory() and rtc_set_memory() helpers only work with
> TYPE_MC146818_RTC devices. 'memory' in their name refer to
> the CMOS region. Rename them as mc146818rtc_get_cmos_data()
> and mc146818rtc_set_cmos_data() to be explicit about what
> they are doing.
> 
> Mechanical change doing:
> 
>    $ sed -i -e 's/rtc_set_memory/mc146818rtc_set_cmos_data/g' \
>          $(git grep -wl rtc_set_memory)
>    $ sed -i -e 's/rtc_get_memory/mc146818rtc_get_cmos_data/g' \
>          $(git grep -wl rtc_get_memory)
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i386/microvm.c            | 22 +++++++-------
>   hw/i386/pc.c                 | 58 ++++++++++++++++++------------------
>   hw/i386/x86.c                |  4 +--
>   hw/ppc/prep.c                |  8 ++---
>   hw/rtc/mc146818rtc.c         |  6 ++--
>   include/hw/rtc/mc146818rtc.h |  4 +--
>   6 files changed, 51 insertions(+), 51 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

