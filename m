Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EC163B369
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 21:37:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozksJ-0000ch-J6; Mon, 28 Nov 2022 15:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ozksE-0000WD-DZ
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 15:37:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ozks7-0003pi-Qh
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 15:37:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669667818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=roHZtRoeAJ+wkYMKPWjdwDLQVX1nYkC/LiYFWWVsprs=;
 b=bbGLzsP4j6y7Vo6QebOxEBaMlVthc9ucFEz89nFW5VAR4W9hkW6dNe1YiCEhz343x4VqF1
 Q37l1/FGfiluaiU4ED5lCxk6gQzFJ+w/Dx19aI3sLKo3kLTIpS1zMsM9t4Wd7LNf1mOBXR
 qeZkgN+Gw8dd0faINIwt02Q4XyNThsY=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-21-wPjtI5ApMpKVKot5dBEGCQ-1; Mon, 28 Nov 2022 15:36:56 -0500
X-MC-Unique: wPjtI5ApMpKVKot5dBEGCQ-1
Received: by mail-il1-f200.google.com with SMTP id
 i8-20020a056e0212c800b00302578e6d78so9861497ilm.0
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 12:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=roHZtRoeAJ+wkYMKPWjdwDLQVX1nYkC/LiYFWWVsprs=;
 b=YQty82Cx6uGV3eLQZKV4ck3zQA7762iVprQ0yORs3UhEc+GzmB9RvP2Mxse3/zafiG
 PnKBCs3ol7/Xs5OGDVWSbBpEwxAfJ0g7fVofkR5JW+xjdZ6IAIJo7Gu1T8rmG4RsCgrJ
 k2de7voNgPt2IdQHKI/qT3YbtRHs2WNWj0yfuD3xz53gR31bFtPIP82VhF8ou5kLbTrI
 q90anm88FxVNG5bSHCFWwSddFamw3C60aFUzv+sIglpBD5k3tutPtx3jQRLUcwBy01sR
 Wv9qaR0i5+adNzCJsJYC2gvVD6unOeRJJHH+ITMToqRWQvxW0elitu6ZaS2CsmWkN4D7
 3zUQ==
X-Gm-Message-State: ANoB5pmlyBuBIFgcOOi9tHdsMe9s95Ejl2Mt8wmyCx8CbbG0fEzlq8SP
 UNq71L7gceW/9PUXonD8Sznx1bSHi/W8RoffN5RdI+nQQ0eRgJwp2sp/nPPnPq+vJnmBMlxGFij
 kCtwYGE6PonSboxI=
X-Received: by 2002:a6b:6b07:0:b0:6dd:f70e:dda5 with SMTP id
 g7-20020a6b6b07000000b006ddf70edda5mr17655984ioc.100.1669667803423; 
 Mon, 28 Nov 2022 12:36:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4cIJCUIAHUv5wn+eOOvTXQtJ6b5XMqN3e4KjVp5Vm3952wALl2rDbCv4B7Apblk8wGfTa9Cw==
X-Received: by 2002:a6b:6b07:0:b0:6dd:f70e:dda5 with SMTP id
 g7-20020a6b6b07000000b006ddf70edda5mr17655766ioc.100.1669667796414; 
 Mon, 28 Nov 2022 12:36:36 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f30-20020a056602089e00b006df10f981a2sm4832429ioz.6.2022.11.28.12.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 12:36:35 -0800 (PST)
Date: Mon, 28 Nov 2022 13:36:30 -0700
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
Message-ID: <20221128133630.07e1fa14.alex.williamson@redhat.com>
In-Reply-To: <Y4UOp7Wi/fwsY6DY@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-13-avihaih@nvidia.com>
 <20221116112935.23118a30.alex.williamson@redhat.com>
 <099b99c2-8949-c101-45eb-9a8aaed2adb7@nvidia.com>
 <20221117103829.18feab7a.alex.williamson@redhat.com>
 <feaa77ec-c574-6267-0872-d8769037e4c7@nvidia.com>
 <a867c866-c297-960c-6fe3-51f292f4c6d3@nvidia.com>
 <20221128115003.602d4ef7.alex.williamson@redhat.com>
 <Y4UOp7Wi/fwsY6DY@nvidia.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 28 Nov 2022 15:40:23 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, Nov 28, 2022 at 11:50:03AM -0700, Alex Williamson wrote:
> 
> > There's a claim here about added complexity that I'm not really seeing.
> > It looks like we simply make an ioctl call here and scale our buffer
> > based on the minimum of the returned device estimate or our upper
> > bound.  
> 
> I'm not keen on this, for something like mlx5 that has a small precopy
> size and large post-copy size it risks running with an under allocated
> buffer, which is harmful to performance.

I'm trying to weed out whether there are device assumptions in the
implementation, seems like maybe we found one.  MIG_DATA_SIZE specifies
that it's an estimated data size for stop-copy, so shouldn't that
provide the buffer size you're looking for?  Thanks,

Alex


