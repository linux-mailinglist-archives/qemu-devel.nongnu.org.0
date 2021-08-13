Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692793EB5BA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 14:46:20 +0200 (CEST)
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEWZn-0003WH-0y
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 08:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mEWXz-0002mS-Nl
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 08:44:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mEWXv-0005tD-3H
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 08:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628858661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PCSLf8CvrbyewRgYDbe8Ww++B2hkC+cptwAXglH4R1E=;
 b=W1DAtiQbEp878Fhny4Ou7n8at2Dyt5hWjNJaSVZpgSjAeIsmLzCVm74HRp73lcWiBYoFaT
 B8rcQYQ5Nr2vT2RHJ3yrVfHdS3MTZ5XN7kSaiTpr4lKqaS+mbg5PEbFErr6ZHGeCqRBASG
 9gQj0F4QQRGQ2FXVzpSxXJsX2ey4oio=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-ZdffCYx8NLa2t2onbU0Gag-1; Fri, 13 Aug 2021 08:44:20 -0400
X-MC-Unique: ZdffCYx8NLa2t2onbU0Gag-1
Received: by mail-wr1-f71.google.com with SMTP id
 e17-20020adfa4510000b02901550e0550f3so2870397wra.11
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 05:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PCSLf8CvrbyewRgYDbe8Ww++B2hkC+cptwAXglH4R1E=;
 b=f/989xoaUg72wbyDAL4H0xauQYGQo0ENSNC2n06JCOTAXpnbaetN/PWeQwnQcDPugP
 sLZ2TbnznhrlS9zk+Lka1IpR9MSXw5CHJuaSzDHx5gXsYUtc7e3I7BkrZMnredobwSkX
 ztlfw2sHvj3ETWVXBOG+lSbbFIH6bZhmRU269w7f0qzuVTpgeKq0Gm56osZqbqfAA9Lm
 bj5qJ7IiIRn4Qz+odPh4PFq29GWcMWIvMWzR5lSdFdKAJ2wmZ1nocZaMU3+6NEynozKf
 kMLcaEd1+sq3T92hnDQIwDybjZZ1iW24KTMEjxvfxxWVCth0YMHIEhNU4wGSGCo8ERpJ
 xDSQ==
X-Gm-Message-State: AOAM532cExVI0TG9kxVEECEnMvHiSoPijzrSfh861Isq0S04PqLAf+Hf
 IFMxHLa50+oH3rNLN29PUbsMe7Bk6EW1cna4zdgAq47uCZoW7ddwHffyOKPxbmc4UAqD6aU97pY
 71xD4NBR2WuuD+/s=
X-Received: by 2002:a5d:4e4f:: with SMTP id r15mr2995802wrt.346.1628858659329; 
 Fri, 13 Aug 2021 05:44:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzid+33I3Qh8KcFNc+0TyX5IRJoxup8vtW7yVXt25Rif5tYBlcIFf0tbbSW+kZPfAP1p1U18g==
X-Received: by 2002:a5d:4e4f:: with SMTP id r15mr2995783wrt.346.1628858659145; 
 Fri, 13 Aug 2021 05:44:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d7sm1540176wrs.39.2021.08.13.05.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 05:44:18 -0700 (PDT)
Subject: Re: [PATCH for-6.1 ?] hw/core: fix error checkig in smp_parse
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210812175353.4128471-1-berrange@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3317a4ec-f802-778f-5376-07a598ff914a@redhat.com>
Date: Fri, 13 Aug 2021 14:44:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812175353.4128471-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/08/21 19:53, Daniel P. Berrangé wrote:
> The machine_set_smp() mistakenly checks 'errp' not '*errp',
> and so thinks there is an error every single time it runs.
> This causes it to jump to the end of the method, skipping
> the max CPUs checks. The caller meanwhile sees no error
> and so carries on execution. The result of all this is:
> 
>   $ qemu-system-x86_64 -smp -1
>   qemu-system-x86_64: GLib: ../glib/gmem.c:142: failed to allocate 481036337048 bytes
> 
> instead of
> 
>   $ qemu-system-x86_64 -smp -1
>   qemu-system-x86_64: Invalid SMP CPUs -1. The max CPUs supported by machine 'pc-i440fx-6.1' is 255
> 
> This is a regression from
> 
>    commit fe68090e8fbd6e831aaf3fc3bb0459c5cccf14cf
>    Author: Paolo Bonzini <pbonzini@redhat.com>
>    Date:   Thu May 13 09:03:48 2021 -0400
> 
>      machine: add smp compound property
> 
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/524
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/core/machine.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 943974d411..ab4fca6546 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -832,7 +832,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>       }
>   
>       mc->smp_parse(ms, config, errp);
> -    if (errp) {
> +    if (*errp) {
>           goto out_free;
>       }
>   
> 

Queued, thanks.

Paolo


