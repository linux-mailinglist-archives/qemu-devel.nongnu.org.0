Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37269420783
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:43:03 +0200 (CEST)
Received: from localhost ([::1]:39640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJYs-0000Hg-8y
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ4M-0005tz-2M
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:11:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ4J-0008Sz-JG
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633335085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/v8IuUJOxdE99igoHOKSTqfou1Z3pZ41LzbF7lclFns=;
 b=O6l2+SCSjf/N7CSXnN9KkM+2neCN1Z5reIiAt+eRixIqeY6I0uYYqT/+YihxHPAI/gnrRH
 oxSO5blk44XSm4Oyae4K2E7By85XoSjrnMmGE7AYawyEm14XasXy14o3dZf4QbaZKuhbyt
 wTmMhs6dXfD+FBL3cO+L6gvDFwq0XOg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-zZhK3yZ7P5GRJ3Wt1jXtLQ-1; Mon, 04 Oct 2021 04:11:25 -0400
X-MC-Unique: zZhK3yZ7P5GRJ3Wt1jXtLQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso16314821edj.20
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/v8IuUJOxdE99igoHOKSTqfou1Z3pZ41LzbF7lclFns=;
 b=HFWT3lY27Lvzehw5TiGoHTj1t7CKkIs2T+MyPr0hFwHzcsm3X86skHjFsM4SxugTwy
 5o2AKKZIdwKgOkdmncPYHVweHUawTy/HQlIR7asy+1nrcxtLbXdRI7ynKfEeR7YmFdVc
 BRxJDHFSaEU1NOc/WmW+ZRvcYN/puD+9SO6siux7/G2kkP73neIm7KkZKd0UdLHzIZtu
 YZ3JOPDeYa+Vp+sYC4CiQpJIN+/FLeSmIggQpcVkyOvQ11TPhazgEr4gOnBstJjG+jM9
 MkOPde/uhaUrpLFfuGrgoLbwTMmhlIEiK43CIv0rnj5IXati69bxhjH8F8GLoVejEPGm
 eNPA==
X-Gm-Message-State: AOAM531xTGlC87ttDUxGQkwfM4zJ62zqKzeQzZOHWvon9KYHK1tpHUeU
 t/C1QmWT4cfQYmPD0VGNagwKcVyFa3+jwhGpX2jWzwrc0JdH8kji4bi5fEHGW9ZDmem6liFYc7j
 SBtknVZ5iyAmT104=
X-Received: by 2002:a17:906:b884:: with SMTP id
 hb4mr15020065ejb.376.1633335083102; 
 Mon, 04 Oct 2021 01:11:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkPJIkziIwqftGpn97RDjz6g6khr3WzHwWLhziFcUldzYrZQu27oHEbu6PGcHJrChqkpjvSA==
X-Received: by 2002:a17:906:b884:: with SMTP id
 hb4mr15020049ejb.376.1633335082903; 
 Mon, 04 Oct 2021 01:11:22 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d18sm1904189ejo.80.2021.10.04.01.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:11:22 -0700 (PDT)
Message-ID: <dc17b773-8b40-1793-8234-88deb58414a3@redhat.com>
Date: Mon, 4 Oct 2021 10:11:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 06/22] target/i386/cpu: Add missing 'qapi/error.h'
 header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-7-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-7-philmd@redhat.com>
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
> Commit 00b81053244 ("target-i386: Remove assert_no_error usage")
> forgot to add the "qapi/error.h" for &error_abort, add it now.
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   target/i386/cpu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index cacec605bf1..e169a01713d 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -27,6 +27,7 @@
>   #include "sysemu/hvf.h"
>   #include "kvm/kvm_i386.h"
>   #include "sev_i386.h"
> +#include "qapi/error.h"
>   #include "qapi/qapi-visit-machine.h"
>   #include "qapi/qmp/qerror.h"
>   #include "qapi/qapi-commands-machine-target.h"
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


