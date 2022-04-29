Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D511A515396
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 20:22:39 +0200 (CEST)
Received: from localhost ([::1]:57704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkVGI-0006Xf-O1
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 14:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nkVF4-0005sy-US
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 14:21:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nkVF0-0008PG-Gi
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 14:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651256476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/stkcvJjykGRYHDCQBNH7PAqqEJypDF4kYoHuS+OVKA=;
 b=gLGGpaHugbBBzMN+di8QpYyiGltIrc6KzqTnknPkVYZ4EFv8bsqSNFYe7rzPdiSzEg/Yae
 gY6Tb+UZKSQYztTWbY9yOUGzQh4VhXtlemEWj/1GeJI3dU2F1Ec4TKA2R+5JK7bmjt8acT
 N2rNcA6jylCx55xy5g7IV/6IReTqWnA=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-aTPLANOrNzCKKSBd6fnyzA-1; Fri, 29 Apr 2022 14:21:14 -0400
X-MC-Unique: aTPLANOrNzCKKSBd6fnyzA-1
Received: by mail-il1-f198.google.com with SMTP id
 f18-20020a926a12000000b002be48b02bc6so4028487ilc.17
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 11:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/stkcvJjykGRYHDCQBNH7PAqqEJypDF4kYoHuS+OVKA=;
 b=DdiFlIhdD6HQQsxmwuFJfausx8CF6OpXEqL20LW5rvw6owAoE9LKYO0vQRzOy7yzEY
 QTveoyj2O0q18K5c3mHt/2/Nn/JD7znMSWHr+weLvTsUl0lceMBUh+3hU0sbGTCtvFB2
 H0uuW4pEMMkGTOVpJNWY0GCRl4cn5gNIApOYcZvaObR7JwbBMiwm64nNwNhrZgn+YbZa
 GcRKyD4HZP9xueDkxwDdHb2G31irprIQ8LbOMpjhiUl0EnAQVlIuBOvDEji/K//Z4LPe
 QUEPCQ06IOkSYj25UwnLnqmlhrDDDrAIz7uYXi+uj4ql50nWgv3k+HQGif9wEyi3ADOU
 vcCg==
X-Gm-Message-State: AOAM5339qu/zaXIQ+t+4CJshrMi/Zq7haGsHQVav2pgqJepSJTzTn+W0
 v4xaOtgug+ulS/qaq074OeuU1/bY5GNWkxb6RwQsPadFicptFEGKpwA+7t1MM3XC7EwpbyBxtgL
 URec/QMgXq/1zrpw=
X-Received: by 2002:a05:6e02:1809:b0:2cc:507a:acfa with SMTP id
 a9-20020a056e02180900b002cc507aacfamr266312ilv.114.1651256474192; 
 Fri, 29 Apr 2022 11:21:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMQe01BrdjkQTGSc8GhfcNnSFwj4USJ8BqMV1n3p5cbt4caHClRYCCsnFmYOxhkaUoVr9wpg==
X-Received: by 2002:a05:6e02:1809:b0:2cc:507a:acfa with SMTP id
 a9-20020a056e02180900b002cc507aacfamr266282ilv.114.1651256473927; 
 Fri, 29 Apr 2022 11:21:13 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 70-20020a6b1449000000b00657b4130f57sm1184609iou.25.2022.04.29.11.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 11:21:13 -0700 (PDT)
Date: Fri, 29 Apr 2022 14:21:11 -0400
From: Peter Xu <peterx@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC 04/10] intel_iommu: Second Stage Access Dirty bit
 support
Message-ID: <Ymwsl5G/TCuRFja2@xz-m1.local>
References: <20220428211351.3897-1-joao.m.martins@oracle.com>
 <20220428211351.3897-5-joao.m.martins@oracle.com>
 <CACGkMEug0zW0pWCSEtHQ5KE5KRpXyWvgJmPZm-yvJnCLmocAYg@mail.gmail.com>
 <f90a8126-7805-be8d-e378-f129196e753d@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f90a8126-7805-be8d-e378-f129196e753d@oracle.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "John G . Johnson" <john.g.johnson@oracle.com>, kvm <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 29, 2022 at 10:12:01AM +0100, Joao Martins wrote:
> On 4/29/22 03:26, Jason Wang wrote:
> > On Fri, Apr 29, 2022 at 5:14 AM Joao Martins <joao.m.martins@oracle.com> wrote:
> >> @@ -3693,7 +3759,8 @@ static void vtd_init(IntelIOMMUState *s)
> >>
> >>      /* TODO: read cap/ecap from host to decide which cap to be exposed. */
> >>      if (s->scalable_mode) {
> >> -        s->ecap |= VTD_ECAP_SMTS | VTD_ECAP_SRS | VTD_ECAP_SLTS;
> >> +        s->ecap |= VTD_ECAP_SMTS | VTD_ECAP_SRS | VTD_ECAP_SLTS |
> >> +                   VTD_ECAP_SLADS;
> >>      }
> > 
> > We probably need a dedicated command line parameter and make it compat
> > for pre 7.1 machines.
> > 
> > Otherwise we may break migration.
> 
> I can gate over an 'x-ssads' option (default disabled). Which reminds me that I probably
> should rename to the most recent mnemonic (as SLADS no longer exists in manuals).
> 
> If we all want by default enabled I can add a separate patch to do so.

The new option sounds good.

Jason, per our previous discussion, shall we not worry about the
compatibility issues per machine-type until the whole feature reaches a
mostly-complete stage?

There seems to have a bunch of sub-features for scalable mode and it's a
large project as a whole.  I'm worried trying to maintain compatibilities
for all the small sub-features could be an unnessary burden to the code
base.

Thanks,

-- 
Peter Xu


