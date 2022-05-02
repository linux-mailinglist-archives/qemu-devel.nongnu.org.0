Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0774516FE4
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 14:56:46 +0200 (CEST)
Received: from localhost ([::1]:39712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlVbZ-00084b-Nc
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 08:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlVZx-000719-AX
 for qemu-devel@nongnu.org; Mon, 02 May 2022 08:55:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlVZu-0003b4-2e
 for qemu-devel@nongnu.org; Mon, 02 May 2022 08:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651496100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CqL4KiR9uD/RXOMEb8URbmnxGDSjsgc67isSNuA7kNo=;
 b=RDOV6sUYve+LqfR4ziuutrHEsHUuCSjFwpUXU3qhQf7NdxbSGjiqSVEqEhB18JYvAzSQaI
 7D9LRI6z2XSQsPpllYmhDmNa4UoI7zt3SZCEfA3lXaMOPM2FZdoWIHQJOp/XUzGDAsGuV8
 e0a5mZtsEZAZOJVGRB/Frjg/lkWLCbA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-QE2QBk5aPe-IBXJWuMykJA-1; Mon, 02 May 2022 08:54:57 -0400
X-MC-Unique: QE2QBk5aPe-IBXJWuMykJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC9C93811A22;
 Mon,  2 May 2022 12:54:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95B4B14DE24A;
 Mon,  2 May 2022 12:54:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7251F21E68BC; Mon,  2 May 2022 14:54:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFC 09/10] migration/dirtyrate: Expand dirty_bitmap to
 be tracked separately for devices
References: <20220428211351.3897-1-joao.m.martins@oracle.com>
 <20220428211351.3897-10-joao.m.martins@oracle.com>
Date: Mon, 02 May 2022 14:54:55 +0200
In-Reply-To: <20220428211351.3897-10-joao.m.martins@oracle.com> (Joao
 Martins's message of "Thu, 28 Apr 2022 22:13:50 +0100")
Message-ID: <87k0b4ksbk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Cc: "John G . Johnson" <john.g.johnson@oracle.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>, Yi Liu <yi.l.liu@intel.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <f4bug@amsat.org>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Joao Martins <joao.m.martins@oracle.com> writes:

> Expand dirtyrate measurer that is accessible via HMP calc_dirty_rate
> or QMP 'calc-dirty-rate' to receive a @scope argument. The scope
> then restricts the dirty tracking to be done at devices only,
> while neither enabling or using the KVM (CPU) dirty tracker.
> The default stays as is i.e. dirty-ring / dirty-bitmap from KVM.
>
> This is useful to test, exercise the IOMMU dirty tracker and observe
> how much a given device is dirtying memory.
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

[...]

> diff --git a/qapi/migration.json b/qapi/migration.json
> index 27d7b281581d..082830c6e771 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1793,6 +1793,19 @@
>  { 'enum': 'DirtyRateMeasureMode',
>    'data': ['page-sampling', 'dirty-ring', 'dirty-bitmap'] }
>  
> +##
> +# @DirtyRateScope:
> +#
> +# An enumeration of scope of measuring dirtyrate.

"dirtyrate" is not a word.

> +#
> +# @dirty-devices: calculate dirtyrate by devices only.

Please document @all, too.

> +#
> +# Since: 6.2
> +#
> +##
> +{ 'enum': 'DirtyRateScope',
> +  'data': ['all', 'dirty-devices'] }
> +
>  ##
>  # @DirtyRateInfo:
>  #
> @@ -1827,6 +1840,7 @@
>             'calc-time': 'int64',
>             'sample-pages': 'uint64',
>             'mode': 'DirtyRateMeasureMode',
> +           'scope': 'DirtyRateScope',

Please document new member @scope.

>             '*vcpu-dirty-rate': [ 'DirtyRateVcpu' ] } }
>  
>  ##
> @@ -1851,6 +1865,7 @@
>  ##
>  { 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64',
>                                           '*sample-pages': 'int',
> +                                         '*scope': 'DirtyRateScope',
>                                           '*mode': 'DirtyRateMeasureMode'} }
>  
>  ##

[...]


