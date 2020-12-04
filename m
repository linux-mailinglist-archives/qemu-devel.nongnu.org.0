Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FCD2CF3ED
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 19:23:35 +0100 (CET)
Received: from localhost ([::1]:53566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klFjw-0000nG-8M
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 13:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1klETe-00059S-BG
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:02:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1klET0-0003kr-Mo
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:02:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607101301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C3KwBOLKtqAON90MkEzVLIst4cdHZMTf5v6xPZ32gd0=;
 b=FOm2kgAxq8wvG/+PuNnrKhWDL0fh8vFiYqdQdRZeACkasADt7S7iBh3D+tsUUKHufzK3WD
 vOf3ik12J7POm4Bvh/JSxy+PzjcbLttaWMeDOvsylvRWjwmbkrSOdUJmKhmiWAGuqiyh+w
 3GoFyPJ+W0uE9NxogSG7hWOtSRcrvaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-NUAWgytON2mc1n1Z_J70dw-1; Fri, 04 Dec 2020 12:01:37 -0500
X-MC-Unique: NUAWgytON2mc1n1Z_J70dw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 636A81922028;
 Fri,  4 Dec 2020 17:01:36 +0000 (UTC)
Received: from [10.3.112.195] (ovpn-112-195.phx2.redhat.com [10.3.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF68D100239A;
 Fri,  4 Dec 2020 17:01:29 +0000 (UTC)
Subject: Re: [PATCH 1/2] virtio-blk: Acquire context while switching them on
 dataplane start
To: Sergio Lopez <slp@redhat.com>, qemu-devel@nongnu.org
References: <20201204165347.73542-1-slp@redhat.com>
 <20201204165347.73542-2-slp@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <a3b88f66-a34c-883d-3ec2-346aaf552275@redhat.com>
Date: Fri, 4 Dec 2020 11:01:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204165347.73542-2-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 10:53 AM, Sergio Lopez wrote:
> On dataplane start, acquire the new AIO context before calling
> 'blk_set_aio_context', releasing it immediately afterwards. This
> prevents reaching the AIO context attach/detach notifier functions
> without having acquired it first.
> 
> It was also the only place where 'blk_set_aio_context' was called with
> an unprotected AIO context.
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  hw/block/dataplane/virtio-blk.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

I'll queue through my NBD tree, but will wait a couple days to see if
other block developers want to add review comments.

> 
> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
> index 37499c5564..034e43cb1f 100644
> --- a/hw/block/dataplane/virtio-blk.c
> +++ b/hw/block/dataplane/virtio-blk.c
> @@ -214,7 +214,9 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
>      vblk->dataplane_started = true;
>      trace_virtio_blk_data_plane_start(s);
>  
> +    aio_context_acquire(s->ctx);
>      r = blk_set_aio_context(s->conf->conf.blk, s->ctx, &local_err);
> +    aio_context_release(s->ctx);
>      if (r < 0) {
>          error_report_err(local_err);
>          goto fail_guest_notifiers;
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


