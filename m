Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A6366D7A1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 09:11:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHh3a-0006hX-TB; Tue, 17 Jan 2023 03:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHh3K-0006hB-9S
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:10:42 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHh3I-0000xM-En
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:10:42 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so7473869wmc.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 00:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6JTmHejIQqwqDUL8/FbLlby9NIBbCPxWdxI17sAZz88=;
 b=IGRRo666bJVPD4kkqFG+BQxEy7TG26l+56IyjpuorKWmBtkeBuC3JQjKpAFLOuGqy3
 5Rr+3xF4FXEQLQdomCYLqzvPsiNP9ErVAz/IrgWpFhRuqshFWvPAAOapvvU5J9MC/JTJ
 m1brYf73hgMSqQa0Zpo5vEWRKYyhE8npsIWjr6o+5C0+c8paa5K0knltT1OvZTnYy/sB
 WTTsxUrPHF6n3K/iyf3GE6Vf9noWzgktNco+EIQUhBnt5+1FW/AWw0DyhlCQJ+brSTec
 NOWQUYzM/hyQSUj5NYNhHnr8ZzjbNXQf4PiF63+b2m44qFgLxfYWeeyYadk3eAT22sC/
 TS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6JTmHejIQqwqDUL8/FbLlby9NIBbCPxWdxI17sAZz88=;
 b=I3A1eNoiVmyie/3p95LbDyTc8brXr9Keljo13gYQMwQZwjuS9T7sKIUXmCsD1Rk+t3
 yB/DftcmFBY06zh5XcnzCbSdHIpe4ZNDa2w6LFBmtsydM/1AD5hd4tOW7Bsr92SkL/eP
 WvELe4LlMfRno/zrQMjsvewlw3/2ajvrLUxytOidzuoi4ByHGNYAkFqo5gP/OLRTECbu
 b8P21nWRM4dU4BQ+TtKLvkj9UYZCxBVL3se6mGxktMe1oFhXNvER0vw9gvwDHWhuUWdr
 cYUoxsMKvBzvrWeF5juazCv3a/cko9Exwy8ieMtLXM/fXxP4o4B+MiVG9o+5yh8pR0f8
 ZvZw==
X-Gm-Message-State: AFqh2kouJ5VJQDavx9xl/2mxmcpmiZbnl8a1snYCjvZU0xxtXEQSkDNw
 2ezVRFFh8IYP3HaIsOs3tfKuLw==
X-Google-Smtp-Source: AMrXdXuTsf4L4fSU5Njx46iCuYjfzTVCE39JDsF3IiLrmzL/owIyoj8nrFbJvWqWejrqQv5sDK8DGQ==
X-Received: by 2002:a05:600c:1609:b0:3db:12a:5e65 with SMTP id
 m9-20020a05600c160900b003db012a5e65mr2166831wmn.4.1673943039120; 
 Tue, 17 Jan 2023 00:10:39 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f7-20020a5d6647000000b002bbeb700c38sm22981452wrw.91.2023.01.17.00.10.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 00:10:38 -0800 (PST)
Message-ID: <8ec3abf5-f4aa-db40-cb7e-2f5733d93de3@linaro.org>
Date: Tue, 17 Jan 2023 09:10:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/4] vl: catch [accel] entry without accelerator
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
References: <20230117080745.43247-1-pbonzini@redhat.com>
 <20230117080745.43247-2-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230117080745.43247-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 17/1/23 09:07, Paolo Bonzini wrote:
> While QEMU catches invalid -accel command line options:
> 
>      $ qemu-system-x86_64 -accel foo=bar
>      Accelerators supported in QEMU binary:
>      tcg
>      xen
>      kvm
> 
> the same is not true of configuration files, which instead crash.
> Avoid a SIGSEGV and return an error instead.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1439
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   softmmu/vl.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 9bd0e52d016a..b6deaee52da4 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2204,14 +2204,18 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
>       int ret;
>       bool qtest_with_kvm;
>   
> +    if (!acc) {
> +        error_setg(&error_fatal, QERR_MISSING_PARAMETER, "accel");

s/&error_fatal/errp/ ?

> +        goto bad;
> +    }
> +
>       qtest_with_kvm = g_str_equal(acc, "kvm") && qtest_chrdev != NULL;
>   
>       if (!ac) {
> -        *p_init_failed = true;
>           if (!qtest_with_kvm) {
>               error_report("invalid accelerator %s", acc);
>           }
> -        return 0;
> +        goto bad;
>       }
>       accel = ACCEL(object_new_with_class(OBJECT_CLASS(ac)));
>       object_apply_compat_props(OBJECT(accel));
> @@ -2221,14 +2225,17 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
>   
>       ret = accel_init_machine(accel, current_machine);
>       if (ret < 0) {
> -        *p_init_failed = true;
>           if (!qtest_with_kvm || ret != -ENOENT) {
>               error_report("failed to initialize %s: %s", acc, strerror(-ret));
>           }
> -        return 0;
> +        goto bad;
>       }
>   
>       return 1;
> +
> +bad:
> +    *p_init_failed = true;
> +    return 0;
>   }

