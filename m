Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABDB30FC0F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:59:05 +0100 (CET)
Received: from localhost ([::1]:47736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jqK-0005HQ-C1
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7jEP-0007Pc-Ih
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:19:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7jEN-0006Iz-0u
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:19:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612462789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gAxUehg8suyFkGTSsnwL4Xxm72fgcZJz6XaRrmxlTp4=;
 b=P+McHLSs1uwAjz9WNnN6EcFkRSzh3Gfm+jejGhIO9C8+7K7/mJYAERFlMTJnAWy0gxFamk
 fTDpi01zTfzeA4JvbxXu6SBH0UTtL+FruKGTBZfXewBzvBpI3c74u3HT2tMS1a6PJz2SNb
 i+r8w1tJnIU2JmuiLBSbOBEKOzdXU3Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-0C4kgW9hMdajoOpad1ymPA-1; Thu, 04 Feb 2021 13:19:47 -0500
X-MC-Unique: 0C4kgW9hMdajoOpad1ymPA-1
Received: by mail-ed1-f72.google.com with SMTP id g6so3632031edy.9
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 10:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gAxUehg8suyFkGTSsnwL4Xxm72fgcZJz6XaRrmxlTp4=;
 b=rfgWDs2ICuFMtgI+HhyZHNhycjkM/qoMGAoOvMoAz9uzD9YfxIwKfoYMXToTgbbbmF
 eMcRhhQwO8oqSluU6Knam9H+SDqLQV4GCiGBswvfAH3htGFf6k8i3Hzaj90crffy9As0
 Yfe2thfe+15duKpCZuRYIUT56ln1jkw0iY3iOe9+BWQvFkwQ3NxOXDumpi5MZabd0VuO
 cKBgCxPwgLw5+ouy5oBGvHEOb9H20eubYfqN+u4OHXxlmfkJ12+kWFxJGUKt6xcSLZq2
 lTk9Di4P4E+rkl0TnYhwJXgmJh1a32+S4/uFsF0b2RQ79KPrdZ5VBO5xnkaIWONam8VY
 MVgA==
X-Gm-Message-State: AOAM533WGY6Ca1Tf4lOF3N0NM1pW8hZCP2DADWJZkFiSV1XVBSdEBmzt
 IKd5v06JAXwHxm3QAWj9RF8cUw8/kc5Fsj+h/nByAJ7WEElL7UrkJCXBKsVau7mzLCY48QueKFb
 d9juKnwEZafH2fDI=
X-Received: by 2002:a50:f19a:: with SMTP id x26mr250155edl.354.1612462786589; 
 Thu, 04 Feb 2021 10:19:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+/yrwlT6RrV5QbzGv4VwIqM7jqwHI8haks3HUtnmD8MFRAZm7QP8DRCjNLdqYhP8I/mCR/Q==
X-Received: by 2002:a50:f19a:: with SMTP id x26mr250005edl.354.1612462784200; 
 Thu, 04 Feb 2021 10:19:44 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b11sm2784605eja.115.2021.02.04.10.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 10:19:43 -0800 (PST)
Subject: Re: [PATCH] exec/cpu-defs: Remove TCG backends dependency
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210204180328.1735105-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0e3863f5-179c-7bb9-e5de-5a5a6d21c2c6@redhat.com>
Date: Thu, 4 Feb 2021 19:19:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204180328.1735105-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/21 19:03, Philippe Mathieu-Daudé wrote:
> "exec/cpu-defs.h" contains common CPU definitions for
> accelerators, which is not related to the TCG backends.
> See tcg/README description:

Most of the definitions are actually for TCG, not for all accelerators 
(the TLB mostly).

However, they're indeed unrelated to the backends, so

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

I'll let the TCG people pick it up.

Paolo

>    4) Backend
> 
>    tcg-target.h contains the target specific definitions. tcg-target.c.inc
>    contains the target specific code; it is #included by tcg/tcg.c, rather
>    than being a standalone C file.
> 
> So far only "tcg/tcg.h" requires these headers.
> 
> Remove the "target-tcg.h" header dependency on accelerators.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/exec/cpu-defs.h | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
> index d1f5e3fc3d8..ba3cd32a1ec 100644
> --- a/include/exec/cpu-defs.h
> +++ b/include/exec/cpu-defs.h
> @@ -25,9 +25,6 @@
>   
>   #include "qemu/host-utils.h"
>   #include "qemu/thread.h"
> -#ifdef CONFIG_TCG
> -#include "tcg-target.h"
> -#endif
>   #ifndef CONFIG_USER_ONLY
>   #include "exec/hwaddr.h"
>   #endif
> 


