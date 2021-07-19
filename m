Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735DC3CE222
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 18:13:51 +0200 (CEST)
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Vtt-0003gB-VX
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 12:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5Vs6-0002Ec-PF
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:11:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5Vs3-0003Pm-0K
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626711113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rfONtBPSi28j5DEHzVYvrm30jA/zf4Xb1AKuou8zgaw=;
 b=d1Xn9dmVrTYdPWwk2GTOXvTmjBFiAmMmMRuSpp7EWNFLKq1IuVpefADwEN52XBAFwgkBN1
 qKqspjOd+lsTspexAASmSzf0zQtXNOqnZXphy98cCStdEgFF9LQXnP4HUmfjVFZVXs+IGY
 HIk71gixkzBTyTlI//fIsqpDUrSKryI=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-f493_bvsN7Siv4JrVzTVfA-1; Mon, 19 Jul 2021 12:11:51 -0400
X-MC-Unique: f493_bvsN7Siv4JrVzTVfA-1
Received: by mail-il1-f200.google.com with SMTP id
 e16-20020a056e0204b0b029020c886c9370so10920558ils.10
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 09:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rfONtBPSi28j5DEHzVYvrm30jA/zf4Xb1AKuou8zgaw=;
 b=N3L/8U6oRAE07svPf66TNcaeEWg55zh5JOAjZ+fw0BG8mQmoJDtC5Yw4nFIY34z9Lm
 brQ5nl16LVWSH8aBrFFbWtuJvfOUUBt+pKvgFKf0Mh8DgPuqajlMAHLqYLGGS4MrMSsV
 KxK9A/CEMAD6eeRaxhU/Mmo6q/E8GPFEqf4ygDabBRCJ9lYeMH1L7A8zUs91ARDUinLY
 UjwHboWFLKnlRxzRWgXpnVd5oLDIw6iwqVvhRgcWDII9rhZh3immQehgZNOflNiggvq2
 r+k7xxrUaBBwKT9Io6ONssy20VOMEG9EZa/VIklvWErcv+Hzf8cFqfhiLVixnANCxUiv
 y0zA==
X-Gm-Message-State: AOAM533dR0/awBwMhEL9raJgUs73tCeV8NsirftAXbje7xQVz87btHSJ
 s7kX9ps6h9Cb18lUyMq1GXpfc9CY8nbERyFd5pko/Nwz69oBdYEmydjk7fzpXqvrjgZG/Qr7qyV
 /yR5fe+MVgh+MT1w=
X-Received: by 2002:a05:6e02:16c7:: with SMTP id
 7mr1643495ilx.269.1626711111209; 
 Mon, 19 Jul 2021 09:11:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaFe6KzPq1rQL55o2qxn3PVeVNe3YmctzRXkWUlTHQ0BSZKHMCVNzt3ExngM2SpRQW2cy+aw==
X-Received: by 2002:a05:6e02:16c7:: with SMTP id
 7mr1643479ilx.269.1626711110971; 
 Mon, 19 Jul 2021 09:11:50 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id r1sm9410662ilt.37.2021.07.19.09.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 09:11:50 -0700 (PDT)
Date: Mon, 19 Jul 2021 18:11:48 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 01/11] machine: Disallow specifying topology
 parameters as zero
