Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8AF38E378
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 11:39:20 +0200 (CEST)
Received: from localhost ([::1]:53382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll73O-0005b1-Ld
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 05:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ll72P-0004vA-DJ
 for qemu-devel@nongnu.org; Mon, 24 May 2021 05:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ll72M-0004nH-Ip
 for qemu-devel@nongnu.org; Mon, 24 May 2021 05:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621849092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhcG+ZYBd4bRB5Q9zZ5/t8jdmTbmo6W9bwBV1bTr2uI=;
 b=Q8bg5J1n3YHew9O1qTU1h1v+vXElIyfM2sw3Lh9RNNThsV0zExotBRqXPVObBi37ystBdq
 ixaoPOpKPtie4zClLCHa1fB+sbMmrouBJDExMX/UXXJlFZmsbukoCpv9s9a+ErqS9wqdF+
 BSqHiDMiaUK6Iu0wL9w7VnoZpXm+5q0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-PsLXx-TSOe6vhlT_btJcyg-1; Mon, 24 May 2021 05:38:11 -0400
X-MC-Unique: PsLXx-TSOe6vhlT_btJcyg-1
Received: by mail-wr1-f70.google.com with SMTP id
 2-20020adf94020000b0290110481f75ddso12830992wrq.21
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 02:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UhcG+ZYBd4bRB5Q9zZ5/t8jdmTbmo6W9bwBV1bTr2uI=;
 b=Hr2Fri4NTrB3DXjEyImNCFqNvMvJY5lTQynHMYPMK65PaaH7NvQluBy2gv/O4L4F9J
 1HsKrh6MYcgBT0Uuz7q5OE3ozB7dyN73DMF5CnO13v72zsVuXB1PkjV0T0i9Ke5OVARy
 gh++7lnVEphO94uDk6Zq+m0A8RfQS+YTBNwZZyOtnCwYxuErd1rcRSJkt08garVwpUD2
 +uX12ZknrF0me/o0v3u/5JN+shrGqm+RN0tpkyLZIFqg2q/RGuCpPZMDD5Z/FEDJrM4U
 JMVm3HfnPiuD8ylbcTK9VpRkqy78jNEzmlHopIwlMG6fXG/sw3SKSY/BbP0bdkEUYUdJ
 bW1w==
X-Gm-Message-State: AOAM532wxp+C+pYD3TTdtPCfhuTEGJQqR1IA8DqOB5Pnv6Owkq0mbHep
 pcOo2G9L2beKg9h5EgAfghv6+tSHMNDv+wsTgAYS++AegpT3Lx5wrKXZhaq89swXn0mpO7JCA+H
 6YeMBkCQRltBNk4U=
X-Received: by 2002:a5d:4c46:: with SMTP id n6mr20882580wrt.95.1621849089970; 
 Mon, 24 May 2021 02:38:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkE8l/aehoZWuKmQObYHxaOPyTbgiq/nPsGARq/5vNSJKSJ1RNdTK4INsbnLsVugDByKpq7Q==
X-Received: by 2002:a5d:4c46:: with SMTP id n6mr20882558wrt.95.1621849089807; 
 Mon, 24 May 2021 02:38:09 -0700 (PDT)
Received: from redhat.com (bzq-79-176-159-122.red.bezeqint.net.
 [79.176.159.122])
 by smtp.gmail.com with ESMTPSA id u11sm11262234wrw.14.2021.05.24.02.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 02:38:09 -0700 (PDT)
Date: Mon, 24 May 2021 05:38:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC v3 00/29] vDPA software assisted live migration
Message-ID: <20210524053144-mutt-send-email-mst@kernel.org>
References: <20210519162903.1172366-1-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210519162903.1172366-1-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Harpreet Singh Anand <hanand@xilinx.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 06:28:34PM +0200, Eugenio Pérez wrote:
> Commit 17 introduces the buffer forwarding. Previous one are for
> preparations again, and laters are for enabling some obvious
> optimizations. However, it needs the vdpa device to be able to map
> every IOVA space, and some vDPA devices are not able to do so. Checking
> of this is added in previous commits.

That might become a significant limitation. And it worries me that
this is such a big patchset which might yet take a while to get
finalized.

I have an idea: how about as a first step we implement a transparent
switch from vdpa to a software virtio in QEMU or a software vhost in
kernel?

This will give us live migration quickly with performance comparable
to failover but without dependance on guest cooperation.

Next step could be driving vdpa from userspace while still copying
packets to a pre-registered buffer.

Finally your approach will be a performance optimization for devices
that support arbitrary IOVA.

Thoughts?

-- 
MST


