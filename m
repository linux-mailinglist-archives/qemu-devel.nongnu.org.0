Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 561AE60487B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:57:03 +0200 (CEST)
Received: from localhost ([::1]:38044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol9Z7-0001bI-Qr
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ol9Sv-0005Fa-N1
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 09:50:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ol9St-0004wP-Nu
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 09:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666187434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OHlPayFUH77OAALUBNCzWmPzjqOh9C8unFWYU2Bh4jY=;
 b=HuiSRr2/RgY2Ob4h7jkGDBjzo/4LTvmsGS1/avfVDE7P/FMd1/6NMEJkMxdQwdMyINvCRL
 gpnI54nGS7ZfY72jpGS5wDXz4S6v58NYR393GRrXetTuZt0WGeSNR2dQ1n8QzKAIJZGR1z
 uvsWcdQRZ/T1JKSGdIOwgMkXMAVxJ34=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-euJmU37YM22DDNa8dz76eg-1; Wed, 19 Oct 2022 09:50:33 -0400
X-MC-Unique: euJmU37YM22DDNa8dz76eg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C44D429AB3F5;
 Wed, 19 Oct 2022 13:50:32 +0000 (UTC)
Received: from localhost (unknown [10.39.194.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 758DBC15BA5;
 Wed, 19 Oct 2022 13:50:32 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v5 4/6] hw/arm/virt: Introduce
 virt_get_high_memmap_enabled() helper
In-Reply-To: <20221011231832.149839-5-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20221011231832.149839-1-gshan@redhat.com>
 <20221011231832.149839-5-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 19 Oct 2022 15:50:30 +0200
Message-ID: <8735bj2a8p.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 12 2022, Gavin Shan <gshan@redhat.com> wrote:

> This introduces virt_get_high_memmap_enabled() helper, which returns
> the pointer to vms->highmem_{redists, ecam, mmio}. The pointer will
> be used in the subsequent patches.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
> ---
>  hw/arm/virt.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


