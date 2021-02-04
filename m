Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8A130FD93
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 21:02:42 +0100 (CET)
Received: from localhost ([::1]:52468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kpt-00025t-OG
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 15:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7koP-0001Q7-GX
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:01:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7koN-0006sH-SA
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:01:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612468867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nMPWw9lmLMDvFmHlKgieokiY/8wdlKt79Ewv3JOQT/I=;
 b=DkNSqjvCMVltLnnFCyck/fH5CWcWfxBPQBEibt345Osomd1RTvKJl7a6OYhH1ZcRPKpPNJ
 kjqSh9r8e96nigcLuJ+R4hzPA/qYrapX01lkwlkjWQ9dZfUjCNAzXN4TsFsjEZVG+eSkcV
 BcsXnxQtX240OeJetcbJx9nD85IjoFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-LUKVKFRzPcWQ86gcSHIJHg-1; Thu, 04 Feb 2021 15:01:05 -0500
X-MC-Unique: LUKVKFRzPcWQ86gcSHIJHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBE81801963;
 Thu,  4 Feb 2021 20:01:03 +0000 (UTC)
Received: from work-vm (ovpn-114-21.ams2.redhat.com [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EA205D762;
 Thu,  4 Feb 2021 20:01:00 +0000 (UTC)
Date: Thu, 4 Feb 2021 20:00:56 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH v3 2/2] sev: update sev-inject-launch-secret to make gpa
 optional
Message-ID: <20210204200056.GS3039@work-vm>
References: <20210204193939.16617-1-jejb@linux.ibm.com>
 <20210204193939.16617-3-jejb@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210204193939.16617-3-jejb@linux.ibm.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, brijesh.singh@amd.com,
 david.kaplan@amd.com, jon.grimm@amd.com, tobin@ibm.com, qemu-devel@nongnu.org,
 frankeh@us.ibm.com, dovmurik@linux.vnet.ibm.com, Dov.Murik1@il.ibm.com,
 pbonzini@redhat.com, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* James Bottomley (jejb@linux.ibm.com) wrote:
> If the gpa isn't specified, it's value is extracted from the OVMF
> properties table located below the reset vector (and if this doesn't
> exist, an error is returned).  OVMF has defined the GUID for the SEV
> secret area as 4c2eb361-7d9b-4cc3-8081-127c90d3d294 and the format of
> the <data> is: <base>|<size> where both are uint32_t.  We extract
> <base> and use it as the gpa for the injection.
> 
> Note: it is expected that the injected secret will also be GUID
> described but since qemu can't interpret it, the format is left
> undefined here.
> 
> Signed-off-by: James Bottomley <jejb@linux.ibm.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> 
> ---
> 
> v2: fix line length warning, add more comments about sev area
> v2: remove misleading comment
> ---
>  qapi/misc-target.json |  2 +-
>  target/i386/monitor.c | 23 ++++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 06ef8757f0..0c7491cd82 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -216,7 +216,7 @@
>  #
>  ##
>  { 'command': 'sev-inject-launch-secret',
> -  'data': { 'packet-header': 'str', 'secret': 'str', 'gpa': 'uint64' },
> +  'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
>    'if': 'defined(TARGET_I386)' }
>  
>  ##
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 1bc91442b1..5994408bee 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -34,6 +34,7 @@
>  #include "sev_i386.h"
>  #include "qapi/qapi-commands-misc-target.h"
>  #include "qapi/qapi-commands-misc.h"
> +#include "hw/i386/pc.h"
>  
>  /* Perform linear address sign extension */
>  static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
> @@ -730,9 +731,29 @@ SevCapability *qmp_query_sev_capabilities(Error **errp)
>      return sev_get_capabilities(errp);
>  }
>  
> +#define SEV_SECRET_GUID "4c2eb361-7d9b-4cc3-8081-127c90d3d294"
> +struct sev_secret_area {
> +    uint32_t base;
> +    uint32_t size;
> +};
> +
>  void qmp_sev_inject_launch_secret(const char *packet_hdr,
> -                                  const char *secret, uint64_t gpa,
> +                                  const char *secret,
> +                                  bool has_gpa, uint64_t gpa,
>                                    Error **errp)
>  {
> +    if (!has_gpa) {
> +        uint8_t *data;
> +        struct sev_secret_area *area;
> +
> +        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data, NULL)) {
> +            error_setg(errp, "SEV: no secret area found in OVMF,"
> +                       " gpa must be specified.");
> +            return;
> +        }
> +        area = (struct sev_secret_area *)data;
> +        gpa = area->base;
> +    }
> +
>      sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
>  }
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


