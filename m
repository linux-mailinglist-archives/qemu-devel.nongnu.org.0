Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA8A2BB1AC
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:47:51 +0100 (CET)
Received: from localhost ([::1]:33574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgAVi-00087P-Hi
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:47:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kgASz-0006v6-Pw
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:45:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kgASx-0004m4-A6
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605894298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/mpnxqbrfo+pkCk8KM242hu6S1fUV+4mPL9qNp/n+iA=;
 b=HaoPxM1P+wEKlu40cnQM09LRnAf9d3nt0xJOF7OjXq4BEKqadagL0FFvKWdn8d1diH2nl6
 XWfo9FXPKznWBCbVmsP2xHQAUjpPc1O6ZPU4tSwAp1vKo24B+kMhhj8SeX0EJ/J3T439Ws
 kqLEgvk3gezH3lKwvs6sbGplIaWCPYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-rH92i_AWPGK5-qtHHY9C5g-1; Fri, 20 Nov 2020 12:44:53 -0500
X-MC-Unique: rH92i_AWPGK5-qtHHY9C5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7762107AD32;
 Fri, 20 Nov 2020 17:44:51 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 189EC13470;
 Fri, 20 Nov 2020 17:44:48 +0000 (UTC)
Date: Fri, 20 Nov 2020 12:44:47 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v4 9/9] i386: split cpu accelerators from cpu.c
Message-ID: <20201120174447.GC2271382@habkost.net>
References: <20201120144909.24097-1-cfontana@suse.de>
 <20201120144909.24097-10-cfontana@suse.de>
MIME-Version: 1.0
In-Reply-To: <20201120144909.24097-10-cfontana@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Bruce Rogers <brogers@suse.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 03:49:09PM +0100, Claudio Fontana wrote:
> split cpu.c into:
> 
> cpu.c            cpuid and common x86 cpu functionality
> host-cpu.c       host x86 cpu functions and "host" cpu type
> kvm/cpu.c        KVM x86 cpu type
> hvf/cpu.c        HVF x86 cpu type
> tcg/cpu.c        TCG x86 cpu type
> 
> The link to the accel class is set in the X86CPUClass classes
> at MODULE_INIT_ACCEL_CPU time, when the accelerator is known.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
[...]
> +static void hvf_cpu_accel_class_init(ObjectClass *oc, void *data)
> +{
> +    X86CPUAccelClass *acc = X86_CPU_ACCEL_CLASS(oc);
> +
> +    acc->cpu_realizefn = host_cpu_realizefn;
> +    acc->cpu_common_class_init = hvf_cpu_common_class_init;
> +    acc->cpu_instance_init = hvf_cpu_instance_init;
> +};
> +static const TypeInfo hvf_cpu_accel_type_info = {
> +    .name = X86_CPU_ACCEL_TYPE_NAME("hvf"),
> +
> +    .parent = TYPE_X86_CPU_ACCEL,
> +    .class_init = hvf_cpu_accel_class_init,
> +};
> +static void hvf_cpu_accel_register_types(void)
> +{
> +    type_register_static(&hvf_cpu_accel_type_info);
> +}
> +type_init(hvf_cpu_accel_register_types);
> +
> +static void hvf_cpu_accel_init(void)
> +{
> +    if (hvf_enabled()) {
> +        x86_cpu_accel_init(X86_CPU_ACCEL_TYPE_NAME("hvf"));
> +    }
> +}
> +
> +accel_cpu_init(hvf_cpu_accel_init);

The point of my suggestion of using QOM is to not require
separate accel_cpu_init() functions and (hvf|tcg|kvm)_enabled()
checks.

If we still have separate accel_cpu_init() functions for calling
x86_cpu_accel_init() with the right argument, using a pointer to
static variables like &hvf_cpu_accel (like you did before) was
simpler and required less boilerplate code.

However, the difference is that with the X86_CPU_ACCEL_TYPE_NAME
macro + object_class_by_name(), you don't need the separate
accel_cpu_init() functions for each accelerator.

All you need is a single:

  x86_cpu_accel_init(X86_CPU_ACCEL_TYPE_NAME(chosen_accel_name));

call somewhere in the initialization path.

A good place for the x86_cpu_accel_init() call would be
do_configure_accelerator(), but the function is arch-specific.
That's why I suggested a cpu_accel_arch_init() function at
https://lore.kernel.org/qemu-devel/20201118220750.GP1509407@habkost.net

-- 
Eduardo


