Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7232831B6FA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:22:18 +0100 (CET)
Received: from localhost ([::1]:48426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBb1F-0008Lq-Gx
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBazo-0007RC-O7
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:20:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBazj-0004WQ-FE
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:20:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613384442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q9FQK6tN/ELkQFVnpg5VSayLlF/asdHAzCRwxWhKMsA=;
 b=CDD/LQRyyb8xPNokm8BB06WfRJm0lsn7VkIvTYBOXBaJh64glPuKTgkyAuQF4eBfejs1rx
 BPmCGRSc3mk6JPQDqtZV+L77z7zGQtlNIBcJ+gK0Y+vAcTqTWKV4T7KRjxwiqULaTczlV9
 kVuHZ2/rBO9lw3dQq95SCKpthAV7Ue8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-HYcvkwLoOZaYoEzqub3vYw-1; Mon, 15 Feb 2021 05:20:39 -0500
X-MC-Unique: HYcvkwLoOZaYoEzqub3vYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF7AEC7400;
 Mon, 15 Feb 2021 10:20:37 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 885065DF21;
 Mon, 15 Feb 2021 10:20:33 +0000 (UTC)
Date: Mon, 15 Feb 2021 11:20:31 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH V2 4/7] block/rbd: add bdrv_attach_aio_context
Message-ID: <20210215102031.GD7226@merkur.fritz.box>
References: <20210126112540.11880-1-pl@kamp.de>
 <20210126112540.11880-5-pl@kamp.de>
MIME-Version: 1.0
In-Reply-To: <20210126112540.11880-5-pl@kamp.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, ct@flyingcircus.io, qemu-devel@nongnu.org,
 pbonzini@redhat.com, mreitz@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.01.2021 um 12:25 hat Peter Lieven geschrieben:
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/block/rbd.c b/block/rbd.c
> index f68ebcf240..7abd0252c9 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -91,6 +91,7 @@ typedef struct BDRVRBDState {
>      char *namespace;
>      uint64_t image_size;
>      uint64_t object_size;
> +    AioContext *aio_context;
>  } BDRVRBDState;

A commit message explaining the why would be helpful here.

This is already stored in BlockDriverState, which should be available
everywhere. Keeping redundant information needs a good justification,
which seems unlikely when BlockDriverState and BDRVRBDState are already
connected through the BlockDriverState.opaque pointer.

The rest of the series doesn't seem to make more use of it either.

Kevin


