Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581025BCB5F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 14:02:17 +0200 (CEST)
Received: from localhost ([::1]:53018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaFTb-000320-72
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 08:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oaFIc-0002V3-HC
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 07:50:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oaFIX-00052W-W0
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 07:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663588248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GV3no5O0Ex/rN2YWvmnsmrtYDlp5PG+8hTX2YdS6fAE=;
 b=GvxbszcmzNbo179WIjRlpJKnuaTA1SyGQPXwBMe4AE2E+AncnrRXZ21a1O4WOMZrBqcIVf
 G2Bjoi9wmNy73/bLuhz2Z6Swuh/cHFKEQcTtXLqs/MjMU7UPRyL0AcrabtwFsvyGt5QFgd
 qBieLvusge6LrQHaz6W23JTmE0AXKbQ=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-45-h8tBWtUSM5-2Ec7NNsGQjA-1; Mon, 19 Sep 2022 07:50:47 -0400
X-MC-Unique: h8tBWtUSM5-2Ec7NNsGQjA-1
Received: by mail-il1-f200.google.com with SMTP id
 o2-20020a056e0214c200b002eb8acbd27cso19479971ilk.22
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 04:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=GV3no5O0Ex/rN2YWvmnsmrtYDlp5PG+8hTX2YdS6fAE=;
 b=j5YedtSdSpeUHCx3D/bmXiiT+3+/V//CVvxJCxQbOjjOiDRmWPk24rucVQh5Z5ut4J
 KEm/AHLFcehYshXPEm1A60wgxdEmc+tn1NM2eNrAVH4ZfPmnjKPxIw86sqFXFzv6h7pD
 yIWs825R5pz0JQLHdglmofWtMa56AXqE0tfGBV9+C+6VABFA1X7zPxPHlU3uB9+hibbj
 HE2STah953f2xHGRJR9z5oN2ChhQQWQqYm/jybnFHMoblu+kDVFPmCM3/h69/wjukUOm
 P7dWGVvSfBf2804UyhoAVXk4uZtX04KbEdP4CP7S0PEPyCQno6umGrooCF3Bn2DNxZzm
 oYdw==
X-Gm-Message-State: ACrzQf3UC/DwCiQoOF6RPGe/iblmMOkKx0uEJluO90gKICrRM1mYqI+b
 Sc6y+F9CvRAkt4zZk8n8lmwECx4SvFuS5qm1js9Gh7Qkhjm+csDMFAUQ6S67hob0hdHuI41nHT8
 Cuo1caxbSdKJuRJI=
X-Received: by 2002:a05:6638:448d:b0:35a:81aa:939d with SMTP id
 bv13-20020a056638448d00b0035a81aa939dmr7595379jab.312.1663588246827; 
 Mon, 19 Sep 2022 04:50:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4KzFqUPYXK2rP5BdhBXzGXT+zAPAdj8v4+ah4jNxj6Xo3jOADS03LFINjLJ9z+XUT06aYWQQ==
X-Received: by 2002:a05:6638:448d:b0:35a:81aa:939d with SMTP id
 bv13-20020a056638448d00b0035a81aa939dmr7595363jab.312.1663588246630; 
 Mon, 19 Sep 2022 04:50:46 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 y12-20020a02354c000000b00349dccb3855sm5489069jae.72.2022.09.19.04.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 04:50:46 -0700 (PDT)
Date: Mon, 19 Sep 2022 05:50:44 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: liulongfang <liulongfang@huawei.com>
Cc: Avihai Horon <avihaih@nvidia.com>, <qemu-devel@nongnu.org>, Cornelia
 Huck <cohuck@redhat.com>, "Juan Quintela" <quintela@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, Joao Martins
 <joao.m.martins@oracle.com>, Yishai Hadas <yishaih@nvidia.com>, Jason
 Gunthorpe <jgg@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, "Shameerali Kolothum Thodi"
 <shameerali.kolothum.thodi@huawei.com>, <jiangkunkun@huawei.com>
Subject: Re: [PATCH v2 08/11] vfio/migration: Remove VFIO migration protocol v1
Message-ID: <20220919055044.47372c9f.alex.williamson@redhat.com>
In-Reply-To: <efba4434-4044-f7ff-0f22-a5e39f48560f@huawei.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
 <20220530170739.19072-9-avihaih@nvidia.com>
 <efba4434-4044-f7ff-0f22-a5e39f48560f@huawei.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Sep 2022 16:35:49 +0800
liulongfang <liulongfang@huawei.com> wrote:

> On 2022/5/31 1:07, Avihai Horon Wrote:
> > Now that v2 protocol implementation has been added, remove the
> > deprecated v1 implementation.
> > "struct vfio_device_migration_info" still exists in vfio.h,  
> why does qemu need to delete v1 implementation?

It never progressed past experimental support, upstream never committed
to support it, it's dead code relative to the kernel specification now.
Thanks,

Alex


