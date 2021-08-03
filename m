Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1973DF6BD
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 23:12:53 +0200 (CEST)
Received: from localhost ([::1]:50890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB1iW-0000hF-Hu
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 17:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mB1hf-0008Ss-JY
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 17:11:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mB1hc-0004t7-AZ
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 17:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628025114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GamxtMrg0poTDnYI4i9Ff43J0iNNaHviEHdwOHNkXG0=;
 b=LspQ7z4ah3vG8t7HFSrXi6GajjwfNknZC0iqEeKU52AjYl5fPVPU2I6eajcTaEcDE3rUc/
 1fpfXZ8pgBkkEFGfrBI09VBUOQWrhEyqUObbxOolQWceQvaUDlrguLK1Y5WG1eP6PQfFOS
 l4iaUS1erxyrCEzj80Odja0eNTUYESo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-LI8nBPeRPHWCMk_lvN3-fQ-1; Tue, 03 Aug 2021 17:11:53 -0400
X-MC-Unique: LI8nBPeRPHWCMk_lvN3-fQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 s12-20020a0cdc0c0000b0290341c280725dso133727qvk.6
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 14:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GamxtMrg0poTDnYI4i9Ff43J0iNNaHviEHdwOHNkXG0=;
 b=lao/HCxQR9Zm4jJzGXrIM4/KS8buzxsSP0rqsH/r9y2B7OENd2dp7Mqfyi3vBtRDgN
 LXvyfVJoFFFUvgup/c5Ae2uatdHBfZ7zROcpsuNdYamfrF05p4SGUp0+m6sXYkLBMXEO
 t/1K2OHiXV5pd2Dc81cFSLFEMDl0hcqSzsvcO8X20OQDo0m/gWtvBK1VDXpNEM05ygvU
 IvSzgW6dFMKbtrvbGcX7B1g/VqEq+NjDirQSK0OsYZKFO58q67Gv6Z15ZlmNZcBZlVf2
 j/TLRXg0sNk4v5Eyplsg9QeuflwQrWFMhz3LRxzMM3r2EJFrJfeZ4Wzqt66+irSMu0Ts
 uoHQ==
X-Gm-Message-State: AOAM531Npk45Amqr3mf5jkWbZ8Dh+VoCeLmveQ9qp0ePBSdEg8tkGUIv
 pLf9Ss5PD9/DtKlDHcDT28LBatVc+fxJd/30c5LwLk/iQw/mCMpRPFv7R/jEG1Wk4uZqpwZiKgS
 SUpQQLhLKCbKPOPI=
X-Received: by 2002:a05:622a:134c:: with SMTP id
 w12mr19225801qtk.281.1628025112736; 
 Tue, 03 Aug 2021 14:11:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrS73K5b8enqUOoRMigJ4/wUDZBN1ilmoYYGLUii36dmCB1wySHUadb8okalc8uh65kW7GMw==
X-Received: by 2002:a05:622a:134c:: with SMTP id
 w12mr19225784qtk.281.1628025112534; 
 Tue, 03 Aug 2021 14:11:52 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-92-76-70-75-133.dsl.bell.ca.
 [76.70.75.133])
 by smtp.gmail.com with ESMTPSA id l1sm18959qtk.63.2021.08.03.14.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 14:11:51 -0700 (PDT)
Date: Tue, 3 Aug 2021 17:11:50 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: use large iotlb entry if no IOMMU translation is
 needed
Message-ID: <YQmxFkSo7jZ7pX8Q@t490s>
References: <20210721075402.203711-1-chao.gao@intel.com>
 <20210803042927.GA30466@gao-cwp>
 <5321eefb-7177-2009-6aae-f8c398731eac@redhat.com>
 <20210803055127.GA31303@gao-cwp>
 <950f83e5-cc48-17b2-4509-902ecb7cc22a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <950f83e5-cc48-17b2-4509-902ecb7cc22a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 Chao Gao <chao.gao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 03, 2021 at 04:14:57PM +0800, Jason Wang wrote:
