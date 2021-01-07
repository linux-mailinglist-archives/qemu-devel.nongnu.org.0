Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C4F2ECAEA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 08:24:00 +0100 (CET)
Received: from localhost ([::1]:39974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxPeJ-000639-AV
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 02:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxPcf-0005VE-IU
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 02:22:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxPcd-0004x9-8C
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 02:22:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610004134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zUW2V52XY2ZvrjuO9aeiFsP9sC0ekYKuP0PnX60c3T4=;
 b=ZIfQRzXjI/drUHbYyacpIlF7YJKPBo1Qug1vBF1QHJlryMjjqsWOTcirEayFbp/KyyOFNO
 LTtwgEf8x17NQMEXF8SKxs9C8JRQs6TxAotfFLkk9i7q9M9JgWHJ3TOOiVO+UZGIsyXFmY
 Iw4pBPoumAPJ8DJImB1CyIqE3CxcPN8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-m6DU1BgPOpOFFTmonqDV_A-1; Thu, 07 Jan 2021 02:22:10 -0500
X-MC-Unique: m6DU1BgPOpOFFTmonqDV_A-1
Received: by mail-wr1-f69.google.com with SMTP id u3so2240525wri.19
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 23:22:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zUW2V52XY2ZvrjuO9aeiFsP9sC0ekYKuP0PnX60c3T4=;
 b=JwdC7jIrJeqt+J+CPcTYmeikezL0KjXu1xI83mxFu8XJaSIAgMpHBbakD+pROSQvqc
 ykfeEyisqL3rsvybJfljpBIl9lIMPlU0E6zMKZ3kwsEyJrfTx9ZNLyrTp3fT4b6f0eBG
 lbm3UVilv/01WFfJZIyGGimE6nFtYPY5tYfc6CAFqh8O2EDd0xFHIcRgtWEEFU6haAxP
 LYWz+tqE0JQhcxjqALjEk92kwgSS5qHQCI8Gl3TYTyLYqVvrON4bdTCema31FtI4Z0jd
 QoGHfvd1pa5VCFoo3yVQ6+EJrmmItuEJv2FnJzGzi5rSz8OtrPPxJwss+oJfQ2QgJqDg
 jVeQ==
X-Gm-Message-State: AOAM533JJo/CnaIk92ZhqeXalXqezXu/Q5tqaBeVciwKmVtdZmrIu8tl
 vnVYcUpm2Hn8CR3f4bB5fcYyX7+TtO/o24E34MGkQnl6JFchpafxeWWQzqStmNC+S/xsDQ8OerW
 eWqlas8sHC3LhPPs=
X-Received: by 2002:a7b:c849:: with SMTP id c9mr6691542wml.11.1610004129654;
 Wed, 06 Jan 2021 23:22:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxad9AQamSizMKt09/n2qLY8a03QgLHI7vF6pki+P2KIHGwDWXtW8LCdcNSf5RTsQNNraicSA==
X-Received: by 2002:a7b:c849:: with SMTP id c9mr6691524wml.11.1610004129496;
 Wed, 06 Jan 2021 23:22:09 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id c16sm6832513wrx.51.2021.01.06.23.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 23:22:08 -0800 (PST)
Subject: Re: [PATCH 3/4] whpx: Fixes include of whp-dispatch.h in whpx.h
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
References: <20210107053825.2010-1-luoyonggang@gmail.com>
 <20210107053825.2010-4-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e1746c7a-5841-d4ef-bfc4-e2d6ebe43066@redhat.com>
Date: Thu, 7 Jan 2021 08:22:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107053825.2010-4-luoyonggang@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 6:38 AM, Yonggang Luo wrote:
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  include/sysemu/whpx.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
> index 9346fd92e9..0e6c9faaf6 100644
> --- a/include/sysemu/whpx.h
> +++ b/include/sysemu/whpx.h
> @@ -15,7 +15,7 @@
>  
>  #ifdef CONFIG_WHPX
>  
> -#include "whp-dispatch.h"
> +#include "target/i386/whpx/whp-dispatch.h"

"sysemu" should not include target/...

$ git grep target/ include/sysemu/ | wc -l
0

Maybe what you want is:

-- >8 --
diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
index 9346fd92e93..4f38784d7e4 100644
--- a/include/sysemu/whpx.h
+++ b/include/sysemu/whpx.h
@@ -15,7 +15,7 @@

 #ifdef CONFIG_WHPX

-#include "whp-dispatch.h"
+#include <WinHvPlatformDefs.h>

 struct whpx_state {
     uint64_t mem_quota;
---


