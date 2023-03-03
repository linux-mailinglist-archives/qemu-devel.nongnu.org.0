Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777496A9AB4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 16:31:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7NS-0003oW-Vw; Fri, 03 Mar 2023 10:31:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pY7Mh-0003d1-Ai
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:30:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pY7Me-0001cW-5h
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:30:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677857431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x5yLb/pKiuoRvIIlBVBFeYJnf+biGgkFq3zyHIeeEQs=;
 b=RqkazGgzyFdaiB0q0lcslC0muknIBSu7TkFZUvMY+//lBtbO+iFdL9qF3oiDtFSdcfEKq9
 yy9ef99LWiFIlj53uRE/gwfFdCOqqFKf9J3Q2KhgIkP7yz6W2U1Wk9eYjueAyls41qNA3h
 RVz4TKAfNWg5rX1ltLcPePWieztRygs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-HkhUTNi7Nmi51MkGAmLdpA-1; Fri, 03 Mar 2023 10:30:30 -0500
X-MC-Unique: HkhUTNi7Nmi51MkGAmLdpA-1
Received: by mail-ed1-f72.google.com with SMTP id
 v11-20020a056402348b00b004ce34232666so1354085edc.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 07:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677857428;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x5yLb/pKiuoRvIIlBVBFeYJnf+biGgkFq3zyHIeeEQs=;
 b=CPDq7r8QudlGz8U+S7DLNy10RA08B62L8o8qJboCGNgit2kOiSnsYK0ubKGZPu4ydo
 pn8MmBV5P2nPMFVEQZasF44nvgLEjsHU0LTM7oFj75AZsAuZ5W9+FyEjrtf2I++rerfU
 14betqKQr0lM87522Bc26uqN1aJi4aKW72X5VViSAsm7FOs855QPLzFxgDURFwy+nWaI
 QNi5gzWfw7Bg724l+yXyb8xbORfFIBIqvKzlTM8BJl9XvkOeSR6tRfLQlEGZ6cF3XObd
 urB3G4jACqG9ORnTaLuTBwajxdHINCg9RnsrjQqALQa+GjtMw0/fPgRCtDzcok0nt9jR
 upiQ==
X-Gm-Message-State: AO0yUKWBYwIWz1vE7JtFjXNXjCKVNlGJior0vqwqFiWntGp9xJBeL3c2
 XFQgOCSp5yeJIwiiQq3f+7x6IjOvQPFwIlzUYW54Q6NZufgmCxa8TTCs1BBIu7SeTjF/M4zZegy
 1GhmUGowqk1MyXqvOPz3z
X-Received: by 2002:aa7:c606:0:b0:4af:7e0f:df62 with SMTP id
 h6-20020aa7c606000000b004af7e0fdf62mr2223365edq.24.1677857427856; 
 Fri, 03 Mar 2023 07:30:27 -0800 (PST)
X-Google-Smtp-Source: AK7set/oN1ICOry/el0BDxMaHok5LX7DnvdPakMl1G6W3eU2asRStSAG4exR7npPfxN8Mw09KGjIIw==
X-Received: by 2002:aa7:c606:0:b0:4af:7e0f:df62 with SMTP id
 h6-20020aa7c606000000b004af7e0fdf62mr2223352edq.24.1677857427726; 
 Fri, 03 Mar 2023 07:30:27 -0800 (PST)
Received: from ?IPV6:2003:cf:d737:1307:9c:fde6:ce26:76d4?
 (p200300cfd7371307009cfde6ce2676d4.dip0.t-ipconnect.de.
 [2003:cf:d737:1307:9c:fde6:ce26:76d4])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a17090682c400b008d4b6f086c9sm1047964ejy.185.2023.03.03.07.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 07:30:27 -0800 (PST)
Message-ID: <27cd0f1a-338f-b535-21d5-68627e296890@redhat.com>
Date: Fri, 3 Mar 2023 16:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] block: protect BlockBackend->queued_requests with a
 lock
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230227205704.1910562-1-stefanha@redhat.com>
 <20230227205704.1910562-4-stefanha@redhat.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230227205704.1910562-4-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 27.02.23 21:57, Stefan Hajnoczi wrote:
> The CoQueue API offers thread-safety via the lock argument that
> qemu_co_queue_wait() and qemu_co_enter_next() take. BlockBackend
> currently does not make use of the lock argument. This means that
> multiple threads submitting I/O requests can corrupt the CoQueue's
> QSIMPLEQ.
>
> Add a QemuMutex and pass it to CoQueue APIs so that the queue is
> protected. While we're at it, also assert that the queue is empty when
> the BlockBackend is deleted.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/block-backend.c | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)

Reviewed-by: Hanna Czenczek <hreitz@redhat.com>