Message-ID: <20210719161148.lpkziyzgkuavl7nv@gator>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210719032043.25416-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Igor Mammedov <imammedo@redhat.com>,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 11:20:33AM +0800, Yanan Wang wrote:
> In the SMP configuration, we should either specify a topology
> parameter with a reasonable value (equal to or greater than 1)
> or just leave it omitted and QEMU will calculate its value.
> 
> Configurations which explicitly specify the topology parameters
> as zero like "sockets=0" are meaningless, so disallow them.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 31 +++++++++++++++++++++++--------
>  hw/i386/pc.c      | 29 +++++++++++++++++++++--------
>  qapi/machine.json |  4 ++--
>  3 files changed, 46 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 775add0795..d73daa10f4 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -745,11 +745,25 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>  {
>      unsigned cpus    = config->has_cpus ? config->cpus : 0;
>      unsigned sockets = config->has_sockets ? config->sockets : 0;
> +    unsigned dies    = config->has_dies ? config->dies : 1;
>      unsigned cores   = config->has_cores ? config->cores : 0;
>      unsigned threads = config->has_threads ? config->threads : 0;
> +    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
> +
> +    if ((config->has_cpus && config->cpus == 0) ||
> +        (config->has_sockets && config->sockets == 0) ||
> +        (config->has_dies && config->dies == 0) ||
> +        (config->has_cores && config->cores == 0) ||
> +        (config->has_threads && config->threads == 0) ||
> +        (config->has_maxcpus && config->maxcpus == 0)) {
> +        error_setg(errp, "parameters must be equal to or greater than one"
> +                   "if provided");

Missing a space between 'one' and 'if'. It's better to just put the whole
string on one line too (ignore the 80 char thing) for error grepping.

> +        return;
> +    }
>  
> -    if (config->has_dies && config->dies != 0 && config->dies != 1) {
> +    if (dies > 1) {
>          error_setg(errp, "dies not supported by this machine's CPU topology");
> +        return;
>      }
>  
>      /* compute missing values, prefer sockets over cores over threads */
> @@ -760,8 +774,8 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>              sockets = sockets > 0 ? sockets : 1;
>              cpus = cores * threads * sockets;
>          } else {
> -            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
> -            sockets = ms->smp.max_cpus / (cores * threads);
> +            maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +            sockets = maxcpus / (cores * threads);
>          }
>      } else if (cores == 0) {
>          threads = threads > 0 ? threads : 1;
> @@ -778,26 +792,27 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>          return;
>      }
>  
> -    ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
>  
> -    if (ms->smp.max_cpus < cpus) {
> +    if (maxcpus < cpus) {
>          error_setg(errp, "maxcpus must be equal to or greater than smp");
>          return;
>      }
>  
> -    if (sockets * cores * threads != ms->smp.max_cpus) {
> +    if (sockets * cores * threads != maxcpus) {
>          error_setg(errp, "Invalid CPU topology: "
>                     "sockets (%u) * cores (%u) * threads (%u) "
>                     "!= maxcpus (%u)",
>                     sockets, cores, threads,
> -                   ms->smp.max_cpus);
> +                   maxcpus);
>          return;
>      }
>  
>      ms->smp.cpus = cpus;
> +    ms->smp.sockets = sockets;
>      ms->smp.cores = cores;
>      ms->smp.threads = threads;
> -    ms->smp.sockets = sockets;
> +    ms->smp.max_cpus = maxcpus;
>  }
>  
>  static void machine_get_smp(Object *obj, Visitor *v, const char *name,
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c2b9d62a35..c6b63c00a5 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -719,6 +719,18 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>      unsigned dies    = config->has_dies ? config->dies : 1;
>      unsigned cores   = config->has_cores ? config->cores : 0;
>      unsigned threads = config->has_threads ? config->threads : 0;
> +    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
> +
> +    if ((config->has_cpus && config->cpus == 0) ||
> +        (config->has_sockets && config->sockets == 0) ||
> +        (config->has_dies && config->dies == 0) ||
> +        (config->has_cores && config->cores == 0) ||
> +        (config->has_threads && config->threads == 0) ||
> +        (config->has_maxcpus && config->maxcpus == 0)) {
> +        error_setg(errp, "parameters must be equal to or greater than one"
> +                   "if provided");

Same comment as above.

> +        return;
> +    }
>  
>      /* compute missing values, prefer sockets over cores over threads */
>      if (cpus == 0 || sockets == 0) {
> @@ -728,8 +740,8 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>              sockets = sockets > 0 ? sockets : 1;
>              cpus = cores * threads * dies * sockets;
>          } else {
> -            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
> -            sockets = ms->smp.max_cpus / (cores * threads * dies);
> +            maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +            sockets = maxcpus / (cores * threads * dies);
>          }
>      } else if (cores == 0) {
>          threads = threads > 0 ? threads : 1;
> @@ -746,27 +758,28 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>          return;
>      }
>  
> -    ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
>  
> -    if (ms->smp.max_cpus < cpus) {
> +    if (maxcpus < cpus) {
>          error_setg(errp, "maxcpus must be equal to or greater than smp");
>          return;
>      }
>  
> -    if (sockets * dies * cores * threads != ms->smp.max_cpus) {
> +    if (sockets * dies * cores * threads != maxcpus) {
>          error_setg(errp, "Invalid CPU topology deprecated: "
>                     "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
>                     "!= maxcpus (%u)",
>                     sockets, dies, cores, threads,
> -                   ms->smp.max_cpus);
> +                   maxcpus);
>          return;
>      }
>  
>      ms->smp.cpus = cpus;
> -    ms->smp.cores = cores;
> -    ms->smp.threads = threads;
>      ms->smp.sockets = sockets;
>      ms->smp.dies = dies;
> +    ms->smp.cores = cores;
> +    ms->smp.threads = threads;
> +    ms->smp.max_cpus = maxcpus;
>  }
>  
>  static
> diff --git a/qapi/machine.json b/qapi/machine.json
> index c3210ee1fb..c11b2e6f73 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1288,8 +1288,8 @@
>  ##
>  # @SMPConfiguration:
>  #
> -# Schema for CPU topology configuration.  "0" or a missing value lets
> -# QEMU figure out a suitable value based on the ones that are provided.
> +# Schema for CPU topology configuration. A missing value lets QEMU
> +# figure out a suitable value based on the ones that are provided.
>  #
>  # @cpus: number of virtual CPUs in the virtual machine
>  #
> -- 
> 2.19.1
> 

Otherwise

Reviewed-by: Andrew Jones <drjones@redhat.com>


