Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24B95A29E2
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:46:36 +0200 (CEST)
Received: from localhost ([::1]:38438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRabU-0004Q1-01
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRaDU-0004CY-LN
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:21:49 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRaDR-0005gH-Gg
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:21:47 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y141so1688424pfb.7
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 07:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=FOB0ayffQKy3bCCXMCqEpdU9sU12Fi/LURAoulskXLA=;
 b=Akir1WYytXHe05IRXb9s9W97z4hqZP8ArAKKz0G2lrTXYEMdV4bDHMKKh2PBQRn2Mw
 1+cynwyNRkH5z5iCzpXM3wqTqnR4eQlXWD0bcl3vsh3MilJE+1lP1fXtNWbbcCabTaFx
 LPP1DcuYXhOlxbfKFf6bEE/ZMpUhO19O7SBY0jd/802aEmYvzMrNlpFO7kVRbpvEXgLz
 9D+C1xt9XbS9rsWRIdy9B/0oyO+6j3I8R2Tj8NXmq5fhDRB7kew/WvkE6CdfU0GoJTFF
 5L4IM/G3J1UqE9Gl6Jbu8ewCRIGcSBBEcJwxQGnEjBqdBAxeko51e8J3ofY8tBwMxDut
 cVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=FOB0ayffQKy3bCCXMCqEpdU9sU12Fi/LURAoulskXLA=;
 b=IeoCg3VkPq2S7uh4twha+Hyw4GAR7nQneOhIbhpguVySxwt8IubEBP6G7LWdlc9Tj9
 WFKn2WtUlnzAENdp5EUNUH8bp1n+zId8dI31v+0RLF3mXsX0js4WZsLmrmsINF8Y8EiO
 VCSUarf8P3ddqqjTlOXE+fYKVgTRdcDuc+nlxC5IQcnA0O8QLnNHmWcXxo/vmFitHDlz
 vwIwkxGWXvQTmeQaDNoNw3W+vXizvB8oEfC4NGAM5nZIWerhTbZLeq6ykKNrgIDHrUys
 HV9kpnRDct2/4zWdX2bLXY4OwKDxbcwXXqARSuTObTLZdyGrlET+B8V/dHANJrlSSoDF
 1NhQ==
X-Gm-Message-State: ACgBeo1x96MdrtCV9S8lObBoXeQYdYIrgSUXrjeMpsXYPixUJVCO+obH
 AMh02ObU0Xm0dc4r4+e/R/WeRQ==
X-Google-Smtp-Source: AA6agR6B8AqCiZ79pO/NhqKL0fzQ0szPwO4VNuZvRxLdCzfJdQ8KPVpwEUOLscGAntWYR7VRhAa/2w==
X-Received: by 2002:a63:83c8:0:b0:42b:908c:710 with SMTP id
 h191-20020a6383c8000000b0042b908c0710mr79127pge.195.1661523703970; 
 Fri, 26 Aug 2022 07:21:43 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f?
 ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a17090301c100b00172e19c2fa9sm1701383plh.9.2022.08.26.07.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 07:21:43 -0700 (PDT)
Message-ID: <156aec1f-65bc-ba76-48ba-c9a389e8816d@linaro.org>
Date: Fri, 26 Aug 2022 07:21:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: use 'max' instead of 'qemu32' / 'qemu64' by
 defualt
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
References: <20220826113900.794046-1-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220826113900.794046-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/22 04:39, Daniel P. Berrangé wrote:
> The 'qemu64' CPU model implements the least featureful x86_64 CPU that's
> possible. Historically this hasn't been an issue since it was rare for
> OS distros to build with a higher mandatory CPU baseline.
> 
> With RHEL-9, however, the entire distro is built for the x86_64-v2 ABI
> baseline:
> 
>    https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level
> 
> It is likely that other distros may take similar steps in the not too
> distant future. For example, it has been suggested for Fedora on a
> number of occassions.
> 
> This new baseline is not compatible with the qemu64 CPU model though.
> While it is possible to pass a '-cpu xxx' flag to qemu-x86_64, the
> usage of QEMU doesn't always allow for this. For example, the args
> are typically controlled via binfmt rules that the user has no ability
> to change. This impacts users who are trying to use podman on aarch64
> platforms, to run containers with x86_64 content. There's no arg to
> podman that can be used to change the qemu-x86_64 args, and a non-root
> user of podman can not change binfmt rules without elevating privileges:
> 
>    https://github.com/containers/podman/issues/15456#issuecomment-1228210973
> 
> Changing to the 'max' CPU model gives 'qemu-x86_64' maximum
> compatibility with binaries it is likely to encounter in the wild,
> and not likely to have a significant downside for existing usage.
> 
> Most other architectures already use an 'any' CPU model, which is
> often mapped to 'max' (or similar) already, rather than the oldest
> possible CPU model.
> 
> For the sake of consistency the 'i386' architecture is also changed
> from using 'qemu32' to 'max'.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   linux-user/i386/target_elf.h   | 2 +-
>   linux-user/x86_64/target_elf.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/linux-user/i386/target_elf.h b/linux-user/i386/target_elf.h
> index 1c6142e7da..238a9aba73 100644
> --- a/linux-user/i386/target_elf.h
> +++ b/linux-user/i386/target_elf.h
> @@ -9,6 +9,6 @@
>   #define I386_TARGET_ELF_H
>   static inline const char *cpu_get_model(uint32_t eflags)
>   {
> -    return "qemu32";
> +    return "max";
>   }
>   #endif
> diff --git a/linux-user/x86_64/target_elf.h b/linux-user/x86_64/target_elf.h
> index 7b76a90de8..3f628f8d66 100644
> --- a/linux-user/x86_64/target_elf.h
> +++ b/linux-user/x86_64/target_elf.h
> @@ -9,6 +9,6 @@
>   #define X86_64_TARGET_ELF_H
>   static inline const char *cpu_get_model(uint32_t eflags)
>   {
> -    return "qemu64";
> +    return "max";
>   }
>   #endif


