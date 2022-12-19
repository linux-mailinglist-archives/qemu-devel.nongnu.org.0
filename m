Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D2B651225
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 19:42:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7L5m-0003jS-1s; Mon, 19 Dec 2022 13:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7L5k-0003jK-ML
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:42:24 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7L5i-00037v-Tl
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:42:24 -0500
Received: by mail-pl1-x631.google.com with SMTP id l10so9883189plb.8
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 10:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BoAgQbY9UO5j6N8tXgupK/qxuk7Pci6GRE5/VK+L47c=;
 b=qMSgyTERBroi2syJ9a2laVLJyfvqz/ZY30XtGpftCm0DEiIN5VzI5Fuv+cDdeeSPdH
 ec+wz2taiAX0CWRPpTRAGgoNnFd+8e+aIpw87LU4odDPjJYTaVBPM228lWD0WAqLV0vf
 mks/J16257mc6dirx7NICEf76EkM8NzA9bXQ7mFkQZ9dsaJclNIs/A3Ma0orDpnYLe+5
 kqPf1yIUhl/PdCtfQ+C2Lwt9k5jGtk2S0XEBi9YhKx36X+uLRoL+B4QxZnfDdPfIguSv
 HDdkjMp4T6EhVAftfcZEMwhl9kvgNEiRGZu+GjGMhGc5ARunhhXmxeWJ44DZQatqd3Uj
 T6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BoAgQbY9UO5j6N8tXgupK/qxuk7Pci6GRE5/VK+L47c=;
 b=CQyI3noCZpVKIYEOQ4OTRrCG8S78tjyaSxLXfJfYxI3CxzzNBF1MZaEn2/9sALqWSH
 M1lsVgN1m+C6ULR3F3t6FNvCmnV6lpQr1NLmlEgC9Ugjed2rkX+QmGcCGpaiL8JB1OZw
 SzpLRSdidik5fSx6K2xdKZQ4e6ESZInQ7s30gzjnAv6pv8bJcJs2V8dXFfdw+ia8a0WT
 i2Em40qsXedjU6S9w/PZ8fbSGWSloqBf52t0CHekE8tqhTzbXi6iQqy6T54LVR/1Gt1x
 A+hhr49XOD12KHyn0XlT4c4VxwWbRDpe4qG+27v2C0V0EYSCocD+2FqaS7F0z8GrPZoR
 7Vdg==
X-Gm-Message-State: ANoB5pnP3L17pJ6YPBU74MlrcR4NCCOcUWclyF/oWq4Khh+tRd5C6j7G
 39IlEEnS2mpFzgpO+4eoJcQuIw==
X-Google-Smtp-Source: AA0mqf4KvSt9ZMuBpNA3jLayIHjqywvxsSo5eOxBsA8KM/Rr62KOKbQVaO9ZsVO272UItt7q0okvtw==
X-Received: by 2002:a17:902:efc7:b0:189:812f:48a8 with SMTP id
 ja7-20020a170902efc700b00189812f48a8mr40752295plb.63.1671475341444; 
 Mon, 19 Dec 2022 10:42:21 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a170902650700b00186b549cdc2sm7447341plk.157.2022.12.19.10.42.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 10:42:20 -0800 (PST)
Message-ID: <86b96f5a-c7ff-e9c2-ee62-f992e4a30f2c@linaro.org>
Date: Mon, 19 Dec 2022 10:42:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/5] accel/tcg: Restrict 'qapi-commands-machine.h' to
 system emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
References: <20221219170806.60580-1-philmd@linaro.org>
 <20221219170806.60580-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221219170806.60580-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 12/19/22 09:08, Philippe Mathieu-Daudé wrote:
> Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
> user-mode builds") we don't generate the "qapi-commands-machine.h"
> header in a user-emulation-only build.
> 
> Rename 'hmp.c' as 'monitor.c' and move the QMP functions from
> cpu-exec.c (which is always compiled) to monitor.c (which is only
> compiled when system-emulation is selected).
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/tcg/cpu-exec.c  |  88 +----------------------------------
>   accel/tcg/hmp.c       |  14 ------
>   accel/tcg/internal.h  |   3 ++
>   accel/tcg/meson.build |   2 +-
>   accel/tcg/monitor.c   | 105 ++++++++++++++++++++++++++++++++++++++++++
>   5 files changed, 111 insertions(+), 101 deletions(-)
>   delete mode 100644 accel/tcg/hmp.c
>   create mode 100644 accel/tcg/monitor.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

