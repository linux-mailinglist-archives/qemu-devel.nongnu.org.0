Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0924B08E3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 09:52:43 +0100 (CET)
Received: from localhost ([::1]:38506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI5Bx-00065G-UV
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 03:52:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nI4mX-0001q1-8F
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 03:26:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nI4mU-0006oy-0h
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 03:26:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644481580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hseZq7a2lxPYo8hUFen1q3BMsz5xUpfzza9DtD2LoHM=;
 b=O9nUKtjT4XmyElgituSnoM4PNTC+RxZ+2WhVu3bW/mzBiQeV9MalrME4oYTM8quOX/YaxG
 7QnL1nzFINcZrH2oDE5sB2sN2uk2xj3a3fzqCt24VbjkukruA+bGHqPsTkrYajii8n6QSu
 ajLP+7n++3eXTQNNV1dj8L1N5NWHGFg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-g_ivqSjQOhSvXRPDkUzNUQ-1; Thu, 10 Feb 2022 03:26:19 -0500
X-MC-Unique: g_ivqSjQOhSvXRPDkUzNUQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adfa34d000000b001e33a1c56f3so2156044wrb.20
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 00:26:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hseZq7a2lxPYo8hUFen1q3BMsz5xUpfzza9DtD2LoHM=;
 b=3bMKv+UP/LWSKzj9bL5XiRCY2qqpGyUABLWQOE1Y3kEMgC5x4QMCmO9n7aiyW2kyN/
 OwdjSUOiNEkf1UluDCVAW5LUt9ZeJt5SsUbPLK0PV4lYIGQEF6WYNpnH/rf25/f3eLFH
 ACRQNzjspiFJ478qQAYGNHzC25+Q89VkGXpha2It1XP/Tt7wjDrwv3tvqksOGO5yyrAw
 91UjRBAjIGKoo4QNxpX25zGxofuxhAkARiD/mVaPd3tMG3iWYy4uwGa08VaWWxzJY3MC
 YGnxFHGvo5AQsb2PcGC9mP/CRRBdVTWeSshswFjWtHTX7UAVoUSlGQ65nWyr5z7iG3/o
 rkZA==
X-Gm-Message-State: AOAM53365WGpIwh906x+wwvQlpDYxcPy0y4mRzebXN5D5GdYp+J8PbWy
 Qx93hS/6U2HRVecEpYE18qCG0FBMgz2XezynYGvtEwzIIMnxUXHQIj2iAfwueQngrHA0E/0CDUk
 Y3IGMyIq7CbeLKL0=
X-Received: by 2002:a5d:43c6:: with SMTP id v6mr5569470wrr.530.1644481578339; 
 Thu, 10 Feb 2022 00:26:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTKGYjCKh4Mi7TJY2FgElvQ5l8lN+K0hTqmqZjpjUKHh7+9BMlbLMJ2jOTRru2Y686GxVi3A==
X-Received: by 2002:a5d:43c6:: with SMTP id v6mr5569444wrr.530.1644481577984; 
 Thu, 10 Feb 2022 00:26:17 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id p27sm1431324wms.1.2022.02.10.00.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 00:26:17 -0800 (PST)
Message-ID: <10c05761-6422-48c8-4c53-9e9378b98a4c@redhat.com>
Date: Thu, 10 Feb 2022 09:26:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/15] hw/tricore: Remove unused and incorrect header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220209215446.58402-1-f4bug@amsat.org>
 <20220209215446.58402-4-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220209215446.58402-4-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/02/2022 22.54, Philippe Mathieu-Daudé wrote:
> TriCore boards certainly don't need the ARM loader API :)
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/tricore/triboard.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/hw/tricore/triboard.h b/include/hw/tricore/triboard.h
> index f3844be447..094c8bd563 100644
> --- a/include/hw/tricore/triboard.h
> +++ b/include/hw/tricore/triboard.h
> @@ -21,7 +21,6 @@
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
>   #include "hw/boards.h"
> -#include "hw/arm/boot.h"
>   #include "sysemu/sysemu.h"
>   #include "exec/address-spaces.h"
>   #include "qom/object.h"

Reviewed-by: Thomas Huth <thuth@redhat.com>


