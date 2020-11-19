Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8732B9DF2
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 00:09:25 +0100 (CET)
Received: from localhost ([::1]:43462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kft3M-0004fh-9A
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 18:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kft2R-00049c-DL
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 18:08:27 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kft2P-0007DG-WB
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 18:08:27 -0500
Received: by mail-pf1-x42b.google.com with SMTP id q10so6004394pfn.0
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 15:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KO+XgTStUCirDVusXB/iVhOumkg3OpEzrgo40gKTrF0=;
 b=BZe0mZKdO7kjNsJKQoY0WxoaoG0rMEgqrAyMQptMdVjmE8Wb4a5jfAy8ioGyeFvRHG
 94sQAJTiL9+39LnQT+3TbNZx0m00fVh1y+tJGPogp3hehkSMPrLwDclrv4ELTu2Qq10N
 tpubmVKrc7R06JtM1fM73drQfkF8cPAT5q58e33wH+myydZZwPmIcPkhVZj8QY7jcLJK
 uECIG5edW/c0GG6LkGXpfEJ4a81tEUX4OoFnSmMvun7Wfy3JRejTejIkWufFZRNSR+Hn
 DmzYrsa2wFjXu3rmQS+s+bTocrUZZbufwn5icS09s3PJnHvJGm0SSCG5B8NHiyTow2xK
 V3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KO+XgTStUCirDVusXB/iVhOumkg3OpEzrgo40gKTrF0=;
 b=QjZuusIpy5CJjrIiR99/2ddDGUOg+YM514Xe1ieuGNCFqze7u2WkuQ/zYgHfmmxq41
 Da1ZKhJHv+9JpuW4tAZAkXkZmPrtncIDOG2ylZ23odUZHtEW8pZbTWi0dBGiCpkuxVJZ
 uXM3PJozsGqrh6WkuKQ1L8YLtYD8Aq842VUNvHWT7CpcnKZmZNDOR8r6McqWXHyt3Aa0
 cH3V9knGpmbbIwmUbF6SzrVGY2upFzUgMcrDRnlyLFVas9wU4LS2+Z6sg771PItWoPeF
 7697TDOHD5/skXyjU2KEF+WW546qQLxFuU9e41QlZaMUqIDbvXtSqm6j1fWdoEV3LtTi
 puVg==
X-Gm-Message-State: AOAM532VhPBVIP8bGmorFEN3iSvEJTlb0dkhyvPa0KgfZY5VIZIgeOUL
 CnKc+VkJALYgGI5DsV0/BY9THQ==
X-Google-Smtp-Source: ABdhPJxTy5dPRJT0jhw9xmx+BhxSlq8MvHtHZ+5RkgzOzCVu9MQn5lL/Xs4K0FQOVNYL10CFPxFjyw==
X-Received: by 2002:a17:90a:b881:: with SMTP id
 o1mr6067732pjr.43.1605827304632; 
 Thu, 19 Nov 2020 15:08:24 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id h20sm818522pgv.23.2020.11.19.15.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 15:08:23 -0800 (PST)
Subject: Re: [PATCH 2/4] linux-user/mips64: Support o32 ABI syscalls
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201119161710.1985083-1-f4bug@amsat.org>
 <20201119161710.1985083-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <969a01ac-ca23-7c0e-ee61-8d75177df0a5@linaro.org>
Date: Thu, 19 Nov 2020 15:08:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119161710.1985083-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 8:17 AM, Philippe Mathieu-Daudé wrote:
> +#if defined(TARGET_ABI_MIPSO32)
> +#define TARGET_SYSCALL_OFFSET 4000
> +#include "syscall_o32_nr.h"

Where does this get built?


r~


