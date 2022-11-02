Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC86615E8C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 09:58:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq9Zx-00031o-CR; Wed, 02 Nov 2022 04:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oq9Zb-0002i2-Jc
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:58:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oq9ZZ-0001yQ-6G
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667379484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qu3FjAQZEyErNwM/6amQrLAxS3Xs8cUJdPDkh+Rw9r0=;
 b=U8J99pzAAqHg0aJrNx44eBB8eUnLWdXF3hMB6UzWESWjrBewImBCc5BIbeDZjEZZ9rXhE4
 MYMUYS8ZjRrRcI+b2TkNueqetUMLlaYPcXxDqlD5bYtR3kS2yhO2T4LcIGhehSCKfI9Dtp
 8hL3LBaj303vNpX/iHOuAfCEBbuX4qc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-vgOW4mwkPJO1Tw19IppLMA-1; Wed, 02 Nov 2022 04:58:01 -0400
X-MC-Unique: vgOW4mwkPJO1Tw19IppLMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D1571C07582;
 Wed,  2 Nov 2022 08:58:00 +0000 (UTC)
Received: from localhost (unknown [10.39.194.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DA8640C2065;
 Wed,  2 Nov 2022 08:58:00 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH v7 7/7] hw/arm/virt: Add properties to disable high
 memory regions
In-Reply-To: <20221029224307.138822-8-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20221029224307.138822-1-gshan@redhat.com>
 <20221029224307.138822-8-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 02 Nov 2022 09:57:58 +0100
Message-ID: <87wn8dspgp.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Oct 30 2022, Gavin Shan <gshan@redhat.com> wrote:

> The 3 high memory regions are usually enabled by default, but they may
> be not used. For example, VIRT_HIGH_GIC_REDIST2 isn't needed by GICv2.
> This leads to waste in the PA space.
>
> Add properties ("highmem-redists", "highmem-ecam", "highmem-mmio") to
> allow users selectively disable them if needed. After that, the high
> memory region for GICv3 or GICv4 redistributor can be disabled by user,
> the number of maximal supported CPUs needs to be calculated based on
> 'vms->highmem_redists'. The follow-up error message is also improved
> to indicate if the high memory region for GICv3 and GICv4 has been
> enabled or not.
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> ---
>  docs/system/arm/virt.rst | 13 +++++++
>  hw/arm/virt.c            | 75 ++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 86 insertions(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


