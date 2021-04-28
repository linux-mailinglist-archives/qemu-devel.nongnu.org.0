Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC17236D584
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 12:15:05 +0200 (CEST)
Received: from localhost ([::1]:51282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbhDl-0006Kp-0G
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 06:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbh7Z-0002fX-RI
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:08:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbh7V-0006mJ-4S
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619604515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQ5c2nlSkAzuPgxI+mhszrDfiC3PttMdqf/F2GcZBCc=;
 b=TPQWah1WkVl0ZjhOjQvZ30U+TwMxRlIbu2pUhtZspp5MorAL71spEyT197khO4kZM5dEMI
 YcR4rYPx9lMuBlLg7OqDbYMUcJZUIDsiPUvSLCWxJiDtvu8LXR4h+3TyUmH5yZ5XdFMiGS
 9cAFUwN+shWMilAGC2rIl16t+DW/j90=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-N0SdoOPXMYCApvgUBfYtwQ-1; Wed, 28 Apr 2021 06:08:31 -0400
X-MC-Unique: N0SdoOPXMYCApvgUBfYtwQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n67-20020a1c59460000b0290114d1a03f5bso4947604wmb.6
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 03:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=eQ5c2nlSkAzuPgxI+mhszrDfiC3PttMdqf/F2GcZBCc=;
 b=Lm8031L+UDtC+lRBfMN4zjL901t9GcZMQhWLsJt3iX98XbCSyCg/Aq68P4aLqlofOh
 LY2gMgMMP7pUM64CjSbBX2qDHurebfX4M6wH+P1LqGva/zKBcv3hEAP2h1di+L1uQG9+
 xnxuJy2xuvP1TbvE2OXy6OKdrXSvz2WvBFTAg4hVlmAGaOB7II3tIE+ihlMcYVom5R+P
 tRjtANrxJUWjckA7xH3v39up+FFor4K1Z9SkZY89/eaIkH25WJOl7+lxpBcR5p259iDI
 8IgK30hPM4r7nVW6UXuMrHZ4fSPBzbH4LBr5TNXs3KzyL+WGhhGLel+KK+T+/xi4aWEd
 mlPA==
X-Gm-Message-State: AOAM532PG4lxQ6gjJkgJgWpYi4cuwiOTUpPexZ5mk76pvTDhn9W+guyd
 S4BEB457dDG1uK59cScEz06jAXVMYZiuRLb43ShrxzNVN1rxUVubiqbbEpNb2F692eKRmDCTWGB
 KbLXfJSv6rdSr7sw=
X-Received: by 2002:a7b:c195:: with SMTP id y21mr30095029wmi.178.1619604510541; 
 Wed, 28 Apr 2021 03:08:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhYo83JQLK8NP/eTl2v8jhRsvXHt9dS+6fTbAEdnzaiQ//FMvPTr+kRTLyfHjngHMCFx2Xgw==
X-Received: by 2002:a7b:c195:: with SMTP id y21mr30094998wmi.178.1619604510311; 
 Wed, 28 Apr 2021 03:08:30 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f38:2400:62f4:c5fa:ba13:ac32?
 (p200300d82f38240062f4c5faba13ac32.dip0.t-ipconnect.de.
 [2003:d8:2f38:2400:62f4:c5fa:ba13:ac32])
 by smtp.gmail.com with ESMTPSA id g197sm6337052wme.43.2021.04.28.03.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 03:08:30 -0700 (PDT)
Subject: Re: [RFC v3 03/13] hw/s390x: tod: make explicit checks for
 accelerators when initializing
To: Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210422115430.15078-1-cfontana@suse.de>
 <20210422115430.15078-4-cfontana@suse.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <6c7166a8-251d-0fbc-2277-98b15afc650e@redhat.com>
Date: Wed, 28 Apr 2021 12:08:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422115430.15078-4-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.04.21 13:54, Claudio Fontana wrote:
> replace general "else" with specific checks for each possible accelerator.
> 
> Handle qtest as a NOP, and error out for an unknown accelerator used in
> combination with tod.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/s390x/tod.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/tod.c b/hw/s390x/tod.c
> index 3c2979175e..fd5a36bf24 100644
> --- a/hw/s390x/tod.c
> +++ b/hw/s390x/tod.c
> @@ -14,6 +14,8 @@
>   #include "qemu/error-report.h"
>   #include "qemu/module.h"
>   #include "sysemu/kvm.h"
> +#include "sysemu/tcg.h"
> +#include "sysemu/qtest.h"
>   #include "migration/qemu-file-types.h"
>   #include "migration/register.h"
>   
> @@ -23,8 +25,13 @@ void s390_init_tod(void)
>   
>       if (kvm_enabled()) {
>           obj = object_new(TYPE_KVM_S390_TOD);
> -    } else {
> +    } else if (tcg_enabled()) {
>           obj = object_new(TYPE_QEMU_S390_TOD);
> +    } else if (qtest_enabled()) {
> +        return;
> +    } else {
> +        error_report("current accelerator not handled in s390_init_tod!");
> +        abort();
>       }
>       object_property_add_child(qdev_get_machine(), TYPE_S390_TOD, obj);
>       object_unref(obj);
> 

As long as qtest keeps working, fine with me

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


