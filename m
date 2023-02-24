Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991976A16DB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:02:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVS5s-0006fp-1q; Fri, 24 Feb 2023 02:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVS5o-0006da-Vp
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:02:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVS5n-0002Fl-A3
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677222126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HOYJPmzOn7bAlaO4Pwa7ev8VrAuOY/sa64YfCGzMYsE=;
 b=cxCeava38KQrRaUkD+RWr+nuD3VYf8VluyTj7ZLG00zEFmmblZwB0ip+uc5PvizxzSKI+w
 SlxfJJL42ihZJyNn0Kv4SDzQhjnFREk9OJ3WHmMi9gsSgn6TljsuwoZUGaeClNDRIQVBDF
 EkWEFqHhZ1IVfumlS+EbQPOWsou7s7Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-XGVFSko5MJ2RtUuJl9qQcw-1; Fri, 24 Feb 2023 02:02:05 -0500
X-MC-Unique: XGVFSko5MJ2RtUuJl9qQcw-1
Received: by mail-wm1-f72.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so634519wms.9
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 23:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HOYJPmzOn7bAlaO4Pwa7ev8VrAuOY/sa64YfCGzMYsE=;
 b=tPly277mYtQ/a+yim48/uGlwuecc61dUsnAKAFhPlKurpBkR58UQ01JZtbl9ndqpzH
 N78z6+a5ckc+SEqilqaNih5rN1dBchj/LOP1ZwyHH/XS95/JR0FTx6u6WB4BYZAqJkCf
 6ILLrfHNfWdbYQNusLkLo87SDw/zntnJ8tX8iIYjYlpqqa+3PqIdHCZs7+TNdWHD3ndI
 rqoWzcJUDOvXKlfnOGGDnDfhQOW1+6Cp6t8mZyO/vjDOiiOpCUcpyLpX+0FGN9hzbIwT
 5A90mlx4LaADlBxhGYWB8CwJSMZj3Z5/Cti7tMtJkud8hVRPbtJAPJubRukXZtR4jjpV
 jF8Q==
X-Gm-Message-State: AO0yUKX8NgrECxQzD2vvg+j0TwZ8IPAfqcZwBmjVfucF49rcQNKMMHfs
 q+FP4O+VxASJXITdRsmIdhLivuwZCyXMoF1kXb2CjEC2G0IUgWK2ebW0lyg7hHxbTaWhxT06Avx
 ch/rz9dvpoOHYNjY=
X-Received: by 2002:a05:600c:a694:b0:3da:1f6a:7b36 with SMTP id
 ip20-20020a05600ca69400b003da1f6a7b36mr11280788wmb.0.1677222124031; 
 Thu, 23 Feb 2023 23:02:04 -0800 (PST)
X-Google-Smtp-Source: AK7set+F0PhT92pL05bzjtRPNZmbOOqqr9TARHWi723Gl/ydk6Ys1VM2eKBQbgQrq72Pwbdvc9/5TA==
X-Received: by 2002:a05:600c:a694:b0:3da:1f6a:7b36 with SMTP id
 ip20-20020a05600ca69400b003da1f6a7b36mr11280741wmb.0.1677222123233; 
 Thu, 23 Feb 2023 23:02:03 -0800 (PST)
Received: from [192.168.8.100] (tmo-115-119.customers.d1-online.com.
 [80.187.115.119]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c1d8900b003e203681b26sm1762293wms.29.2023.02.23.23.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 23:02:02 -0800 (PST)
Message-ID: <27686501-2463-544d-a6e3-9628f9f854b8@redhat.com>
Date: Fri, 24 Feb 2023 08:02:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 3/7] dump: Correct headers included
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230223231755.81633-1-philmd@linaro.org>
 <20230223231755.81633-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230223231755.81633-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 24/02/2023 00.17, Philippe Mathieu-Daudé wrote:
> "qemu/win_dump_defs.h" is only required by win_dump.c,
> but win_dump.h requires "sysemu/dump.h" which declares
> the DumpState type.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   dump/win_dump.c | 1 +
>   dump/win_dump.h | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/dump/win_dump.c b/dump/win_dump.c
> index f20b6051b6..12b7da5da0 100644
> --- a/dump/win_dump.c
> +++ b/dump/win_dump.c
> @@ -21,6 +21,7 @@
>   #include "qapi/qmp/qerror.h"
>   #include "qemu/error-report.h"
>   #include "hw/misc/vmcoreinfo.h"
> +#include "qemu/win_dump_defs.h"
>   #include "win_dump.h"
>   
>   static size_t win_dump_ptr_size(bool x64)
> diff --git a/dump/win_dump.h b/dump/win_dump.h
> index b8c25348f4..56f63683c3 100644
> --- a/dump/win_dump.h
> +++ b/dump/win_dump.h
> @@ -11,7 +11,7 @@
>   #ifndef WIN_DUMP_H
>   #define WIN_DUMP_H
>   
> -#include "qemu/win_dump_defs.h"
> +#include "sysemu/dump.h"
>   
>   void create_win_dump(DumpState *s, Error **errp);
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


