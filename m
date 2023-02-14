Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7492E696F1F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 22:19:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS2hB-0006IC-NN; Tue, 14 Feb 2023 16:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS2hA-0006HT-1e
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:18:36 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS2h7-0000jO-JW
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:18:35 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 v6-20020a17090ad58600b00229eec90a7fso2436840pju.0
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 13:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zrXOht5ns80AF9o8W2+bNRm3mzNaCmwOMDyhNnNtR2U=;
 b=yPThbyM4PpZkL7EKiGkc2d208Zo8dNdbzcczG96eBMlFDFmPv/kJNG4ScG2GO07IRP
 ifdYQl1NzgplOfMRKjV/rFVwdUJkSIfkbaqu6rKLgIg9Pab1AhG/cvlJL3ibMnrAgNKY
 LkvuHGhiEt+VuyKirigxp3dpRMo0Nsk2sv5Qh9iFo1USQcmBzzB6gjFUWHUZX6IcZ7OS
 dznEE21R1ze87NS7XlVMV0yR3psBtdZNxLM2MfBbxoqsCNkgGtRHGmlRATmB9E6ZAQSm
 MeoU43ByMRH46QvtLXSyfca0aJ9oOFDTbJDRWG+aJqqZ0NQHgUMns1hQ/n1cYma4wcDh
 i3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zrXOht5ns80AF9o8W2+bNRm3mzNaCmwOMDyhNnNtR2U=;
 b=4KOmOaGADIbzIjaWPyitTNMvoVzchLXhzYYFbyaqKOS1TKqJv8g+Z74DDtSHIuLZvq
 axAciQeOa2TNZvsoc7Mu3BLs4RtuFFdqai2xBkxPApQypT+u1cJI9Yv8ueNZz2qk7fWj
 QCsQU+yoFsh+bQsA6sZ86SSx1fkjEZDgNYNODLeM3sWTqbS/034OynfUQSACsPYXCOP2
 ez8+wBGVg8LB2Tpyp8y3WVy6pCJ8om3lxX4y1GiU8Ud1Ja5xvLTvoscHFuQYMTPq3Fvu
 zzH3UQRtMug6WJHNrU85j/mAcanAHn65l/UnXV02/wmGFFrqGsaHi1/pncoQMSmymPFU
 oCSA==
X-Gm-Message-State: AO0yUKVtenmTPmDQUqLhHNTuSuT8IwJBJPOI/M51OvPJrSWKlwkkpQPt
 1YQ1wa7N/FfJQ8wLDjEoglN2zA==
X-Google-Smtp-Source: AK7set+sF8AsUnV13i8UgGj3Rgotls0GRmyX1j1WX4fWv+9jGAeoivlgfhg9ih9iEM8Rza+8LpBtBQ==
X-Received: by 2002:a17:903:1247:b0:19a:b59c:cd4e with SMTP id
 u7-20020a170903124700b0019ab59ccd4emr55113plh.40.1676409511799; 
 Tue, 14 Feb 2023 13:18:31 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 jb11-20020a170903258b00b0019a81a8bb14sm5577832plb.32.2023.02.14.13.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 13:18:31 -0800 (PST)
Message-ID: <9cd7b8f7-9d35-5d2f-d235-9ae4f86758d6@linaro.org>
Date: Tue, 14 Feb 2023 11:18:25 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 07/12] bsd-user: sysctl helper funtions:
 sysctl_name2oid and sysctl_oidfmt
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>
References: <20230214002757.99240-1-imp@bsdimp.com>
 <20230214002757.99240-8-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230214002757.99240-8-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 2/13/23 14:27, Warner Losh wrote:
> From: Juergen Lock<nox@jelal.kn-bremen.de>
> 
> Helper functions for sysctl implementations. sysctl_name2oid and
> sysctl_oidfmt convert oids between host and targets
> 
> Signed-off-by: Juergen Lock<nox@jelal.kn-bremen.de>
> Reviewed-by: Warner Losh<imp@bsdimp.com>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-sys.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/bs

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

