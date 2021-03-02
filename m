Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85A23295E1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 05:25:03 +0100 (CET)
Received: from localhost ([::1]:57384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGwak-0007Qi-FR
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 23:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGwZz-0006yW-An
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 23:24:15 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:32978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGwZw-0004Q2-Qw
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 23:24:15 -0500
Received: by mail-pl1-x62e.google.com with SMTP id c16so1801043ply.0
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 20:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w4wEYNgX/pCQyj47OuHAAD/OJYu2mvLymzOERjjGn9A=;
 b=o9mJpT8WlaUhDsWbmlBZbGVp9I8bOkrkIecebG0p1X8q9o760WebPxoCEvQXAE6i3l
 o+GSscAh/m8aDJwrfQrBojI2J/EqD5aFiMT8WfWazwmCO1e+i27BuEFgOqoVDFN1arKX
 y1s+Om0A9XB1/fdh5OwyT58pdLWk3DFYmMfoMV/Gpiqt+M7LSgT6kxeUkyMztPgBdaCa
 mRcNq5LRYz+T5QEXHXrtNPSRUMN5I2fPhqR1arQxxQWoV/Drwr9On0ZAw6YHOMBI2m6d
 P+AnHy7FhAzd20QRVAPhSgFpb+T8uU920R8hjVotS9hBtz6DxwHaee/VvRDKWsLJF6qo
 N/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w4wEYNgX/pCQyj47OuHAAD/OJYu2mvLymzOERjjGn9A=;
 b=N5d3LAd+pdilp2JZNBLVTUaQprTF4YKWwSpYYYaa2YXLT+aTel3PFuUWpVDxEOHhEj
 molQd9sIpY+NZndhnhgsL+hJR8wiihMsTAfR400dryXMk0n3gzmc8IqeCuvYYbOv0VrR
 D3YQ6mxsn/Pu2xfKKWnApKtv8L9XwXSLRbmGk+hz8qoH6pZXfTp3OYeabhHZdo3u22hc
 hBxKD638sT8A5VTXLmu+mnGl6LopKBl/M9HlniK4VCqiL78LyqPwYTiizu59wXNK1xXu
 fmE6ReDTBfbkTfO7S9R8EZTDA7DuGy+EjjduDejZa7j/NOIIrJlYXdmxsEMyUg4lkYcR
 wUVw==
X-Gm-Message-State: AOAM532gZTz4P9u8E4Cl/Mp1JslJ1e2zX0russVhPX3fDbVYstrFNjVE
 nVK+mcGRkjlWtcd2lWLQBg1Ciuresna06g==
X-Google-Smtp-Source: ABdhPJyze/1R70Q0qMUcrcm/GIEmC38Izw6f2OBBILJQu4mufaXRHbBkbNq/rRcFE3HPeADWtDKRBA==
X-Received: by 2002:a17:903:230b:b029:dd:7cf1:8c33 with SMTP id
 d11-20020a170903230bb02900dd7cf18c33mr18425746plh.31.1614659051055; 
 Mon, 01 Mar 2021 20:24:11 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id z3sm6815865pfk.173.2021.03.01.20.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 20:24:10 -0800 (PST)
Subject: Re: [RFC v2 14/24] target/arm: split vfp state setting from tcg
 helpers
To: Claudio Fontana <cfontana@suse.de>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-15-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3658a432-7dc1-ce34-e341-710ea6013556@linaro.org>
Date: Mon, 1 Mar 2021 20:24:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301164936.19446-15-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 8:49 AM, Claudio Fontana wrote:
> vfp_get_fpsr and vfp_set_fpsr are needed also for KVM.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu-vfp.h          |  29 +++++
>   target/arm/cpu-vfp.c          |  92 +++++++++++++++
>   target/arm/kvm/helper-stubs.c |  10 ++
>   target/arm/tcg/cpu-vfp.c      | 146 +++++++++++++++++++++++
>   target/arm/tcg/vfp_helper.c   | 210 +---------------------------------
>   target/arm/meson.build        |   1 +
>   target/arm/tcg/meson.build    |   1 +
>   7 files changed, 281 insertions(+), 208 deletions(-)
>   create mode 100644 target/arm/cpu-vfp.h
>   create mode 100644 target/arm/cpu-vfp.c
>   create mode 100644 target/arm/tcg/cpu-vfp.c

kvm/helper-stubs.c should be for all !tcg.


r~

