Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A0E4207BE
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:03:09 +0200 (CEST)
Received: from localhost ([::1]:60024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJsK-0000Ug-Oa
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJJ5-0002Ht-07
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:26:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJJ3-0007dJ-9D
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:26:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633336000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btG2jGUoWy2nT5ZM3BSZ7Cn5M3SntGDJo8lfgebe/EI=;
 b=J2Tu/B8HaqA/Pqup9yFmorSt5bEehzaqrG6SdehLRX7+Cd/LCABY9igDB3/SHEafJLGSJi
 vn9BTrj5hTdewf+DTiFbS9FYVYfFGaxBrvTxHs6FMMYkWIxMIRV3mPaaZSD2pujK/U5FC1
 ZNJigIm+MhwFIbO88xfnWOz/RltuKYU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-GEdlXRXHOEe9NxHHLMwd4Q-1; Mon, 04 Oct 2021 04:26:37 -0400
X-MC-Unique: GEdlXRXHOEe9NxHHLMwd4Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 m20-20020aa7c2d4000000b003d1add00b8aso16485186edp.0
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=btG2jGUoWy2nT5ZM3BSZ7Cn5M3SntGDJo8lfgebe/EI=;
 b=YEPjppVeObIlu2h2OVTHL9TEPqmAFijwGwqKncRs43thQ/x3Gcr/Lc+6olLsmkU0pS
 GsgEwZMw2UlFnPEmo1giTEc4xEmqhEbouvLc8wOTGu7vlPNcJI7bbXnx3mDyrJ6J/paj
 3aE+gTm01DxlTW0nTL3BtXQnWzOykrNCqt5PG7DXEUpooynrwRCclM+mS0NvXv+bF+ee
 UZ5s1K0MgwZO07xnEpPMme0DAGp60tqMOy9ciIZ91keqjG8/A96Wc+zXpdDyarH2Za1g
 jEc8FX2hw9jlrFAGvb4xbE6E2U+Dyqg5lTVmG7GCU/kD5nNNzb+aIEka7Jx89X3w+zKg
 QuBw==
X-Gm-Message-State: AOAM532Dcq8DrnIau+Af6xNZyQZMuocXU4e5QRi0+3XWnspWh33BLd1Y
 v8qFPqHsxgZA+Cb4ODF+L13zBBQqcukvyWIliDCyKXEbV7+M3vSu6IzgPTRIVdAyCK/dEHjeZTY
 dY9sU3G7nAzGlqj0=
X-Received: by 2002:a17:906:2441:: with SMTP id
 a1mr15633968ejb.414.1633335996389; 
 Mon, 04 Oct 2021 01:26:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRoeSW+V0+V2SCoZEw8TibTIzZQeXEges4N9UaSGdTRKC9mpRFxypKJ3npveIPfv+B2z22Zg==
X-Received: by 2002:a17:906:2441:: with SMTP id
 a1mr15633943ejb.414.1633335996161; 
 Mon, 04 Oct 2021 01:26:36 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x16sm1639516ejj.8.2021.10.04.01.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:26:35 -0700 (PDT)
Message-ID: <5c1652ac-8a71-8d23-ed31-b84ce07596e8@redhat.com>
Date: Mon, 4 Oct 2021 10:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 19/22] monitor: Restrict 'info sev' to x86 targets
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-20-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-20-philmd@redhat.com>
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
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/21 14:53, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   include/monitor/hmp-target.h  | 1 +
>   include/monitor/hmp.h         | 1 -
>   target/i386/sev-sysemu-stub.c | 2 +-
>   target/i386/sev.c             | 2 +-
>   4 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
> index dc53add7eef..96956d0fc41 100644
> --- a/include/monitor/hmp-target.h
> +++ b/include/monitor/hmp-target.h
> @@ -49,6 +49,7 @@ void hmp_info_tlb(Monitor *mon, const QDict *qdict);
>   void hmp_mce(Monitor *mon, const QDict *qdict);
>   void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
>   void hmp_info_io_apic(Monitor *mon, const QDict *qdict);
> +void hmp_info_sev(Monitor *mon, const QDict *qdict);
>   void hmp_info_sgx(Monitor *mon, const QDict *qdict);
>   
>   #endif /* MONITOR_HMP_TARGET_H */
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 3baa1058e2c..6bc27639e01 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -124,7 +124,6 @@ void hmp_info_ramblock(Monitor *mon, const QDict *qdict);
>   void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict);
>   void hmp_info_vm_generation_id(Monitor *mon, const QDict *qdict);
>   void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict);
> -void hmp_info_sev(Monitor *mon, const QDict *qdict);
>   void hmp_info_replay(Monitor *mon, const QDict *qdict);
>   void hmp_replay_break(Monitor *mon, const QDict *qdict);
>   void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
> diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
> index 1836b32e4fc..b2a4033a030 100644
> --- a/target/i386/sev-sysemu-stub.c
> +++ b/target/i386/sev-sysemu-stub.c
> @@ -13,7 +13,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "monitor/monitor.h"
> -#include "monitor/hmp.h"
> +#include "monitor/hmp-target.h"
>   #include "qapi/qapi-commands-misc-target.h"
>   #include "qapi/qmp/qerror.h"
>   #include "qapi/error.h"
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 7caaa117ff7..c6d8fc52eb2 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -32,7 +32,7 @@
>   #include "migration/blocker.h"
>   #include "qom/object.h"
>   #include "monitor/monitor.h"
> -#include "monitor/hmp.h"
> +#include "monitor/hmp-target.h"
>   #include "qapi/qapi-commands-misc-target.h"
>   #include "qapi/qmp/qerror.h"
>   #include "exec/confidential-guest-support.h"
> 


This is only a cleanup, isn't it?  The #ifdef is already in 
hmp-commands-info.hx.

Anyway,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

but please adjust the commit message in v4.

Paolo


