Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279E960749B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:02:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olor5-0001G2-Ro
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:02:19 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olokO-0004yS-I2
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1olok6-0004bv-Hb
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:55:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1olok5-0004iX-0v
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:55:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666346104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SH2/OBnZNy0nh4PPag+U2sXcIXnSNot7+Q0P7iZqpiM=;
 b=N8Pr8dF2mIG9EQ00HMsr6CEnWSL9gvL/Au5h3+ZJNQzz17VjIHzt7b1YRHaskCyBpR841o
 9GDHDpOySHBrIKYngzt6gbvtxwPKYZZz48GcMJPBsjp6A2yCyjBf3fVGaZTQ7c52nUp65/
 kUzT8uv4ECuGZX7wZYrZvH5L8dfJ+V0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-OkPeMzt5PZqFX4XXgDOO7g-1; Fri, 21 Oct 2022 05:55:00 -0400
X-MC-Unique: OkPeMzt5PZqFX4XXgDOO7g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0740987A9EC;
 Fri, 21 Oct 2022 09:55:00 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6238340F156;
 Fri, 21 Oct 2022 09:54:56 +0000 (UTC)
Date: Fri, 21 Oct 2022 11:54:55 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Li Feng <fengli@smartx.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 lifeng1519@gmail.com
Subject: Re: [PATCH] vhost-user-blk: fix the resize crash
Message-ID: <Y1Jsb083WoLUqDWX@redhat.com>
References: <20220919121816.3252223-1-fengli@smartx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919121816.3252223-1-fengli@smartx.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.09.2022 um 14:18 hat Li Feng geschrieben:
> If the os is not installed and doesn't have the virtio guest driver,
> the vhost dev isn't started, so the dev->vdev is NULL.
> 
> Reproduce: mount a Win 2019 iso, go into the install ui, then resize
> the virtio-blk device, qemu crash.
> 
> Signed-off-by: Li Feng <fengli@smartx.com>

Thanks, applied to the block branch.

Kevin


