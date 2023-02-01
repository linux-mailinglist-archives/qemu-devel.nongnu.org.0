Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 099DD686548
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 12:20:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNBA8-000066-TG; Wed, 01 Feb 2023 06:20:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pNBA0-0008Rz-3d
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:20:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pNB9x-0005lI-7S
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675250412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Rf/ndu1ndlmsrEh9cZrHni1lq7ELUaMh4GsKtwZLQM=;
 b=Wi/UXRqacuELj9ICKDa33vN72qroX+2iOC2/epHX/V1k/WOPmnLb2/n9oIjcw4Ng1NLm4T
 D42CC7/RDi8OIJ/ZKpWg644FVwUbuRlDGV3JDCIcNe8nDpNdDM9ucQRVmCzKN6s7vfFRLX
 MdY0uaRKSHTlZ5guwSP4Nb1j9OY5PCc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-7rWXKKV2NYWHbGPIvyNyZg-1; Wed, 01 Feb 2023 06:20:09 -0500
X-MC-Unique: 7rWXKKV2NYWHbGPIvyNyZg-1
Received: by mail-ed1-f72.google.com with SMTP id
 w3-20020a056402268300b00487e0d9b53fso12699739edd.10
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 03:20:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Rf/ndu1ndlmsrEh9cZrHni1lq7ELUaMh4GsKtwZLQM=;
 b=LHF8wM3brhiBV0jQT9j+fvW8XsCY5hPO5nKsZGwbvWWDmhoANSh6Zj2sRZgXzN/57X
 ssymMLQMOi5Q9oEok85T1LkRFISG9QAC5Pa2QD+7S+HlkRA3sEokRb/hBKZjfilKr56P
 GhVWv8lOF6QwSKZfhOBK4++MMWrpSERhdwMXSOeA3GjcYdSGEDauh6A5a6uUTzsPic7F
 aDYkGA3y2d8D5LgBLj0pCtoTAVe9jncALz+rb0hAxQfDsiAyIc0k9ZmayHpDLXsYNdt1
 1MHHcy2jHcATfJo4K062lCGpW1yzRnUy9s9wGbq709JBXmnp+V4XWjSuxB1JH8WxLj8D
 4+OQ==
X-Gm-Message-State: AO0yUKXGIML8IA8msF6wVYBrqHoVFWle6JJhY/c9YPADIV8jT6gT8QAp
 0T/4zuiq5hl9QOk30SQlKWHs9rTvGpLiLIpB+3AiyxPhzbFH40XwfxpBXkQ/+y6azl0OUtlNwLx
 UjEMaa1OJn7ph/7o=
X-Received: by 2002:a17:906:c13:b0:878:56ae:36e6 with SMTP id
 s19-20020a1709060c1300b0087856ae36e6mr5723205ejf.35.1675250408180; 
 Wed, 01 Feb 2023 03:20:08 -0800 (PST)
X-Google-Smtp-Source: AK7set9i2mMeTRZ8GoVCdqa0HFg5CHi82V7w9+EwekItreT6SujTXCtzlj2ifW5yoqzDsJkskO2vZQ==
X-Received: by 2002:a17:906:c13:b0:878:56ae:36e6 with SMTP id
 s19-20020a1709060c1300b0087856ae36e6mr5723192ejf.35.1675250407939; 
 Wed, 01 Feb 2023 03:20:07 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 cw9-20020a170906c78900b007aece68483csm9966929ejb.193.2023.02.01.03.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 03:20:07 -0800 (PST)
Date: Wed, 1 Feb 2023 06:20:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Maxime Coquelin <maxime.coquelin@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
Message-ID: <20230201061709-mutt-send-email-mst@kernel.org>
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
 <6684066f-452d-a8b3-58b2-b0db2a3c2015@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6684066f-452d-a8b3-58b2-b0db2a3c2015@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 01, 2023 at 12:14:18PM +0100, Maxime Coquelin wrote:
> Thanks Eugenio for working on this.
> 
> On 1/31/23 20:10, Eugenio Perez Martin wrote:
> > Hi,
> > 
> > The current approach of offering an emulated CVQ to the guest and map
> > the commands to vhost-user is not scaling well:
> > * Some devices already offer it, so the transformation is redundant.
> > * There is no support for commands with variable length (RSS?)
> > 
> > We can solve both of them by offering it through vhost-user the same
> > way as vhost-vdpa do. With this approach qemu needs to track the
> > commands, for similar reasons as vhost-vdpa: qemu needs to track the
> > device status for live migration. vhost-user should use the same SVQ
> > code for this, so we avoid duplications.
> > 
> > One of the challenges here is to know what virtqueue to shadow /
> > isolate. The vhost-user device may not have the same queues as the
> > device frontend:
> > * The first depends on the actual vhost-user device, and qemu fetches
> > it with VHOST_USER_GET_QUEUE_NUM at the moment.
> > * The qemu device frontend's is set by netdev queues= cmdline parameter in qemu
> > 
> > For the device, the CVQ is the last one it offers, but for the guest
> > it is the last one offered in config space.
> > 
> > To create a new vhost-user command to decrease that maximum number of
> > queues may be an option. But we can do it without adding more
> > commands, remapping the CVQ index at virtqueue setup. I think it
> > should be doable using (struct vhost_dev).vq_index and maybe a few
> > adjustments here and there.
> > 
> > Thoughts?
> 
> I am fine with both proposals.
> I think index remapping will require a bit more rework in the DPDK
> Vhost-user library, but nothing insurmountable.
> 
> I am currently working on a PoC adding support for VDUSE in the DPDK
> Vhost library, and recently added control queue support. We can reuse it
> if we want to prototype your proposal.
> 
> Maxime
> 
> > Thanks!
> > 


technically backend knows how many vqs are there, last one is cvq...
not sure we need full blown remapping ...

-- 
MST


