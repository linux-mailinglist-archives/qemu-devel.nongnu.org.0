Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DECE3AFDF8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 09:34:54 +0200 (CEST)
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvavt-0003QP-NM
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 03:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lvav5-0002bG-Om
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:34:03 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:54876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lvav4-0006ij-Av
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:34:03 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-5rEBVZkqO-aKe0jXW3Eaew-1; Tue, 22 Jun 2021 03:33:50 -0400
X-MC-Unique: 5rEBVZkqO-aKe0jXW3Eaew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C7FB18D6A39;
 Tue, 22 Jun 2021 07:33:48 +0000 (UTC)
Received: from bahia.lan (ovpn-113-182.ams2.redhat.com [10.36.113.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CA915C1D1;
 Tue, 22 Jun 2021 07:33:46 +0000 (UTC)
Date: Tue, 22 Jun 2021 09:33:45 +0200
From: Greg Kurz <groug@kaod.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu] spapr: tune rtas-size
Message-ID: <20210622093345.544e256d@bahia.lan>
In-Reply-To: <20210622070336.1463250-1-aik@ozlabs.ru>
References: <20210622070336.1463250-1-aik@ozlabs.ru>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Jun 2021 17:03:36 +1000
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

> QEMU reserves space for RTAS via /rtas/rtas-size which tells the client
> how much space the RTAS requires to work which includes the RTAS binary
> blob implementing RTAS runtime. Because pseries supports FWNMI which
> requires plenty of space, QEMU reserves more than 2KB which is
> enough for the RTAS blob as it is just 20 bytes (under QEMU).
>=20
> Since FWNMI reset delivery was added, RTAS_SIZE macro is not used anymore=
.
> This replaces RTAS_SIZE with RTAS_MIN_SIZE and uses it in
> the /rtas/rtas-size calculation to account for the RTAS blob.
>=20
> Fixes: 0e236d347790 ("ppc/spapr: Implement FWNMI System Reset delivery")
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>=20
> Alternatively SLOF could add hv_rtas_size to the property itself
> but splitting calculations between 2 chunks of code seems an overkill.
> The RTAS blob has always been 20 bytes and unlikely to ever change.

I guess this is acceptable.

Reviewed-by: Greg Kurz <groug@kaod.org>

> ---
>  include/hw/ppc/spapr.h | 2 +-
>  hw/ppc/spapr.c         | 8 ++++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index f05219f75ef6..5697327e4c00 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -770,7 +770,7 @@ void spapr_load_rtas(SpaprMachineState *spapr, void *=
fdt, hwaddr addr);
>  #define SPAPR_IS_PCI_LIOBN(liobn)   (!!((liobn) & 0x80000000))
>  #define SPAPR_PCI_DMA_WINDOW_NUM(liobn) ((liobn) & 0xff)
> =20
> -#define RTAS_SIZE               2048
> +#define RTAS_MIN_SIZE           20 /* hv_rtas_size in SLOF */
>  #define RTAS_ERROR_LOG_MAX      2048
> =20
>  /* Offset from rtas-base where error log is placed */
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 4dd90b75cc52..9e19c570327e 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -919,9 +919,13 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, =
void *fdt)
>       *
>       * The extra 8 bytes is required because Linux's FWNMI error log che=
ck
>       * is off-by-one.
> +     *
> +     * RTAS_MIN_SIZE is required for the RTAS blob itself.
>       */
> -    _FDT(fdt_setprop_cell(fdt, rtas, "rtas-size", RTAS_ERROR_LOG_MAX +
> -=09=09=09  ms->smp.max_cpus * sizeof(uint64_t)*2 + sizeof(uint64_t)));
> +    _FDT(fdt_setprop_cell(fdt, rtas, "rtas-size", RTAS_MIN_SIZE +
> +                          RTAS_ERROR_LOG_MAX +
> +                          ms->smp.max_cpus * sizeof(uint64_t) * 2 +
> +                          sizeof(uint64_t)));
>      _FDT(fdt_setprop_cell(fdt, rtas, "rtas-error-log-max",
>                            RTAS_ERROR_LOG_MAX));
>      _FDT(fdt_setprop_cell(fdt, rtas, "rtas-event-scan-rate",


