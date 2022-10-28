Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63AA610799
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 04:04:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooEj1-00069P-N6; Thu, 27 Oct 2022 22:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooEix-00069E-IC
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 22:03:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooEiv-0002Yy-Rr
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 22:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666922633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KAC3PuetTmyUlh1CF2uvNb7PtwgWneKQXuEv8RFWNgc=;
 b=VAjvPiuhmD61r1j4ec/OGO0FtlzDUAe49kebYldJYjqKfzKiSUhgYOmJV4WcuLtUOXHaFM
 grdYHq4aEIXYimyy1q8p1zRIaRXY6rpGlEQ5I+Q0vz2wrsx605AKmnMBLUhVS0/jkSnJid
 oqDeA+J0d8EEqx+SytevYtpzjzYR68Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-322-Nh_98b5fM4myGyljemrWyQ-1; Thu, 27 Oct 2022 22:03:50 -0400
X-MC-Unique: Nh_98b5fM4myGyljemrWyQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 b13-20020a056402350d00b0045d0fe2004eso2268685edd.18
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 19:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KAC3PuetTmyUlh1CF2uvNb7PtwgWneKQXuEv8RFWNgc=;
 b=ACZyKfa9fjEK5TS08NyW4T9jyzHdLl7fqIqAEsKRObigULrKkX++aqRgxYhM0tGrxd
 cugOU+HBCG4vhUc9uR+MQpnusMVjN0CMfBcRpwYsWfjgq+rUQ6HBvGxomupmckmqHimA
 K79FveAez4j5HovS7xvZ209wZ1cymJgTg3/wkwZKciasV1RsQI6opnMpYmp1b0EMtpt7
 wMDk1IKG/yjk+RkgqSOdV6j+1lLgb6Y/62V/lQk93iRJRIoHVZ6gN4uq8/vY00k0CP9l
 xOrvsDu5n+O3JGeVJyGjkW7pGfn581Mhws2rfD+vxwFAspbL5niXtpLZ095wb4nXmZ9/
 vl5w==
X-Gm-Message-State: ACrzQf3dXCbgHuZInbw4X3mNg59HIb1/cWXrD9aXsMX6l7u76sU0s1X2
 sQrCujUhP0TyRc15ihVMm0vISU72HdxF2NC1w8izx2PQeMN4Ma3NRVkJ7djgwZXwzVDd4TUNzSL
 WkexgjUTcSFqc7bgXlaQvvkkoBY7gm3I=
X-Received: by 2002:a17:907:daa:b0:78d:9bc9:7d7a with SMTP id
 go42-20020a1709070daa00b0078d9bc97d7amr43632760ejc.567.1666922629725; 
 Thu, 27 Oct 2022 19:03:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5n7TBdXzRzbbo/Q4977LqvO0MVI8zy32Cy+avMCBM5tTR6joNoqmmne9nHyNeCeDw2+6Bi7VBBIJWn8hvHCGc=
X-Received: by 2002:a17:907:daa:b0:78d:9bc9:7d7a with SMTP id
 go42-20020a1709070daa00b0078d9bc97d7amr43632745ejc.567.1666922629559; Thu, 27
 Oct 2022 19:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221027075042.16894-1-jasowang@redhat.com>
 <20221027075042.16894-2-jasowang@redhat.com>
 <a1ddce4d-0f42-5ae7-e7d0-fd80cbea65ee@intel.com>
In-Reply-To: <a1ddce4d-0f42-5ae7-e7d0-fd80cbea65ee@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 28 Oct 2022 10:03:37 +0800
Message-ID: <CACGkMEuUOBNKnpzibw5Bcqbf0GT_6xUJ8XngDL6-Ek6fb+sP8g@mail.gmail.com>
Subject: Re: [PATCH V4 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
To: Yi Liu <yi.l.liu@intel.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com, 
 yi.y.sun@linux.intel.com, eperezma@redhat.com, lulu@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

On Thu, Oct 27, 2022 at 9:20 PM Yi Liu <yi.l.liu@intel.com> wrote:
>
> On 2022/10/27 15:50, Jason Wang wrote:
> > We use to warn on wrong rid2pasid entry. But this error could be
> > triggered by the guest and could happens during initialization. So
> > let's don't warn in this case.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >   hw/i386/intel_iommu.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index 6524c2ee32..796f924c06 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -1554,8 +1554,10 @@ static bool vtd_dev_pt_enabled(IntelIOMMUState *s, VTDContextEntry *ce)
> >       if (s->root_scalable) {
> >           ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
> >           if (ret) {
>
> ret is no more used in this branch. It may be changed to below. right?

Right.

>
>          if (vtd_ce_get_rid2pasid_entry(s, ce, &pe)) {
>              ...
>          }
>
> > -            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"PRId32,
> > -                              __func__, ret);
> > +            /*
> > +             * This error is guest triggerable. We should assumt PT
>
> s/triggerable/trigger-able
> s/assumt/assume

Fixed.

Thanks

>
> > +             * not enabled for safety.
> > +             */
> >               return false;
> >           }
> >           return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
>
> --
> Regards,
> Yi Liu
>


