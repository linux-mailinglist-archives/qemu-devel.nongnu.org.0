Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785C4419A91
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:08:43 +0200 (CEST)
Received: from localhost ([::1]:60794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUu7O-0001CA-GL
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUtzu-0000Id-Be
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUtzp-0001H2-T8
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762053;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mzZfcPCdDblg4Kqgk4uY45/tSiuH9b0IxKMj7UiTZ4s=;
 b=B7ImHEY+Ykc+ObTPQPhY5HfAn49Ha+ZMkSqsMkOBO0tv6O6ClqoEt5u0JVtwPSGI+I4SU1
 XfLaIkc+Qz5pkz9djkV3IYTcRUYX1hb4j/ihioGjbx7rgC798TmVWv/B7lsuY1AW5MlOsq
 NySQO7gTJavdMWwdp+10Zbm+oaKpjgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-uk4Yw_yPOG2pCiUBjz8WSw-1; Mon, 27 Sep 2021 13:00:37 -0400
X-MC-Unique: uk4Yw_yPOG2pCiUBjz8WSw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 073F210BFA7D;
 Mon, 27 Sep 2021 17:00:36 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0134C5BAF3;
 Mon, 27 Sep 2021 17:00:14 +0000 (UTC)
Date: Mon, 27 Sep 2021 18:00:12 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
Message-ID: <YVH4nLO+tuzNIDsC@redhat.com>
References: <20210825073538.959525-1-dovmurik@linux.ibm.com>
 <20210825073538.959525-2-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210825073538.959525-2-dovmurik@linux.ibm.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 25, 2021 at 07:35:37AM +0000, Dov Murik wrote:
> Add the sev_add_kernel_loader_hashes function to calculate the hashes of
> the kernel/initrd/cmdline and fill a designated OVMF encrypted hash
> table area.  For this to work, OVMF must support an encrypted area to
> place the data which is advertised via a special GUID in the OVMF reset
> table.
> 
> The hashes of each of the files is calculated (or the string in the case
> of the cmdline with trailing '\0' included).  Each entry in the hashes
> table is GUID identified and since they're passed through the
> sev_encrypt_flash interface, the hashes will be accumulated by the PSP
> measurement (SEV_LAUNCH_MEASURE).
> 
> Co-developed-by: James Bottomley <jejb@linux.ibm.com>
> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> ---
>  target/i386/sev_i386.h |  12 ++++
>  target/i386/sev-stub.c |   5 ++
>  target/i386/sev.c      | 137 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 154 insertions(+)
> 
> diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
> index ae6d840478..deb3eec409 100644
> --- a/target/i386/sev_i386.h
> +++ b/target/i386/sev_i386.h
> @@ -28,6 +28,17 @@
>  #define SEV_POLICY_DOMAIN       0x10
>  #define SEV_POLICY_SEV          0x20
>  
> +typedef struct KernelLoaderContext {
> +    char *setup_data;
> +    size_t setup_size;
> +    char *kernel_data;
> +    size_t kernel_size;
> +    char *initrd_data;
> +    size_t initrd_size;
> +    char *cmdline_data;
> +    size_t cmdline_size;
> +} KernelLoaderContext;

I'd expect the struct to have 'Sev' as its name prefix, in common
with everything else SEV related that's exported here. 

> +
>  extern bool sev_es_enabled(void);
>  extern uint64_t sev_get_me_mask(void);
>  extern SevInfo *sev_get_info(void);
> @@ -37,5 +48,6 @@ extern char *sev_get_launch_measurement(void);
>  extern SevCapability *sev_get_capabilities(Error **errp);
>  extern SevAttestationReport *
>  sev_get_attestation_report(const char *mnonce, Error **errp);
> +extern bool sev_add_kernel_loader_hashes(KernelLoaderContext *ctx, Error **errp);

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


