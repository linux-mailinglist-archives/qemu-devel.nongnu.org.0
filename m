Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79862DE105
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:30:46 +0100 (CET)
Received: from localhost ([::1]:37010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqD25-0003e8-Ky
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:30:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqD0J-0001vV-V2
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:28:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqD0H-00009B-V4
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608287332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+VAEZHFFaVOpJ3CTnnyBUWIXe2hbiXjZMNRxK21HOA=;
 b=FnlNN7o/o/JUhZYYdeyVXi+rkBbeaZdqvqJDLoeinpEGGMAXHfChkpgPaXGl1TKAWu1VI6
 B6MhJIcUY4g8ATLM1TGFiqx5cbHC5gqCxrrS2uVzR2ZGRUlRWKhvXulsfOEKN0j7BnT/Nb
 Wl7dImVMjzOGEAeee/0BrHmbCCqB4hA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-P-yWOpKpNy2ZGdnrfIBc8g-1; Fri, 18 Dec 2020 05:28:50 -0500
X-MC-Unique: P-yWOpKpNy2ZGdnrfIBc8g-1
Received: by mail-ed1-f72.google.com with SMTP id d12so883091edx.23
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 02:28:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S+VAEZHFFaVOpJ3CTnnyBUWIXe2hbiXjZMNRxK21HOA=;
 b=EYz8sfOyoPiKJ1FzZp2W5Q3M0thJyfnsxfLAowad3AmAvCsF2Nq3/gP71fJth9eH2G
 leWeqzmbVX1ggT8uo+14e7Uh/V83QWofwWyq3JhTqasQu17cqC2uCjCk4cH11R32bY9u
 vx0uIkm8VKyelbyTrkX/MKnMOYRtsaD/WNcEAIdzj9/sWW7ezx8b5pJ5Y5DPQzE8bBDd
 619j+JU4c0JRy+KeMFSJEiAK9ppEACk/4XFQxsME4F5lmp9SLa/RqOEPiuiDATJI/xKt
 GlLLKQIRggWcCxlLqz4XmP+uyDWxsdM+gwGHtvWNLctWrIWT2Io/jUHn1doahi9iVSgq
 pJ5A==
X-Gm-Message-State: AOAM531bqgJXJivnko5Hbjtv0/OSY7ToWwm3BeGnocNnu48hkgFHxx1X
 Mc5tM315WZAgyfR+fPu04YpPsYGP4nrE6G8upikDQRruL77payPlIxskWsvXfrNDaR6OQhqCu46
 YhwnvdDdhSQofeoM=
X-Received: by 2002:a17:907:7253:: with SMTP id
 ds19mr3447311ejc.166.1608287329480; 
 Fri, 18 Dec 2020 02:28:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2x0bfODwsfVnaqr6JwSf5hFgbb3xNWtVOhbCG90malEXJaaHJqsVodhcJrw0eF28djaiRsw==
X-Received: by 2002:a17:907:7253:: with SMTP id
 ds19mr3447286ejc.166.1608287329231; 
 Fri, 18 Dec 2020 02:28:49 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p3sm5336751ejx.0.2020.12.18.02.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 02:28:48 -0800 (PST)
Subject: Re: [PATCH] whpx: fix compilation
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20201218084611.634254-1-marcandre.lureau@redhat.com>
 <023ac901-2c57-15da-4dfe-62b1f4f1c23d@redhat.com>
 <CAMxuvayDzUmpBg8n10zD=7pYtKtwQZs1n0wAvPjMzKTZ4ZNuGQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9ea55256-e3fd-e8e7-3b70-9c690b09dc74@redhat.com>
Date: Fri, 18 Dec 2020 11:28:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAMxuvayDzUmpBg8n10zD=7pYtKtwQZs1n0wAvPjMzKTZ4ZNuGQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: sunilmut@microsoft.com, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/12/20 11:08, Marc-André Lureau wrote:
>      >   #ifdef CONFIG_WHPX
>      >
>      > -#include "whp-dispatch.h"
>      > +#include <windows.h>
>      > +#include <WinHvPlatform.h>
>      > +#include <WinHvEmulation.h>
>      >
>      >   struct whpx_state {
>      >       uint64_t mem_quota;
>      >
> 
>     This is wrong, just "git mv target/i386/whpx/whp-dispatch.h
>     include/sysemu" instead (and possibly change the #include line to
>     sysemu/whp-dispatch.h).
> 
> 
> Wrong? It fixes the build. So whatever is in whp-dispatch, it's not 
> exactly necessary. Why should it be included?

Did you read the code that initializes whp-dispatch, or even easier try 
to find the patch the introduced it ("git log --follow 
target/i386/whpx/whp-dispatch.h")?  Marc-André, I expect you to know 
better than "it fixes the build, ergo it is correct"...

> Furthermore, I tried your suggestion first. But it fails with other 
> include issues. I can probably solve them differently, but why should 
> whp-dispatch be in include/sysemu?

It shouldn't indeed, hence the second suggestion:

>     But I wonder if whp-dispatch.h is needed at all in this file.  If we
>     can just include it in whpx-all.c and whpx-apic.c, that would be much
>     better.
> 
> May be, but how does this solve the issue with include/sysemu/whpx.h ?

Because "just" including it in those two .c files implies removing it 
from include/sysemu/whpx.h.  I was a bit concise, I admit.

Thanks,

Paolo


