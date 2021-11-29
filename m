Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2113A4619CF
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:39:12 +0100 (CET)
Received: from localhost ([::1]:52142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhoF-00070J-7u
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:39:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrhkA-000896-Pz
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:34:58 -0500
Received: from [2a00:1450:4864:20::42e] (port=33603
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrhk8-0002iG-8L
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:34:57 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d24so37339349wra.0
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 06:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hBwFTc9Q0EXFD7ELfD+dXOU4Eyyxh5j5ItKwQXbZcvg=;
 b=F9MT5VXYkT9Ow4vdNWOroKVJyZAE+WM39InGkQOdj19i7fbIwsHwv+0OI0PSmi49Yb
 LOCzZKdtwcZdyfsU9Zx1HBmI4WG50xl5r9kQAa+bsDcMq0hQdjXCfXG7rMx23McXCwtA
 w0aONtl1aV3/7mZ2Z7DpkXKo85y8WNSu7uyBGzlR3iZiQ/NDwdj/5ZsznbnGQr30rKBy
 s3P8EU1hZsWRZRxeG+ZMllqX5Y7kxyA4cXiAkIC33OHcwTH5AQx73f1UxbxrXI+My541
 SH12DIPWPB1Xj2BJ11eOr9ZSZSJBgeaEAVzmRX4HXstVJrL5K+c/V4yzRT3VX8NrtOPg
 860A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hBwFTc9Q0EXFD7ELfD+dXOU4Eyyxh5j5ItKwQXbZcvg=;
 b=hrJCQRBfyZyUW7YlWQFAn/fHBgP+rhiPwcgqfLOdrnLs6BQQIrZBCA+ML1F0xZbisj
 zHWWu2JajxLJHvGhsSp8PJmMWS0uUK43ZbSVIrNgDXnDQV5XA89vua7NTMBhq685S3ku
 lyZ0gwYEphxs9DCnhys69UVm+AYrF3SJMDcJDXKcjGjlq66EtPoNH2dArA3dBsJMhzQF
 MKVa1w2rKeIzI9CYNXt3WDWFpW7XVGCaMF6Za9j9OvGuYnME/tmJgR0izvS+RnOejEJV
 ekCq7WTGXTMawduZSCcdJ4tp9oUF87qLYa5Tpj/gYAC47YFrQqbLZ+FWkdziYLc6+GUl
 HBAA==
X-Gm-Message-State: AOAM533K2kkueMtWCbpIri9O8/inuFUfAGTuf3ODl6VQ6m/rghALsdZn
 lZRBYyYs1Q04mddb3klTOvF/mA==
X-Google-Smtp-Source: ABdhPJxddKJ+b5nBi8kzghugbl/R12NEAsrZVFrniDQZ4d+K55gXA9tKERGKOdFwp8zwd3gHBUj2VA==
X-Received: by 2002:adf:e3c3:: with SMTP id k3mr33423718wrm.599.1638196494786; 
 Mon, 29 Nov 2021 06:34:54 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id r83sm19905101wma.22.2021.11.29.06.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 06:34:54 -0800 (PST)
Subject: Re: [PATCH v3 2/8] accel/tcg: suppress IRQ check for special TBs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211129140932.4115115-1-alex.bennee@linaro.org>
 <20211129140932.4115115-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9cb5c50d-114d-d515-c60f-17d3ccfe66ab@linaro.org>
Date: Mon, 29 Nov 2021 15:34:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211129140932.4115115-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, berrange@redhat.com, David Hildenbrand <david@redhat.com>,
 f4bug@amsat.org, Peter Xu <peterx@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/21 3:09 PM, Alex Bennée wrote:
> When we set cpu->cflags_next_tb it is because we want to carefully
> control the execution of the next TB. Currently there is a race that
> causes the second stage of watchpoint handling to get ignored if an
> IRQ is processed before we finish executing the instruction that
> triggers the watchpoint. Use the new CF_NOIRQ facility to avoid the
> race.
> 
> We also suppress IRQs when handling precise self modifying code to
> avoid unnecessary bouncing.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Pavel Dovgalyuk<pavel.dovgalyuk@ispras.ru>
> Fixes:https://gitlab.com/qemu-project/qemu/-/issues/245
> 
> ---
> v2
>    - split the CF_NOIRQ implementation
>    - only apply CF_NOIRQ for watchpoints/SMC handling
>    - minor reword of commit
> v3
>    - add additional two cases of | CF_NOIRQ
> ---
>   accel/tcg/cpu-exec.c      | 9 +++++++++
>   accel/tcg/translate-all.c | 4 ++--
>   softmmu/physmem.c         | 4 ++--
>   3 files changed, 13 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

