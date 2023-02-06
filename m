Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DA268BD19
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:42:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0on-0007ef-H8; Mon, 06 Feb 2023 07:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pP0ok-0007aP-8m
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:41:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pP0oi-0002PS-J0
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675687311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=okOxFNRBawMJX/GrZo7mW7r0/H+vIJ0KrofIPQLvRJo=;
 b=E9s0Yulx3ihAr4XhQjY0TGgA/nVHcS8qAoTJ9ptMrwuaCM6SvPZ0s2VSmhdKt0K7CKAeur
 3adNazY/XSOH4kh3A2/vUgwmQ0/eA9+PU3QD7lC6aJSdP9jUKgU9bFxvN1wWRLwxyN6xYz
 BSIaUWk5+fr6Jvm3qSLq8h8Nlmt4mho=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-35-JIzLSrFYPYKyw1gO0s0v5A-1; Mon, 06 Feb 2023 07:41:50 -0500
X-MC-Unique: JIzLSrFYPYKyw1gO0s0v5A-1
Received: by mail-qk1-f197.google.com with SMTP id
 s7-20020a05620a0bc700b006e08208eb31so7688693qki.3
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 04:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=okOxFNRBawMJX/GrZo7mW7r0/H+vIJ0KrofIPQLvRJo=;
 b=SyOV9ZlOqmnWUJP9W6GrU5dJuS0h53lsYwyRwDXr0dTAndKLNtU8XFWLpdqI9Xo58Z
 Fu10AjUng1vYN5/6LmToSM5rHQ9GnZxXMFyzLAQrMkU00idnRuyS1ezsWbhxPMXpqqhX
 ii7vKP/WsCvmh1hHH1Zz9/dlTEMtpFy88zykcfDFvdkoqlIeNv19BqFCSvybPNYPyDRZ
 YZj4wQv2pcV0YnnvA/CqnSty45KVYjNRVswT9hFQRW+aXAochoNJtyy5F34A3WOBoGGI
 0JPhFURws+pZA9+vxgR/zM3kZVwObaDtw4F5lHnwpVy2JwH+enf3FKmhPZ0gaWTfXhZL
 mtrw==
X-Gm-Message-State: AO0yUKV+pHlzsbWP7tW8CeuNKsvhhxZ8pmltFMTQ6uPzziGWTolKb1hh
 ttzn0qmTLUDf/36LvnRqEdMFDSXSGBHWfY8+8UfLyfEW0/NTMgCZwp6pupV21/MeEBW/3KSRpm0
 f2201WrNqkayAyBA=
X-Received: by 2002:a05:622a:5ce:b0:3b6:36a0:adbe with SMTP id
 d14-20020a05622a05ce00b003b636a0adbemr37258156qtb.6.1675687309823; 
 Mon, 06 Feb 2023 04:41:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+GAXr9jY6Hh9EW3jsp2Uai+08Q7dFWScNRaKTS4AOBcs+GaunXCokeMxElbmP4WgnciGYbEw==
X-Received: by 2002:a05:622a:5ce:b0:3b6:36a0:adbe with SMTP id
 d14-20020a05622a05ce00b003b636a0adbemr37258104qtb.6.1675687309463; 
 Mon, 06 Feb 2023 04:41:49 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-71.web.vodafone.de.
 [109.43.177.71]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05620a27cf00b006fba0a389a4sm7234075qkp.88.2023.02.06.04.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 04:41:48 -0800 (PST)
Message-ID: <a7a235d5-4ded-b83d-dcb6-2cf81ad5f283@redhat.com>
Date: Mon, 6 Feb 2023 13:41:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v15 09/11] machine: adding s390 topology to query-cpu-fast
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-10-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230201132051.126868-10-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/02/2023 14.20, Pierre Morel wrote:
> S390x provides two more topology containers above the sockets,
> books and drawers.
> 
> Let's add these CPU attributes to the QAPI command query-cpu-fast.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   qapi/machine.json          | 13 ++++++++++---
>   hw/core/machine-qmp-cmds.c |  2 ++
>   2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 3036117059..e36c39e258 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -53,11 +53,18 @@
>   #
>   # Additional information about a virtual S390 CPU
>   #
> -# @cpu-state: the virtual CPU's state
> +# @cpu-state: the virtual CPU's state (since 2.12)
> +# @dedicated: the virtual CPU's dedication (since 8.0)
> +# @polarity: the virtual CPU's polarity (since 8.0)
>   #
>   # Since: 2.12
>   ##
> -{ 'struct': 'CpuInfoS390', 'data': { 'cpu-state': 'CpuS390State' } }
> +{ 'struct': 'CpuInfoS390',
> +    'data': { 'cpu-state': 'CpuS390State',
> +              'dedicated': 'bool',
> +              'polarity': 'int'

I think it would also be better to mark the new fields as optional and only 
return them if the guest has the topology enabled, to avoid confusing 
clients that were written before this change.

  Thomas


