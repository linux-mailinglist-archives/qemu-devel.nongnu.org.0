Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867894A8700
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:52:45 +0100 (CET)
Received: from localhost ([::1]:48124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFdTY-0006TE-74
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:52:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nFdHH-0008EU-TZ
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:40:03 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:49928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nFdHF-0002MK-2Y
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:40:03 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-_bLnjOhzMXSge1Gw46FxGg-1; Thu, 03 Feb 2022 09:39:47 -0500
X-MC-Unique: _bLnjOhzMXSge1Gw46FxGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5B001091DB9;
 Thu,  3 Feb 2022 14:39:46 +0000 (UTC)
Received: from bahia (unknown [10.39.193.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 464991086494;
 Thu,  3 Feb 2022 14:39:45 +0000 (UTC)
Date: Thu, 3 Feb 2022 15:39:43 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] target/ppc: Fix radix logging
Message-ID: <20220203153943.5f017621@bahia>
In-Reply-To: <20220203142145.1301749-1-clg@kaod.org>
References: <20220203142145.1301749-1-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Feb 2022 15:21:45 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> ppc_radix64_partition_scoped_xlate() logs the host page protection
> bits variable but it is uninitialized since it is set later in
> ppc_radix64_check_prot(). Remove the
>=20

Remove the what ?

> Fixes: Coverity CID 1468942
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

LGTM apart from that.

Reviewed-by: Greg Kurz <groug@kaod.org>

>  target/ppc/mmu-radix64.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 040c055bff65..d4e16bd7db50 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -327,13 +327,9 @@ static int ppc_radix64_partition_scoped_xlate(PowerP=
CCPU *cpu,
>      uint64_t pte;
> =20
>      qemu_log_mask(CPU_LOG_MMU, "%s for %s @0x%"VADDR_PRIx
> -                  " mmu_idx %u (prot %c%c%c) 0x%"HWADDR_PRIx"\n",
> +                  " mmu_idx %u 0x%"HWADDR_PRIx"\n",
>                    __func__, access_str(access_type),
> -                  eaddr, mmu_idx,
> -                  *h_prot & PAGE_READ ? 'r' : '-',
> -                  *h_prot & PAGE_WRITE ? 'w' : '-',
> -                  *h_prot & PAGE_EXEC ? 'x' : '-',
> -                  g_raddr);
> +                  eaddr, mmu_idx, g_raddr);
> =20
>      *h_page_size =3D PRTBE_R_GET_RTS(pate.dw0);
>      /* No valid pte or access denied due to protection */


