Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B910600827
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 09:54:41 +0200 (CEST)
Received: from localhost ([::1]:45410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okKxM-0001v9-9s
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 03:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1okKa2-00061P-SN
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:30:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1okKZy-0001dJ-9p
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665991810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvAxYdeCOYWH4QCXiUbCRHIf397+9vSs06F5PLy4WSw=;
 b=cr76va8LNPJlvpm144b5hyqnbBGqYEpcWjqENG4uw3QIqBiT3R4uLzU09Ivya/Gds3BV5e
 9XnCKKOfohxZBOVW1NsiTUWei3Bo+PI4tMtIOfNzBX339WqL0Txo6a/hctRXYLIIuWlTCt
 Ll2YPvgOftbs0NmZHKTdZKVg5e174o8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-360-fqtej4lbNiifmYNqb6EeQQ-1; Mon, 17 Oct 2022 03:30:08 -0400
X-MC-Unique: fqtej4lbNiifmYNqb6EeQQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 cc18-20020a05622a411200b0039cdeb3a699so3600603qtb.23
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 00:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rvAxYdeCOYWH4QCXiUbCRHIf397+9vSs06F5PLy4WSw=;
 b=65+mw2KKQLPOlE73vPjf018098TYnxsD4SplL/yyu2vTsh4aPYdrUvzzBdYMxIr6pD
 1Gy/5P3sm1aVvtayWmZB1Pv9+lz8UZj7u0TmZ+bGleEEJ1WS/OBxDFqLaU5v/UeWVZqY
 y1hCo6Us/78ogWhiKAtDCnjAyxMiolc1GBhAkmURthNQvKKPp+9R/C8x+wfZvo+9x0on
 MvwQstY62cBMwPuF3oz6aPcSIX/juVGWyuypUp65herlawNCdIMN0sONyPPBSvUvmi6d
 3CXn5mbBfVC3q0vjm0uAHgG31zUl/3qLIwhTeZOk0mXC8fmR+e+DeJoLj4qoARkCJBD+
 MjBQ==
X-Gm-Message-State: ACrzQf2uik6z88H9TBSu/x8xs6UUmDKL9WVi9nKxCO6vXPqKukVe9Q4Y
 VzDYwXAoXWfFzeaAj/bv0oeXE6QHrV7j1TMuWMlcf9oViW2OCoWT+g8jGzagNfNMB8WLMOS8djg
 5yFXyn2Zf+UX3lxQ=
X-Received: by 2002:a37:8a87:0:b0:6cf:3ee4:56e0 with SMTP id
 m129-20020a378a87000000b006cf3ee456e0mr6424481qkd.200.1665991808531; 
 Mon, 17 Oct 2022 00:30:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7oVfdqPtdbJ0cnYMdRiDTfUmP+v6cgSJDdLxEnycF6c9G4mr1dMFzW56AqlJXvZi+7jJVEuw==
X-Received: by 2002:a37:8a87:0:b0:6cf:3ee4:56e0 with SMTP id
 m129-20020a378a87000000b006cf3ee456e0mr6424467qkd.200.1665991808271; 
 Mon, 17 Oct 2022 00:30:08 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-160.web.vodafone.de.
 [109.43.178.160]) by smtp.gmail.com with ESMTPSA id
 w7-20020ac86b07000000b00342f8d4d0basm7286612qts.43.2022.10.17.00.30.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 00:30:07 -0700 (PDT)
Message-ID: <f2600526-0223-94df-08c2-847c7f2b2ec6@redhat.com>
Date: Mon, 17 Oct 2022 09:30:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Nico Boehr <nrb@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, qemu-devel@nongnu.org,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com
References: <20221012123229.1196007-1-nrb@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v1] s390x/tod-kvm: don't save/restore the TOD in PV guests
In-Reply-To: <20221012123229.1196007-1-nrb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/2022 14.32, Nico Boehr wrote:
> Under PV, the guest's TOD clock is under control of the ultravisor and the
> hypervisor cannot change it.
> 
> With upcoming kernel changes[1], the Linux kernel will reject QEMU's
> request to adjust the guest's clock in this case, so don't attempt to set
> the clock.
> 
> This avoids the following warning message on save/restore of a PV guest:
> 
> warning: Unable to set KVM guest TOD clock: Operation not supported
> 
> [1] https://lore.kernel.org/all/20221011160712.928239-2-nrb@linux.ibm.com/
> 
> Fixes: c3347ed0d2ee ("s390x: protvirt: Support unpack facility")
> Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
> ---
>   hw/s390x/tod-kvm.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/hw/s390x/tod-kvm.c b/hw/s390x/tod-kvm.c
> index 9d0cbfbce2bf..303bd67ee64f 100644
> --- a/hw/s390x/tod-kvm.c
> +++ b/hw/s390x/tod-kvm.c
> @@ -13,6 +13,7 @@
>   #include "qemu/module.h"
>   #include "sysemu/runstate.h"
>   #include "hw/s390x/tod.h"
> +#include "hw/s390x/pv.h"
>   #include "kvm/kvm_s390x.h"
>   
>   static void kvm_s390_get_tod_raw(S390TOD *tod, Error **errp)
> @@ -84,6 +85,13 @@ static void kvm_s390_tod_vm_state_change(void *opaque, bool running,
>       S390TODState *td = opaque;
>       Error *local_err = NULL;
>   
> +    /*
> +     * Under PV, the clock is under ultravisor control, hence we cannot restore
> +     * it on resume.
> +     */
> +    if (s390_is_pv())
> +        return;

  Hi Nico,

I know it's annoying when switching between kernel coding style and QEMU 
coding style, but please use curly braces when doing QEMU patches. I wonder 
why checkpatch.pl does not print any warnings here...?

Anyway, since it's a trivial patch, I fixed it up on my own and queued your 
patch to my s390x-next branch:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


