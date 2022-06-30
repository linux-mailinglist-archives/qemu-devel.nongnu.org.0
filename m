Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93997561487
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 10:17:35 +0200 (CEST)
Received: from localhost ([::1]:41232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6pMj-0006zM-AK
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 04:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6pK0-0005gj-E8
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 04:14:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6pJs-0001Dc-Mk
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 04:14:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656576875;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=sHOROkkDPVycREOjaX84DcrqMqdz1IXTlosFpoNNS6s=;
 b=gVbW3vg6S54Zl0R6379xEnL4E9KfELuVmpjr0OaIM3QKoNY5i4xHd7gTMe32mDUx/B3CXn
 wJeBnFxJE6+cef7OAKyzCl7+lU7RTjiJaGoyNVMwK5nHxbWHqfwOVC6698V3UFC0AZSHXm
 wzifd/485dVPaW8my08v22IPPDiugtc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-fylKwONuN0SX24-oFzDzeQ-1; Thu, 30 Jun 2022 04:14:31 -0400
X-MC-Unique: fylKwONuN0SX24-oFzDzeQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A06F1C00131;
 Thu, 30 Jun 2022 08:14:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9FDB2026D64;
 Thu, 30 Jun 2022 08:14:28 +0000 (UTC)
Date: Thu, 30 Jun 2022 09:14:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dionna Glaze <dionnaglaze@google.com>
Cc: qemu-devel@nongnu.org, Xu@google.com, Min M <min.m.xu@intel.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Thomas Lendacky <Thomas.Lendacky@amd.com>,
 Gerd Hoffman <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "open list:X86 KVM CPUs" <kvm@vger.kernel.org>
Subject: Re: [PATCH v2] target/i386: Add unaccepted memory configuration
Message-ID: <Yr1bYiA1w/lMX76k@redhat.com>
References: <20220629193701.734154-1-dionnaglaze@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220629193701.734154-1-dionnaglaze@google.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 29, 2022 at 07:37:01PM +0000, Dionna Glaze wrote:
> For SEV-SNP, an OS is "SEV-SNP capable" without supporting this UEFI
> v2.9 memory type. In order for OVMF to be able to avoid pre-validating
> potentially hundreds of gibibytes of data before booting, it needs to
> know if the guest OS can support its use of the new type of memory in
> the memory map.

This talks about something supported for SEV-SNP, but....

>  static void
>  sev_guest_class_init(ObjectClass *oc, void *data)
>  {
> @@ -376,6 +401,14 @@ sev_guest_class_init(ObjectClass *oc, void *data)
>                                     sev_guest_set_kernel_hashes);
>      object_class_property_set_description(oc, "kernel-hashes",
>              "add kernel hashes to guest firmware for measured Linux boot");
> +    object_class_property_add_enum(oc, "accept-all-memory",
> +                                   "MemoryAcceptance",
> +                                   &memory_acceptance_lookup,
> +        sev_guest_get_accept_all_memory, sev_guest_set_accept_all_memory);
> +    object_class_property_set_description(
> +        oc, "accept-all-memory",
> +        "false: Accept all memory, true: Accept up to 4G and leave the rest unaccepted (UEFI"
> +        " v2.9 memory type), default: default firmware behavior.");
>  }

..this is adding a property to the 'sev-guest' object, which only
targets SEV/SEV-ES currently AFAIK.

The most recent patches I recall for SEV-SNP introduced a new
'sev-snp-guest' object instead of overloading the existing
'sev-guest' object:

  https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04757.html



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


