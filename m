Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A5E2F2AD3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 10:11:28 +0100 (CET)
Received: from localhost ([::1]:41456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzFi2-00078w-1y
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 04:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzFg9-0006ZQ-5T
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:09:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzFg2-0004q8-TZ
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610442560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f14Za0d/nMlSTuKJf2LEcKWkIQG6JHTgHDcTmh1ygv4=;
 b=KfzOSJzaqFvTD0GyEejtJzXrG26kEWG14jC6FcQ/WUxFJ1j021q3nwYrKhbe9/OU69iZg5
 cCg/X45IviT50nR3wOBygR2weJwN6KzHCGGBdRbpCqJSUC2oOVXnXaE8waoQ5a1ep4O0HW
 tk7ctUjzp4Y8HxXKT8anuWU2KsrKinA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-RCC94vtUNX-jQSWTQmM02g-1; Tue, 12 Jan 2021 04:09:18 -0500
X-MC-Unique: RCC94vtUNX-jQSWTQmM02g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E62B800FF3;
 Tue, 12 Jan 2021 09:09:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-184.ams2.redhat.com [10.36.112.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B41AD10023AB;
 Tue, 12 Jan 2021 09:09:15 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] s390x: Use strpadcpy for copying vm name
To: Miroslav Rezanina <mrezanin@redhat.com>, qemu-devel@nongnu.org
References: <cover.1610384501.git.mrezanin@redhat.com>
 <7334beb15bb36de2f9472264bea284f91abf686f.1610384501.git.mrezanin@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <94a8735d-3539-9d14-18e0-f42f36399631@redhat.com>
Date: Tue, 12 Jan 2021 10:09:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <7334beb15bb36de2f9472264bea284f91abf686f.1610384501.git.mrezanin@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/2021 18.09, Miroslav Rezanina wrote:
> When using strncpy with lenght equal to size of target array,

s/lenght/length/

> GCC 11 produce following warning:
> 
>     warning: '__builtin_strncpy' specified bound 256 equals destination size [-Wstringop-truncation]
> 
> To prevent this warning, use strpadcpy function that will enusure that
> provide functionality similar to strncpy but allow copy strings with
> length equal size of target array (and discarding endint zero) and

s/endint/ending/

> ensure array is zeroed after copied string.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>   target/s390x/kvm.c         | 12 +++++-------
>   target/s390x/misc_helper.c |  7 +++++--
>   2 files changed, 10 insertions(+), 9 deletions(-)

With the two typos fixed:

Reviewed-by: Thomas Huth <thuth@redhat.com>

> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> index b8385e6b95..dc27fa36c9 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm.c
> @@ -29,6 +29,7 @@
>   #include "internal.h"
>   #include "kvm_s390x.h"
>   #include "sysemu/kvm_int.h"
> +#include "qemu/cutils.h"
>   #include "qapi/error.h"
>   #include "qemu/error-report.h"
>   #include "qemu/timer.h"
> @@ -1910,18 +1911,15 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
>                                                       strlen(qemu_name)));
>       }
>       sysib.vm[0].ext_name_encoding = 2; /* 2 = UTF-8 */
> -    memset(sysib.ext_names[0], 0, sizeof(sysib.ext_names[0]));
>       /* If hypervisor specifies zero Extended Name in STSI322 SYSIB, it's
>        * considered by s390 as not capable of providing any Extended Name.
>        * Therefore if no name was specified on qemu invocation, we go with the
>        * same "KVMguest" default, which KVM has filled into short name field.
>        */
> -    if (qemu_name) {
> -        strncpy((char *)sysib.ext_names[0], qemu_name,
> -                sizeof(sysib.ext_names[0]));
> -    } else {
> -        strcpy((char *)sysib.ext_names[0], "KVMguest");
> -    }
> +    strpadcpy((char *)sysib.ext_names[0],
> +              sizeof(sysib.ext_names[0]),
> +              qemu_name ?: "KVMguest", '\0');
> +
>       /* Insert UUID */
>       memcpy(sysib.vm[0].uuid, &qemu_uuid, sizeof(sysib.vm[0].uuid));
>   
> diff --git a/target/s390x/misc_helper.c b/target/s390x/misc_helper.c
> index 58dbc023eb..7ea90d414a 100644
> --- a/target/s390x/misc_helper.c
> +++ b/target/s390x/misc_helper.c
> @@ -19,6 +19,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>   #include "qemu/main-loop.h"
>   #include "cpu.h"
>   #include "internal.h"
> @@ -369,8 +370,10 @@ uint32_t HELPER(stsi)(CPUS390XState *env, uint64_t a0, uint64_t r0, uint64_t r1)
>                   ebcdic_put(sysib.sysib_322.vm[0].name, qemu_name,
>                              MIN(sizeof(sysib.sysib_322.vm[0].name),
>                                  strlen(qemu_name)));
> -                strncpy((char *)sysib.sysib_322.ext_names[0], qemu_name,
> -                        sizeof(sysib.sysib_322.ext_names[0]));
> +                strpadcpy((char *)sysib.sysib_322.ext_names[0],
> +                          sizeof(sysib.sysib_322.ext_names[0]),
> +                          qemu_name, '\0');
> +
>               } else {
>                   ebcdic_put(sysib.sysib_322.vm[0].name, "TCGguest", 8);
>                   strcpy((char *)sysib.sysib_322.ext_names[0], "TCGguest");
> 



