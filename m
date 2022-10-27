Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3405B60F057
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:33:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwNg-00089v-7E; Thu, 27 Oct 2022 02:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1onwNL-0007xe-Qd
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:28:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1onwNA-0001r4-Kj
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666852088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XRVGW0Z25dj4RPGxzoEW3xNCVCF6lDd5mxqW21GBDLc=;
 b=e8Vs2po4+vdl4Jz59QrqUwEGWXFBpoh049t8HBMtuYOQtsbdz7SFuNCzIw1SnCNaPms+Q6
 xfhIJHeTe6BTn2MeZzIc4sY5lle1c6S3lakTvpUMy7qa3/rSiXkqdsfO02xtpoG3n4pM2x
 SxYY7aSiHjtbNq1UZAXu0F7Uz0wj3/s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-dxmLC4h1NdOcJaxk5MZyag-1; Thu, 27 Oct 2022 02:28:07 -0400
X-MC-Unique: dxmLC4h1NdOcJaxk5MZyag-1
Received: by mail-ed1-f72.google.com with SMTP id
 f16-20020a056402355000b00461cf923fdcso421329edd.13
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XRVGW0Z25dj4RPGxzoEW3xNCVCF6lDd5mxqW21GBDLc=;
 b=z9gAV+5wIX7mfhNYMtSvVW6F6IDXvCyFXI/5yYQZXMAxjIZoX/72FCuilQUO4kkeIz
 SlXZgOBa24l/hTSXYlbfDK7cntSStOI8C1KtPmR2gmGa0C0vDcM4Y0PpXAyF7pz32+7h
 tkT4btiVvTJjunmDviZULVfWWsXSlOm585NVTbEXoTDlh0ZLoVzDbod6YGE8GNGhSq5m
 OhkU1fZdMbV0tr+KPrpsTfH02IF8NtlrohhMutNxwAklOGVihl9Hjw4vh9cJX7eNK1GR
 RHew555Qjz8K/CSrwGcksI3s9lwPWRkXJzh1etTw7dVYhSm84Ajp/uTQOxZZAsC4otxq
 MEXA==
X-Gm-Message-State: ACrzQf3PbMvJWt7vlgHBIJixEnE0Yo81zkr2aXCU5/X3q4RajnV77ReH
 23SqJXf6l4Dur7MM16ghDZwlXo0TjuFbsaQKqTtvqxZ9WFTtLmq+kTMZy7Bq5OL59DqhNo6MONl
 oNYaUMt/fwlgSpcYmiCmyZTfmx8KhXJs=
X-Received: by 2002:a05:6402:4148:b0:440:cb9f:d10f with SMTP id
 x8-20020a056402414800b00440cb9fd10fmr43804318eda.77.1666852085936; 
 Wed, 26 Oct 2022 23:28:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM40Gt5wGPTN9k2QXAerTLq0avgxxveSTODNewWYB/dURfrGwkvQt+HFdSArvKitsI1lCTCprmAOa8TnPS+UB1Y=
X-Received: by 2002:a05:6402:4148:b0:440:cb9f:d10f with SMTP id
 x8-20020a056402414800b00440cb9fd10fmr43804298eda.77.1666852085762; Wed, 26
 Oct 2022 23:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221025163734.965367-1-lulu@redhat.com>
 <20221025163734.965367-2-lulu@redhat.com>
 <20221025105518.0a56c662.alex.williamson@redhat.com>
 <20221026164001-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221026164001-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 27 Oct 2022 14:27:26 +0800
Message-ID: <CACLfguWLiSkUzPXuaxpV9wmKsQiirWekOHHYrZLYPTGpz6=v2Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] vfio: move the function vfio_get_xlat_addr() to
 memory.c
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, jasowang@redhat.com,
 pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, sgarzare@redhat.com, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
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

On Thu, 27 Oct 2022 at 04:40, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Oct 25, 2022 at 10:55:18AM -0600, Alex Williamson wrote:
> > On Wed, 26 Oct 2022 00:37:33 +0800
> > Cindy Lu <lulu@redhat.com> wrote:
> > > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > > index 7ba2048836..03940c551d 100644
> > > --- a/softmmu/memory.c
> > > +++ b/softmmu/memory.c
> > ...
> > > +        /*
> > > +         * Malicious VMs might trigger discarding of IOMMU-mapped memory. The
> > > +         * pages will remain pinned inside vfio until unmapped, resulting in a
> > > +         * higher memory consumption than expected. If memory would get
> > > +         * populated again later, there would be an inconsistency between pages
> > > +         * pinned by vfio and pages seen by QEMU. This is the case until
> > > +         * unmapped from the IOMMU (e.g., during device reset).
> > > +         *
> > > +         * With malicious guests, we really only care about pinning more memory
> > > +         * than expected. RLIMIT_MEMLOCK set for the user/process can never be
> > > +         * exceeded and can be used to mitigate this problem.
> > > +         */
> > > +        warn_report_once("Using vfio with vIOMMUs and coordinated discarding of"
> > > +                         " RAM (e.g., virtio-mem) works, however, malicious"
> > > +                         " guests can trigger pinning of more memory than"
> > > +                         " intended via an IOMMU. It's possible to mitigate "
> > > +                         " by setting/adjusting RLIMIT_MEMLOCK.");
> >
> > Looks like the comment and warning still need to be generalized for
> > shared use here.  Thanks,
> >
> > Alex
>
> can be a patch on top? concerned about meeting the soft freeze here.
>
Thanks Alex and Micheal, I will send a new version with this fix very soon
Thanks
Cindy


