Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B7F3B908B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 12:34:32 +0200 (CEST)
Received: from localhost ([::1]:54726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyu1e-0002IM-OB
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 06:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyu09-0001Vz-92
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 06:32:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyu04-0000lY-2Y
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 06:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625135569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5wza/Q1joQ54vxGokREJ8pbZ0jg+hTp/FhWT510c50M=;
 b=NK/tgjMtp5m8Aw8foiyRDaAIJ/hlHkWU+9MT1y/0qqYN1uFtrXvoGs758vwXWq1Z94nTlz
 89uUu4cBbhyysAbHio+ZAP7JtcMDArm5INLvKprKeU1edkdMR1vlJd1/iLDcDTeCmtmMxl
 9j5P1efiIdO7NdbshxTxT+aQDMt6CzY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-n-8-3jPzNv290e5DoWcb7w-1; Thu, 01 Jul 2021 06:32:48 -0400
X-MC-Unique: n-8-3jPzNv290e5DoWcb7w-1
Received: by mail-wr1-f72.google.com with SMTP id
 a4-20020a0560001884b0290124b6e4a437so2365849wri.16
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 03:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5wza/Q1joQ54vxGokREJ8pbZ0jg+hTp/FhWT510c50M=;
 b=sT4pFqsJFnI1RWD2KBcSoiRsVmphpSH0FBK9ZkVyNGR8OpS9moBexZADIv+8NJz2MO
 G0R8a/xkwUqStJfdOPRqTo3QxKpTD/013ug/YPwG5bVptKyTqIknKqoZgAkD67Qr1SkI
 /UIlL+SO2qDx6o/3kqTGEUPueGP6Rju8eI57Ujnr0QFT47/heYvzTXaHPAXqqIm5kQa/
 QZl7POsAqZ8b+f8mQivpJZu90uqICYu9ckPO2TvuDSyRQzPWWHVGrcJiqWZWfuI25u+S
 OvbpMfj/iP1pLspiFVx4OcP/k45jZXJQMTgSjMnRAxgpe14RgZ03wha78Cd+yhHqo+QA
 a3SQ==
X-Gm-Message-State: AOAM530Z5tMjdT4oEl+v0p1cst9b7rQCrTeVCuqQo56LUJ4QXbVlp4Oa
 PKOi9q8zxxWQdQOIMx+QZGKm91n0+U5cZMqw/+vRpYVEXTLHMoYI6Xqema9NxW3qy7U/dlSGwNi
 xXm5SoQyUEgSq3oY=
X-Received: by 2002:adf:ce0e:: with SMTP id p14mr44519860wrn.69.1625135567816; 
 Thu, 01 Jul 2021 03:32:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3rY4d9FTNRtaWF9EzNGMho9O2qQXUQQSTLTm+RJQGk2ahXM9WKd3Lrjsf+6UvqiWlEbUI/Q==
X-Received: by 2002:adf:ce0e:: with SMTP id p14mr44519840wrn.69.1625135567620; 
 Thu, 01 Jul 2021 03:32:47 -0700 (PDT)
Received: from thuth.remote.csb (pd9575bc6.dip0.t-ipconnect.de.
 [217.87.91.198])
 by smtp.gmail.com with ESMTPSA id x1sm23657421wmc.31.2021.07.01.03.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 03:32:47 -0700 (PDT)
Subject: Re: [RFC v6 04/13] hw/s390x: tod: make explicit checks for
 accelerators when initializing
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-5-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <50d5a101-3c71-5393-fae4-641b56651a06@redhat.com>
Date: Thu, 1 Jul 2021 12:32:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629141931.4489-5-acho@suse.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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

On 29/06/2021 16.19, Cho, Yu-Chen wrote:
> replace general "else" with specific checks for each possible accelerator.
> 
> Handle qtest as a NOP, and error out for an unknown accelerator used in
> combination with tod.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
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

I think it might be better to swap the order of patch 03 and 04, to avoid 
that the qtests might break during bisecting later.

For this patch itself:
Reviewed-by: Thomas Huth <thuth@redhat.com>


