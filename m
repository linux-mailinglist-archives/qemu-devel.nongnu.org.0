Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8873F6A21
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 21:53:34 +0200 (CEST)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIcUH-00058S-Jo
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 15:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIcTX-0004T6-PA
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 15:52:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIcTW-0000UQ-AP
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 15:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629834765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=un9/Mbl1zzFrm7ETPi+lNSv+BmnSoFtZvAbh94wbvKg=;
 b=aj0BqcRAuwBWsknZOGVahiJ0ihsur2Cfir54/So5fb3ezo9tQcdg3bvvPEbQzPQr86P/f5
 VzfyZ32pRY3O242UMSYB2678VBZJapwMLDDh09PJn0YrKN2mXvFjhp59dS9HaVdipB9jde
 KPh+CLUyWsd6hJyng/375omoD6hyysM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-8F0_Mh4RNnSAowuedUuCjA-1; Tue, 24 Aug 2021 15:52:44 -0400
X-MC-Unique: 8F0_Mh4RNnSAowuedUuCjA-1
Received: by mail-qt1-f200.google.com with SMTP id
 f34-20020a05622a1a2200b0029c338949c1so1871439qtb.8
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 12:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=un9/Mbl1zzFrm7ETPi+lNSv+BmnSoFtZvAbh94wbvKg=;
 b=BWLiAOfwaosz97ka+kskAahwzyqmIbHTxPmgtuVbKoSd4evQG4lqIsxRQ1FS8kA5qO
 htjFQ31akMR9XVMcIdIjlg5RnTBU58KL1EAfNVUKfjrDiCD7TkynFWuYQNmHZhQKS8+l
 qfqqSyGl8hrBhy8kNI9xsNkq3i9jTXorLoh58xXO9NQMXob8C0Iw27nGNuHRer2hW5gi
 U7cABAOH6+Jh0fqtmcf8NvJj3G2gQJdftbe2/DjKSpsuas9EpiQrU/u9XzFxUA44HvM3
 uW/ATCDdaTEijr7Y6nodRVJMdTzG22xiczaqCMJp6t4GvAmsjoOEU2WUlUeE9cvKNK3p
 hmMg==
X-Gm-Message-State: AOAM532fKtPsOxJjBEpFKiyVRn7ecJwO677uN8ehiYZlqQr5Qsv0lUxO
 Ea5KZj05T/dvPYcSTjhfSxfRH37gyQFglIz/pMeHceGH8NMewElzr4BegsD9UD5A0L6QWFZggn3
 k6/AdtEQDxKj+V+c=
X-Received: by 2002:a37:de02:: with SMTP id h2mr27819956qkj.411.1629834763600; 
 Tue, 24 Aug 2021 12:52:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+zCrYiNHGJIDVqFzXnm0ZkWzyKJaO1eCW85hXAXXaHvDFDLQOaVKps+uGE7humwx8X/MGfA==
X-Received: by 2002:a37:de02:: with SMTP id h2mr27819932qkj.411.1629834763395; 
 Tue, 24 Aug 2021 12:52:43 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id t6sm5044456qtp.31.2021.08.24.12.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 12:52:42 -0700 (PDT)
Date: Tue, 24 Aug 2021 15:52:41 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <YSVOCUREQaw+rTen@t490s>
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net>
 <YSP0m83roQytqvDr@t490s>
 <20210823175457-mutt-send-email-mst@kernel.org>
 <4246646f-dee8-c868-0439-1ba7c8fdef3e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4246646f-dee8-c868-0439-1ba7c8fdef3e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 24, 2021 at 06:24:27PM +0200, David Hildenbrand wrote:
> > > Not so much; here's the list of priorities and the devices using it:
> > > 
> > >         |--------------------+---------|
> > >         | priority           | devices |
> > >         |--------------------+---------|
> > >         | MIG_PRI_IOMMU      |       3 |
> > >         | MIG_PRI_PCI_BUS    |       7 |
> > >         | MIG_PRI_VIRTIO_MEM |       1 |
> > >         | MIG_PRI_GICV3_ITS  |       1 |
> > >         | MIG_PRI_GICV3      |       1 |
> > >         |--------------------+---------|
> > 
> > iommu is probably ok. I think virtio mem is ok too,
> > in that it is normally created by virtio-mem-pci ...
> 
> IIRC:
> 
> intel-iommu has to be created on the QEMU cmdline before creating
> virtio-mem-pci.
> 
> -device intel-iommu,caching-mode=on,intremap=on,device-iotlb=on \
> ...
> -device virtio-mem-pci,disable-legacy=on,disable-modern=off,iommu_platform=on,ats=on,id=vm0,...
> 
> Creating virtio-mem-pci will implicitly create virtio-mem. virtio-mem device
> state has to be migrated before migrating intel-iommu state.

Since we're at it.. frankly I didn't fully digest why virtio-mem needs to be
migrated before when reading commit 0fd7616e0f1171b.  It gives me the feeling
more like that virtio-mem has a ordering dependency with vfio-pci not
virtio-mem, but I could be wrong.

E.g., the IOMMU unit shouldn't be walking page table if without a device using
it, then it won't fail until the device walks it in region_add() hooks when
memory replay happens.

> 
> I do wonder if migration priorities are really what we want to reuse here. I
> guess it works right, but just by pure luck (because we ignore the implicit
> dependency regarding priorities)

Yep, that's probably not what we want.  I'll make it a new list of priorities
as I've stated in the other thread.

Thanks,

-- 
Peter Xu


