Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67284E8C15
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 04:28:11 +0200 (CEST)
Received: from localhost ([::1]:46520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYf74-0000uh-GI
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 22:28:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nYf6E-0000A4-QJ
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 22:27:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nYf6B-0004pJ-Qp
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 22:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648434434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E93uC6Bv1Pny2ARxrV7PKvVY+s1UIVNJyRWxWphOdtU=;
 b=Acwnw6TmZi3fd/wgFmhLFNJdWdCfWHJ/nBakyxgFAnaOxO/YbaoWlZYCXsx757DvWor/Ll
 e36yiidkWa0ytPcu7srYz9BOq34loo/NtWSQxbafi2iZYGKXQ9g4BaWzyMxlDIWqNCyzA4
 6CVhF+Xamj+692Hllx4BDgtDDvQMIWk=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-PqOg1FfLMQKPudaXLF3uOw-1; Sun, 27 Mar 2022 22:27:13 -0400
X-MC-Unique: PqOg1FfLMQKPudaXLF3uOw-1
Received: by mail-yb1-f199.google.com with SMTP id
 a12-20020a25938c000000b0063467614126so9901605ybm.13
 for <qemu-devel@nongnu.org>; Sun, 27 Mar 2022 19:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E93uC6Bv1Pny2ARxrV7PKvVY+s1UIVNJyRWxWphOdtU=;
 b=VMiS/JjzYn/QOlJFECiE6G33FNPHeheH2X5J25pnToueaDs+IamZ5CEGvrTPT1EqXf
 oicYZr8aFQV30MUwwpzeKtqZ9y1EPihdjgmcIMFRxDZPGwJq9YUjHLC9ZcEpr0RS5hmk
 8pDdIhTIqliboP0oe8ajMglGdnrVlR4+WWk3ngnp7AjV856DhM4wpHolSHFN0v134Wy7
 iPZPLuD5Fp8i1LlEJtE8r/6ZBvsmGxi9duWRUxR0E2KD95WS7rAtvm+1lZqmLAxiu6GQ
 X7pTfhvdQypEcKbEzTJptwwl8KPmi7nu2XPJWLgkPolLMlUHp28Kg+bGlwQ8UC7pSM+B
 P+9w==
X-Gm-Message-State: AOAM532iHAm8GvqdKqk4aHA5SGNAZsgGiSvReClMBXxN2trSXDXMYlCz
 /iITCkW73+KI2+oIvOjIHtR+LpC0fAA3cmZP0lnWWWFc+WyaPifGK+U8OHhekbkV+6a+6T2WgU4
 yURSDYhjqzSjo1eqOQ/iQj1xCgEtGVDc=
X-Received: by 2002:a81:1c07:0:b0:2e5:b683:50b3 with SMTP id
 c7-20020a811c07000000b002e5b68350b3mr23043242ywc.394.1648434432911; 
 Sun, 27 Mar 2022 19:27:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsYO5kl9z6CD1Xuuj1lRWsKy+nWy0bycR8K3reEC2OW6zBOoCLekKQ7LTVHZ4ejP4y61Hlyg5nzRibbn/TOWc=
X-Received: by 2002:a81:1c07:0:b0:2e5:b683:50b3 with SMTP id
 c7-20020a811c07000000b002e5b68350b3mr23043234ywc.394.1648434432728; Sun, 27
 Mar 2022 19:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-2-jasowang@redhat.com>
 <BN9PR11MB52769DCA64DCF7B107FD244B8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB52769DCA64DCF7B107FD244B8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 28 Mar 2022 10:27:01 +0800
Message-ID: <CACGkMEsKJjnBb0qPM8oZvSHt326pMF8JCN8Fu1Qqjeu5pmdfMg@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
To: "Tian, Kevin" <kevin.tian@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 4:21 PM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Jason Wang
> > Sent: Monday, March 21, 2022 1:54 PM
> >
> > We use to warn on wrong rid2pasid entry. But this error could be
> > triggered by the guest and could happens during initialization. So
> > let's don't warn in this case.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  hw/i386/intel_iommu.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index 874d01c162..90964b201c 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -1554,8 +1554,10 @@ static bool vtd_dev_pt_enabled(IntelIOMMUState
> > *s, VTDContextEntry *ce)
> >      if (s->root_scalable) {
> >          ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
> >          if (ret) {
> > -            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"PRId32,
> > -                              __func__, ret);
> > +            /*
> > +             * This error is guest triggerable. We should assumt PT
> > +             * not enabled for safety.
> > +             */
>
> suppose a VT-d fault should be queued in this case besides returning false:
>
> SPD.1: A hardware attempt to access the scalable-mode PASID-directory
> entry referenced through the PASIDDIRPTR field in scalable-mode
> context-entry resulted in an error
>
> SPT.1: A hardware attempt to access a scalable-mode PASID-table entry
> referenced through the SMPTBLPTR field in a scalable-mode PASID-directory
> entry resulted in an error.

Probably, but this issue is not introduced in this patch. We can fix
it on top if necessary.

>
> Currently the implementation of vtd_ce_get_rid2pasid_entry() is also
> problematic. According to VT-d spec, RID2PASID field is effective only
> when ecap.rps is true otherwise PASID#0 is used for RID2PASID. I didn't
> see ecap.rps is set, neither is it checked in that function. It works possibly
> just because Linux currently programs 0 to RID2PASID...

This seems to be another issue since the introduction of scalable mode.

Thanks

>
> >              return false;
> >          }
> >          return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
> > --
> > 2.25.1
> >
>


