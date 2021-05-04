Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE71372414
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 03:03:53 +0200 (CEST)
Received: from localhost ([::1]:36390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldjTc-00071L-85
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 21:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ldidK-00016R-Dj
 for qemu-devel@nongnu.org; Mon, 03 May 2021 20:09:51 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ldidG-0003qv-8G
 for qemu-devel@nongnu.org; Mon, 03 May 2021 20:09:50 -0400
Received: by mail-pg1-x52c.google.com with SMTP id m12so5071050pgr.9
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 17:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BWnUivadNaThYgP7jgFhkDF+yZo1bOJ9x2Kn3bxBh4I=;
 b=NiOb6seam1/w5Be53wLqbK561l2rL9NuE/lbAiwNBce6J32aY319bEPkTMh8EEoMlB
 4sucT9rxxquu64CUbloB12jeVGRsgJY/QQhtok2aODlDh/919tEz6Y+ZFiJTqzJeRVhM
 lBiGWO+D2bucO5dwJHzWCiW8BGCGDRyulNXActp1fR+QU5oVy3pDD/RwuyrpVoL9R2I2
 3N//DIpWkIDsVIt+o+fxVTtcjVhd0LMgb7qW3qDwEcULmFpOh6uAftzXhHk6Ujlmd/Ov
 Vwa0CD52FDFc6dMQJWbUOexC0KPYfuUF/Bov0V2FmBmv4zjdjsZm6OiGWAUykeq+JvsK
 M/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BWnUivadNaThYgP7jgFhkDF+yZo1bOJ9x2Kn3bxBh4I=;
 b=Z9J/TBvnyUp9yK9mj0JtxXTJUjeSopeAZ3ztO/XmD4O6b2Oi5OERc5uZYNKiTiB86s
 Eag6UIfETAUc3cIuyJ4lNWYuhGTx6QcJ2bZ0gGFrOlfXMi6leTJ2P0W7nIi0rJSADGHy
 gbqLartiZr0RNqUhElBUdOlylIZy+Gb/E67BuuRdbVBZ2+2+hOiRroNrjnVPmt2cXFkG
 EX/gwkuYTwkEX2SSj+jQs0BHxshO41TNZ+IoDheXleIqKLS0TM8e9nDUezoagu+W92fo
 ++35sm0SiQw6MdvH/5uf8MykBeMRwTG3fbEnMhHA8i3oVxG3utzoJFt8HS2x7Wu/21vU
 gYQQ==
X-Gm-Message-State: AOAM530R3cs7oQe7eGRKRzZiolQhnulKHgZGFCKpXxZyfGPbw63QkTEy
 AANHSuYCAhY6kLeOoNI9qkTXIg==
X-Google-Smtp-Source: ABdhPJyTCGaIbbGSFyVo1OrB5XEEqAiRUvT8ViSbCOlhv88b7rmVns4RFybFa/1++gIz7I7rSl/IDA==
X-Received: by 2002:a17:90a:17a2:: with SMTP id
 q31mr1525507pja.32.1620086981887; 
 Mon, 03 May 2021 17:09:41 -0700 (PDT)
Received: from google.com (240.111.247.35.bc.googleusercontent.com.
 [35.247.111.240])
 by smtp.gmail.com with ESMTPSA id i20sm10461828pjz.48.2021.05.03.17.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 17:09:41 -0700 (PDT)
Date: Tue, 4 May 2021 00:09:37 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org,
 kai.huang@intel.com
Subject: Re: [RESEND PATCH 05/32] vl: Add "sgx-epc" option to expose SGX EPC
 sections to guest
Message-ID: <YJCQwXVmS/om2HrW@google.com>
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-6-yang.zhong@intel.com>
 <d772cdd1-69fa-b48f-b8ff-c07cd383b04e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d772cdd1-69fa-b48f-b8ff-c07cd383b04e@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=seanjc@google.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 03 May 2021 21:00:15 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 03, 2021, Paolo Bonzini wrote:
> On 30/04/21 08:24, Yang Zhong wrote:
> > +void pc_machine_init_sgx_epc(PCMachineState *pcms)
> > +{
> > +    SGXEPCState *sgx_epc;
> > +    X86MachineState *x86ms = X86_MACHINE(pcms);
> > +
> > +    sgx_epc = g_malloc0(sizeof(*sgx_epc));
> > +    pcms->sgx_epc = sgx_epc;
> > +
> > +    sgx_epc->base = 0x100000000ULL + x86ms->above_4g_mem_size;
> > +
> > +    memory_region_init(&sgx_epc->mr, OBJECT(pcms), "sgx-epc", UINT64_MAX);
> > +    memory_region_add_subregion(get_system_memory(), sgx_epc->base,
> > +                                &sgx_epc->mr);
> > +
> > +    qemu_opts_foreach(qemu_find_opts("sgx-epc"), sgx_epc_init_func, NULL,
> > +                      &error_fatal);
> > +
> > +    if ((sgx_epc->base + sgx_epc->size) < sgx_epc->base) {
> > +        error_report("Size of all 'sgx-epc' =0x%"PRIu64" causes EPC to wrap",
> > +                     sgx_epc->size);
> > +        exit(EXIT_FAILURE);
> 
> Or perhaps even drop completely the options and just do "-device
> sgx-epc,backend=epc1"?

Is there a way to process "-device sgx-epc..." before vCPUs are realized?  The
ordering problem was the only reason I added a dedicated option.

From the changelog:

  Because SGX EPC is enumerated through CPUID, EPC "devices" need to be
  realized prior to realizing the vCPUs themselves, i.e. long before
  generic devices are parsed and realized.

  So even though EPC sections could be realized through the generic
  -devices command, they need to be created much earlier for them to
  actually be usable by the guest.

