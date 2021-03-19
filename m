Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BFF341A50
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:47:06 +0100 (CET)
Received: from localhost ([::1]:56802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCen-0005BP-9L
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lNCdh-0004Yr-8U
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:45:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lNCdb-0003L4-46
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616150748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wQODZ6pINn4GzZIn80IrAjzkdm/UVE22dkFhNq6YvhA=;
 b=hwEN7IIFbFknWBCMp9B1ctBo9bh2AkfFePW2n0aTnG7ImNzOJK38IZXfSMAJgsuL1wSm8M
 sclg14JjBNY6wEi+RSkbbD/AqDtsiSfwUgP/qM4bAZtoflOtkdaHORgGdPYz6AZ4oy7+mW
 moBr4o/xNayi9nA0Nwgn5J54j66W+gE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-dp7vuF6NMj6C9UV0jQxFAA-1; Fri, 19 Mar 2021 06:45:45 -0400
X-MC-Unique: dp7vuF6NMj6C9UV0jQxFAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F244587504E;
 Fri, 19 Mar 2021 10:45:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB96960C13;
 Fri, 19 Mar 2021 10:45:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F05C018000B3; Fri, 19 Mar 2021 11:45:38 +0100 (CET)
Date: Fri, 19 Mar 2021 11:45:38 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [RFC 0/1] Use dmabufs for display updates instead of pixman
Message-ID: <20210319104538.dpoffojh3cu7wax7@sirius.home.kraxel.org>
References: <20210302080358.3095748-1-vivek.kasireddy@intel.com>
 <20210302120350.5zqcrdajdpszezpr@sirius.home.kraxel.org>
 <BN7PR11MB278631D2E7F4C7F3DCCB0C6D89699@BN7PR11MB2786.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN7PR11MB278631D2E7F4C7F3DCCB0C6D89699@BN7PR11MB2786.namprd11.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, "Kim,
 Dongwon" <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Hi,

> According to
> https://lore.kernel.org/dri-devel/20210212110140.gdpu7kapnr7ovdcn@sirius.home.kraxel.org/
> proposal, we made some progress on making a 'virtio-gpu (display) +
> pass-through GPU' prototype. We leverage the kmsro framework provided
> by mesa to let the virtio-gpu display work with a passed-through GPU
> in headless mode. And the MR is here:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/9592

Cool.

> Although our work is different from this on-going discussion which is
> about enabling a general way to share buffers between guest and host,
> we'd like to leverage this patch. So, is there any plan to refine this
> patch?

Item (1) on Vivek's new TODO list should provide that.  Once we have
shared blob resources we can create udmabufs on the host side, which
in turn allows to drop extra copies in the display path and speed up
this use case as well (both with and without opengl).

take care,
  Gerd


