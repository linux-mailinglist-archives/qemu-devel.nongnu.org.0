Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974EF693558
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 01:02:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQzpM-0007VL-H9; Sat, 11 Feb 2023 19:02:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzpK-0007V4-T3
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 19:02:42 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzpJ-0000Yv-3f
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 19:02:42 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 z14-20020a17090abd8e00b00233bb9d6bdcso3904242pjr.4
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 16:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nco/IXBD2gUlUS9VPuSry9W58QZxkXuZT1RjXzDeOXI=;
 b=dDCvsij1vgsYAJ6PCAaKkJvS3H6Jm5P4hTNSGSwOWFL1sxPFmBCWVSRRPvAG5iP1FX
 xQLjSZVE6OZhasxDjarDhuqZ/pkVM6lHnuVYUXLgY57p1F9NbQMDQhaMd/mvQPz1iTwq
 41gSQg/oBwJtB7VVw46Q+EkSG4HxKfxjTipGwt9uBWSlDPKbYuUJFQIAL+VolOZuzbj6
 PfQujdg77VOBPOA/+LvB7D/W7W06NKfD/8Cg2ShZJnPVIezpmDuS/1puwuOWwwO4E9Lu
 yUjgpOZ1Q+44oyuXqKEXZPm/CjH8Q5mWGNdA/6PhPayzNu5m7HpE085EyE6qyDSRoqhg
 6wOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nco/IXBD2gUlUS9VPuSry9W58QZxkXuZT1RjXzDeOXI=;
 b=rBxMkfrZuWRIbHuERLWGLnMTpt0dIyq957MGBAa0MnH/IhMq3HY4rxmhNId4TO3M3g
 nzINqp8q5UKQrIk8tk2Te77fqaH/qrElPM9SYUyys8Z+iAI38b6ngYbKVqhD6lAayC//
 Xc6TKM8jz+99N66/eVm4N9qYLVA4X5E3juGT/HaZ6AfdsnvBDKOvjSwI5gcVa5WpTu6f
 G6nSdzY+b3aPO4azCTFuiDM8YMULx86QRfqjL1ogr1YVSRUj+E0uevFeiLSRGIZspfF5
 96fAems+xtVq4O58f4+rOxw4oFHncAaqKa7yc5vniJQzSLquLEGpW+N4V7sdGHwsFQPR
 IBfw==
X-Gm-Message-State: AO0yUKWUloZm7Ov93KwRT0pzEozM9Av2bb7Yu06FU0hhde62I5sMDxR6
 p2jhMqnhNOD7lVWoIng+iCnjkw==
X-Google-Smtp-Source: AK7set+TQXGVZj387f/7di22d8vtWaeUC5p9W9iGKBErk/zDgDt53nWEj3PGIwY1Mo5vpt1szWHs3g==
X-Received: by 2002:a17:902:e285:b0:19a:7156:4168 with SMTP id
 o5-20020a170902e28500b0019a71564168mr6177752plc.9.1676160159321; 
 Sat, 11 Feb 2023 16:02:39 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 w3-20020a1709027b8300b0019a70a85ea0sm3628098pll.229.2023.02.11.16.02.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 16:02:38 -0800 (PST)
Message-ID: <a732e9d4-8161-b9fe-bfca-06028b90ea1a@linaro.org>
Date: Sat, 11 Feb 2023 14:02:34 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] hw/rtc/mc146818rtc: Pass MC146818RtcState instead of
 ISADevice argument
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230210233116.80311-1-philmd@linaro.org>
 <20230210233116.80311-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210233116.80311-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
> rtc_get_memory() and rtc_set_memory() methods can not take any
> TYPE_ISA_DEVICE object. They expect a TYPE_MC146818_RTC one.
> 
> Simplify the API by passing a MC146818RtcState.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i386/microvm.c            |  6 ++----
>   hw/i386/pc.c                 | 16 +++++++++-------
>   hw/i386/x86.c                |  4 +++-
>   hw/ppc/prep.c                |  3 +--
>   hw/rtc/mc146818rtc.c         | 13 ++++++-------
>   include/hw/rtc/mc146818rtc.h |  8 ++++----
>   6 files changed, 25 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

