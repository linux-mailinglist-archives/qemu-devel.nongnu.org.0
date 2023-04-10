Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C4F6DCB3F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:59:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plwiM-0005lU-6w; Mon, 10 Apr 2023 14:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plwiK-0005lC-Jl
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:58:04 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plwiJ-0002oC-2Z
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:58:04 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-632384298b3so2742950b3a.0
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681153081;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=26xst+orYVb3brES0g/3y5QPxSZqc5AZBX+aA21O5nk=;
 b=qqjbOITVLw38WV0gIjOFKLvFw2VzSc9H0kFi994yc04EhEDs+4u/U7ewjGtkSF7LK+
 LvUuWX0dKUzWBbDT3BDMfhI6w6tioZF30/c2zti2DlVAu7IXLXP+sx06HUpAyoyoN96l
 RbL0+eMDXlTUwrLG6AHcPKyLtJU96spVSujgh/CYel+v2pNR949eF7MAsRLSDIG2wpoL
 i0w55UCtToPGOFdYm9pGWDOJ27tyUq+k9z3hmCqxE/loC7zGc85NPWGayeib6LCHTyUE
 n66EqJ0pYXSbUv5SSS+cWLaX8szY2K90bobnd4kgvGV2ORycktRMEg1A6lMkHRO8UFDD
 uGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681153081;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=26xst+orYVb3brES0g/3y5QPxSZqc5AZBX+aA21O5nk=;
 b=CStj/vhWsGBqhbpMog5PFrQYX/bmLq9+wTh2nCflC99dUkHJTVOckzQATdK1Ni12o8
 AckCy4yTJdJiwYolW6Ej8/uGrtCMG1gmMAderCDiwUJ2EPvHPyQM0HFdYywvw6fr5Jcp
 iDh87CC0Z1MjpbvN2w6RvlHtYscXUvy5py3+53zGP1S31mpf4xUi8nEbtmQ19MWU2808
 WTtfE6ZaJx0eWbBDnIwnJ10PkczWvdYeDQRs4FVGSqldwA/6LqTcsETBLWvbLyo9uIqr
 LSM+e+3CyeqtSx9blz5fNCkVqz18kcFU9rMpaGWOld/rtqf2sbnq35trzbAhmsG5nzMz
 8vgg==
X-Gm-Message-State: AAQBX9dR+Ylo5zQxBYGrQPQpg6Qogr7WfiOHrIM6RNAjkOOvzKEtZu6P
 6C0+Er822hPxLhMdmh8CLlWP7A==
X-Google-Smtp-Source: AKy350bDUSyBSBm6wG3hg7XOoZP+TIbvVHGnX6agmokXZN5YvbA8K4YwllJgAWXDn9RWceNPWwpEkA==
X-Received: by 2002:a62:5209:0:b0:636:e0fb:8c45 with SMTP id
 g9-20020a625209000000b00636e0fb8c45mr5547452pfb.16.1681153080913; 
 Mon, 10 Apr 2023 11:58:00 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:ba90:b5d9:e085:5a6c?
 ([2602:ae:1598:4c01:ba90:b5d9:e085:5a6c])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a62be13000000b006249928aba2sm8187448pff.59.2023.04.10.11.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 11:58:00 -0700 (PDT)
Message-ID: <6331ef58-d7bf-8938-7e22-a0a625f8fecd@linaro.org>
Date: Mon, 10 Apr 2023 11:57:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/16] bsd-user: Move system call include to os-syscall.h
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, reinoud@netbsd.org, riastradh@netbsd.org,
 ryoon@netbsd.org, jrtc27@jrtc27.com, kevans@freebsd.org,
 Brad Smith <brad@comstyle.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-8-imp@bsdimp.com>
 <b9355660-1869-971d-afe6-d4a206232645@linaro.org>
 <CANCZdfqtx5kDmVK7C_8pBDTMu88u1BeZQaS9RyjG9_GzsuBPoA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CANCZdfqtx5kDmVK7C_8pBDTMu88u1BeZQaS9RyjG9_GzsuBPoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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

On 4/10/23 10:12, Warner Losh wrote:
> 
> 
> On Sat, Apr 8, 2023 at 1:08 PM Richard Henderson <richard.henderson@linaro.org 
> <mailto:richard.henderson@linaro.org>> wrote:
> 
>     On 4/5/23 14:36, Warner Losh wrote:
>      > @@ -98,11 +75,9 @@ struct target_iovec {
>      >    * sys/timex.h
>      >    */
>      >
>      > -typedef abi_long target_freebsd_suseconds_t;
>      > -
>      >   /* compare to sys/timespec.h */
>      >   struct target_freebsd_timespec {
>      > -    target_freebsd_time_t   tv_sec;     /* seconds */
>      > +    target_time_t   tv_sec;     /* seconds */
>      >       abi_long                tv_nsec;    /* and nanoseconds */
>      >   #if !defined(TARGET_I386) && TARGET_ABI_BITS == 32
>      >       abi_long _pad;
>      > @@ -120,8 +95,8 @@ struct target_freebsd__umtx_time {
>      >   };
>      >
>      >   struct target_freebsd_timeval {
>      > -    target_freebsd_time_t       tv_sec; /* seconds */
>      > -    target_freebsd_suseconds_t  tv_usec;/* and microseconds */
>      > +    target_time_t       tv_sec; /* seconds */
>      > +    target_suseconds_t  tv_usec;/* and microseconds */
> 
>     Did I miss where target_suseconds_t got defined?
>     With the context provided, you remove target_freebsd_suseconds_t but don't replace it.
> 
> 
> At the very end of the first file bsd-user/freebsd/os-syscall.h I define it.

Ah, there it is, thanks.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


