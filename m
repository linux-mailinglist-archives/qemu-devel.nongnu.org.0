Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327E96F8A9F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:20:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2pP-0007Dx-39; Fri, 05 May 2023 17:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2pM-0007Co-B8
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:18:56 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2pK-0002dJ-BS
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:18:56 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f315735514so112740195e9.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321532; x=1685913532;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5jwcosUWDmPv7R4SsSu/IaC0DpXfRzqCAo+HgndKO/A=;
 b=ofhBxz+ej9l669bNxW+5mycnN6QiA+1oo0cBMCvxZEI9umWEL/9YseGgoVM8SMHG14
 1n1DT4JUgRW0Wxu5bdRkAAkTg25aj/3lpfLLSFEsSbDRdA+KrofthMTwMxn5JVkmhDUj
 i+c09lGmU2X1g4SubvLQAQhyh9RsoN6UW85BPxEbksaVN3+CIn78ZFFh3QRiAiiWmTku
 pfExyu66Knsyk/HfwNsM/1/SgkKJVYnhQ5OMapwFOpdnMjwY+xrRCowj397w+B9bYASo
 TiTcM2k7NKYrwGFYpNMhy0LpIYWn1sKoFDBjzG0GQbisXaYHy8dgsBDabkHdPbYZPbxl
 RXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321532; x=1685913532;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5jwcosUWDmPv7R4SsSu/IaC0DpXfRzqCAo+HgndKO/A=;
 b=VoVR1vvxp/aj9fXSwyfygbXJxz7ncAL2PlEBW/IAp3+OvxNFEUI1O+dP1jWYtYtpUs
 Apakytp80D3ZCQzDtvzyPj6KZW23Wot8mcgrWKnJMsBUKODYKEWJ4UWNy+qfF4HfMT4f
 4Rcevhc2GYi866pe+rUu5UeMaaYIOIJb1xjDLbjN082BLyA+vYL0T4EdrQeHNBZY8Bsg
 pUGTWXawrh/InVi1qCth83H9WlgEPFC7zBvXxMdAHvsPLi6o+RMu2gvpyWoVoKLxKh+T
 5gEKaO7AdfXogrd9C9xn02C/Yxjmygx4UZDU3WNCD5xjPQFUydWXtHt4BHSwHjY/VgYq
 k7Tg==
X-Gm-Message-State: AC+VfDz7Q4D76kLDO3beihpsUUa6Zs5PrgeYGADvOsZKYkImJIyVhauC
 BSk1W3fxjbvrwaUQLChn3lZaAQ==
X-Google-Smtp-Source: ACHHUZ7WMan+RLyfIjHFr3vIp0soGwEJrXuj4TWz0xgAMq3XrsTEU2D3YUmkr02LlJgiJ+p4+YREaw==
X-Received: by 2002:a1c:4b0a:0:b0:3f1:7287:55ad with SMTP id
 y10-20020a1c4b0a000000b003f1728755admr2269677wma.10.1683321531784; 
 Fri, 05 May 2023 14:18:51 -0700 (PDT)
Received: from [192.168.20.44] ([212.241.182.8])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c220a00b003f17122587bsm9080126wml.36.2023.05.05.14.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 14:18:51 -0700 (PDT)
Message-ID: <c6f69cf9-3e82-aac3-755e-1827f8b65585@linaro.org>
Date: Fri, 5 May 2023 22:18:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/16] Migration 20230505 patches
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Leonardo Bras <leobras@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
References: <20230505004812.31583-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230505004812.31583-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/5/23 01:47, Juan Quintela wrote:
> The following changes since commit f6b761bdbd8ba63cee7428d52fb6b46e4224ddab:
> 
>    Merge tag 'qga-pull-2023-05-04' ofhttps://github.com/kostyanf14/qemu  into staging (2023-05-04 12:08:00 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/juan.quintela/qemu.git  tags/migration-20230505-pull-request
> 
> for you to fetch changes up to fae4009fb51b12927165667a9c9d6af93d31b1df:
> 
>    qemu-file: Make ram_control_save_page() use accessors for rate_limit (2023-05-05 02:01:59 +0200)
> 
> ----------------------------------------------------------------
> Migration Pull request (20230505 edition)
> 
> In this series:
> - fix block_bitmap_mapping (juan)
> - RDMA cleanup (juan)
> - qemu file cleanup (juan)
> 
> Please apply.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


