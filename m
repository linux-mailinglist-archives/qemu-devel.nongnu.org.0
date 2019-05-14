Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2F01C1ED
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 07:39:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQQ9V-0001z0-QL
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 01:39:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hQQ8R-0001gK-7B
	for qemu-devel@nongnu.org; Tue, 14 May 2019 01:37:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hQQ8Q-0005xd-AI
	for qemu-devel@nongnu.org; Tue, 14 May 2019 01:37:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43472)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hQQ8Q-0005x6-4g
	for qemu-devel@nongnu.org; Tue, 14 May 2019 01:37:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E41430675B0
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 05:37:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C646A608AB;
	Tue, 14 May 2019 05:37:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id DBCD41747D; Tue, 14 May 2019 07:37:47 +0200 (CEST)
Date: Tue, 14 May 2019 07:37:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20190514053747.os6lwvzwhe2ojsuu@sirius.home.kraxel.org>
References: <20190513184433.21038-1-marcandre.lureau@redhat.com>
	<20190513184433.21038-2-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513184433.21038-2-marcandre.lureau@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 14 May 2019 05:37:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v7 1/8] vhost-user: add
 vhost_user_gpu_set_socket()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +VhostUserGpuCursorUpdate
> +^^^^^^^^^^^^^^^^^^^^^^^^
> +
> ++-----+-------+-------+--------+
> +| pos | hot_x | hot_y | cursor |
> ++-----+-------+-------+--------+
> +
> +:pos: a ``VhostUserGpuCursorPos``, the cursor location
> +
> +:hot_x/hot_y: ``u32``, the cursor hot location
> +
> +:cursor: ``[u32; 64 * 64]``, 64x64 RGBA cursor data

Should clarify here what exactly RGBA is. (PIXMAN_a8r8g8b8 I guess).

> +VhostUserGpuUpdate
> +^^^^^^^^^^^^^^^^^^
> +
> ++------------+---+---+---+---+------+
> +| scanout-id | x | y | w | h | data |
> ++------------+---+---+---+---+------+
> +
> +:scanout-id: ``u32``, the scanout content to update
> +
> +:x/y/w/h: ``u32``, region of the update
> +
> +:data: RGBA data (the size is computed based on the region size, and
> +       the request type)

Likewise.  Also: alpha channel for the framebuffer?

> +C structure
> +-----------
> +
> +In QEMU the vhost-user-gpu message is implemented with the following struct:
> +
> +.. code:: c
> +
> +  typedef struct VhostUserGpuMsg {
> +      uint32_t request; /* VhostUserGpuRequest */
> +      uint32_t flags;
> +      uint32_t size; /* the following payload size */

uint32_t padding;

> +      union {
> +          VhostUserGpuCursorPos cursor_pos;
> +          VhostUserGpuCursorUpdate cursor_update;
> +          VhostUserGpuScanout scanout;
> +          VhostUserGpuUpdate update;
> +          VhostUserGpuDMABUFScanout dmabuf_scanout;
> +          struct virtio_gpu_resp_display_info display_info;
> +          uint64_t u64;

... so this 64bit value will be aligned.

cheers,
  Gerd


