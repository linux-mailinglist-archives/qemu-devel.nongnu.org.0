Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D16F46AB29
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 22:59:24 +0100 (CET)
Received: from localhost ([::1]:35722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muM14-0005IL-VE
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 16:59:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1muM06-0004Vn-Ot
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 16:58:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1muLzy-00027U-Nn
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 16:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638827893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mAG7yt6Bhhlgj/XI7A09NT3Kw/3k7Q4hGlu1rrncmKY=;
 b=BgQ6/DDlOiCqaa8CryIfdL8K7/GMAPBFgYLlIaFOln8gUcLxskLX/w6zbiAy72ZAkDljR6
 jyATNS9LdzCxrpyzsVT2m36ZcSPonszIJU4SQuHUKUlEImgnizG87HJD/tiaVJJVQQU5j3
 gb3GuR0OOTvnKy+YJpqgfnrm57TMJ2M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-pAvQqzG8OOOl3NraM79BKg-1; Mon, 06 Dec 2021 16:58:12 -0500
X-MC-Unique: pAvQqzG8OOOl3NraM79BKg-1
Received: by mail-wm1-f70.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so210709wma.5
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 13:58:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mAG7yt6Bhhlgj/XI7A09NT3Kw/3k7Q4hGlu1rrncmKY=;
 b=jEMViqRv6bQtxMaw3QG4o3QWKzV52vRfJT1bwiqGLCg1E/WCM78DQcgWgbDYDTqoS3
 0/3tgfxNd++eujOKskwK5bFJ2XMx7Xz8/x6SXlOmURhCM5DKVilTnxLpxjEIQ2AFvTLs
 /hEaO/bRiCCsMWyqDAJBBUJ8L7id0zDeIaInalLYIYBBy/Tq/gczTIMjkC3kieZcHxRk
 HBLiZGHWn8cBQDXS2mVbkzwFtCnSM1JPzMuEY7Jzpqsztc3Z/IoW4yIa5EBnd2faWiUQ
 mWpQcsdCy62B+EwTm11hqxifAtteDqLe+rzY27Dv1aYDmvf6+2wZgu3+00r9sizqg1qM
 LklQ==
X-Gm-Message-State: AOAM531sgH2YvuWu47bWCpfbtg4jBtXbndkdrIo0NnmOAqYIsKXSz+Bq
 t8APflrK6BzgO4cKXe5xDbtXIqLvnpMSs+seYc0j5lJ4FDyxkz+G3HX+T78ZCruGpAzvNX3r7NA
 nM0BHcT9RStLfdDQ=
X-Received: by 2002:a1c:540c:: with SMTP id i12mr1591356wmb.33.1638827890985; 
 Mon, 06 Dec 2021 13:58:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLm8tDlHUypbpFHiMdsOgZZBB61UltPUk+GVbHCqmIBrIsAzTN//H8CuGbYdOInrdQ2XfghA==
X-Received: by 2002:a1c:540c:: with SMTP id i12mr1591317wmb.33.1638827890780; 
 Mon, 06 Dec 2021 13:58:10 -0800 (PST)
Received: from redhat.com ([2606:ed00:2::68])
 by smtp.gmail.com with ESMTPSA id v15sm12998093wro.35.2021.12.06.13.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 13:58:10 -0800 (PST)
Date: Mon, 6 Dec 2021 16:57:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v10 0/8] hmp,qmp: Add commands to introspect virtio devices
Message-ID: <20211206165617-mutt-send-email-mst@kernel.org>
References: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
 <2322952.dU7V5S69UE@silver>
 <b8d74a5c-73ac-3fe5-6eae-1e5b3c907628@oracle.com>
 <819408538.haW0C61HAu@silver>
MIME-Version: 1.0
In-Reply-To: <819408538.haW0C61HAu@silver>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: david@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, armbru@redhat.com, arei.gonglei@huawei.com,
 marcandre.lureau@redhat.com, Jonah Palmer <jonah.palmer@oracle.com>,
 lvivier@redhat.com, thuth@redhat.com, michael.roth@amd.com, groug@kaod.org,
 dgilbert@redhat.com, eric.auger@redhat.com, stefanha@redhat.com,
 boris.ostrovsky@oracle.com, kwolf@redhat.com, mathieu.poirier@linaro.org,
 raphael.norwitz@nutanix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 06, 2021 at 07:13:49PM +0100, Christian Schoenebeck wrote:
> On Montag, 6. Dezember 2021 17:09:45 CET Jonah Palmer wrote:
> > On 12/6/21 08:50, Christian Schoenebeck wrote:
> > > On Montag, 6. Dezember 2021 13:43:18 CET Jonah Palmer wrote:
> > >> This series introduces new QMP/HMP commands to dump the status of a
> > >> virtio device at different levels.
> > >> 
> > >> [Jonah: Rebasing previous patchset from Nov. 10 (v9). Original patches
> > >> 
> > >>   are by Laurent Vivier from May 2020.
> > >>   
> > >>   Rebase from v9 to v10 includes reformatting virtio.json examples and
> > >>   command structures for better consistency. Also removed all enums from
> > >>   virtio.json and replaced their purpose with string literals.
> > >>   
> > >>   Removed @ndescs from VirtioQueueElement, as the number of descriptors
> > >>   can be inferred from the length of the @descs chain.
> > >>   
> > >>   Lastly, removed the examples in hmp-commands-info.hx to fix
> > >>   'inconsistent
> > >>   literal block quoting' warning from Sphinx.]
> > > 
> > > I have not followed the entire discussion. AFAICS this is intended to
> > > monitor status information on virtio level only, like virtqueue fill
> > > status, etc.
> > > 
> > > One thing that I am looking for is monitoring device specific information
> > > above virtio level, e.g. certain performance numbers or statistics that
> > > only make sense for the specific device. That would not fit into any of
> > > these commands, right?
> > > 
> > > Best regards,
> > > Christian Schoenebeck
> > 
> > Correct. These are just one-shot commands that dump information on virtio
> > devices (including vhosts), their virtqueues, and virtqueue elements as they
> > are at the time of the command.
> > 
> > Jonah
> 
> What I would find useful though on this virtio level: also being able to query 
> the maximum and average fill state of the two ring buffers of each virtqueue. 
> That would allow to identify performance bottlenecks.
> 
> Best regards,
> Christian Schoenebeck

Adding this to vhost would need some interface work though.
Also, collecting these stats isn't free or trivial,
so I imagine we would need commands to enable/disable data collection.

-- 
MST


