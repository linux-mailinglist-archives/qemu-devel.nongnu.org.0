Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7575B4A6869
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:16:38 +0100 (CET)
Received: from localhost ([::1]:54650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF2O3-0000V1-Il
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:16:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0iO-0007Qh-Ek
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:29:28 -0500
Received: from [2607:f8b0:4864:20::102d] (port=35808
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0iM-0003Eu-Bn
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:29:27 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 z14-20020a17090ab10e00b001b6175d4040so4732543pjq.0
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 13:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ylXGVuymAXGM7ORQ72GkqFwyhTjV+gUEeuKppyB+LoM=;
 b=iDJ8LOVpmeHlZcfRkmFvD9su6KY0XjOTmwnK9b6JapShYSzHhnXsTMB5/p8vU0jm4n
 MSDAyQ8PEEeFf0RTogmDD9pKu2ljPpCGnQAh6coRkPNY5JiCEi4VAJVDw+ZxBwU1vjGo
 xyNMqXTf93fvOyEHt9g99yDyCbHsiMiqy5aecfHhi3a9z7d1+yBrgfETrLg1V0SkVQZ8
 JaX7hAMLvm1OSWAhv6mJD5cDjRJVJi7PBFRMFaRZy3vSRj9vuSAokajMH/kPf2JdTZqu
 dDmqvn3X4BOs/5hDDmGQFsYtNn7JdNVMErnFVKJ+o82AyAEq6gvhSg4a+97g6kD9MBaG
 BwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ylXGVuymAXGM7ORQ72GkqFwyhTjV+gUEeuKppyB+LoM=;
 b=Vz8V9EO6TGjH9uWachmOVTWk4B4+4qPZmOvidZxn3csMNQeM7D83uFSzTKxf89oFVa
 bdRNWd6+RWZWcm2ULmnn8++CZr2nZGd8vqbn4JAaWJ+Q7Y9PGH5epwy2+7raL5YiSNak
 lXh6N+P7T43lvZ5rhZTnShDLVfdJsBnPvdE2mLnk17t5W39KRhFmuQ8Ha4EccAUUy2BK
 590DM4P6FB4FFGGwdbi3XXjLS578WCA2RGnQL7wj1U5+npmuX2DUPmm6HbLGKAV5nb+X
 twvPqW0lhEVvNPWv82obEY+U/7+82cu/YgGKAD2MTXjW3RM1JhNmsjqgVQLi71Ia+n4d
 Kp+Q==
X-Gm-Message-State: AOAM531Sx6Zm72UdGNMuF+YkX9oRRFt4EDoiuq1rL0Ue7tjKYKuN59I3
 m1joey3IE9N7V7O3nsYnoYCKUw==
X-Google-Smtp-Source: ABdhPJweEoa4tKQxqq9TVXeb9r1Sgus9Pnf3bmMyodARSqYhfAWyxdOntXfKRe8c5l6i+j1U8R4qcQ==
X-Received: by 2002:a17:90b:255:: with SMTP id
 fz21mr4545060pjb.226.1643750964541; 
 Tue, 01 Feb 2022 13:29:24 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:4f14:faaf:dae:66e4?
 ([2001:8003:3a49:fd00:4f14:faaf:dae:66e4])
 by smtp.gmail.com with ESMTPSA id s15sm23769380pfg.145.2022.02.01.13.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:29:24 -0800 (PST)
Message-ID: <b5783207-6e23-d8c7-9534-8de5606cc69e@linaro.org>
Date: Wed, 2 Feb 2022 08:29:18 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 15/22] bsd-user/freebsd/os-syscall.c: unlock_iovec
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-16-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-16-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>, def@FreeBSD.org, jrtc27@FreeBSD.org,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:14, Warner Losh wrote:
> Releases the references to the iovec created by lock_iovec.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-syscall.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
> index c21759ae7ce..d49945f0fcc 100644
> --- a/bsd-user/freebsd/os-syscall.c
> +++ b/bsd-user/freebsd/os-syscall.c
> @@ -167,6 +167,29 @@ struct iovec *lock_iovec(int type, abi_ulong target_addr,
>       return NULL;
>   }
>   
> +void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
> +        int count, int copy)
> +{
> +    struct target_iovec *target_vec;
> +    int i;
> +
> +    target_vec = lock_user(VERIFY_READ, target_addr,
> +                           count * sizeof(struct target_iovec), 1);
> +    if (target_vec) {
> +        for (i = 0; i < count; i++) {
> +            abi_ulong base = tswapal(target_vec[i].iov_base);
> +            abi_long len = tswapal(target_vec[i].iov_len);
> +            if (len < 0) {
> +                break;
> +            }
> +            unlock_user(vec[i].iov_base, base, copy ? vec[i].iov_len : 0);
> +        }
> +        unlock_user(target_vec, target_addr, 0);

Not quite right.  Any vec[i].iov_len == 0 ought to be skipped, as per the previous patch, 
where we force those values for bad_address and target_vec[i].iov_len == 0.


r~

