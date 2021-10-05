Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA22421F14
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 08:51:29 +0200 (CEST)
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXeIR-00057G-2u
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 02:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mXeGJ-0003nl-5L
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 02:49:15 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:23452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mXeGH-0004kC-Hw
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 02:49:14 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-rw8hNHQMN_aQwZQiDfxgTQ-1; Tue, 05 Oct 2021 02:49:11 -0400
X-MC-Unique: rw8hNHQMN_aQwZQiDfxgTQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AB4118125C3;
 Tue,  5 Oct 2021 06:49:10 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A8CD5C1CF;
 Tue,  5 Oct 2021 06:49:09 +0000 (UTC)
Date: Tue, 5 Oct 2021 08:49:08 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] spapr/xive: Add source status helpers
Message-ID: <20211005084908.776f9f48@bahia.huguette>
In-Reply-To: <20211004212141.432954-1-clg@kaod.org>
References: <20211004212141.432954-1-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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

On Mon, 4 Oct 2021 23:21:41 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> and use them to set and test the ASSERTED bit of LSI sources.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  include/hw/ppc/xive.h    | 24 ++++++++++++++++++++++++
>  hw/intc/spapr_xive.c     |  2 +-
>  hw/intc/spapr_xive_kvm.c | 10 +++-------
>  hw/intc/xive.c           |  8 ++++----
>  4 files changed, 32 insertions(+), 12 deletions(-)
>=20
> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
> index 252c58a1d691..b8ab0bf7490f 100644
> --- a/include/hw/ppc/xive.h
> +++ b/include/hw/ppc/xive.h
> @@ -286,6 +286,30 @@ uint8_t xive_esb_set(uint8_t *pq, uint8_t value);
>  uint8_t xive_source_esb_get(XiveSource *xsrc, uint32_t srcno);
>  uint8_t xive_source_esb_set(XiveSource *xsrc, uint32_t srcno, uint8_t pq=
);
> =20
> +/*
> + * Source status helpers
> + */
> +static inline void xive_source_set_status(XiveSource *xsrc, uint32_t src=
no,
> +                                          uint8_t status, bool enable)
> +{
> +    if (enable) {
> +        xsrc->status[srcno] |=3D status;
> +    } else {
> +        xsrc->status[srcno] &=3D ~status;
> +    }
> +}
> +
> +static inline void xive_source_set_asserted(XiveSource *xsrc, uint32_t s=
rcno,
> +                                            bool enable)
> +{
> +    xive_source_set_status(xsrc, srcno, XIVE_STATUS_ASSERTED, enable);
> +}
> +
> +static inline bool xive_source_is_asserted(XiveSource *xsrc, uint32_t sr=
cno)
> +{
> +    return xsrc->status[srcno] & XIVE_STATUS_ASSERTED;
> +}
> +
>  void xive_source_pic_print_info(XiveSource *xsrc, uint32_t offset,
>                                  Monitor *mon);
> =20
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index 89cfa018f598..4ec659b93e13 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -185,7 +185,7 @@ static void spapr_xive_pic_print_info(SpaprXive *xive=
, Monitor *mon)
>                         xive_source_irq_is_lsi(xsrc, i) ? "LSI" : "MSI",
>                         pq & XIVE_ESB_VAL_P ? 'P' : '-',
>                         pq & XIVE_ESB_VAL_Q ? 'Q' : '-',
> -                       xsrc->status[i] & XIVE_STATUS_ASSERTED ? 'A' : ' =
',
> +                       xive_source_is_asserted(xsrc, i) ? 'A' : ' ',
>                         xive_eas_is_masked(eas) ? "M" : " ",
>                         (int) xive_get_field64(EAS_END_DATA, eas->w));
> =20
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index 6d4909d0a856..be94cff14837 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -242,7 +242,7 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, in=
t srcno, Error **errp)
> =20
>      if (xive_source_irq_is_lsi(xsrc, srcno)) {
>          state |=3D KVM_XIVE_LEVEL_SENSITIVE;
> -        if (xsrc->status[srcno] & XIVE_STATUS_ASSERTED) {
> +        if (xive_source_is_asserted(xsrc, srcno)) {
>              state |=3D KVM_XIVE_LEVEL_ASSERTED;
>          }
>      }
> @@ -321,7 +321,7 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int src=
no, uint32_t offset,
>      if (xive_source_irq_is_lsi(xsrc, srcno) &&
>          offset =3D=3D XIVE_ESB_LOAD_EOI) {
>          xive_esb_read(xsrc, srcno, XIVE_ESB_SET_PQ_00);
> -        if (xsrc->status[srcno] & XIVE_STATUS_ASSERTED) {
> +        if (xive_source_is_asserted(xsrc, srcno)) {
>              kvmppc_xive_esb_trigger(xsrc, srcno);
>          }
>          return 0;
> @@ -359,11 +359,7 @@ void kvmppc_xive_source_set_irq(void *opaque, int sr=
cno, int val)
>              return;
>          }
>      } else {
> -        if (val) {
> -            xsrc->status[srcno] |=3D XIVE_STATUS_ASSERTED;
> -        } else {
> -            xsrc->status[srcno] &=3D ~XIVE_STATUS_ASSERTED;
> -        }
> +        xive_source_set_asserted(xsrc, srcno, val);
>      }
> =20
>      kvmppc_xive_esb_trigger(xsrc, srcno);
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index 6c82326ec768..190194d27f84 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -875,7 +875,7 @@ static bool xive_source_lsi_trigger(XiveSource *xsrc,=
 uint32_t srcno)
>  {
>      uint8_t old_pq =3D xive_source_esb_get(xsrc, srcno);
> =20
> -    xsrc->status[srcno] |=3D XIVE_STATUS_ASSERTED;
> +    xive_source_set_asserted(xsrc, srcno, true);
> =20
>      switch (old_pq) {
>      case XIVE_ESB_RESET:
> @@ -923,7 +923,7 @@ static bool xive_source_esb_eoi(XiveSource *xsrc, uin=
t32_t srcno)
>       * notification
>       */
>      if (xive_source_irq_is_lsi(xsrc, srcno) &&
> -        xsrc->status[srcno] & XIVE_STATUS_ASSERTED) {
> +        xive_source_is_asserted(xsrc, srcno)) {
>          ret =3D xive_source_lsi_trigger(xsrc, srcno);
>      }
> =20
> @@ -1104,7 +1104,7 @@ void xive_source_set_irq(void *opaque, int srcno, i=
nt val)
>          if (val) {
>              notify =3D xive_source_lsi_trigger(xsrc, srcno);
>          } else {
> -            xsrc->status[srcno] &=3D ~XIVE_STATUS_ASSERTED;
> +            xive_source_set_asserted(xsrc, srcno, false);
>          }
>      } else {
>          if (val) {
> @@ -1133,7 +1133,7 @@ void xive_source_pic_print_info(XiveSource *xsrc, u=
int32_t offset, Monitor *mon)
>                         xive_source_irq_is_lsi(xsrc, i) ? "LSI" : "MSI",
>                         pq & XIVE_ESB_VAL_P ? 'P' : '-',
>                         pq & XIVE_ESB_VAL_Q ? 'Q' : '-',
> -                       xsrc->status[i] & XIVE_STATUS_ASSERTED ? 'A' : ' =
');
> +                       xive_source_is_asserted(xsrc, i) ? 'A' : ' ');
>      }
>  }
> =20


