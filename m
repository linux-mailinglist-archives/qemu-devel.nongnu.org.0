Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9E0302589
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 14:33:19 +0100 (CET)
Received: from localhost ([::1]:43320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l41za-00077e-Ls
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 08:33:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l41xl-00068r-6i
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:31:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l41xj-0001Vb-EV
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611581482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HF8zbD+DxuTRiQZUd3fqW5bScq7LcFoWIZgiTcQD66Q=;
 b=BekWfLdrZl0D5h1vfdZLj+yagiWZ5jivwMi+xSpNEFAKtiZU8Vzj2X/OWtkEhYVmz01hQ7
 ql1uRgTpCnPprhFembofeLWZLYNV8FLtzeysHMzYSIpJ3omVq1ro3Mlzflb5udjs1oapRR
 Z2rH2bqoB5ATSZM2A7J5WIJiFuo2Yz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-nUYZhUljNUCYWEuwbvBf2A-1; Mon, 25 Jan 2021 08:31:18 -0500
X-MC-Unique: nUYZhUljNUCYWEuwbvBf2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C86881F02A;
 Mon, 25 Jan 2021 13:31:17 +0000 (UTC)
Received: from [10.36.115.13] (ovpn-115-13.ams2.redhat.com [10.36.115.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 761EA19744;
 Mon, 25 Jan 2021 13:31:13 +0000 (UTC)
Subject: Re: [PATCH v2] s390x/cpu_model: disallow unpack for --only-migratable
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20210125132238.179972-1-borntraeger@de.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <bc05b7aa-d89e-fa36-0bb1-38b3336145c8@redhat.com>
Date: Mon, 25 Jan 2021 14:31:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210125132238.179972-1-borntraeger@de.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.01.21 14:22, Christian Borntraeger wrote:
> secure execution (aka protected virtualization) guests cannot be
> migrated at the moment. Disallow the unpack facility if the user
> specifies --only-migratable.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
> v1->v2:
> - add missing return
> - protect check with CONFIG_USER_ONLY for building non softmmu binaries
> 
>  target/s390x/cpu_models.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index 35179f9dc7ba..e844a4007210 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -26,6 +26,7 @@
>  #include "qapi/qmp/qdict.h"
>  #ifndef CONFIG_USER_ONLY
>  #include "sysemu/arch_init.h"
> +#include "sysemu/sysemu.h"
>  #include "hw/pci/pci.h"
>  #endif
>  #include "qapi/qapi-commands-machine-target.h"
> @@ -878,6 +879,14 @@ static void check_compatibility(const S390CPUModel *max_model,
>          return;
>      }
>  
> +#ifndef CONFIG_USER_ONLY
> +    if (only_migratable && test_bit(S390_FEAT_UNPACK, model->features)) {
> +        error_setg(errp, "The unpack facility is not compatible with "
> +                   "the --only-migratable option");
> +	return;
> +    }
> +#endif
> +
>      /* detect the missing features to properly report them */
>      bitmap_andnot(missing, model->features, max_model->features, S390_FEAT_MAX);
>      if (bitmap_empty(missing, S390_FEAT_MAX)) {
> 

BTW, I wonder if the right place for this would be apply_cpu_model().

Anyhow

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


