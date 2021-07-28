Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BE03D96F2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 22:41:24 +0200 (CEST)
Received: from localhost ([::1]:56478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8qMl-0002mA-8Z
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 16:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m8qLH-0001Hq-EC
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:39:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m8qLF-0000XC-Qq
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:39:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627504789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QmEMItRtRm3JbMJFlpsS5o1EGkbPC8Kgs7t/O+IhNxQ=;
 b=RuS02do2Ry26QGn9FV84Q+V2eixyjR1APOLVSO7eiXk+Ux/iIi6CJTZdjb9ZZ38kOOQb9e
 MQqFqAiBVELz1Yt3LdlovE0wtmPDlXfjhbWlZi1OBqQBfzcW0Kw9h1LiJx3lMnzLocqHUp
 sTfJJLu5zrcLr0rIG447j2lC42oWo0w=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-7jIjL-xaM-2RMKdymcgdDw-1; Wed, 28 Jul 2021 16:39:48 -0400
X-MC-Unique: 7jIjL-xaM-2RMKdymcgdDw-1
Received: by mail-io1-f70.google.com with SMTP id
 f10-20020a6b620a0000b02904e5ab8bdc6cso1969252iog.22
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 13:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QmEMItRtRm3JbMJFlpsS5o1EGkbPC8Kgs7t/O+IhNxQ=;
 b=GnKHRF1q/Z0pKN7OKCB0wDD2fdV9ugyWbas+HYoQjyKIe+BoYlGi0w3JHSUIBDr+Bu
 OycFkYKKfE/iZoGaOtNDUcVo57VbCnOhr5fKr3NpcNa5v48tN8t9myPqRW2QVui591fi
 r8iXSUrLqyNqabSd1/p1g2+uQaxTrb6yg1Fnik92O3utJkrLG3nE7fOLY5kVi40O7Geh
 pxQADbbuxvNXuhRCrt8/Q8gHwnWoETfpBH6s0vOWQ7WuWfwqDFq7ZaX+nbOvvIlPe1FZ
 cmmZRnT8gDwP3KO5XuHJ+fY/xoFGLStP8EmgaEaud2P/DWs6vG1s8E4QnZy+uZ+L2Dcz
 LGHA==
X-Gm-Message-State: AOAM530NZHL+5KWpRAMG8kbb3sl7ipSE/oM2/42PNCVJWBs+rctpMuVl
 BbHx9KRFhO2rBU9V9TyO//lVnIi2XpEZVxTRJBzdIZE1gvtJpO8/Erx1XTMtVjvLpTaX/cjUeMO
 7LWi4Q9YovGDGpCk=
X-Received: by 2002:a02:c95a:: with SMTP id u26mr1400193jao.49.1627504787563; 
 Wed, 28 Jul 2021 13:39:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpbZF1pGTpKGpzOntOsv9n4FAXMrmH70V0czc/9OZAQTVxxs/d84bCDspBlJJuSPGtkwfpWA==
X-Received: by 2002:a02:c95a:: with SMTP id u26mr1400170jao.49.1627504787301; 
 Wed, 28 Jul 2021 13:39:47 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id f9sm602928ile.38.2021.07.28.13.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 13:39:46 -0700 (PDT)
Date: Wed, 28 Jul 2021 22:39:44 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v3 10/11] machine: Remove smp_parse callback from
 MachineClass
Message-ID: <20210728203944.arphd55kxsi62iw6@gator>
References: <20210728034848.75228-1-wangyanan55@huawei.com>
 <20210728034848.75228-11-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210728034848.75228-11-wangyanan55@huawei.com>
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

On Wed, Jul 28, 2021 at 11:48:47AM +0800, Yanan Wang wrote:
> Now we have a generic smp parser for all arches, and there will
> not be any other arch specific ones, so let's remove the callback
> from MachineClass and call the parser directly.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c   | 3 +--
>  include/hw/boards.h | 5 -----
>  2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 76b6c3bc64..8f84e38e2e 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -934,7 +934,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>          goto out_free;
>      }
>  
> -    mc->smp_parse(ms, config, errp);
> +    smp_parse(ms, config, errp);
>      if (errp) {
>          goto out_free;
>      }
> @@ -963,7 +963,6 @@ static void machine_class_init(ObjectClass *oc, void *data)
>      /* Default 128 MB as guest ram size */
>      mc->default_ram_size = 128 * MiB;
>      mc->rom_file_has_mr = true;
> -    mc->smp_parse = smp_parse;
>  
>      /* numa node memory size aligned on 8MB by default.
>       * On Linux, each node's border has to be 8MB aligned
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 0631900c08..72123f594d 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -177,10 +177,6 @@ typedef struct {
>   *    kvm-type may be NULL if it is not needed.
>   * @numa_mem_supported:
>   *    true if '--numa node.mem' option is supported and false otherwise
> - * @smp_parse:
> - *    The function pointer to hook different machine specific functions for
> - *    parsing "smp-opts" from QemuOpts to MachineState::CpuTopology and more
> - *    machine specific topology fields, such as smp_dies for PCMachine.
>   * @hotplug_allowed:
>   *    If the hook is provided, then it'll be called for each device
>   *    hotplug to check whether the device hotplug is allowed.  Return
> @@ -217,7 +213,6 @@ struct MachineClass {
>      void (*reset)(MachineState *state);
>      void (*wakeup)(MachineState *state);
>      int (*kvm_type)(MachineState *machine, const char *arg);
> -    void (*smp_parse)(MachineState *ms, SMPConfiguration *config, Error **errp);
>  
>      BlockInterfaceType block_default_type;
>      int units_per_default_bus;
> -- 
> 2.19.1
>

 
Reviewed-by: Andrew Jones <drjones@redhat.com>


