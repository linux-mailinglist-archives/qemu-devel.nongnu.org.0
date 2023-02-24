Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC64E6A16D9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:01:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVS4s-00056s-IV; Fri, 24 Feb 2023 02:01:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVS4p-0004zS-CJ
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:01:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVS4n-00028Z-Ty
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:01:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677222065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eBF7zlEyAdmMOjAIAp6YTm4gPMTShFRuaN2qoKGPy58=;
 b=iAgv7O137SYaXr6yA30vrlrxX5ZyhEXv391kyRTB4w/TKWdXmtnArC/IG+zcxqHXzYO9Bn
 2Bbt+An00iMMcvDRtOhu4PwNjS5ScsPzM06XP+n0gNnjnjWomnfrbHngqdsoOTBDLRZAxk
 yRN75Huf/D9igWqGsGbOMXiFtBJ3DxM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-WSpjsktEOqe810QryJmXHg-1; Fri, 24 Feb 2023 02:01:03 -0500
X-MC-Unique: WSpjsktEOqe810QryJmXHg-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e9d0925341so2657870wmb.8
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 23:01:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eBF7zlEyAdmMOjAIAp6YTm4gPMTShFRuaN2qoKGPy58=;
 b=s2Y9aG2TmzLkAtvJWUFznILPbLe7so8YOKaKhKEmxA3ZRBcRUWEf4ghXsiSqBsYVmW
 fRnMCUhXIbocyGpFO+T1guyjxGx6brZxn4pjUEl6qgGAFDXjSsP4sLqdViLcjbQyOvjj
 yYNk9hMkt/kfdNtFS6U5K8h3PhVD7qVHCHLpEWgpghVncd5LAO5uIaQjx2KHHTxS7tBX
 vac3NZidjBJP6LKeRtCY2nZNybRfzDQkqOXb6Iqnlob1e4bvU8MqFi2rhC0FFuzURrtA
 ySDkutfq01UKUftnVlAwDpBn3KH2DPxkvvsbhUyyVEblZ7McYQsUiQqTKLlg02omA9fS
 FX0Q==
X-Gm-Message-State: AO0yUKWjr9KehWX6puOxoDQZunuDyYoTSpJrIp5GnXQksMrSNQ9AObRq
 ImnXONxsSkEFnCj34fzd1ilr4RNbEsk1mPSBnVyeNcwkmPcynJVs84xnspZleoBorWXwuiXSR0Q
 rs8hCGuxQ3/85Rgc=
X-Received: by 2002:a05:600c:160a:b0:3ea:8cac:3edd with SMTP id
 m10-20020a05600c160a00b003ea8cac3eddmr3389109wmn.11.1677222062675; 
 Thu, 23 Feb 2023 23:01:02 -0800 (PST)
X-Google-Smtp-Source: AK7set8RoCukjfTSNSoOaQWgWp4/czqjn2ANgpMuMftijrLIY4kBKMzTym1l2EICkNxWZXckHd5cQw==
X-Received: by 2002:a05:600c:160a:b0:3ea:8cac:3edd with SMTP id
 m10-20020a05600c160a00b003ea8cac3eddmr3389094wmn.11.1677222062405; 
 Thu, 23 Feb 2023 23:01:02 -0800 (PST)
Received: from [192.168.8.100] (tmo-115-119.customers.d1-online.com.
 [80.187.115.119]) by smtp.gmail.com with ESMTPSA id
 q1-20020a1cf301000000b003e2232d0960sm1741581wmq.23.2023.02.23.23.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 23:01:01 -0800 (PST)
Message-ID: <25deaa40-fe58-f7c5-6098-20c938b85e8e@redhat.com>
Date: Fri, 24 Feb 2023 08:01:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/7] dump: Replace TARGET_PAGE_SIZE ->
 qemu_target_page_size()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230223231755.81633-1-philmd@linaro.org>
 <20230223231755.81633-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230223231755.81633-3-philmd@linaro.org>
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
> TARGET_PAGE_SIZE is target specific. In preparation of
> making dump.c target-agnostic, replace the compile-time
> TARGET_PAGE_SIZE definition by runtime qemu_target_page_size().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   dump/dump.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 7101169ecb..3784a9054d 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -15,6 +15,7 @@
>   #include "qemu/cutils.h"
>   #include "elf.h"
>   #include "exec/hwaddr.h"
> +#include "exec/target_page.h"
>   #include "monitor/monitor.h"
>   #include "sysemu/kvm.h"
>   #include "sysemu/dump.h"
> @@ -1859,7 +1860,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
>       }
>   
>       if (!s->dump_info.page_size) {
> -        s->dump_info.page_size = TARGET_PAGE_SIZE;
> +        s->dump_info.page_size = qemu_target_page_size();
>       }
>   
>       s->note_size = cpu_get_note_size(s->dump_info.d_class,

Reviewed-by: Thomas Huth <thuth@redhat.com>


