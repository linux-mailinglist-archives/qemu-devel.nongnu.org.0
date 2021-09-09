Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC744048A9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:43:17 +0200 (CEST)
Received: from localhost ([::1]:33818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHWW-0002K6-1i
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOHQu-0002iN-Uu
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:37:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOHQt-00066L-5q
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631183846;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mFpyUFg5iicRG4N67bToPFSscnmzl25Wk4DeTDhXjsA=;
 b=B2k1I4tU+Y2M14tf3rtvval/iAB+LRm8YAJnx+QTtdqBpjO046X2uXbBfd/RJS6Dc/p3/f
 rudTyk4Q7bAfYwpxoRzOvQcH5iOL3CYl3L06KIbrs1rAOKsRNyFuvfoBN/A5qs6mfH2TgW
 3Hx9dBiYgt2mWSutXTjdAexqJYcjAOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-nHnegXWZNDKFzlbTRBMcJQ-1; Thu, 09 Sep 2021 06:37:23 -0400
X-MC-Unique: nHnegXWZNDKFzlbTRBMcJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 559E61B18BC5;
 Thu,  9 Sep 2021 10:37:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7475C1002388;
 Thu,  9 Sep 2021 10:37:15 +0000 (UTC)
Date: Thu, 9 Sep 2021 11:37:12 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 02/10] accel: Use qemu_security_policy_taint(), mark
 KVM and Xen as safe
Message-ID: <YTnj2M+lygKzdsgO@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
 <20210908232024.2399215-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908232024.2399215-3-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 01:20:16AM +0200, Philippe Mathieu-Daudé wrote:
> Add the AccelClass::secure_policy_supported field to classify
> safe (within security boundary) vs unsafe accelerators.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/qemu/accel.h | 5 +++++
>  accel/kvm/kvm-all.c  | 1 +
>  accel/xen/xen-all.c  | 1 +
>  softmmu/vl.c         | 3 +++
>  4 files changed, 10 insertions(+)
> 
> diff --git a/include/qemu/accel.h b/include/qemu/accel.h
> index 4f4c283f6fc..895e30be0de 100644
> --- a/include/qemu/accel.h
> +++ b/include/qemu/accel.h
> @@ -44,6 +44,11 @@ typedef struct AccelClass {
>                         hwaddr start_addr, hwaddr size);
>  #endif
>      bool *allowed;
> +    /*
> +     * Whether the accelerator is withing QEMU security policy boundary.
> +     * See: https://www.qemu.org/contribute/security-process/
> +     */
> +    bool secure_policy_supported;

The security handling policy is a high level concept that is
open to variation over time and also by downstream distro
vendors.

At a code level we should be dealing in a more fundamental
concept. At an accelerator level we should really jsut
declare whether or not the accelerator impl is considered
to be secure against malicious guest code.

eg

    /* Whether this accelerator is secure against execution
     * of malciious guest machine code */
    bool secure;


>      /*
>       * Array of global properties that would be applied when specific
>       * accelerator is chosen. It works like MachineClass.compat_props
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 0125c17edb8..eb6b9e44df2 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -3623,6 +3623,7 @@ static void kvm_accel_class_init(ObjectClass *oc, void *data)
>      ac->init_machine = kvm_init;
>      ac->has_memory = kvm_accel_has_memory;
>      ac->allowed = &kvm_allowed;
> +    ac->secure_policy_supported = true;
>  
>      object_class_property_add(oc, "kernel-irqchip", "on|off|split",
>          NULL, kvm_set_kernel_irqchip,
> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
> index 69aa7d018b2..57867af5faf 100644
> --- a/accel/xen/xen-all.c
> +++ b/accel/xen/xen-all.c
> @@ -198,6 +198,7 @@ static void xen_accel_class_init(ObjectClass *oc, void *data)
>      ac->setup_post = xen_setup_post;
>      ac->allowed = &xen_allowed;
>      ac->compat_props = g_ptr_array_new();
> +    ac->secure_policy_supported = true;
>  
>      compat_props_add(ac->compat_props, compat, G_N_ELEMENTS(compat));
>  
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 92c05ac97ee..e4f94e159c3 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2388,6 +2388,9 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
>          return 0;
>      }
>  
> +    qemu_security_policy_taint(!ac->secure_policy_supported,
> +                               "%s accelerator", acc);

We need this information to be introspectable, becuase stuff printed
to stderr is essentially opaque to libvirt and mgmt apps above.

We don't have a convenient "query-accel" command but I think this
could possibly fit into 'query-target'. ie the TargetInfo struct
gain a field:
 

  ##
  # @TargetInfo:
  #
  # Information describing the QEMU target.
  #
  # @arch: the target architecture
  # @secure: Whether the currently active accelerator for this target
  #          is secure against execution of malicous guest code
  #
  # Since: 1.2
  ##
  { 'struct': 'TargetInfo',
    'data': { 'arch': 'SysEmuTarget',
              'secure': 'bool'} }

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


