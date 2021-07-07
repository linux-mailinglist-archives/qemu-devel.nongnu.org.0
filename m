Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CAA3BE741
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:41:57 +0200 (CEST)
Received: from localhost ([::1]:50712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15wC-0006lb-OS
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m15tY-0005kZ-DU
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:39:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m15tW-0006pq-Hw
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625657949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R8NJC6ri/DI2SfS1ttYkCQ+Q/MSYqE9O3lPETEVtmXw=;
 b=Gk/VOMm1xpYUASDjd38n/rtrtu7ShWBf48bWFj2cc/5xaWOg1d0lXMUZ14dPOFeh7+Y8j3
 CCrIebwTC6fpbxplPVZQf0xFK2F9r+PSnvhVaHg2VhqIlYzK3m1ATnWAAAjEUxC9Vo136U
 D2QMJo4TYfbAbCvhWvDp2w73t+/Zb90=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-YKC6_tHKNfi-zKUasby6ZA-1; Wed, 07 Jul 2021 07:39:06 -0400
X-MC-Unique: YKC6_tHKNfi-zKUasby6ZA-1
Received: by mail-wm1-f70.google.com with SMTP id
 z127-20020a1c7e850000b02901e46e4d52c0so2354066wmc.6
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 04:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R8NJC6ri/DI2SfS1ttYkCQ+Q/MSYqE9O3lPETEVtmXw=;
 b=nyqFJN8nHXexfMDn3Tf9XiCO2MlHQ2LTzrxzvNmg0NDhBuZ+uqoQV9OQgRaMCKKiSn
 OwVLSaWXdcvZx0qSUwUQrgBB4rO1XE3GlF7hnX+Pxa4S79hPkavdYnIB1EROViVdGM5B
 Jzbs+dI8rGDKjvN9ic7hjdImzW8i8NAm0564R8DZEJrJCPEdBMNuV+IgxzKH9AfHoN2K
 6is3FnB1Rbye82qRvjw48V8GsDpeDKj4qFjsJISktFg2AgVc5b8f1xnNYsU3IdE8tPrf
 8Q2T0ZXxDhz0RAuHYRz3IcddgcNwM6BfH4E6LN4vRNs7xJLyk9is9D+6WHMj8iDJNzJc
 yjow==
X-Gm-Message-State: AOAM530Uk/gJ5qAXrdLI+oOxLa1pgtOpkl2eExPkG5YNKe3cKtFkg/GW
 5B+FlQZwttvXS90Fub2d/ugWKVyocK48AmMJ/8+3VbryRdIIUs68/t2INs4C4g6NSkCap/8wg28
 PSs9DW2LwIRnd3Ww=
X-Received: by 2002:a1c:f016:: with SMTP id a22mr26952701wmb.65.1625657945216; 
 Wed, 07 Jul 2021 04:39:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtVac1pbLMuMBiPMCoKm3Dd6RvAkRZdDtcXLN25VKLOHkymUP2UfGjY9YirhOPW/xMa6riQA==
X-Received: by 2002:a1c:f016:: with SMTP id a22mr26952679wmb.65.1625657945041; 
 Wed, 07 Jul 2021 04:39:05 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ead.dip0.t-ipconnect.de.
 [217.87.94.173])
 by smtp.gmail.com with ESMTPSA id h15sm19417529wrq.88.2021.07.07.04.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 04:39:04 -0700 (PDT)
Subject: Re: [PATCH v7 07/14] target/s390x: start moving TCG-only code to tcg/
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210707105324.23400-1-acho@suse.com>
 <20210707105324.23400-8-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <26ff1e71-1cfb-8fdb-9bb3-56ec61f234d7@redhat.com>
Date: Wed, 7 Jul 2021 13:39:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707105324.23400-8-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Cornelia Huck <cohuck@redhat.com>, cfontana@suse.com,
 David Hildenbrand <david@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/07/2021 12.53, Cho, Yu-Chen wrote:
> move everything related to translate, as well as HELPER code in tcg/
> 
> mmu_helper.c stays put for now, as it contains both TCG and KVM code.
> 
> After the reshuffling, update MAINTAINERS accordingly.
> Make use of the new directory:
> 
> target/s390x/tcg/
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   MAINTAINERS                                |  1 +
>   hw/s390x/tod-tcg.c                         |  2 +-
>   include/hw/s390x/tod.h                     |  2 +-
>   target/s390x/interrupt.c                   |  2 +-
>   target/s390x/machine.c                     |  2 +-
>   target/s390x/meson.build                   | 17 ++---------------
>   target/s390x/{ => tcg}/cc_helper.c         |  0
>   target/s390x/{ => tcg}/crypto_helper.c     |  0
>   target/s390x/{ => tcg}/excp_helper.c       |  0
>   target/s390x/{ => tcg}/fpu_helper.c        |  0
>   target/s390x/{ => tcg}/insn-data.def       |  0
>   target/s390x/{ => tcg}/insn-format.def     |  0
>   target/s390x/{ => tcg}/int_helper.c        |  0
>   target/s390x/{ => tcg}/mem_helper.c        |  0
>   target/s390x/tcg/meson.build               | 14 ++++++++++++++
>   target/s390x/{ => tcg}/misc_helper.c       |  0
>   target/s390x/{ => tcg}/s390-tod.h          |  0
>   target/s390x/{ => tcg}/tcg_s390x.h         |  0
>   target/s390x/{ => tcg}/translate.c         |  0
>   target/s390x/{ => tcg}/translate_vx.c.inc  |  0
>   target/s390x/{ => tcg}/vec.h               |  0
>   target/s390x/{ => tcg}/vec_fpu_helper.c    |  0
>   target/s390x/{ => tcg}/vec_helper.c        |  0
>   target/s390x/{ => tcg}/vec_int_helper.c    |  0
>   target/s390x/{ => tcg}/vec_string_helper.c |  0
>   25 files changed, 21 insertions(+), 19 deletions(-)
>   rename target/s390x/{ => tcg}/cc_helper.c (100%)
>   rename target/s390x/{ => tcg}/crypto_helper.c (100%)
>   rename target/s390x/{ => tcg}/excp_helper.c (100%)
>   rename target/s390x/{ => tcg}/fpu_helper.c (100%)
>   rename target/s390x/{ => tcg}/insn-data.def (100%)
>   rename target/s390x/{ => tcg}/insn-format.def (100%)
>   rename target/s390x/{ => tcg}/int_helper.c (100%)
>   rename target/s390x/{ => tcg}/mem_helper.c (100%)
>   create mode 100644 target/s390x/tcg/meson.build
>   rename target/s390x/{ => tcg}/misc_helper.c (100%)
>   rename target/s390x/{ => tcg}/s390-tod.h (100%)
[...]
> diff --git a/include/hw/s390x/tod.h b/include/hw/s390x/tod.h
> index ff3195a4bf..0935e85089 100644
> --- a/include/hw/s390x/tod.h
> +++ b/include/hw/s390x/tod.h
> @@ -12,7 +12,7 @@
>   #define HW_S390_TOD_H
>   
>   #include "hw/qdev-core.h"
> -#include "target/s390x/s390-tod.h"
> +#include "tcg/s390-tod.h"

Technically, s390-tod.h is not specific to tcg, so I'm not sure whether we 
really want to move it ... maybe it would even be possible to merge its 
contents into include/hw/s390x/tod.h instead .... but we can still clean 
that up later, so FWIW:

Reviewed-by: Thomas Huth <thuth@redhat.com>


