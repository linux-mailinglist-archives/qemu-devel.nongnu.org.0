Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A10E364C77C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:56:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5PPP-0001Pb-7e; Wed, 14 Dec 2022 05:54:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p5PPN-0001P7-Ct
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:54:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p5PPL-0002Bc-BO
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:54:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671015277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVeT+AlWQGYDoII4rwF3b9uhksIUoqU2W0Bow00V1RQ=;
 b=JxpeZ20dL8Upbnwg3UO5M7pjmOiuFhOeY0bmfZ2AeQQUOAInYMeFTrbq37YRMHQb1+qbgP
 36T/l2TKcke7jW4JUYeYjl6XbV+BJ8+tz/7M26DNodO0KN9BXkFUtUeNrir7DmIkHxEPql
 QdJecF2oNIX1TtRFS5amr76szHbXvcM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-332-rog2CNrlP1q3yhVlYrzA3g-1; Wed, 14 Dec 2022 05:54:35 -0500
X-MC-Unique: rog2CNrlP1q3yhVlYrzA3g-1
Received: by mail-wr1-f69.google.com with SMTP id
 e7-20020adf9bc7000000b00242121eebe2so3419195wrc.3
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 02:54:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iVeT+AlWQGYDoII4rwF3b9uhksIUoqU2W0Bow00V1RQ=;
 b=zMtkkUD/M6EUv13fUVZ4PX7HrJkhX0Rb9d6/LMrNHB/vyFmpGBn3dyAP74nbACinFP
 Pfg4lBHSd4YvwX3McHyOcY7XeKvN9FMI+8gyUeMMntiRxbiHpiWMlfwOPxI2OL47KpHo
 Cuw6tgx/yMmc6uLm5NDEU2ys/6z6xHNr/zEah/AcuklEstjw0Sy1yr1mmhH4B6Mp24O6
 FpKl+45bmpjKi2CB3qYllwUtvYOuHirb8sx5WgEH7kML9v+BpTggl2QN9HEAc+/9vEBC
 PyCQeLgpjk8ZcyTYAyzMsHdgWsrc9v5Jg5Un3/W1nePnB+6F1j2LZpIFkTzwiwA4Ed+a
 Av6Q==
X-Gm-Message-State: ANoB5pmCixbR4uhj77MwcYsBt0eZ5oCRa5kfA0KnUwPgaj6LVI5QbfFc
 SBR8iw5WmoslYFquthW0K/H/VQO4avKJJwx3jKFYwL8UO5bHOlbnDDBkL/fCHWpfypxrpJp3dNt
 U5jApoGVrhb9ldok=
X-Received: by 2002:a05:6000:38b:b0:242:69f4:cb6a with SMTP id
 u11-20020a056000038b00b0024269f4cb6amr16737595wrf.9.1671015274247; 
 Wed, 14 Dec 2022 02:54:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7hdPRByY5rKc1XQuOvfZYb+QsNDFdzMKR8hLx1BsZmAvLHiYjkYah2gd5uvHiVSK72fGFE6w==
X-Received: by 2002:a05:6000:38b:b0:242:69f4:cb6a with SMTP id
 u11-20020a056000038b00b0024269f4cb6amr16737579wrf.9.1671015273919; 
 Wed, 14 Dec 2022 02:54:33 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:7700:dd7c:92f8:481f:b96b?
 (p200300cbc7037700dd7c92f8481fb96b.dip0.t-ipconnect.de.
 [2003:cb:c703:7700:dd7c:92f8:481f:b96b])
 by smtp.gmail.com with ESMTPSA id
 b9-20020adfee89000000b00242442c8ebdsm2536949wro.111.2022.12.14.02.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 02:54:33 -0800 (PST)
Message-ID: <da19b9fa-3032-b355-e0f4-7ae5e27e09ab@redhat.com>
Date: Wed, 14 Dec 2022 11:54:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
Cc: imammedo@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com
References: <ba02465fc48807eddea9ad646fca7cc92f929ae7.1670603308.git.mprivozn@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] hostmem: Honour multiple preferred nodes if possible
In-Reply-To: <ba02465fc48807eddea9ad646fca7cc92f929ae7.1670603308.git.mprivozn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09.12.22 17:29, Michal Privoznik wrote:
> If a memory-backend is configured with mode
> HOST_MEM_POLICY_PREFERRED then
> host_memory_backend_memory_complete() calls mbind() as:
> 
>    mbind(..., MPOL_PREFERRED, nodemask, ...);
> 
> Here, 'nodemask' is a bitmap of host NUMA nodes and corresponds
> to the .host-nodes attribute. Therefore, there can be multiple
> nodes specified. However, the documentation to MPOL_PREFERRED
> says:
> 
>    MPOL_PREFERRED
>      This mode sets the preferred node for allocation. ...
>      If nodemask specifies more than one node ID, the first node
>      in the mask will be selected as the preferred node.
> 
> Therefore, only the first node is honoured and the rest is

