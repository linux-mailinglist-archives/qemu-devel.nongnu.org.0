Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765DC69700C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 22:50:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS3B8-0003f6-2H; Tue, 14 Feb 2023 16:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS3B5-0003dn-W3
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:49:32 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS3B2-0004gE-7A
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:49:30 -0500
Received: by mail-pj1-x1029.google.com with SMTP id mg23so9826013pjb.0
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 13:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j7nmODxCDB5yNtGTjJX8EKrHi2YmU1H54VUpPlLy6Eg=;
 b=BAvm9tSpxRf30k0eUW9ZdV2yb7mXyOtvA1bh/5ir114jsPC0DjMSQQWZg0bcNOi6EO
 xh2AhlM0IGYmrpVzvaCJF7oLUkh629wf2TK/OfaIrpF3W50BcQcpefojU4uT5Z44ofcL
 KKuioHHQUkMMBFHRz6x397IJ5Z2XjWG8WpMBQsz0kLsNlpFOw/dksALt15ocpXn+A/t5
 Jj4e4BB+cXIm0FTTvOOlHXyvuf28dhcUGW96wbVcNl2aAAYES1L75aeF/h+pBUuIgxO4
 YAZ05z1edxMW7Yhv29lR8h3PCh/Fs5gBpwoO43ue4yq4/XpbDJp47g7nnVPltQDGbVOp
 x9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j7nmODxCDB5yNtGTjJX8EKrHi2YmU1H54VUpPlLy6Eg=;
 b=fOF0ivAO4EQV9epE6/2XPbqLFK+yNHHrAxrV0Xjx0MmotQ8dKzjsuG/af+7054fy1k
 JZH1CXAJkdhugVUoNntfVrrE+Ihmb9KpPbiHyZrS6ZC9FpEQ4QcAfSzdUxQFnpsuAAwD
 4jInfZcYZ+aZ7LMJunVsP4u5HpxBJYx5MQV7WjWfVzeC7tFeuAElxaYJhoDEysMccdCQ
 oI+GUw/2yh+x+TWH+x6XDH0Trrs3e3C29+gT8FbhiivNIe0foxui5ygkofSujMawzP7G
 pgIPQrcB9HIoCHrNvav3R1qhgh9mkKVDZqOBY2+dAt8YpeRR6ZSTJdcuOiu2MAhUIjJg
 et7w==
X-Gm-Message-State: AO0yUKUin451yegTnOSe2IYG9cHMDrZsyu5UjzMSfQVSLvjFCD5fgZvR
 LbeTdoHSwNX3sLNbhii2wprdog==
X-Google-Smtp-Source: AK7set+qEuru7+3zx/Aq20SvgmcWKQgHfdSlHs3xXzL07084tL8VPn8vGREmVHs/cqDSBtxjgaFh+w==
X-Received: by 2002:a17:90b:4d07:b0:234:35bb:6190 with SMTP id
 mw7-20020a17090b4d0700b0023435bb6190mr310167pjb.27.1676411366677; 
 Tue, 14 Feb 2023 13:49:26 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 cu11-20020a17090afa8b00b00230c8484fbfsm5942479pjb.55.2023.02.14.13.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 13:49:26 -0800 (PST)
Message-ID: <22306900-591c-2fd6-f573-4e011562a1eb@linaro.org>
Date: Tue, 14 Feb 2023 11:49:18 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 12/12] bsd-user: Add -strict
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>
References: <20230214002757.99240-1-imp@bsdimp.com>
 <20230214002757.99240-13-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230214002757.99240-13-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
> Most of the time, it's useful to make our best effort, but sometimes we
> want to know right away when we don't implement something. First place
> we use it is for unknown syscalls.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-syscall.c | 4 ++++
>   bsd-user/main.c               | 5 ++++-
>   bsd-user/qemu.h               | 1 +
>   3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
> index 179a20c304b..e2b26ecb8dd 100644
> --- a/bsd-user/freebsd/os-syscall.c
> +++ b/bsd-user/freebsd/os-syscall.c
> @@ -508,6 +508,10 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
>   
>       default:
>           qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
> +        if (bsd_user_strict) {
> +            printf("Unimplemented system call %d\n", num);
> +            abort();
> +        }

Still don't like the printf.  I suggested alternatives against v1.

r~