> 
> 在 2021/8/3 下午1:51, Chao Gao 写道:
> > On Tue, Aug 03, 2021 at 12:43:58PM +0800, Jason Wang wrote:
> > > 在 2021/8/3 下午12:29, Chao Gao 写道:
> > > > Ping. Could someone help to review this patch?
> > > > 
> > > > Thanks
> > > > Chao
> > > > 
> > > > On Wed, Jul 21, 2021 at 03:54:02PM +0800, Chao Gao wrote:
> > > > > If guest enables IOMMU_PLATFORM for virtio-net, severe network
> > > > > performance drop is observed even if there is no IOMMU.
> > > 
> > > We see such reports internally and we're testing a patch series to disable
> > > vhost IOTLB in this case.
> > > 
> > > Will post a patch soon.

[1]

> > OK. put me in the CC list. I would like to test with TDX to ensure your patch
> > fix the performance issue I am facing.
> 
> 
> Sure.
> 
> 
> > 
> > > 
> > > 
> > > > >    And disabling
> > > > > vhost can mitigate the perf issue. Finally, we found the culprit is
> > > > > frequent iotlb misses: kernel vhost-net has 2048 entries and each
> > > > > entry is 4K (qemu uses 4K for i386 if no IOMMU); vhost-net can cache
> > > > > translations for up to 8M (i.e. 4K*2048) IOVAs. If guest uses >8M
> > > > > memory for DMA, there are some iotlb misses.
> > > > > 
> > > > > If there is no IOMMU or IOMMU is disabled or IOMMU works in pass-thru
> > > > > mode, we can optimistically use large, unaligned iotlb entries instead
> > > > > of 4K-aligned entries to reduce iotlb pressure.
> > > 
> > > Instead of introducing new general facilities like unaligned IOTLB entry. I
> > > wonder if we optimize the vtd_iommu_translate() to use e.g 1G instead?
> > using 1G iotlb entry looks feasible.
> 
> 
> Want to send a patch?
> 
> 
> > 
> > >      } else {
> > >          /* DMAR disabled, passthrough, use 4k-page*/
> > >          iotlb.iova = addr & VTD_PAGE_MASK_4K;
> > >          iotlb.translated_addr = addr & VTD_PAGE_MASK_4K;
> > >          iotlb.addr_mask = ~VTD_PAGE_MASK_4K;
> > >          iotlb.perm = IOMMU_RW;
> > >          success = true;
> > >      }
> > > 
> > > 
> > > > >    Actually, vhost-net
> > > > > in kernel supports unaligned iotlb entry. The alignment requirement is
> > > > > imposed by address_space_get_iotlb_entry() and flatview_do_translate().
> > > 
> > > For the passthrough case, is there anyway to detect them and then disable
> > > device IOTLB in those case?
> > yes. I guess so; qemu knows the presence and status of iommu. Currently,
> > in flatview_do_translate(), memory_region_get_iommu() tells whether a memory
> > region is behind an iommu.
> 
> 
> The issues are:
> 
> 1) how to know the passthrough mode is enabled (note that passthrough mode
> doesn't mean it doesn't sit behind IOMMU)

memory_region_get_iommu() should return NULL if it's passthrough-ed?

> 2) can passthrough mode be disabled on the fly? If yes, we need to deal with
> them

I don't think it happens in reality; e.g. when iommu=pt is set it's set until
the next guest reboot.  However I don't know whether there's limitation from
spec-wise.  Also I don't know whether there's special cases, for example when
we kexec.

I've two questions..

Jason, when you mentioned the "fix" above [1], shouldn't that also fix the same
issue, and in a better way? Because ideally I think if we know vhost does not
need a translation for either iommu_platform=off, or passthrough, dev-iotlb
layer seems an overhead with no real use.

The other question is I'm also wondering why we care about iommu_platform=on
when there's no vIOMMU at all - it's about why we bother setting the flag at
all?  Or is it a valid use case?

Thanks,

-- 
Peter Xu


