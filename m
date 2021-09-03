Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E85A3FF891
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 03:04:24 +0200 (CEST)
Received: from localhost ([::1]:43136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLxd1-00042T-Dp
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 21:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mLxX9-0007Es-Pg
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 20:58:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mLxX6-0007Be-VL
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 20:58:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630630695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dweDyOYjcmK69myJXjFnVZ/WQ447Q7GxQ0zWDd/1fFI=;
 b=iFjIfUETuXKF1elgr3X+YLx8ZPlXmr0I3Qh2sY0OjjIT8rZMqRxt6x0B+nFh/XwwywdNot
 mTzm3I93MpF0Hz8SKcnqG4Pz+f6esN1kCT/Y/Lha/z+OXVaH8YazpxAikEjrl4pSbgMQZu
 0xOPMo/q4QEGYuFzqUV7tpgs6QayDZE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-v5UqGJtcMk6lUMEwdzBGBg-1; Thu, 02 Sep 2021 20:58:11 -0400
X-MC-Unique: v5UqGJtcMk6lUMEwdzBGBg-1
Received: by mail-lf1-f72.google.com with SMTP id
 y5-20020a0565123f0500b003e21318cde6so1517193lfa.11
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 17:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dweDyOYjcmK69myJXjFnVZ/WQ447Q7GxQ0zWDd/1fFI=;
 b=Z3qdisMn4UpEPLNdo2rXNMVz3WYx24GN3gc5210EZJIntHUy4sovF7alDHnJokGmLR
 vXb+T4VUipRmmCJV47b30te7f3k497gg1G9bNYn0FL3yL9OToUhEh6Gh239BYhFxlyCZ
 yd7UNFUvAx7u7tGNWHoJED8J8+lOEc/FiCea9RehnAQVlWmp0YMNrYqWHlIhq160IeFD
 sFZ5rh3Y+dX9uToaYzo4FF+ZewOqgCGyd/F2RevztrL9Nk8aXlNGQoRR7XgCssZP/5vc
 9IstS8gaCH/NeZw9k8KpfCAJ6u2v7C4VK8k7bMhoZs+Do+nyYGKfK6OW8HmIsMWq4i6h
 7w/Q==
X-Gm-Message-State: AOAM530ncIWccXdPunenW53AbT27kKZStG2/MFNvUozN5T4aPz6vtZnl
 zwO4j0MP9Zlu+dg48bb3u3hGqmMaVky5fh69P0b3VCGyu6k0QSX4opZZ8BkmDAu7cSRhjZOhP9b
 DVriTX3biCEAeVs4w4VkTTK92wqNs5z0=
X-Received: by 2002:a2e:801a:: with SMTP id j26mr822128ljg.385.1630630689517; 
 Thu, 02 Sep 2021 17:58:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv+cC/51MDemLJlyzI1/sE33ac9c6oU7NLMZ7/q8qpYz09PPl+mZKp6gK057IgTiCC/j+wiUqVqDbsh2Yb5aA=
X-Received: by 2002:a2e:801a:: with SMTP id j26mr822105ljg.385.1630630689270; 
 Thu, 02 Sep 2021 17:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210902130625.25277-1-weijunji@bytedance.com>
In-Reply-To: <20210902130625.25277-1-weijunji@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 3 Sep 2021 08:57:57 +0800
Message-ID: <CACGkMEsz4HQKpaw3P=ODXvN2AuqO+_YE0UHpzOFk5GbzX13V4A@mail.gmail.com>
Subject: Re: [RFC 0/5] VirtIO RDMA
To: Junji Wei <weijunji@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>,
 linux-rdma@vger.kernel.org, Yongji Xie <xieyongji@bytedance.com>,
 Cornelia Huck <cohuck@redhat.com>, yuval.shaia.ml@gmail.com,
 virtualization <virtualization@lists.linux-foundation.org>, jgg@ziepe.ca,
 dledford@redhat.com, =?UTF-8?B?5p+056iz?= <chaiwen.cc@bytedance.com>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 2, 2021 at 9:07 PM Junji Wei <weijunji@bytedance.com> wrote:
>
> Hi all,
>
> This RFC aims to reopen the discussion of Virtio RDMA.
> Now this is based on Yuval Shaia's RFC "VirtIO RDMA"
> which implemented a frame for Virtio RDMA and a simple
> control path (Not sure if Yuval Shaia has any further
> plan for it).
>
> We try to extend this work and implement a simple
> data-path and a completed control path. Now this can
> work with SEND, RECV and REG_MR in kernel. There is a
> simple test module in this patch that can communicate
> with ibv_rc_pingpong in rdma-core.
>
> During doing this work, we have found some problems and
> would like to ask for some suggestions from community:

I think it would be beneficial if you can post a spec patch.

Thanks


