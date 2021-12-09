Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D625F46E5AF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 10:37:40 +0100 (CET)
Received: from localhost ([::1]:44284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvFrv-0005XS-LU
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 04:37:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mvFl6-0007DI-BC
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:30:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mvFl1-0006fy-Mw
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639042230;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ohMMr64pOhCaoPHIEFugXtRc5AxXM4D9pqoha4DgWi4=;
 b=KUY6nehqg83HRTpY9C+CkbdDWo0KcPjihB6nJ7LmBlQGIS+Imhxf8bQvCHp+fIbcqJkIPE
 tP8D3EX9J6gMYgjs6apK6AjlGxFRyKe+vr+ZEmslY/JxOk9cbGSEDP20OcBE1s3k4WgIXc
 wOqtSDCD1pyjLQLs03My0nb+s5bxdEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-419-zkiA09HyM5qWQomZM5pTQA-1; Thu, 09 Dec 2021 04:30:27 -0500
X-MC-Unique: zkiA09HyM5qWQomZM5pTQA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6434910168C3;
 Thu,  9 Dec 2021 09:30:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDCBA1001F4D;
 Thu,  9 Dec 2021 09:30:06 +0000 (UTC)
Date: Thu, 9 Dec 2021 09:30:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Tyler Fanelli <tfanelli@redhat.com>
Subject: Re: [PATCH] sev: check which processor the ASK/ARK chain should match
Message-ID: <YbHMm9DHCoygmDma@redhat.com>
References: <20211116213858.363583-1-tfanelli@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211116213858.363583-1-tfanelli@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm@vger.kernel.org, mtosatti@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 04:38:59PM -0500, Tyler Fanelli wrote:
> The AMD ASK/ARK certificate chain differs between AMD SEV
> processor generations. SEV capabilities should provide
> which ASK/ARK certificate should be used based on the host
> processor.
> 
> Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
> ---
>  qapi/misc-target.json | 28 ++++++++++++++++++++++++++--
>  target/i386/sev.c     | 17 ++++++++++++++---
>  2 files changed, 40 insertions(+), 5 deletions(-)

> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 5aa2b95b7d..c64aa3ff57 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -166,6 +166,24 @@
>  { 'command': 'query-sev-launch-measure', 'returns': 'SevLaunchMeasureInfo',
>    'if': 'TARGET_I386' }
>  
> +##
> +# @SevAskArkCertName:
> +#
> +# This enum describes which ASK/ARK certificate should be
> +# used based on the generation of an AMD Secure Encrypted
> +# Virtualization processor.
> +#
> +# @naples: AMD Naples processor (SEV 1st generation)
> +#
> +# @rome: AMD Rome processor (SEV 2nd generation)
> +#
> +# @milan: AMD Milan processor (SEV 3rd generation)
> +#
> +# Since: 7.0

I've found that many (all?)   Naples machines expose 'sev_es' in
their CPU flags, which is contrary to my understanding that SEV-ES
was only introduced in Zen2 / Rome. IOW, CPU flags don't seem to
provide a viable alternative to identify the generations, so this
info reported here is useful.


> @@ -534,9 +535,19 @@ static SevCapability *sev_get_capabilities(Error **errp)
>      cap->pdh = g_base64_encode(pdh_data, pdh_len);
>      cap->cert_chain = g_base64_encode(cert_chain_data, cert_chain_len);
>  
> -    host_cpuid(0x8000001F, 0, NULL, &ebx, NULL, NULL);
> +    host_cpuid(0x8000001F, 0, &eax, &ebx, NULL, NULL);
>      cap->cbitpos = ebx & 0x3f;
>  
> +    es = eax & 0x8;
> +    snp = eax & 0x10;
> +    if (!es && !snp) {
> +	cap->ask_ark_cert_name = SEV_ASK_ARK_CERT_NAME_NAPLES;
> +    } else if (es && !snp) {
> +	cap->ask_ark_cert_name = SEV_ASK_ARK_CERT_NAME_ROME;
> +    } else {
> +	cap->ask_ark_cert_name = SEV_ASK_ARK_CERT_NAME_MILAN;
> +    }

Ident appears off here - seems to have accidentally used tabs instead
of spaces. Since that's a trivial fix, feel free to add

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

when reposting.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


