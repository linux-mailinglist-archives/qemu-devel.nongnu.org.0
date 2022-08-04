Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73318589A60
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 12:24:07 +0200 (CEST)
Received: from localhost ([::1]:57724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJY1O-0000my-9z
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 06:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oJXsa-0000lh-3f
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 06:15:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oJXsX-0004Gv-J9
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 06:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659608096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J3iLzp01OOX6DNf4qPAwjQDKj+zlYiqIhEuEKk9RvuQ=;
 b=WrtIGnTHvojMnVgvL/hvt0e5IoPG/s5fwIR2gfn5JrvaTEaY0vp4sCRXIdUhKKWgR6yGoJ
 sqfkvyp6MOM/RklyfkCWSeJ/j8i42kMFCXwiCEpPFqt/b6gJVdjqRCCikCibphDuMcsiT/
 6/fQDj7k0jiPEQalGD+ATm1yMIBiDlc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-1rZKy9uJNzqMzO1_wuVb0Q-1; Thu, 04 Aug 2022 06:14:53 -0400
X-MC-Unique: 1rZKy9uJNzqMzO1_wuVb0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BABB9185A79C;
 Thu,  4 Aug 2022 10:14:52 +0000 (UTC)
Received: from localhost (unknown [10.39.193.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C67C1410DDA;
 Thu,  4 Aug 2022 10:14:52 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>, Fam Zheng
 <fam@euphon.net>, Amit Shah <amit@kernel.org>, Laurent Vivier
 <lvivier@redhat.com>, Hanna Reitz <hreitz@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David
 Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 2/2] virtio: remove unnecessary host_features in
 ->get_features()
In-Reply-To: <20220803173606.965926-3-stefanha@redhat.com>
Organization: Red Hat GmbH
References: <20220803173606.965926-1-stefanha@redhat.com>
 <20220803173606.965926-3-stefanha@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Thu, 04 Aug 2022 12:14:50 +0200
Message-ID: <87edxw8gdh.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Aug 03 2022, Stefan Hajnoczi <stefanha@redhat.com> wrote:

> Since at least commit 6b8f1020540c27246277377aa2c3331ad2bfb160 ("virtio:
> move host_features") the ->get_features() function has been called with
> host_features as an argument.
>
> Some devices manually add host_features in ->get_features() although the
> features argument already contains host_features. Make all devices
> consistent by dropping the unnecessary code.
>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/block/virtio-blk.c       | 3 ---
>  hw/char/virtio-serial-bus.c | 1 -
>  hw/net/virtio-net.c         | 3 ---
>  hw/scsi/vhost-scsi-common.c | 3 ---
>  hw/scsi/virtio-scsi.c       | 4 ----
>  hw/virtio/virtio-balloon.c  | 2 --
>  6 files changed, 16 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


