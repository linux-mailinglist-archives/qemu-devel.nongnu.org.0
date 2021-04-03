Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26A2353476
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Apr 2021 17:13:36 +0200 (CEST)
Received: from localhost ([::1]:44496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lShxv-0002lf-D1
	for lists+qemu-devel@lfdr.de; Sat, 03 Apr 2021 11:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lShwc-0002Dn-Rs
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 11:12:14 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:44765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lShwb-0003tN-9G
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 11:12:14 -0400
Received: by mail-pg1-x531.google.com with SMTP id y32so2147529pga.11
 for <qemu-devel@nongnu.org>; Sat, 03 Apr 2021 08:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L4D4Wad11/OOnEMwQqqe4ltYxGqn5jcktdN/Zn0syd8=;
 b=S58gMl/v5h5/Y7X6mhQdb5RLNShBBoyzv/t27TUjbbHGJgsMhhciRUokmgIhmz8GPg
 oIdx72Rtm20TKeNTT9p8pDtyrl3R7HI13jcTBpAl3QtJ7J8E8V+Gix5MveL1/yStD7mK
 FYyEWRt27eUhZ+2uUVyLWMBL7X9qCCg76Eo4gBQhWyZVpLPIcvyMiF5isVV0tz+mt8RJ
 2I/nL6RnUI8eUkO15GWDG0E3Br9iJENN2lkf+cOIhTKpqyq8m7Ve5hL8uVKRQd/bgNfE
 L2BehXpdY4NA2wRS9viGDDuMOXecCAXmcEDx2W7nQLpKhZ3B0X+XlL92/dmfrxyjxyYZ
 WMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L4D4Wad11/OOnEMwQqqe4ltYxGqn5jcktdN/Zn0syd8=;
 b=MZpaqCxWnBXeiH5v7rN23w7/jDTHhREbSA8GDXhxBsG2CAcULVjhLtqD6YNcxpd8Bl
 3ZCDe2k8GEbe4ahGorRZU7e3EkOwXpXTIsbX/Egbpg7GpLsGEtLjvxTdtTA4hbDDiNix
 1dUduX/RlolbvpU5RnI8CXh9PePhr8rAJYRH5ayWr+L77fHezmX6x1G7RQ4pd+B1JGvH
 xv1Gr19GJwFROAFCpNza6qfSZvI1SjBQUmGSQM40WRzMK20dtjB4iOaNrFdaHU09/4cn
 qzPB9acW8SDcGzxN07wO48hkG9E8FvWlY9NUwBI8FASuEFveNWAssPa9I5MK+902GfRl
 GXkw==
X-Gm-Message-State: AOAM530F9Hx9MhonDHme3RLac5lHNV3ynvSvVgSFJsg+9mRx1KCGc4mD
 7JKucxvQcszHydzrs7ZgT9VWPA==
X-Google-Smtp-Source: ABdhPJyN6lFulT5vzyEe1Nq4phJmXcjcF/D9QEkToTDSPqdVWBvkHTiGcJL3wNe1hiJr4i83Q066qg==
X-Received: by 2002:aa7:985d:0:b029:211:9311:79f with SMTP id
 n29-20020aa7985d0000b02902119311079fmr16773231pfq.20.1617462728865; 
 Sat, 03 Apr 2021 08:12:08 -0700 (PDT)
Received: from ?IPv6:2607:fb90:806d:6e98:198d:7cbc:a62f:cfe0?
 ([2607:fb90:806d:6e98:198d:7cbc:a62f:cfe0])
 by smtp.gmail.com with ESMTPSA id gd13sm2091561pjb.56.2021.04.03.08.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Apr 2021 08:12:08 -0700 (PDT)
Subject: Re: [PATCH] target/xtensa: fix meson.build rule for xtensa cores
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20210403040338.18929-1-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b23e0784-5dea-fe6d-faa3-bf36cdd8071d@linaro.org>
Date: Sat, 3 Apr 2021 08:12:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210403040338.18929-1-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/2/21 9:03 PM, Max Filippov wrote:
> import_core.sh tries to change Makefile.objs when importing new xtensa
> core, but that file no longer exists. Rewrite meson.build rule to pick
> up all source files that match core-*.c pattern and drop commands that
> change Makefile.objs.
> 
> Cc:qemu-stable@nongnu.org  # v5.2.0
> Signed-off-by: Max Filippov<jcmvbkbc@gmail.com>
> ---
>   target/xtensa/import_core.sh |  3 ---
>   target/xtensa/meson.build    | 13 ++++---------
>   2 files changed, 4 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

