Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2603F51B962
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 09:43:57 +0200 (CEST)
Received: from localhost ([::1]:56044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmW9T-0002g1-QT
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 03:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nmW70-0001vo-EX
 for qemu-devel@nongnu.org; Thu, 05 May 2022 03:41:24 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:25802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nmW6x-0008S1-BX
 for qemu-devel@nongnu.org; Thu, 05 May 2022 03:41:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651736477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iImyyWJeXSKqwvAOGyL0QZeKnk1NDA9mP6GMZtxX0sQ=;
 b=cV6xat34OFGFj1XCjwMEMRgbmDBEQN2WDIEI6bkS+sczVxCuUpAgbjMmQkUzNNnTMtPdW4
 Kkhj0uLA0DF8A2bY7oMEFIEsJMcULAMecW8sE3XYyn0KuvTJmh5vLLN+ox3E0SxSme/lVq
 8mtbCJtGwyPVOYLjJNfvRxizx8PP1oE=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-yOybJalsPV2fLa4LhpsBVA-1; Thu, 05 May 2022 03:41:16 -0400
X-MC-Unique: yOybJalsPV2fLa4LhpsBVA-1
Received: by mail-lf1-f69.google.com with SMTP id
 k11-20020a05651210cb00b00471d1b1be81so1428203lfg.17
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 00:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iImyyWJeXSKqwvAOGyL0QZeKnk1NDA9mP6GMZtxX0sQ=;
 b=2AdThqeXRYKEge68JcMVIzoSHeFD8SJCuC2Se6FGPvYiCGZZvvFbU4quetCyjrla5p
 +06FCQLtZKQLoEqdgihZ66t0GlckLNLqgvG/BKxT3JXAA/4CbVLM9CzRFLuoGlwYuecq
 D7tm7O5vlcE+NzEh9PdUXP2KW8+sLTUVirV9CZZp+hYAgm7Eb8hn6NlOZpw1QsfmQDI7
 B4YM2pYLtYkihrM9wkvd66VekZnNbni9RCB1cmYMF2HEA6LpxZMMqD2ZVCLh6UkDw2J+
 d5Xkp6b12lI0YkEg1feb7z9Xovx/DSyzeDeHt0bs9w8rI1Q4os3FTfpFq83CdTpek5ty
 i54w==
X-Gm-Message-State: AOAM530I5+qfXiVkhk7L8rEgg/2TdttNEa//RH3dlPxw8Tof1ZwY/YgX
 j7eZ7yLm6YKh+LnwTvkZAMeF4kYVEmD2eAF6nPpXZ7BI5eb4KQyTvrpRmHQL25g5RoLtHV4Nxpn
 Je5aDf1bqHKGbQlNAai5cy9XIGwPaAxo=
X-Received: by 2002:a05:651c:89:b0:250:87c9:d4e6 with SMTP id
 9-20020a05651c008900b0025087c9d4e6mr3462474ljq.315.1651736474670; 
 Thu, 05 May 2022 00:41:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpnQn0feimHP2UoZ+5XWkNS4nxvIlMmfwO3DobMPr/iVBIJU4hpeTmpZe4KvBJMKq4OORdzsy7jTTiTjtnkXE=
X-Received: by 2002:a05:651c:89:b0:250:87c9:d4e6 with SMTP id
 9-20020a05651c008900b0025087c9d4e6mr3462441ljq.315.1651736474362; Thu, 05 May
 2022 00:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220428211351.3897-1-joao.m.martins@oracle.com>
 <20220428211351.3897-5-joao.m.martins@oracle.com>
 <CACGkMEug0zW0pWCSEtHQ5KE5KRpXyWvgJmPZm-yvJnCLmocAYg@mail.gmail.com>
 <f90a8126-7805-be8d-e378-f129196e753d@oracle.com>
 <Ymwsl5G/TCuRFja2@xz-m1.local>
 <62f26667-5ccd-619d-2e0f-eb3a3f304984@oracle.com>
In-Reply-To: <62f26667-5ccd-619d-2e0f-eb3a3f304984@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 5 May 2022 15:41:03 +0800
Message-ID: <CACGkMEtVVmz7fLYSSE+OWA6VsjUO8R4EOHDH-0o=97ZJkXDJuw@mail.gmail.com>
Subject: Re: [PATCH RFC 04/10] intel_iommu: Second Stage Access Dirty bit
 support
To: Joao Martins <joao.m.martins@oracle.com>
Cc: Peter Xu <peterx@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Alex Williamson <alex.williamson@redhat.com>,
 David Hildenbrand <david@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Cornelia Huck <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>, 
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 Yi Liu <yi.l.liu@intel.com>, 
 Eric Auger <eric.auger@redhat.com>, Thanos Makatos <thanos.makatos@nutanix.com>,
 "John G . Johnson" <john.g.johnson@oracle.com>, kvm <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.74; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 4, 2022 at 4:47 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> On 4/29/22 19:21, Peter Xu wrote:
> > On Fri, Apr 29, 2022 at 10:12:01AM +0100, Joao Martins wrote:
> >> On 4/29/22 03:26, Jason Wang wrote:
> >>> On Fri, Apr 29, 2022 at 5:14 AM Joao Martins <joao.m.martins@oracle.com> wrote:
> >>>> @@ -3693,7 +3759,8 @@ static void vtd_init(IntelIOMMUState *s)
> >>>>
> >>>>      /* TODO: read cap/ecap from host to decide which cap to be exposed. */
> >>>>      if (s->scalable_mode) {
> >>>> -        s->ecap |= VTD_ECAP_SMTS | VTD_ECAP_SRS | VTD_ECAP_SLTS;
> >>>> +        s->ecap |= VTD_ECAP_SMTS | VTD_ECAP_SRS | VTD_ECAP_SLTS |
> >>>> +                   VTD_ECAP_SLADS;
> >>>>      }
> >>>
> >>> We probably need a dedicated command line parameter and make it compat
> >>> for pre 7.1 machines.
> >>>
> >>> Otherwise we may break migration.
> >>
> >> I can gate over an 'x-ssads' option (default disabled). Which reminds me that I probably
> >> should rename to the most recent mnemonic (as SLADS no longer exists in manuals).
> >>
> >> If we all want by default enabled I can add a separate patch to do so.
> >
> > The new option sounds good.
> >
>
> OK, I'll fix it then for the next iteration.
>
> Also, perhaps I might take the emulated iommu patches out of the iommufd stuff into a
> separate series. There might be a place for them in the realm of testing/prototyping.

That would be better.

>
> > Jason, per our previous discussion, shall we not worry about the
> > compatibility issues per machine-type until the whole feature reaches a
> > mostly-complete stage?
> >
> > There seems to have a bunch of sub-features for scalable mode and it's a
> > large project as a whole.  I'm worried trying to maintain compatibilities
> > for all the small sub-features could be an unnessary burden to the code
> > base.

My understanding, if it's not too hard, it looks better for each
sub-features to try its best for compatibility. For this case, having
a dedicated option might help for debugging as well.

> Perhaps best to see how close we are to spec is to check what we support in intel-iommu
> in terms of VT-d revision versus how many buckets we fill in. I think SLADS/SSADS was in
> 3.0 IIRC.
>
> I can take the compat stuff out if it's too early for that -- But I take it
> these are questions for Jason.
>

There's probably no need for the compat stuff, having a dedicated
option and making it disabled by default should be fine.

Thanks


