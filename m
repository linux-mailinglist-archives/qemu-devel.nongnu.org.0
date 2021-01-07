Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCE72ECDFE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:38:04 +0100 (CET)
Received: from localhost ([::1]:54626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSg7-0001ol-Bg
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kxSek-0001NO-Ed
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:36:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kxSei-0004Xx-55
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610015794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qktnC06QgromIDzebo/9LwPb+YTd7N7wq0sBVkjGF3w=;
 b=AinifsZ7X9luCCN4kW4Tl8GWJPy99h+gJ5Vyg7ipvSlQuOTJCTZKzurdpWR5gkvm9l+uR0
 GauGmM15067zWsnYqx4dNfuhedELn8fPW7kQLdIWeBAsDXof/4Y+VP2QvaYm3UqBlzDkTr
 V6NIKhFICttD3Hw1EW2240h+vI6b4Tg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-9ulOn1gJO1CyHmJ28GiAbw-1; Thu, 07 Jan 2021 05:36:32 -0500
X-MC-Unique: 9ulOn1gJO1CyHmJ28GiAbw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A3548144E3;
 Thu,  7 Jan 2021 10:36:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-197.ams2.redhat.com
 [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 435C677BE1;
 Thu,  7 Jan 2021 10:36:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 79D501800620; Thu,  7 Jan 2021 11:36:24 +0100 (CET)
Date: Thu, 7 Jan 2021 11:36:24 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] virtio-mmio: fix guest kernel crash with SHM regions
Message-ID: <20210107103624.v67snigf33lpynai@sirius.home.kraxel.org>
References: <20201220163539.2255963-1-laurent@vivier.eu>
 <ab15d154-8c4d-4a79-9e15-6d3e4c59c5ed@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <ab15d154-8c4d-4a79-9e15-6d3e4c59c5ed@vivier.eu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > According to the comments in the kernel, a non existent shared region
> > has a length of (u64)-1.

virtio spec says the same.

> > +   case VIRTIO_MMIO_SHM_LEN_LOW:
> > +   case VIRTIO_MMIO_SHM_LEN_HIGH:
> > +        /*
> > +         * VIRTIO_MMIO_SHM_SEL is unimplemented
> > +         * according to the linux driver, if region length is -1
> > +         * the shared memory doesn't exist
> > +         */
> > +        return -1;

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


