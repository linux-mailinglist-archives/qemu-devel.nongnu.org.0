Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50FC695985
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 07:57:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRpFq-0001tk-Ih; Tue, 14 Feb 2023 01:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRpFk-0001sn-MA
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 01:57:24 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRpFi-00035U-6P
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 01:57:23 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so10771131wms.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 22:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oueOyWNblWKsvE2tnQ3vfm+X4SWojRFbKqOCIExHV80=;
 b=Nx99lFJwQs+mn2vLRsGbpdZdiVrw2E8qIchyqBgdHTzrzvL9i2wPR48r4hnjWltOUx
 65UCz/uaJKuySXOealugwdtAeQRW/M+sCdDwF5F/ZEjOhgauaEaRSQGMZDI9ovhKRW1m
 g6OGkvY/wgD9VRrpK1a8TDVjRjd7NJ8FNeNW7Rcp5TdGS4yIXX58qBBwjTZNq+qF4Chh
 w4Wurl6zVYuA6bC/W49mtN/I/5tljDKY6WY3LFSR3sdFePsYd//eLqkOLOzLh/HNnOtF
 OMc4C84atK/BwSdVDK6TaX/1iOwomaWhD5mfWYl0TsJtv9GcxLJpMRijNxid4d/ANAF6
 lRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oueOyWNblWKsvE2tnQ3vfm+X4SWojRFbKqOCIExHV80=;
 b=wV+65CCLKPVFPu4yG5HMX9cyAuMeQUZUHrQ2eRb8o9H5IMN5HyuqqZbf5Qkau2Np6t
 jDT7NFqBjoCw+5G7Wm3o6kNu9Is+AWkzSPWX7Q7wpnJD0S/p8u/yFN8e0nw9WHSWu03u
 Tqh2lWNNVjfScyj997fmEYEegEzHDnyP7me/O+7Fx4TScbv0iPsNiIrENNzd188XHzqz
 26YVFPeDb9nkFZ7IUWUD2t7MCEr2K3YiFU2sYuJcw7wneNfrPlvV4HNehYeS3HWztVcW
 1Lu7yD4ELrhVkAybsOzkDJp43sunLNjTlKQiTLHQd9ITE6QWm7Hz9I0Tdph2R2lVFkpf
 bJLg==
X-Gm-Message-State: AO0yUKWCEqW18Nuyl+dyIgGq7Qwj2h0nN0MiiJiBwMQqqmAqMSm5jKsW
 NhtW3TSrGlKZSskrB5kCNuQbAg==
X-Google-Smtp-Source: AK7set9A/PSs5iBfGYpw9NKuSSU3I/0vUC+yUoNMXQb2/tPyK8ToEIkxlLrvjevx+7PQvE4igF48yw==
X-Received: by 2002:a05:600c:13ca:b0:3df:50eb:7cd9 with SMTP id
 e10-20020a05600c13ca00b003df50eb7cd9mr1044587wmg.14.1676357840218; 
 Mon, 13 Feb 2023 22:57:20 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003daf681d05dsm17268289wms.26.2023.02.13.22.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 22:57:19 -0800 (PST)
Message-ID: <b596eac0-6096-5d2c-def6-bdaac5ca3d63@linaro.org>
Date: Tue, 14 Feb 2023 07:57:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 12/12] bsd-user: Add -strict
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 kevans@freebsd.org, f4bug@amsat.org, Thomas Huth <thuth@redhat.com>
References: <20230214002757.99240-1-imp@bsdimp.com>
 <20230214002757.99240-13-imp@bsdimp.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214002757.99240-13-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 14/2/23 01:27, Warner Losh wrote:
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
>           ret = -TARGET_ENOSYS;
>           break;
>       }
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 41290e16f98..ba0ad86ad28 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -91,9 +91,10 @@ unsigned long reserved_va = MAX_RESERVED_VA;
>   unsigned long reserved_va;
>   #endif
>   
> -static const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
> +const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
>   const char *qemu_uname_release;
>   char qemu_proc_pathname[PATH_MAX];  /* full path to exeutable */
> +bool bsd_user_strict = false;	/* Abort for unimplemned things */

"executable" (pre-existing), "unimplemented".

>   unsigned long target_maxtsiz = TARGET_MAXTSIZ;   /* max text size */
>   unsigned long target_dfldsiz = TARGET_DFLDSIZ;   /* initial data size limit */
> @@ -396,6 +397,8 @@ int main(int argc, char **argv)
>               trace_opt_parse(optarg);
>           } else if (!strcmp(r, "0")) {
>               argv0 = argv[optind++];
> +        } else if (!strcmp(r, "strict")) {
> +            bsd_user_strict = true;

As a debug feature, can't we just use some getenv() var?

>           } else {
>               usage();
>           }
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index e24a8cfcfb1..22bd5a3df42 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -113,6 +113,7 @@ typedef struct TaskState {
>   
>   void stop_all_tasks(void);
>   extern const char *qemu_uname_release;
> +extern bool bsd_user_strict;
>   
>   /*
>    * TARGET_ARG_MAX defines the number of bytes allocated for arguments


