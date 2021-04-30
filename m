Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B2E36F83C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:57:19 +0200 (CEST)
Received: from localhost ([::1]:56762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcPte-0000h3-3F
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcPrr-0008K3-Dt
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:55:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcPrm-0003GK-1S
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:55:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619776520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cQeIoq8fqcfo5LdSPtK3qpQlVaLchG9Cqurk9RdlWaw=;
 b=FftgqWP2u8CY+lzz0Gvq5n+KzPIXvsEsODZksrRYvTLJ+HTYq/oEJu5r5kh6F4lmCEgtod
 gkdz+eGdufF+YGcOlCBD+a3ru2ao0AXi5F6jxk25re3oMSn5PsNFGjPscuYCgc4PGSkRL6
 Rq4B3AWxb794vLGPwz6j+gLVVT4RfjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-j9orgGkKOwilfERsk7O2TQ-1; Fri, 30 Apr 2021 05:55:16 -0400
X-MC-Unique: j9orgGkKOwilfERsk7O2TQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C13C06D249;
 Fri, 30 Apr 2021 09:55:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEA7C579B1;
 Fri, 30 Apr 2021 09:55:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5D39D1800380; Fri, 30 Apr 2021 11:55:10 +0200 (CEST)
Date: Fri, 30 Apr 2021 11:55:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: [RFC PATCH 09/27] virtio-snd: Add code for set config function
Message-ID: <20210430095510.izkmd6wykiquxpap@sirius.home.kraxel.org>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
 <20210429120445.694420-10-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210429120445.694420-10-chouhan.shreyansh2702@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 05:34:27PM +0530, Shreyansh Chouhan wrote:
> Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
> ---
>  hw/audio/virtio-snd.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
> index afa38adee7..edaeffd6b7 100644
> --- a/hw/audio/virtio-snd.c
> +++ b/hw/audio/virtio-snd.c
> @@ -54,6 +54,14 @@ static void virtio_snd_get_config(VirtIODevice *vdev, uint8_t *config)
>  
>  static void virtio_snd_set_config(VirtIODevice *vdev, const uint8_t *config)
>  {
> +    VirtIOSound *s = VIRTIO_SOUND(vdev);
> +    virtio_snd_config sndcfg;
> +
> +    memcpy(&sndcfg, config, sizeof(virtio_snd_config));
> +
> +    memcpy(&s->snd_conf.jacks, &sndcfg.jacks, sizeof(uint32_t));
> +    memcpy(&s->snd_conf.streams, &sndcfg.streams, sizeof(uint32_t));
> +    memcpy(&s->snd_conf.chmaps, &sndcfg.streams, sizeof(uint32_t));

This is static device information for the driver, the driver should not
be able to change those.  I think you can simply leave the set_config
empty (i.e. just drop this patch).

take care,
  Gerd


