Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC82F4CDD2B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:11:15 +0100 (CET)
Received: from localhost ([::1]:51236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDKc-0000jL-V5
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:11:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDFD-0001Dq-Td
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:05:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDFB-0001mx-78
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:05:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646420736;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=QsEZdECL9CO/8Rbo/YAaICdmr+wHlhPaRNfeTYH5570=;
 b=hXCGYQEHI4hNqL3EAv7Tbv9MuscGx2+xFoli64l8UNoAt18QZy80S4hkiu2lxgIZAwzD0o
 MBuQ1eIozdFx4J9T5niVMWb0yIqSU3pB+DRUKLIDdTj5sEiUJpAiOBoGYW/VkEuNcP0kYl
 rg29uUj9WFlFNGHOcBRlJRw6L7YeBwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-OIWayi5wNH2UNMu7atr7PA-1; Fri, 04 Mar 2022 14:05:29 -0500
X-MC-Unique: OIWayi5wNH2UNMu7atr7PA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1138A1006AA7;
 Fri,  4 Mar 2022 19:05:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44F1110016F2;
 Fri,  4 Mar 2022 19:05:27 +0000 (UTC)
Date: Fri, 4 Mar 2022 19:05:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Tyler Fanelli <tfanelli@redhat.com>
Subject: Re: [PATCH] i386/sev: Ensure attestation report length is valid
 before retrieving
Message-ID: <YiJi9IYqtZvNQIRc@redhat.com>
References: <20220304183930.502777-1-tfanelli@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220304183930.502777-1-tfanelli@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, mtosatti@redhat.com, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 01:39:32PM -0500, Tyler Fanelli wrote:
> The length of the attestation report buffer is never checked to be
> valid before allocation is made. If the length of the report is returned
> to be 0, the buffer to retrieve the attestation report is allocated with
> length 0 and passed to the kernel to fill with contents of the attestation
> report. Leaving this unchecked is dangerous and could lead to undefined
> behavior.

I don't see the undefined behaviour risk here.

The KVM_SEV_ATTESTATION_REPORT semantics indicate that the kernel
will fill in a valid length if the buffer we provide is too small
and we can re-call with that buffer.

If the kernel tells us the buffer is 0 bytes, then it should be
fine having a second call with length 0. If not, then the kernel
is broken and we're doomed.

The QEMU code looks like it would cope with a zero length, unless
I'm mistaken, it'll  just return a zero length attestation report.

> Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
> ---
>  target/i386/sev.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 025ff7a6f8..215acd7c6b 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -616,6 +616,8 @@ static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
>          return NULL;
>      }
>  
> +    input.len = 0;

The declaration of 'input' already zero initializes.

>      /* Query the report length */
>      ret = sev_ioctl(sev->sev_fd, KVM_SEV_GET_ATTESTATION_REPORT,
>              &input, &err);
> @@ -626,6 +628,11 @@ static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
>                         ret, err, fw_error_to_str(err));
>              return NULL;
>          }
> +    } else if (input.len <= 0) {

It can't be less than 0 because 'len' is an unsigned integer.

> +        error_setg(errp, "SEV: Failed to query attestation report:"
> +                         " length returned=%d",
> +                   input.len);
> +        return NULL;
>      }



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


