Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE4F3676E8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 03:42:58 +0200 (CEST)
Received: from localhost ([::1]:51958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZOMr-0000K9-QQ
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 21:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOL7-0008Ad-Q7
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 21:41:09 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOL6-0004Dr-7L
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 21:41:09 -0400
Received: by mail-pf1-x42b.google.com with SMTP id h11so12931113pfn.0
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 18:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9QsFvqQTRAdULmCZfiXhkW8re5GC5pYqh7guL/J7+8Y=;
 b=xxaZPUKwxh+BwdLTSgOgESPmpfr5YQXQmglP8icTfD1fX0SpR5/tJYCgFTs2ORZ0Jo
 eBjssDKuZpaNLLLLrxWce/op4OAPlnHgrdHIKWjC8dftgPhUPV+eMxhptlwaZ51gZBRs
 hMVl/mSjbv+8FGz+K6w6MicZnTgUXpao0HbvcA/sct8OQwFOXg7BQuNEAnknDvQ/a6OZ
 Ag1Ijkv5UQgvFvdTXfZsnp1NrRPvOyu6OkE6WwEhVqxCYgoncNd9n2WM7ZQpicCIQx12
 fRdJXFaM+vt4o642MTlAQMcRlkRLGcBps/NxSlEKaPCkMyW0+504+gY6LYnoKxkicbk5
 A7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9QsFvqQTRAdULmCZfiXhkW8re5GC5pYqh7guL/J7+8Y=;
 b=FRfJrqowKVsgpgDKwWzmTBoqxdeJP5oNIugeV+fr0it/HQq1CT4/XBrPb7mpozRE4i
 EEdiSSCvvz60UskPbtVgGb8JQk1cy7LK+tVwZibpRE7GAR3pUk83vF+bhQI+GGrO/UN1
 az8r5WSjagiUA5d9nrN+z/4EchclE3UVI+tVfBSAUMbmVp5s+EFb7QMbC3SLZYQXsZyd
 oPR6q+TajMuEesluDq8J+qeU/gFMesSFhhGfNAH/6tZWxp7U7Qe5hkrsii3LvxHviJQH
 GSmtzfRjHxo6jUzHzrn3N9IQq7ou63N+QOIQYDRCrjDBIOckM/tSBY2b/kBBK9UUs5O4
 yzvg==
X-Gm-Message-State: AOAM533K1fmAqW4rYLVX9SWVxHZpLnucq+uIxLgcBYiT+f38Fzk56HOn
 ewceONmkYZJq90Td+Pab8Cah7Q==
X-Google-Smtp-Source: ABdhPJx+riMchWimAVBQil4WfLa8buG9wL0Qf0c7pL31zuMhzWCFUWzQMEqJ6aVWvimuFPiXfWahAw==
X-Received: by 2002:a65:52c3:: with SMTP id z3mr1017616pgp.338.1619055666964; 
 Wed, 21 Apr 2021 18:41:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id a11sm412676pfg.124.2021.04.21.18.41.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 18:41:06 -0700 (PDT)
Subject: Re: [PATCH v2 3/7] hw/arm/musicpal: Map flash using
 memory_region_add_subregion_aliased()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419094329.1402767-1-f4bug@amsat.org>
 <20210419094329.1402767-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <28776805-7086-c2a1-6794-9d2cfc7dc684@linaro.org>
Date: Wed, 21 Apr 2021 18:41:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419094329.1402767-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 2:43 AM, Philippe Mathieu-Daudé wrote:
> Instead of using a device specific feature for mapping the
> flash memory multiple times over a wider region, use the
> generic memory_region_add_subregion_aliased() helper.
> 
> There is no change in the memory layout:
> 
> - before:
> 
>    (qemu) info mtree
>    00000000fe000000-00000000ffffffff (prio 0, i/o): pflash
>      00000000fe000000-00000000fe7fffff (prio 0, romd): alias pflash-alias @musicpal.flash 0000000000000000-00000000007fffff
>      00000000fe800000-00000000feffffff (prio 0, romd): alias pflash-alias @musicpal.flash 0000000000000000-00000000007fffff
>      00000000ff000000-00000000ff7fffff (prio 0, romd): alias pflash-alias @musicpal.flash 0000000000000000-00000000007fffff
>      00000000ff800000-00000000ffffffff (prio 0, romd): alias pflash-alias @musicpal.flash 0000000000000000-00000000007fffff
> 
> - after:
> 
>    00000000fe000000-00000000ffffffff (prio 0, i/o): masked musicpal.flash [span of 8 MiB]
>      00000000fe000000-00000000fe7fffff (prio 0, romd): alias musicpal.flash [#0/4] @musicpal.flash 0000000000000000-00000000007fffff
>      00000000fe800000-00000000feffffff (prio 0, romd): alias musicpal.flash [#1/4] @musicpal.flash 0000000000000000-00000000007fffff
>      00000000ff000000-00000000ff7fffff (prio 0, romd): alias musicpal.flash [#2/4] @musicpal.flash 0000000000000000-00000000007fffff
>      00000000ff800000-00000000ffffffff (prio 0, romd): alias musicpal.flash [#3/4] @musicpal.flash 0000000000000000-00000000007fffff
> 
> Flatview is the same:
> 
>    (qemu) info mtree -f
>    FlatView #0
>     AS "memory", root: system
>     AS "cpu-memory-0", root: system
>     AS "emac-dma", root: system
>     Root memory region: system
>      00000000fe000000-00000000fe7fffff (prio 0, romd): musicpal.flash
>      00000000fe800000-00000000feffffff (prio 0, romd): musicpal.flash
>      00000000ff000000-00000000ff7fffff (prio 0, romd): musicpal.flash
>      00000000ff800000-00000000ffffffff (prio 0, romd): musicpal.flash
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

