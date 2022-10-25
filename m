Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD8660CA75
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 12:57:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onHZz-0007nk-O9; Tue, 25 Oct 2022 06:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1onHZp-0006YT-5r
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:54:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1onHZn-0005yg-Gn
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666695269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K2zfXLXFk2e8p28x8um6eeBSVBVMhs2nk/4C/NGHwyA=;
 b=dlu0PtpTULC2JV5TRt/pwKTNtEEPlk9oFnG6z0lF4T4fU9nnKyAtj2jDpva2pHp5vw6eVd
 ENm9xF2d+2Q8aJuQm3O6Sa8jvI1ssBX+smscalyyZY1VuS4uZLUDB4qnJ3oxlThRtuCwye
 AOZ+VrcaTSLmAtFx0FvcZ3gmbW/adW0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-EHqfgFKnMKm22yMce_7KSA-1; Tue, 25 Oct 2022 06:54:28 -0400
X-MC-Unique: EHqfgFKnMKm22yMce_7KSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB4FA85A59D;
 Tue, 25 Oct 2022 10:54:27 +0000 (UTC)
Received: from localhost (unknown [10.39.193.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5091B10A58CE;
 Tue, 25 Oct 2022 10:54:27 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v6 7/7] hw/arm/virt: Add properties to disable high
 memory regions
In-Reply-To: <20221024035416.34068-8-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20221024035416.34068-1-gshan@redhat.com>
 <20221024035416.34068-8-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 25 Oct 2022 12:54:25 +0200
Message-ID: <874jvsfa1q.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 24 2022, Gavin Shan <gshan@redhat.com> wrote:

> These 3 high memory regions are usually enabled by default, but

s/These 3/The/ ?

> they may be not used. For example, VIRT_HIGH_GIC_REDIST2 isn't
> needed by GICv2. This leads to waste in the PA space.

When building the command line, do we have enough information on when
the regions provide something useful, and when they just waste space?

>
> Add properties to allow users selectively disable them if needed:
> "highmem-redists", "highmem-ecam", "highmem-mmio".
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  docs/system/arm/virt.rst | 12 ++++++++
>  hw/arm/virt.c            | 64 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 76 insertions(+)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 4454706392..a1668a969d 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -98,6 +98,18 @@ compact-highmem
>    Set ``on``/``off`` to enable/disable the compact layout for high memory regions.
>    The default is ``on`` for machine types later than ``virt-7.2``.
>  
> +highmem-redists
> +  Set ``on``/``off`` to enable/disable the high memry region for GICv3/4

s/memry/memory/

> +  redistributor. The default is ``on``.

Do we need to add a note about what effects setting this to "off" may
have, e.g. "Setting this to ``off`` may limit the maximum number of
cpus." or so? And/or "Setting this to ``off`` when using GICv2 will save
some space."?

> +
> +highmem-ecam
> +  Set ``on``/``off`` to enable/disable the high memry region for PCI ECAM.

s/memry/memory/

> +  The default is ``on`` for machine types later than ``virt-3.0``.
> +
> +highmem-mmio
> +  Set ``on``/``off`` to enable/disable the high memry region for PCI MMIO.

s/memry/memory/

> +  The default is ``on``.
> +
>  gic-version
>    Specify the version of the Generic Interrupt Controller (GIC) to provide.
>    Valid values are:


