Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F5F68DC27
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:53:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPL2-0005BU-7G; Tue, 07 Feb 2023 09:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPPL0-00059Y-9o
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:52:50 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPPKy-0004Oc-Nr
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:52:50 -0500
Received: by mail-wr1-x429.google.com with SMTP id y1so13828858wru.2
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xk0cwIQxPWdOTJuQoWiUmMjZ6LrN0O5frCZ9TFyx+PA=;
 b=UAm8DWgxOd3VbFhy4gy345U0K3QzKd8eqU17M3Oaj4YbxIMzZ2QrQ3HCPVZLWaZ7Xl
 hhyxa1XjqtX4QfjScOI3Ka7G8vD+JTaWu2c2LMM/o+/jtgYwSTOw25Vp9iZkgDNRFrGx
 yS6csanB4492NDK3Y1Qwm/KFvnV27CAXBVPa5L8koeiCSITXPpgrLTiLs8NVl/xJLlC/
 ZtoJuntWxWjIDC9Cyx0/tGZqaY4eOIHGRKUsQBNakG874B9IKLZHN2VvNpUH3JBKQO2D
 tTJ+LRhBPFwr+Nr4kvTyHjahDnB4OVqBmsrTX4yuiOzoyISbjVc4xyFW44xKovaDCw8m
 nUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xk0cwIQxPWdOTJuQoWiUmMjZ6LrN0O5frCZ9TFyx+PA=;
 b=baPR9BQhYis8a0GE2qT9PqcjUyPcJq28Q5jr66sRpEuF+C/9sJChr0MPTZZn1J0PAr
 OsCletBdwkMpf0xowK7J3+mqawnFKiOZcR6Nw2sa7vI05uFZ0pxRXfUK3ItE+MyCoLO9
 /VPePf3h+zC5h0WpY7nv03XAhXXRhi3RPbPSOxAGk8NQsM+HtxXXuoGWIy+vbWRiML0Q
 6sRwDlvFP9gJugjkObuXMz8V7LOzVxRnvuiPD0NnXCL1eRBiQi5c3L4nZqvjIy9za4Vd
 ooEYQrOM83xf3DUzNdDa6DISKEPkwsAv4vfKAQM9moTGZHhIu/g77DxXL/c6i7g34R/F
 ni/w==
X-Gm-Message-State: AO0yUKVQsxmTdkQcLsf8eMP3IBt3i9bDH3c2pJ1OBnLXT67FXeB3gAT/
 HIffe/lRZP6RP3H0oRae2Scheg==
X-Google-Smtp-Source: AK7set81Ih1XBo2E2rqi/+nUkG9svKxzZzn0N5UcYD+XMCeXTnQ6D+4Fn6a0SZ3dZGUBuz2GQAVq8Q==
X-Received: by 2002:adf:ead1:0:b0:2bf:c0e4:1bc5 with SMTP id
 o17-20020adfead1000000b002bfc0e41bc5mr2715929wrn.56.1675781566191; 
 Tue, 07 Feb 2023 06:52:46 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c12-20020a5d4ccc000000b002bddac15b3dsm11283316wrt.33.2023.02.07.06.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 06:52:45 -0800 (PST)
Message-ID: <ae894dfe-4234-9b40-19fd-a101ab87262b@linaro.org>
Date: Tue, 7 Feb 2023 15:52:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 06/10] monitor: release the lock before calling close()
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-7-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230207142535.1153722-7-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 7/2/23 15:25, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> As per comment, presumably to avoid syscall in critical section.
> 
> Fixes: 0210c3b39bef08 ("monitor: Use LOCK_GUARD macros")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   monitor/fds.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/monitor/fds.c b/monitor/fds.c
> index 26b39a0ce6..03c5e97c35 100644
> --- a/monitor/fds.c
> +++ b/monitor/fds.c
> @@ -80,7 +80,7 @@ void qmp_getfd(const char *fdname, Error **errp)
>           return;
>       }
>   
> -    QEMU_LOCK_GUARD(&cur_mon->mon_lock);
> +    qemu_mutex_lock(&cur_mon->mon_lock);

If you respin, please add /* See close() call below. */ comment.

>       QLIST_FOREACH(monfd, &cur_mon->fds, next) {
>           if (strcmp(monfd->name, fdname) != 0) {
>               continue;
> @@ -88,6 +88,7 @@ void qmp_getfd(const char *fdname, Error **errp)
>   
>           tmp_fd = monfd->fd;
>           monfd->fd = fd;
> +        qemu_mutex_unlock(&cur_mon->mon_lock);
>           /* Make sure close() is outside critical section */
>           close(tmp_fd);
>           return;
> @@ -98,6 +99,7 @@ void qmp_getfd(const char *fdname, Error **errp)
>       monfd->fd = fd;
>   
>       QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
> +    qemu_mutex_unlock(&cur_mon->mon_lock);
>   }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


