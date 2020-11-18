Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64652B8405
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:47:24 +0100 (CET)
Received: from localhost ([::1]:48300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSUF-0002sW-Mz
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfSCS-0006vv-34
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:29:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfSCQ-0003Go-3U
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:28:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605724136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XEcYGR/3uVZm3culeg+cXhkoZjqefFCSaaNxhx3PrrY=;
 b=C0ERPLqMT/ag7pXDMvi2dRGQAaNsEa5URDUKlVUAfxfKRQpLHXIQhF5D5pjDz0VIzh5lit
 V1V44lNGvd9Zqwo9q+v7NT2wH0rcShVNuaclEPhsHqbnXDbntvwRRpMajPkzUftYrhlR+7
 /XwzS+6Oi6PtFWVvxAaGrQ/MF+XNb+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423--OI9jpH_MD61NYdhG17l5w-1; Wed, 18 Nov 2020 13:28:53 -0500
X-MC-Unique: -OI9jpH_MD61NYdhG17l5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E521210866A7;
 Wed, 18 Nov 2020 18:28:50 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 449C9100239A;
 Wed, 18 Nov 2020 18:28:46 +0000 (UTC)
Date: Wed, 18 Nov 2020 13:28:45 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v3 9/9] i386: split cpu accelerators from cpu.c
Message-ID: <20201118182845.GN1509407@habkost.net>
References: <20201118102936.25569-1-cfontana@suse.de>
 <20201118102936.25569-10-cfontana@suse.de>
MIME-Version: 1.0
In-Reply-To: <20201118102936.25569-10-cfontana@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Olaf Hering <ohering@suse.de>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>,
 Colin Xu <colin.xu@intel.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Bruce Rogers <brogers@suse.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 haxm-team@intel.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 11:29:36AM +0100, Claudio Fontana wrote:
> split cpu.c into:
> 
> cpu.c            cpuid and common x86 cpu functionality
> host-cpu.c       host x86 cpu functions and "host" cpu type
> kvm/cpu.c        KVM x86 cpu type
> hvf/cpu.c        HVF x86 cpu type
> tcg/cpu.c        TCG x86 cpu type
> 
> The accel interface of the X86CPUClass is set at MODULE_INIT_ACCEL_CPU
> time, when the accelerator is known.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
[...]
> +/**
> + * X86CPUAccel:
> + * @name: string name of the X86 CPU Accelerator
> + *
> + * @common_class_init: initializer for the common cpu

So this will be called for every single CPU class.

> + * @instance_init: cpu instance initialization
> + * @realizefn: realize function, called first in x86 cpu realize
> + *
> + * X86 CPU accelerator-specific CPU initializations
> + */
> +
> +struct X86CPUAccel {
> +    const char *name;
> +
> +    void (*common_class_init)(X86CPUClass *xcc);
> +    void (*instance_init)(X86CPU *cpu);
> +    void (*realizefn)(X86CPU *cpu, Error **errp);
>  };
>  
> +void x86_cpu_accel_init(const X86CPUAccel *accel);
[...]
> +static void x86_cpu_accel_init_aux(ObjectClass *klass, void *opaque)
> +{
> +    X86CPUClass *xcc = X86_CPU_CLASS(klass);
> +    const X86CPUAccel **accel = opaque;
> +
> +    xcc->accel = *accel;
> +    xcc->accel->common_class_init(xcc);
> +}
> +
> +void x86_cpu_accel_init(const X86CPUAccel *accel)
> +{
> +    object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, &accel);
> +}

This matches the documented behavior.

[...]
> +void host_cpu_class_init(X86CPUClass *xcc)
> +{
> +    xcc->host_cpuid_required = true;
> +    xcc->ordering = 8;
> +    xcc->model_description =
> +        g_strdup_printf("%s processor with all supported host features ",
> +                        xcc->accel->name);
> +}
[...]
> +static void hvf_cpu_common_class_init(X86CPUClass *xcc)
> +{
> +    host_cpu_class_init(xcc);

Why are you calling host_cpu_class_init() for all CPU types?

> +}
[...]
> +static void kvm_cpu_common_class_init(X86CPUClass *xcc)
> +{
> +    host_cpu_class_init(xcc);
> +}

Same question as above.

-- 
Eduardo


