Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE256DBC8E
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:09:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plDwE-0003G4-Ce; Sat, 08 Apr 2023 15:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDw1-0003FO-LC
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:09:15 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDvz-0002v8-64
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:09:13 -0400
Received: by mail-pl1-x633.google.com with SMTP id ke16so1470499plb.6
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680980929;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kVkhMsg2Ce578qMnKNIJ9RXBbO9W4LuZIc+FPAuyOcQ=;
 b=TI69miLRYjoWG1/B+k2/HS60oVzuP5mcpmtUmgp01r2IdVI7VBvEcEHgiuep57U513
 3bl7Y1ckcJEDr5IcLvZpJUAmBZTihe0UpjKutlQWCXk9zGrjECWA2Gq7YFRncbSb6Bxc
 YHNI+VFZReKwMdAVe9Fez+fWVBImm36tMeu5rihjdj4zwFQEjc/4nCalu/53aYgU0xuT
 xIbmz6XwWdKLzpDDMZep0DBghsuZWJ/QcwVfvCgwLqesCVV2uBY3CsHolqLluswr4UNn
 ybZlP1XklTq4KBU807Auw4axjf3qoOrAA0UVKGEO/HOz/EfH8bo7KkEI37EanFfprEP4
 jr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680980929;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kVkhMsg2Ce578qMnKNIJ9RXBbO9W4LuZIc+FPAuyOcQ=;
 b=12hjukA5GYphJKgz5BG6WozRylawJBaAT4QtIUmTyFn15/DM8vvl+1jOEBpYG9P6JE
 zm9prXb6C0NzG05Zj42IlmmykR2YZVUddumEonmgqnDhevQ6hntSP4aTJ2qgyPGVKuMm
 sLdtH40FAMzM0rgU/iN7RH2KTfDIwRNvUE97aHen4b3+aOMS1c1At2GMdixhGh56T6ut
 HpIsVpsnnGJiPVAod/TR5IZgEnE2HNeungG4vQDUX74QBAAiyaGaJwHVdBmTU97H+BKX
 Sx9iBAXb61ppsoPb2i5PtGWTK1h3ePWBCS7IbIVtdRFJIwDtE5fKHoOyziWxsr0buz2H
 j8RA==
X-Gm-Message-State: AAQBX9c7piuk8qg3jhRjvKk5cPYwbPDIzDL6zpkTX1wy8UdC8o6eKuoY
 P3vChHtuvBWWCzDbSrc4CySpxA==
X-Google-Smtp-Source: AKy350ZkagA0CnkT8IVPQkCPXkyIS9WIU91BijBS+uFI1rCAwkW9ig3VJVW74Y8AxP2tb8ED3WlPAw==
X-Received: by 2002:a17:90b:384f:b0:23f:9d83:ad76 with SMTP id
 nl15-20020a17090b384f00b0023f9d83ad76mr3524782pjb.23.1680980928952; 
 Sat, 08 Apr 2023 12:08:48 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:fcd:4458:21c7:367e?
 ([2602:ae:1541:f901:fcd:4458:21c7:367e])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a1709027c0600b001a52dc07f52sm805849pll.309.2023.04.08.12.08.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 12:08:48 -0700 (PDT)
Message-ID: <b9355660-1869-971d-afe6-d4a206232645@linaro.org>
Date: Sat, 8 Apr 2023 12:08:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/16] bsd-user: Move system call include to os-syscall.h
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, kevans@freebsd.org, Brad Smith <brad@comstyle.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-8-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405213612.15942-8-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.113,
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

On 4/5/23 14:36, Warner Losh wrote:
> @@ -98,11 +75,9 @@ struct target_iovec {
>    * sys/timex.h
>    */
>   
> -typedef abi_long target_freebsd_suseconds_t;
> -
>   /* compare to sys/timespec.h */
>   struct target_freebsd_timespec {
> -    target_freebsd_time_t   tv_sec;     /* seconds */
> +    target_time_t   tv_sec;     /* seconds */
>       abi_long                tv_nsec;    /* and nanoseconds */
>   #if !defined(TARGET_I386) && TARGET_ABI_BITS == 32
>       abi_long _pad;
> @@ -120,8 +95,8 @@ struct target_freebsd__umtx_time {
>   };
>   
>   struct target_freebsd_timeval {
> -    target_freebsd_time_t       tv_sec; /* seconds */
> -    target_freebsd_suseconds_t  tv_usec;/* and microseconds */
> +    target_time_t       tv_sec; /* seconds */
> +    target_suseconds_t  tv_usec;/* and microseconds */

Did I miss where target_suseconds_t got defined?
With the context provided, you remove target_freebsd_suseconds_t but don't replace it.


r~


