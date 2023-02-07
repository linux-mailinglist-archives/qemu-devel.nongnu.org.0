Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E4568D17C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 09:33:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJOc-00032s-Vo; Tue, 07 Feb 2023 03:32:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPJOa-00032V-LU
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:32:09 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPJOZ-0001FH-2m
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:32:08 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so12571941wmb.2
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 00:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ia/DMbJ2iguUm5YYPRpsgEBmLrJb1kLJzOvfh3PI+1k=;
 b=hCJwrDoQmWwZkoGHZpnxYJ+sTuyi4uY5BaHV+/7N47C5p9lthNjDNtWx3Psieergss
 Yx8pZ1EzFsTnzjbC1AJoMkDG3kmEzygifVzF/8eKkLbHlqVfZ9ftC3+UzaCcq8YUulGG
 ABAhDfOYq685Rqx1Mz0SmnXHx9rJtOBZ3+LbO2rK381IoZdqHau27P5/iRRHidMO/2MS
 0fNgWufm0YRvB6E64bDGvLbS5QqgZyyUuIHceUzRKUHFlGYWwey0gLZdkkuE+0acCg1g
 k3pUwlB4ir9PMl4lnfikTu7Ovkuc/xpRV3kwiS1amZs+faML0aJi9XdC2skY/tWowWZI
 wEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ia/DMbJ2iguUm5YYPRpsgEBmLrJb1kLJzOvfh3PI+1k=;
 b=b/UpMO9ZyY8JHpsf3M7fQCXx+cjI8yc7t3SwOE9ei+SGet1l5kORYK804HZvxMCUsC
 wj2F3znZRSKzZw640kfpZByRQmQPU8aEovdW0aJhkSkGE3li9fvDxGCApo1r64I0/69G
 xOnMDoskmlbjQn1Eibi/7bZDvXGxkbaAGf61uVGJ/sQuRKEMe6NxrBbzIcBGoQjRGwmw
 O+n4S0xPcRvEop2DDZ6ce+zeZ7EJsVxXhrOXJKRCC3I7BX9robXX+CpCxWjVnYNgb+II
 CHoW+68udBjssenmpZOUDVxLgUt6VThCISc6XSWdwRjbZ1Dd3oVdPQNqV+UumsMT1TD8
 NpzQ==
X-Gm-Message-State: AO0yUKWE0fFJFEtj+EENVL4YGQtzdIhK3H2kncaQcjF3tgKc9cGXLv3F
 ws3a79MnA5mcyheLV/A1q44mPA==
X-Google-Smtp-Source: AK7set/N7/F+tloX9pCnxJMmPfml57dH+efbobI8knCywxCT5nDjvDh3IBcUSY8NEfBU8bBJVE+MtA==
X-Received: by 2002:a05:600c:18a0:b0:3df:b5ae:529f with SMTP id
 x32-20020a05600c18a000b003dfb5ae529fmr2194206wmp.31.1675758725251; 
 Tue, 07 Feb 2023 00:32:05 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c4f8600b003daf672a616sm13984043wmq.22.2023.02.07.00.32.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 00:32:04 -0800 (PST)
Message-ID: <0cff7e74-c230-2979-9643-9f108809c7d6@linaro.org>
Date: Tue, 7 Feb 2023 09:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 02/12] dump: Improve error message when target doesn't
 support memory dump
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, jiri@resnulli.us, jasowang@redhat.com,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, zhanghailiang@xfusion.com,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-3-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230207075115.1525-3-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 7/2/23 08:51, Markus Armbruster wrote:
> The QERR_ macros are leftovers from the days of "rich" error objects.
> We've been trying to reduce their remaining use.
> 
> Get rid of a use of QERR_UNSUPPORTED, and improve the rather vague
> error message
> 
>      (qemu) dump-guest-memory mumble
>      Error: this feature or command is not currently supported
> 
> to
> 
>      Error: guest memory dumping is not supported on this target
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   dump/dump.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 279b07f09b..80620da40d 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1854,7 +1854,8 @@ static void dump_init(DumpState *s, int fd, bool has_format,
>        */
>       ret = cpu_get_dump_info(&s->dump_info, &s->guest_phys_blocks);
>       if (ret < 0) {
> -        error_setg(errp, QERR_UNSUPPORTED);
> +        error_setg(errp,
> +                   "guest memory dumping is not supported on this target");

"Dumping guest memory is not supported on this target"?

>           goto cleanup;
>       }
>   


