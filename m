Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2864C5E54
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 19:56:22 +0100 (CET)
Received: from localhost ([::1]:36758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOOiT-00078H-MC
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 13:56:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOdk-0008SX-Gc
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:51:30 -0500
Received: from [2607:f8b0:4864:20::42d] (port=43915
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOdi-00060m-Vs
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:51:28 -0500
Received: by mail-pf1-x42d.google.com with SMTP id d187so9108272pfa.10
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 10:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RLHBL3JagmCoUGNMMJMHaIspdw14OW7z5m0+E5Qi16c=;
 b=FlxtHcq9sNQcAGxYGRZY4wdeSI8cnqqDSjOR2KXaZOIsHyhdpZzi4fupWoJ6PMB/CJ
 ESsgE0pYt0oKELH5c1sSkOX4j9bmubfi5v9lxSztb4gtYlkypeI163b7WkrUOOKNUN9N
 7WuGl/J7gT02ZCvBg9x3uTvO1TeN2jdrj5XFOPbps2U8OfQpA3VDeZ7Z+e1RzYiUARvd
 kW9z3a4fDuGLTz8/R3p8AtmbM40ql1SOoZiU/5ZcVlKcQJfBc+taCD2KZAeth3t4z5Gl
 GywHGmWHzfpKYLNuMmRxwpuCQ99xP6aEAaBA87Wvf9JggyHDUA7yL4TT5pEx6jW5X+gI
 NUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RLHBL3JagmCoUGNMMJMHaIspdw14OW7z5m0+E5Qi16c=;
 b=bkB0Z1vZfl03o4JQpr9YWC7MSz9tJJM6qGtNcLRBFBQLRr3JZNOzzSz9AczSKZ2hau
 sV8lImpDCVt4oY+i+ycjCYfyIIBm6lqgJruEUDnRkRcXlS9ia02XZxfmgjaDeVqQsH9J
 e+SdwzcYFJkN6yjmVn5aOsupeW9Rl/uF6SCh7mkatpGchWlsg0EgWzqv2RKiijPxNbkI
 SEvk4KMi9XRJbimLYGxf+J/NYJNSKPSRZ/13LNY/t0lnYhklNOZ4+y6B5OB4qef8GUhR
 xUR0bAGRhWQHUMi6i9mfqO507tI0l9DZxcM6BFJSR/4vTtRNYn0TQd4OxLZqGuq7eABI
 XSsw==
X-Gm-Message-State: AOAM533tcz1lMp0a2p9/tdb7zs8hqvh3qFYBqNZIGfK1WH/L0zFctQ2O
 XJ36V1TeIK1u17flt7EMMVUv6Q==
X-Google-Smtp-Source: ABdhPJy9KO6El2UJpOULHa56a6cmdSNQ3FM8J/Nvo2ezb3P7b7iUYx8GdPQuKbhZO+rlt/bmn2Y2yQ==
X-Received: by 2002:a05:6a00:140c:b0:4e1:530c:edc0 with SMTP id
 l12-20020a056a00140c00b004e1530cedc0mr17998720pfu.18.1645987885531; 
 Sun, 27 Feb 2022 10:51:25 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:23be:43d9:7006:705a?
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm10593006pfj.43.2022.02.27.10.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 10:51:25 -0800 (PST)
Message-ID: <9f65cc93-49bf-2514-9d92-02d13212e288@linaro.org>
Date: Sun, 27 Feb 2022 08:51:21 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 05/14] crypto: move sm4_sbox from target/arm
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
 <20220227142553.25815-6-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220227142553.25815-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, luruibo2000@163.com,
 lustrew@foxmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/27/22 04:25, Weiwei Li wrote:
>     - share it between target/arm and target/riscv
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Reviewed-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   crypto/meson.build         |  1 +
>   crypto/sm4.c               | 49 ++++++++++++++++++++++++++++++++++++++
>   include/crypto/sm4.h       |  6 +++++
>   target/arm/crypto_helper.c | 36 +---------------------------
>   4 files changed, 57 insertions(+), 35 deletions(-)
>   create mode 100644 crypto/sm4.c
>   create mode 100644 include/crypto/sm4.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

