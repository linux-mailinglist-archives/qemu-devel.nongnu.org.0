Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BA3155780
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 13:17:07 +0100 (CET)
Received: from localhost ([::1]:55270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j02ZG-00012z-Bd
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 07:17:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43604)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1j02X6-0007sL-I7
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 07:14:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1j02X5-0004DR-Ej
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 07:14:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34704
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1j02X5-0004C6-Aq
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 07:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581077690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LUazR+lYbj9UBk/5s1Frs0NELxyKnBvlgQXpLNcW3bY=;
 b=H+eK+HIF6JzS7fohEdcc/ysQP6jTyVnLEXeMx8VBOiT39tEfeQte4OEbclptfK2Lf1FXdQ
 sRqAWgnqJgc2rZxxoaTTs6TmMQQno/Bz6LJNUmP8fQGnJvKrHkP/CMb1Z2o+yadHvCUWoH
 Vbl9gljMaRE7cKNLUFmNlr+uW3WMMSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-UOuZLSk0O0KBhvGf_DbxXg-1; Fri, 07 Feb 2020 07:14:46 -0500
X-MC-Unique: UOuZLSk0O0KBhvGf_DbxXg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E233A190B2A1;
 Fri,  7 Feb 2020 12:14:44 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4393D5C541;
 Fri,  7 Feb 2020 12:14:39 +0000 (UTC)
Date: Fri, 7 Feb 2020 13:14:37 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v3 07/14] arm/arm64: gicv3: Enable/Disable
 LPIs at re-distributor level
Message-ID: <20200207121437.qtvonx2x2xh3dvgc@kamzik.brq.redhat.com>
References: <20200128103459.19413-1-eric.auger@redhat.com>
 <20200128103459.19413-8-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200128103459.19413-8-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, kvm@vger.kernel.org,
 maz@kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 andre.przywara@arm.com, yuzenghui@huawei.com, alexandru.elisei@arm.com,
 kvmarm@lists.cs.columbia.edu, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 28, 2020 at 11:34:52AM +0100, Eric Auger wrote:
> This helper function controls the signaling of LPIs at
> redistributor level.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v2 -> v3:
> - move the helper in lib/arm/gic-v3.c
> - rename the function with gicv3_lpi_ prefix
> - s/report_abort/assert
> ---
>  lib/arm/asm/gic-v3.h |  1 +
>  lib/arm/gic-v3.c     | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
> index ec2a6f0..734c0c0 100644
> --- a/lib/arm/asm/gic-v3.h
> +++ b/lib/arm/asm/gic-v3.h
> @@ -96,6 +96,7 @@ extern void gicv3_lpi_set_config(int n, u8 val);
>  extern u8 gicv3_lpi_get_config(int n);
>  extern void gicv3_lpi_set_pending_table_bit(int rdist, int n, bool set);
>  extern void gicv3_lpi_alloc_tables(void);
> +extern void gicv3_lpi_rdist_ctrl(u32 redist, bool set);
>  
>  static inline void gicv3_do_wait_for_rwp(void *base)
>  {
> diff --git a/lib/arm/gic-v3.c b/lib/arm/gic-v3.c
> index c33f883..7865d01 100644
> --- a/lib/arm/gic-v3.c
> +++ b/lib/arm/gic-v3.c
> @@ -210,4 +210,21 @@ void gicv3_lpi_set_pending_table_bit(int rdist, int n, bool set)
>  		byte &= ~mask;
>  	*ptr = byte;
>  }
> +
> +void gicv3_lpi_rdist_ctrl(u32 redist, bool set)

_set_clr_ ?

> +{
> +	void *ptr;
> +	u64 val;
> +
> +	assert(redist < nr_cpus);
> +
> +	ptr = gicv3_data.redist_base[redist];
> +	val = readl(ptr + GICR_CTLR);
> +	if (set)
> +		val |= GICR_CTLR_ENABLE_LPIS;
> +	else
> +		val &= ~GICR_CTLR_ENABLE_LPIS;
> +	writel(val,  ptr + GICR_CTLR);
> +}
>  #endif /* __aarch64__ */
> +

stray blank line here

> -- 
> 2.20.1
>

I'm not sure why this needs its own patch. I could just be part of the
next patch.

Thanks,
drew


