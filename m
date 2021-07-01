Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5A63B9665
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 21:18:09 +0200 (CEST)
Received: from localhost ([::1]:33762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz2CO-0001W7-4Y
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 15:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lz2Am-0000WW-8l
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 15:16:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lz2Ai-0007o4-NH
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 15:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625166983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sVzvhMLEOrhw4Gm5POorP6jOeJOFT0deaxMWHEn79Dw=;
 b=hpAWXeNz5C12/SB3jHlMPi+5B8EV5KmWKpvjRQLoHEFs+JUwDXlxonCeBJxYe8PYNcju/p
 9rX7ysv8+9y6fYAY6Kz5c9Gi/6KXdJPX1ccnWHU6lWfDdQOzLm5N9U+FlM9ThRYQO6v7q8
 oPqup4tRhEpQrtCooRRstKgH99YaubQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-FWnkiUSWPemQBozGUkwGtw-1; Thu, 01 Jul 2021 15:16:22 -0400
X-MC-Unique: FWnkiUSWPemQBozGUkwGtw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m186-20020a1c26c30000b02901e1c85168f1so1369130wmm.2
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 12:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sVzvhMLEOrhw4Gm5POorP6jOeJOFT0deaxMWHEn79Dw=;
 b=hZyMaLoGIezrefe48cc3PxW0d4g+2hT2ReplOGvgCyl3n+iTgCCubY8AernNsONsDL
 AS5hMs1Dy5FveEybVz7X6Bb5/Iba5vkWq2SB/pYaAPAwSHX7Kt2a6//Hwcv2PbuMpqF7
 rNfqk9j/q3+BP3C14lRY4BgavH7KJb3pyDeZYNc5PSyyKCIPxEYLoUb4EEHt1Fn7H00K
 bQU9TzTciGVT41KQzZvso8F3wZ3j9q+DJilmxt0q7Zzwek3X9YxmVzMONrJaDzWd3uF8
 Eg4AwAt4hUzvQtp+M0XwCGK4VsWxGCLnFgVK/ZEXu/N7xOW2lJvAb9otpxNGiHvq/qvk
 u8ow==
X-Gm-Message-State: AOAM531YD16vRBAbO1uNwDkc9jEbVrkCMEyA63aESmqQtXmWeJZKU5/1
 6ERhhmDEQaqQj/TlCr5cF5RXtWmg01uEJblxkYWKOkdRCEOtwmF9JPvorV+Z9Y82pDGYhpbhNMG
 Re7jWM5GNEtUWkjU=
X-Received: by 2002:a7b:cc8d:: with SMTP id p13mr1303910wma.33.1625166981000; 
 Thu, 01 Jul 2021 12:16:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmey3UZrO1MtUVAj8u2/7kzt6BhUZdIJM/ilM8gGUDKv8SBEA69s7tsY6792kNYLwpKuNs5w==
X-Received: by 2002:a7b:cc8d:: with SMTP id p13mr1303881wma.33.1625166980689; 
 Thu, 01 Jul 2021 12:16:20 -0700 (PDT)
Received: from thuth.remote.csb (pd9575bc6.dip0.t-ipconnect.de.
 [217.87.91.198])
 by smtp.gmail.com with ESMTPSA id z9sm10148220wmf.43.2021.07.01.12.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 12:16:20 -0700 (PDT)
Subject: Re: [RFC v6 10/13] target/s390x: use kvm_enabled() to wrap call to
 kvm_s390_get_hpage_1m
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-11-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5dd2785f-489b-61c7-7c7b-8e2cfcddd5ed@redhat.com>
Date: Thu, 1 Jul 2021 21:16:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629141931.4489-11-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Cc: cfontana@suse.com, Claudio Fontana <cfontana@suse.de>,
 jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/06/2021 16.19, Cho, Yu-Chen wrote:
> this will allow to remove the kvm stubs.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>   target/s390x/diag.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/s390x/diag.c b/target/s390x/diag.c
> index c17a2498a7..8405f69df0 100644
> --- a/target/s390x/diag.c
> +++ b/target/s390x/diag.c
> @@ -20,6 +20,7 @@
>   #include "hw/s390x/ipl.h"
>   #include "hw/s390x/s390-virtio-ccw.h"
>   #include "hw/s390x/pv.h"
> +#include "sysemu/kvm.h"
>   #include "kvm_s390x.h"
>   
>   int handle_diag_288(CPUS390XState *env, uint64_t r1, uint64_t r3)
> @@ -168,7 +169,7 @@ out:
>               return;
>           }
>   
> -        if (kvm_s390_get_hpage_1m()) {
> +        if (kvm_enabled() && kvm_s390_get_hpage_1m()) {
>               error_report("Protected VMs can currently not be backed with "
>                            "huge pages");
>               env->regs[r1 + 1] = DIAG_308_RC_INVAL_FOR_PV;

Reviewed-by: Thomas Huth <thuth@redhat.com>


