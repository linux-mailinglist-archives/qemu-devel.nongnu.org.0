Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1292A42077D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:41:05 +0200 (CEST)
Received: from localhost ([::1]:32904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJWx-000434-Ti
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ4d-0006bP-5w
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:11:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ4Z-0000FP-2x
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633335102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dNt/fWJq9H4VOv4gmEOcSD6BHelYlOktyHMHOZ+aCSw=;
 b=PwbN4ijvnW14/OGvBzjPSQtxFLM37F8VVgjo/w0fEB5fmpnAhntx3s0kHnIFbMz22Quu1R
 FQmqnh/QhBNrmfFWM2w3sQtEBje/VVPlm9Vj3Ae6CQ5xEq6KVjBmgA+l57Fq1+Qjeb5hBf
 hRPYKwx03RGqydQFYamUrI8cbK0cU+Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-2_S_-XmrNtOthL1vehxcpw-1; Mon, 04 Oct 2021 04:11:41 -0400
X-MC-Unique: 2_S_-XmrNtOthL1vehxcpw-1
Received: by mail-ed1-f71.google.com with SMTP id
 1-20020a508741000000b003da559ba1eeso16458290edv.13
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dNt/fWJq9H4VOv4gmEOcSD6BHelYlOktyHMHOZ+aCSw=;
 b=6IF2ALuqvUWN7v8AinatHsHcoqfr2p2rr2pK+z4hRgMmoEtPFB4GCbfCOs35Y+9kjw
 FdL+15r3Myj0pOcwvbWFM07MJv1xRNDeKXt1FAd3+N/QWurxugHreVuGYhEfCCNpMhOE
 Ux8HWMr8gKgA3ilyMgZmtEPvqt1miQ4KDMproIW1MSXw1UQ5XR+SuTjCCntIpla9O5AU
 ndr37hMbNPbBzFxRfg5WBEemI8vpZlCjW1sOw+Z6MAheNDa7iUjdTnsBHLl7IT3MWOzB
 J2wHdIkQASf/oCmfWNlLAOCX7AelvV4LmIs+N9BP0w675x6D/w+xK8ZGkMbv3hDtpSwN
 j1Jg==
X-Gm-Message-State: AOAM531Rwq8efDEhZwFuuZ2OcIa3QZPj1pNv2OBGY854FhR5zKK/ABQj
 WnjxGCAbM/odgUta9ObYlaY+X1Uzgy8W3ofW9EBnhXcxAyL8x3QvlMxTRdeplF4yRM6Hso9733v
 TvA+BJ+KFBWh9264=
X-Received: by 2002:a50:d8c7:: with SMTP id y7mr16860262edj.133.1633335099157; 
 Mon, 04 Oct 2021 01:11:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/7eg1QUsdLOkjXK2hQ27bG0xM0Tb85lV3dlMdIW9CUmmwec7UdrWUxdO1ECuIjw+ov/GVJQ==
X-Received: by 2002:a50:d8c7:: with SMTP id y7mr16860081edj.133.1633335096461; 
 Mon, 04 Oct 2021 01:11:36 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bx11sm6325863ejb.107.2021.10.04.01.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:11:35 -0700 (PDT)
Message-ID: <866140d0-1374-7966-19f0-401ccbf49655@redhat.com>
Date: Mon, 4 Oct 2021 10:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 07/22] target/i386/sev_i386.h: Remove unused headers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-8-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-8-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/21 14:53, Philippe Mathieu-Daudé wrote:
> Declarations don't require these headers, remove them.
> 
> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   target/i386/sev_i386.h | 4 ----
>   target/i386/sev-stub.c | 1 +
>   2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
> index ae6d8404787..f4223f1febf 100644
> --- a/target/i386/sev_i386.h
> +++ b/target/i386/sev_i386.h
> @@ -14,11 +14,7 @@
>   #ifndef QEMU_SEV_I386_H
>   #define QEMU_SEV_I386_H
>   
> -#include "qom/object.h"
> -#include "qapi/error.h"
> -#include "sysemu/kvm.h"
>   #include "sysemu/sev.h"
> -#include "qemu/error-report.h"
>   #include "qapi/qapi-types-misc-target.h"
>   
>   #define SEV_POLICY_NODBG        0x1
> diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
> index 0227cb51778..d91c2ece784 100644
> --- a/target/i386/sev-stub.c
> +++ b/target/i386/sev-stub.c
> @@ -12,6 +12,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qapi/error.h"
>   #include "sev_i386.h"
>   
>   SevInfo *sev_get_info(void)
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


