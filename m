Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB28A6868BF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:45:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEF1-00086i-2o; Wed, 01 Feb 2023 09:37:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pNEDA-0005V5-Pz
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:35:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pNED3-00042Y-Dz
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675262135;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=G78sh9k2aYU7/sirb3voCyPm+703BKxdk5K8LUpkvFY=;
 b=RO6diWYDd8b9RqjsUVJXKX2bzRTY7LSx8cxuy+liVtUizWREdJVWqIBP8YMwuclXXLWhNF
 US05SQatxtLjC08QJW0zUqwXEaFnGt68avQMmLRmvl0a53qwIHLI7RDJWQKqMPUXIa1JZc
 ZMJNr271rZXoVUhD2b+74WFKTUr63Ik=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-KEGG-iovNeqvIuKBoVvGew-1; Wed, 01 Feb 2023 09:35:32 -0500
X-MC-Unique: KEGG-iovNeqvIuKBoVvGew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDE8585CBE1;
 Wed,  1 Feb 2023 14:35:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBC16404CD80;
 Wed,  1 Feb 2023 14:35:30 +0000 (UTC)
Date: Wed, 1 Feb 2023 14:35:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 DOV MURIK <Dov.Murik1@il.ibm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] x86: fix q35 kernel measurements broken due to rng seeding
Message-ID: <Y9p4sARXUdUOz/6X@redhat.com>
References: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 01, 2023 at 08:57:10AM -0500, James Bottomley wrote:
> The origin commit for rng seeding 67f7e426e5 ("hw/i386: pass RNG seed
> via setup_data entry") modifies the kernel image file to append a
> random seed.  Obviously this makes the hash of the kernel file
> non-deterministic and so breaks both measured and some signed boots.

I recall raising that at the time

  https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00710.html

and Jason pointed me to a followup which I tested and believe
fixed it for SEV:

  https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00601.html

but it doesn't look like that second patch ever merged. We went
through so many patches I think it probably got obsoleted by
something else, and no one rechecked SEV again.

> The commit notes it's only for non-EFI (because EFI has a different
> RNG seeding mechanism) so, since there are no non-EFI q35 systems, this
> should be disabled for the whole of the q35 machine type to bring back
> deterministic kernel file hashes.

SeaBIOS is the default firmware for both q35 and i440fx. The
majority of systems using q35 will be non-EFI today, and that
is what the random seed was intended to address. I don't think
we can just disable this for the whole of q35.

When you say it breaks measured / signed boots, I presume you
are specifically referring to SEV kernel hashes measurements ?
Or is there a more general problem to solve ?

> Obviously this still leaves the legacy bios case broken for at least
> measured boot, but I don't think anyone cares about that now.
> 
> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> ---
>  hw/i386/pc_q35.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 83c57c6eb1..11e8dd7ca7 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -357,6 +357,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      pcmc->default_nic_model = "e1000e";
>      pcmc->pci_root_uid = 0;
>      pcmc->default_cpu_version = 1;
> +    pcmc->legacy_no_rng_seed = true;
>  
>      m->family = "pc_q35";
>      m->desc = "Standard PC (Q35 + ICH9, 2009)";
> @@ -394,9 +395,7 @@ DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
>  
>  static void pc_q35_7_1_machine_options(MachineClass *m)
>  {
> -    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_7_2_machine_options(m);
> -    pcmc->legacy_no_rng_seed = true;
>      compat_props_add(m->compat_props, hw_compat_7_1,
> hw_compat_7_1_len);
>      compat_props_add(m->compat_props, pc_compat_7_1,
> pc_compat_7_1_len);
>  }

This patch changes behaviour of the pc-q35-7.2 machine type. Any
change will need to be in latest development 8.0 machine type only

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


