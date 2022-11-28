Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D4A63B400
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 22:12:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozlP6-0006Y5-03; Mon, 28 Nov 2022 16:11:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ozlOy-0006X5-8z
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 16:10:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ozlOu-0001SO-MX
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 16:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669669851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uP2h+z3t26o18Ugis80t+DswkzaEK8AYRD8XVcq8Sd0=;
 b=JLtsQ4VvOmm107m9A8VIfixuSCmggXTAQUM9T4KEkHxIGENqRY5av/4PqIVJSSHOG4hzr7
 3ZUCoSh0CZl6X+tXKNHU7qb5M0F8/tokWPV/3c4vCCChdAdD1Z1WsVMqo0ftzQ/K3vTyIW
 MuBGgH8AalZ79gRpLNkbEpNxG5FFCu8=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-550-soztnhm0Oqi26cDeTYknPQ-1; Mon, 28 Nov 2022 16:10:48 -0500
X-MC-Unique: soztnhm0Oqi26cDeTYknPQ-1
Received: by mail-io1-f72.google.com with SMTP id
 z139-20020a6bc991000000b006dac0d359edso6794082iof.2
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 13:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uP2h+z3t26o18Ugis80t+DswkzaEK8AYRD8XVcq8Sd0=;
 b=qMF8Wzh2QgNZw3IwpaL1nvFlMhcLZMEiS/qL7E0L/d6IUz21OghsnQUSF1Itwer2cn
 0w9XBUmivA/EIXTR4WH2ZWHs29rUZkTvwEst6YtuAdqLyRh7RbHoB0SiPs5OFuQjmQvP
 tFgxlJJsGK2MxYIqf58oY8w1WunTrxxCkyiysTnmCu7gmhrwFVfoAk7qmlJ0yyHLCxTI
 3Ah8QkVMSXNsNpcQfkUzZgapPUGz+Oni9qLMm+PORvDM0NJE2emZTim/Uhymo2eOpSJa
 +F4TfPm6lV579ueFhkivenO2Wxxsm2p5WKmTjWLQ9A5gu7MZu5Y0qpRHhT1VriI5Ii3s
 T3ew==
X-Gm-Message-State: ANoB5pnWeOPmP0X9m2q0G475gt2aJywWvcWgsZSCIBiun51tyBU04raB
 irCfGsjZCnkT5kGAFFtKvkgntnohDTerfaKElQ6sJ0ImoHgXstcyoRY2kHHG3fSETIMIDUL6AjQ
 BkzS6c6OHS782lBM=
X-Received: by 2002:a92:a301:0:b0:302:e5dc:b119 with SMTP id
 a1-20020a92a301000000b00302e5dcb119mr11979780ili.45.1669669848034; 
 Mon, 28 Nov 2022 13:10:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4PtZ3idnG6gwSVeMaiggyHu7kZrmJrSYAdHwP/kZC7P2lH0q4NAny7pivXbymoMIj2iFqI0A==
X-Received: by 2002:a92:a301:0:b0:302:e5dc:b119 with SMTP id
 a1-20020a92a301000000b00302e5dcb119mr11979742ili.45.1669669847789; 
 Mon, 28 Nov 2022 13:10:47 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 n1-20020a027101000000b00363ec4dcaacsm4674358jac.22.2022.11.28.13.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 13:10:47 -0800 (PST)
Date: Mon, 28 Nov 2022 14:10:45 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, Juan
 Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>,
 qemu-s390x@nongnu.org, qemu-block@nongnu.org, Kunkun Jiang
 <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>, Yishai
 Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Shay Drory
 <shayd@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 12/17] vfio/migration: Implement VFIO migration
 protocol v2
Message-ID: <20221128141045.2ae4da7d.alex.williamson@redhat.com>
In-Reply-To: <Y4Ugh3TU5lq59pfM@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-13-avihaih@nvidia.com>
 <20221116112935.23118a30.alex.williamson@redhat.com>
 <099b99c2-8949-c101-45eb-9a8aaed2adb7@nvidia.com>
 <20221117103829.18feab7a.alex.williamson@redhat.com>
 <feaa77ec-c574-6267-0872-d8769037e4c7@nvidia.com>
 <a867c866-c297-960c-6fe3-51f292f4c6d3@nvidia.com>
 <20221128115003.602d4ef7.alex.williamson@redhat.com>
 <Y4UOp7Wi/fwsY6DY@nvidia.com>
 <20221128133630.07e1fa14.alex.williamson@redhat.com>
 <Y4Ugh3TU5lq59pfM@nvidia.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 28 Nov 2022 16:56:39 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, Nov 28, 2022 at 01:36:30PM -0700, Alex Williamson wrote:
> > On Mon, 28 Nov 2022 15:40:23 -0400
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > On Mon, Nov 28, 2022 at 11:50:03AM -0700, Alex Williamson wrote:
> > >   
> > > > There's a claim here about added complexity that I'm not really seeing.
> > > > It looks like we simply make an ioctl call here and scale our buffer
> > > > based on the minimum of the returned device estimate or our upper
> > > > bound.    
> > > 
> > > I'm not keen on this, for something like mlx5 that has a small precopy
> > > size and large post-copy size it risks running with an under allocated
> > > buffer, which is harmful to performance.  
> > 
> > I'm trying to weed out whether there are device assumptions in the
> > implementation, seems like maybe we found one.    
> 
> I don't think there are assumptions. Any correct kernel driver should
> be able to do this transfer out of the FD byte-at-a-time.
> 
> This buffer size is just a random selection for now until we get
> multi-fd and can sit down, benchmark and optimize this properly.

We can certainly still do that, but I'm still failing to see how
buffer_size = min(MIG_DATA_SIZE, 1MB) is such an imposition on the
complexity or over-eager optimization.  Thanks,

Alex


