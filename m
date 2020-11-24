Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CF42C2E0B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:09:32 +0100 (CET)
Received: from localhost ([::1]:50444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khboq-0006tQ-0j
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khbfv-0008Fz-Kz
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:00:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khbft-0007BU-PR
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:00:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606237217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mSU7dSX+V/BFT4vlnHFEdUepHXltG8r+xO/P5n1q3gg=;
 b=QyVOndih+e0lLQUKcPX1mYBIGcODTPho5QTmxdzxw4c3VteSuwcHyGs0Hmr1pSr7pUz9bC
 miwm9SLbf5CO93SUTB/zw3LIQ4/aBGQ1b2XWknlS3dNoGa3+hzPfwPa/Qu0e4L9THsVslw
 +CsSp7iFKHyTq1tLM77jpRTOwdXanhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-wlmE2_4IOV2XRvNHXuaSOA-1; Tue, 24 Nov 2020 12:00:09 -0500
X-MC-Unique: wlmE2_4IOV2XRvNHXuaSOA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C2C7100D698;
 Tue, 24 Nov 2020 16:59:53 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5A6E19C46;
 Tue, 24 Nov 2020 16:59:07 +0000 (UTC)
Date: Tue, 24 Nov 2020 11:59:06 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v5 11/12] i386: centralize initialization of cpu accel
 interfaces
Message-ID: <20201124165906.GR2271382@habkost.net>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-12-cfontana@suse.de>
MIME-Version: 1.0
In-Reply-To: <20201124162210.8796-12-cfontana@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 24, 2020 at 05:22:09PM +0100, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Probably this can be squashed into patch 10/12.

> ---
>  target/i386/cpu-qom.h |  2 --
>  target/i386/cpu.c     | 27 ++++++++++++++++++++-------
>  target/i386/hvf/cpu.c |  9 ---------
>  target/i386/kvm/cpu.c |  8 --------
>  target/i386/tcg/cpu.c |  9 ---------
>  5 files changed, 20 insertions(+), 35 deletions(-)
> 
> diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
> index 9316e78e71..2cea5394c6 100644
> --- a/target/i386/cpu-qom.h
> +++ b/target/i386/cpu-qom.h
> @@ -98,6 +98,4 @@ struct X86CPUAccelClass {
>      void (*cpu_realizefn)(X86CPU *cpu, Error **errp);
>  };
>  
> -void x86_cpu_accel_init(const char *accel_name);
> -
>  #endif
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index b799723e53..f6fd055046 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -7066,18 +7066,31 @@ type_init(x86_cpu_register_types)
>  static void x86_cpu_accel_init_aux(ObjectClass *klass, void *opaque)
>  {
>      X86CPUClass *xcc = X86_CPU_CLASS(klass);
> -    const X86CPUAccelClass **accel = opaque;
> +    X86CPUAccelClass *accel = opaque;
>  
> -    xcc->accel = *accel;
> +    xcc->accel = accel;
>      xcc->accel->cpu_common_class_init(xcc);
>  }
>  
> -void x86_cpu_accel_init(const char *accel_name)
> +static void x86_cpu_accel_init(void)
>  {
> -    X86CPUAccelClass *acc;
> +    const char *ac_name;
> +    ObjectClass *ac;
> +    char *xac_name;
> +    ObjectClass *xac;
>  
> -    acc = X86_CPU_ACCEL_CLASS(object_class_by_name(accel_name));
> -    g_assert(acc != NULL);
> +    ac = object_get_class(OBJECT(current_accel()));
> +    g_assert(ac != NULL);
> +    ac_name = object_class_get_name(ac);
> +    g_assert(ac_name != NULL);
>  
> -    object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, &acc);
> +    xac_name = g_strdup_printf("%s-%s", ac_name, TYPE_X86_CPU);
> +    xac = object_class_by_name(xac_name);
> +    g_free(xac_name);
> +
> +    if (xac) {
> +        object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, xac);
> +    }
>  }
> +
> +accel_cpu_init(x86_cpu_accel_init);

This keeps the hidden initialization ordering dependency between
MODULE_INIT_ACCEL_CPU and current_accel().  I thought we were
going to get rid of module init functions that depend on runtime
state.

This is an improvement to the code in patch 10/12, though.  If
others believe it is an acceptable (temporary) solution, I won't
block it.

I would still prefer to have a
  void arch_accel_cpu_init(AccelState*)
function which would call a
  void x86_cpu_accel_init(AccelState*)
function.  That would make the dependency between
x86_cpu_accel_init() and accelerator creation explicit.


> diff --git a/target/i386/hvf/cpu.c b/target/i386/hvf/cpu.c
> index 7e7dc044d3..70b6dbfc10 100644
> --- a/target/i386/hvf/cpu.c
> +++ b/target/i386/hvf/cpu.c
> @@ -65,12 +65,3 @@ static void hvf_cpu_accel_register_types(void)
>      type_register_static(&hvf_cpu_accel_type_info);
>  }
>  type_init(hvf_cpu_accel_register_types);
> -
> -static void hvf_cpu_accel_init(void)
> -{
> -    if (hvf_enabled()) {
> -        x86_cpu_accel_init(X86_CPU_ACCEL_TYPE_NAME("hvf"));
> -    }
> -}
> -
> -accel_cpu_init(hvf_cpu_accel_init);
> diff --git a/target/i386/kvm/cpu.c b/target/i386/kvm/cpu.c
> index bc5f519479..c17ed5a3f2 100644
> --- a/target/i386/kvm/cpu.c
> +++ b/target/i386/kvm/cpu.c
> @@ -147,11 +147,3 @@ static void kvm_cpu_accel_register_types(void)
>      type_register_static(&kvm_cpu_accel_type_info);
>  }
>  type_init(kvm_cpu_accel_register_types);
> -
> -static void kvm_cpu_accel_init(void)
> -{
> -    if (kvm_enabled()) {
> -        x86_cpu_accel_init(X86_CPU_ACCEL_TYPE_NAME("kvm"));
> -    }
> -}
> -accel_cpu_init(kvm_cpu_accel_init);
> diff --git a/target/i386/tcg/cpu.c b/target/i386/tcg/cpu.c
> index e7d4effdd0..00166c36e9 100644
> --- a/target/i386/tcg/cpu.c
> +++ b/target/i386/tcg/cpu.c
> @@ -170,12 +170,3 @@ static void tcg_cpu_accel_register_types(void)
>      type_register_static(&tcg_cpu_accel_type_info);
>  }
>  type_init(tcg_cpu_accel_register_types);
> -
> -static void tcg_cpu_accel_init(void)
> -{
> -    if (tcg_enabled()) {
> -        x86_cpu_accel_init(X86_CPU_ACCEL_TYPE_NAME("tcg"));
> -    }
> -}
> -
> -accel_cpu_init(tcg_cpu_accel_init);
> -- 
> 2.26.2
> 

-- 
Eduardo


