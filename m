Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C8C4326E1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 20:52:09 +0200 (CEST)
Received: from localhost ([::1]:37608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcXk0-0000Xp-I0
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 14:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcXgs-0006Zq-4S
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:48:55 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcXgq-0008VU-L6
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:48:53 -0400
Received: by mail-pl1-x631.google.com with SMTP id n11so11910934plf.4
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 11:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zU4buUIMfhukJ8hAvdWk+qPElqE7yUMsPtCDiqSzk8k=;
 b=G8isYTooE2z/c5qPsVXgT0jmFRXQIDGlMvHz/NBVxKWFivu0ZPfwMyRzW2hcJ0AR3C
 Hsv0vA5hAAVHpdhrnwa8opFdA5dyOHPTMA6g8s1msb8VtcHW4unijC0jS0NYD3PkIfXP
 bIWEGT6+NMqLwumpRBfb8B/bdXJhZNal03aGQDfgHrSRflBR6HAjAD3jCSnVD7nrRnbR
 iYMp7z6RdOrBMrZd/2hc2VScLuhw2OQI72yiXjBZnQvtybTwZhjtKZRIOIuOgjws01LT
 3vIqVFhzfKvbS8ri+OcFb96R9ltwn6UFoHLC9bh3s5l9ItJ3NiA15wDIklNvd0ejfHmw
 PI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zU4buUIMfhukJ8hAvdWk+qPElqE7yUMsPtCDiqSzk8k=;
 b=cw31WaDltC55w41prvm0JiQsvXFZGwPauI/Xe9NUavssd47WlTHGXtCNEraiB+EjX5
 A7553ZdCo90JIhjjv08gkrQRAZtqu73/6vFxLC3JhI5UdMUTzJOfejqm+rDz7VvDdlfr
 v0VK32Rremt0xz6cZcLru+jtjLWVhUqQipS5T2EXaC/fxWS7IYV8/qZsKWyoN23cQuzC
 8fvYjJXfYbobumbywckRtRIU1+LetyjeKf7O+4HyDDU3g1qR4EPZuP4z8BV0TbEXBCN6
 Ewor9Jm9nE21Fc1RR0EnTaAkGTAdZOmSKNKTLYM6uwIviGYOt7fVhyhxr0MmN9/Zkkhm
 7ywA==
X-Gm-Message-State: AOAM531ZnUp6YCX/ulkhzutxyyYGdn7rmqsiBwF0M1l6fRSZ1gLAbxmS
 7PwFM7KUhUPqDDNF6okg/A8XgQ==
X-Google-Smtp-Source: ABdhPJzZGOPW8Vd5MYOiZM+ZycGOAZk7RH4NRDSjkjIIkszTrnrcOHjPXHKQqWwkuJu3LT9XebxRrw==
X-Received: by 2002:a17:902:da83:b0:13f:704:d731 with SMTP id
 j3-20020a170902da8300b0013f0704d731mr28535686plx.77.1634582931067; 
 Mon, 18 Oct 2021 11:48:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k127sm14210641pfd.1.2021.10.18.11.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 11:48:50 -0700 (PDT)
Subject: Re: [PULL 07/23] bsd-user/mmap.c: Don't mmap fd == -1 independently
 from MAP_ANON flag
To: Warner Losh <imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
 <20211018160458.1976-8-imp@bsdimp.com>
 <9d4a243a-de20-8ea4-fe00-6b84b6ee865d@linaro.org>
 <CANCZdfpUmPm98FOoQ3hGt=D5s3XdP5At4PUK7itLM_jfAaQdgg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3851557d-ab70-84c8-819b-31774984ad18@linaro.org>
Date: Mon, 18 Oct 2021 11:48:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfpUmPm98FOoQ3hGt=D5s3XdP5At4PUK7itLM_jfAaQdgg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Guy Yur <guyyur@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 11:47 AM, Warner Losh wrote:
> 
> 
> On Mon, Oct 18, 2021 at 12:45 PM Richard Henderson <richard.henderson@linaro.org 
> <mailto:richard.henderson@linaro.org>> wrote:
> 
>     On 10/18/21 9:04 AM, Warner Losh wrote:
>      > diff --git a/roms/seabios-hppa b/roms/seabios-hppa
>      > index b12acac4be..73b740f771 160000
>      > --- a/roms/seabios-hppa
>      > +++ b/roms/seabios-hppa
>      > @@ -1 +1 @@
>      > -Subproject commit b12acac4be27b6d5d9fbe48c4be1286dcc245fbb
>      > +Subproject commit 73b740f77190643b2ada5ee97a9a108c6ef2a37b
> 
>     You rebased with a stale submodule.
>     You'll need to fix that and recreate the pull request.
> 
> 
> Doh! I tried really hard *NOT* to do that.
> 
> So is this PULL v2 then?

Yep.

r~

