Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071073D96B3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 22:26:24 +0200 (CEST)
Received: from localhost ([::1]:39212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8q8F-0006xE-3M
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 16:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m8q6x-0006A7-W0
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:25:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m8q6w-0006fP-3B
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627503901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zxftLiWuQ7h+ynciUpXE1sf8IKeUZwoLLvxF21QGNBU=;
 b=PxeT/WsP+xHMjlhkv94W8w9KhNaBswdYhdLutycP+4KnY+H5KE0rNcb98rYdnd4wliyt2t
 YjM18I7bz0ef03/sA+5uLqztCe7/wHK3sOs+VyAIg21X7mbm0RteE9m/hJ8hebsO3jzjCm
 O5FGOP/OIPgcxXA1iW/nHupcWpbprfg=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-ynjL3FkEMDOQ8B9MnCLKYA-1; Wed, 28 Jul 2021 16:24:59 -0400
X-MC-Unique: ynjL3FkEMDOQ8B9MnCLKYA-1
Received: by mail-il1-f200.google.com with SMTP id
 o6-20020a056e020926b0290221b4e37e75so2054265ilt.21
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 13:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zxftLiWuQ7h+ynciUpXE1sf8IKeUZwoLLvxF21QGNBU=;
 b=e4EQWaMNxRs+yK9Doqt8uRL9PTdGlBKE5AVCmNStlIeCHJgFMdYM9JP0XeLPYNk1aG
 i61oeNxUQfcFIEaZePjw3/HzJti8CzJCtIQ8sl9BxxVVECIpnoiLUOJisNdbvqPTXYJZ
 Xeq/B2vSb9LTTweKe2+HbrMx9tOoaFf0wrk4vUaSStT0Kat5B1P2LZ7U3KZBaAydk7TM
 WOgwCnbKJuEpbXnNWVFB777Xi+Oqujz7TrZOT3+Qz09QeSdOPjIZmC4l0lxLdrSvbT3g
 PeIefPWwPlk2lP4SGnIYAqFoMBy7XVSSM4rdjAqDTEEVL4WB5OobGgoqAieOJwdm393S
 SUgw==
X-Gm-Message-State: AOAM533IicfWL1AWPq3RU9pssluaJq8G96avnU58Ug8O5I7TaJvz5YaZ
 5wBO+OkInVBgjx1NtyI25/IH0fIfQ8OmZpV+eiJTk0r7A0Gd7nHDEeQAbfV420+dZW4alRJJoWR
 gSxTS8skYjt64q+o=
X-Received: by 2002:a02:6f1c:: with SMTP id x28mr1339313jab.95.1627503899294; 
 Wed, 28 Jul 2021 13:24:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHwTtnTxlqmsMrlQISddgintOhA6CGFQZe1CuAqf5doe88J7Q5RMu7CXFkZ3hjEBBM9Hnxig==
X-Received: by 2002:a02:6f1c:: with SMTP id x28mr1339287jab.95.1627503899020; 
 Wed, 28 Jul 2021 13:24:59 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id g15sm482898ild.29.2021.07.28.13.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 13:24:58 -0700 (PDT)
Date: Wed, 28 Jul 2021 22:24:56 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v3 04/11] machine: Improve the error reporting of
 smp parsing
Message-ID: <20210728202456.t3zfbnvw7ayvyl2l@gator>
References: <20210728034848.75228-1-wangyanan55@huawei.com>
 <20210728034848.75228-5-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210728034848.75228-5-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 28, 2021 at 11:48:41AM +0800, Yanan Wang wrote:
> We have two requirements for a valid SMP configuration:
> the product of "sockets * cores * threads" must represent all the
> possible cpus, i.e., max_cpus, and then must include the initially
> present cpus, i.e., smp_cpus.
> 
> So we only need to ensure 1) "sockets * cores * threads == maxcpus"
> at first and then ensure 2) "maxcpus >= cpus". With a reasonable
> order of the sanity check, we can simplify the error reporting code.
> When reporting an error message we also report the exact value of
> each topology member to make users easily see what's going on.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 22 +++++++++-------------
>  hw/i386/pc.c      | 24 ++++++++++--------------
>  2 files changed, 19 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 958e6e7107..e879163c3b 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -777,25 +777,21 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
>      cpus = cpus > 0 ? cpus : maxcpus;
>  
> -    if (sockets * cores * threads < cpus) {
> -        error_setg(errp, "cpu topology: "
> -                   "sockets (%u) * cores (%u) * threads (%u) < "
> -                   "smp_cpus (%u)",
> -                   sockets, cores, threads, cpus);
> +    if (sockets * cores * threads != maxcpus) {
> +        error_setg(errp, "Invalid CPU topology: "
> +                   "product of the hierarchy must match maxcpus: "
> +                   "sockets (%u) * cores (%u) * threads (%u) "
> +                   "!= maxcpus (%u)",
> +                   sockets, cores, threads, maxcpus);
>          return;
>      }
>  
>      if (maxcpus < cpus) {
> -        error_setg(errp, "maxcpus must be equal to or greater than smp");
> -        return;
> -    }
> -
> -    if (sockets * cores * threads != maxcpus) {
>          error_setg(errp, "Invalid CPU topology: "
> +                   "maxcpus must be equal to or greater than smp: "
>                     "sockets (%u) * cores (%u) * threads (%u) "
> -                   "!= maxcpus (%u)",
> -                   sockets, cores, threads,
> -                   maxcpus);
> +                   "== maxcpus (%u) < smp_cpus (%u)",
> +                   sockets, cores, threads, maxcpus, cpus);
>          return;
>      }
>  
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 9ad7ae5254..3e403a7129 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -747,25 +747,21 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>      maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
>      cpus = cpus > 0 ? cpus : maxcpus;
>  
> -    if (sockets * dies * cores * threads < cpus) {
> -        error_setg(errp, "cpu topology: "
> -                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
> -                   "smp_cpus (%u)",
> -                   sockets, dies, cores, threads, cpus);
> +    if (sockets * cores * threads != maxcpus) {
> +        error_setg(errp, "Invalid CPU topology: "
> +                   "product of the hierarchy must match maxcpus: "
> +                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
> +                   "!= maxcpus (%u)",
> +                   sockets, dies, cores, threads, maxcpus);
>          return;
>      }
>  
>      if (maxcpus < cpus) {
> -        error_setg(errp, "maxcpus must be equal to or greater than smp");
> -        return;
> -    }
> -
> -    if (sockets * dies * cores * threads != maxcpus) {
> -        error_setg(errp, "Invalid CPU topology deprecated: "
> +        error_setg(errp, "Invalid CPU topology: "
> +                   "maxcpus must be equal to or greater than smp: "
>                     "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
> -                   "!= maxcpus (%u)",
> -                   sockets, dies, cores, threads,
> -                   maxcpus);
> +                   "== maxcpus (%u) < smp_cpus (%u)",
> +                   sockets, dies, cores, threads, maxcpus, cpus);
>          return;
>      }
>  
> -- 
> 2.19.1
>

 
Reviewed-by: Andrew Jones <drjones@redhat.com>