s/honoured/honored/

> silently ignored. Well, with recent changes to the kernel and
> numactl we can do better.

Yeah, I think this "silent" ignoring was part of the design for both, 
the kernel feature and the QEMU feature. Yes, we can do better now.

> 
> Firstly, new mode - MPOL_PREFERRED_MANY - was introduced to
> kernel (v5.15-rc1~107^2~21) which now accepts multiple NUMA
> nodes.

Maybe give the kernel commit instead


"The Linux kernel added in v5.15 via commit cfcaa66f8032 ("") support 
for MPOL_PREFERRED_MANY, which accepts multiple preferred NUMA nodes 
instead.

> 
> Then, numa_has_preferred_many() API was introduced to numactl
> (v2.0.15~26) allowing applications to query kernel support.
> 
> Wiring this all together, we can pass MPOL_PREFERRED_MANY to the
> mbind() call instead and stop ignoring multiple nodes, silently.
> 
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---
>   backends/hostmem.c | 28 ++++++++++++++++++++++++++++
>   meson.build        |  5 +++++
>   2 files changed, 33 insertions(+)
> 
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index 8640294c10..e0d6cb6c8a 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -23,10 +23,22 @@
>   
>   #ifdef CONFIG_NUMA
>   #include <numaif.h>
> +#include <numa.h>
>   QEMU_BUILD_BUG_ON(HOST_MEM_POLICY_DEFAULT != MPOL_DEFAULT);
> +/*
> + * HOST_MEM_POLICY_PREFERRED may some time also by MPOL_PREFERRED_MANY, see
> + * below.

I failed to parse that sentence. :)

"
HOST_MEM_POLICY_PREFERRED may either transalte to MPOL_PREFERRED or 
MPOL_PREFERRED_MANY, see comments further below.
"

?

> + */
>   QEMU_BUILD_BUG_ON(HOST_MEM_POLICY_PREFERRED != MPOL_PREFERRED);
>   QEMU_BUILD_BUG_ON(HOST_MEM_POLICY_BIND != MPOL_BIND);
>   QEMU_BUILD_BUG_ON(HOST_MEM_POLICY_INTERLEAVE != MPOL_INTERLEAVE);
> +
> +/*
> + * -1 for uninitialized,
> + *  0 for MPOL_PREFERRED_MANY unsupported,
> + *  1 for supported.
> + */
> +static int has_preferred_many = -1;

maybe "has_mpol_preferred_many" or "supports_mpol_preferred_many" instead.

... but why do we have to cache that value at all? ...

>   #endif
>   
>   char *
> @@ -346,6 +358,7 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
>            * before mbind(). note: MPOL_MF_STRICT is ignored on hugepages so
>            * this doesn't catch hugepage case. */
>           unsigned flags = MPOL_MF_STRICT | MPOL_MF_MOVE;
> +        int mode = backend->policy;
>   
>           /* check for invalid host-nodes and policies and give more verbose
>            * error messages than mbind(). */
> @@ -369,6 +382,21 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
>                  BITS_TO_LONGS(MAX_NODES + 1) * sizeof(unsigned long));
>           assert(maxnode <= MAX_NODES);
>   
> +#ifdef HAVE_NUMA_SET_PREFERRED_MANY
> +        if (has_preferred_many < 0) {
> +            /* Check, whether kernel supports MPOL_PREFERRED_MANY. */
> +            has_preferred_many = numa_has_preferred_many() > 0 ? 1 : 0;
> +        }
> +
> +        if (mode == MPOL_PREFERRED && has_preferred_many > 0) {
> +            /*
> +             * Replace with MPOL_PREFERRED_MANY otherwise the mbind() below
> +             * silently picks the first node.
> +             */
> +            mode = MPOL_PREFERRED_MANY;
> +        }
> +#endif

... maybe simply not cache the value?


#ifdef HAVE_NUMA_SET_PREFERRED_MANY
	if (mode == MPOL_PREFERRED && numa_has_preferred_many() > 0) {
		/* ... */
		mode = MPOL_PREFERRED_MANY;
	}
#endif

> +
>           if (maxnode &&
>               mbind(ptr, sz, backend->policy, backend->host_nodes, maxnode + 1,
>                     flags)) {
> diff --git a/meson.build b/meson.build
> index 5c6b5a1c75..ebbff7a8ea 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1858,6 +1858,11 @@ config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
>   config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
>   config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
>   config_host_data.set('CONFIG_NUMA', numa.found())
> +if numa.found()
> +  config_host_data.set('HAVE_NUMA_SET_PREFERRED_MANY',
> +                       cc.has_function('numa_set_preferred_many',
> +                                       dependencies: numa))

You're using numa_has_preferred_many(), so better check for that and use 
HAVE_NUMA_HAS_PREFERRED_MANY?

Thanks!

-- 
Thanks,

David / dhildenb


