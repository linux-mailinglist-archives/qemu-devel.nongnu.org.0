Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DCF441114
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 22:48:32 +0100 (CET)
Received: from localhost ([::1]:48486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhIgo-0001Ey-UH
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 17:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhIft-0000WH-DQ
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 17:47:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhIfq-0008Ah-Jc
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 17:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635716849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXovAYmHA1oe1JJIAEz0nS9/LP36HKIDgizKbDLEf08=;
 b=WCP22aMBljdo++yFLKwNvsO3gs4exPMna5tCjDjgKB6F2bccvM794OT8FEUt0OC4rhdYDS
 b6e7kgfV3BgSJHEeR8DZb4wrE8tyXxBkwYXnHhZTmkxbs8Qq1S5XchJsx15PtPKdwH2K9h
 17tf5H3MuxgT3Hc7x/VRpPOa3BC1CXQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-e1a09i5BOoqy699KXu4BEg-1; Sun, 31 Oct 2021 17:47:27 -0400
X-MC-Unique: e1a09i5BOoqy699KXu4BEg-1
Received: by mail-wm1-f69.google.com with SMTP id
 y9-20020a1c7d09000000b003316e18949bso2470891wmc.5
 for <qemu-devel@nongnu.org>; Sun, 31 Oct 2021 14:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LXovAYmHA1oe1JJIAEz0nS9/LP36HKIDgizKbDLEf08=;
 b=eYz38ciQkxY+wGrtJUu/mbsVfiNM8D1QYJt/2hKkezJuzx2UviQ2DbVCnn+sLgDJx7
 b/bpCkV2Vp4yZHkrA1eSlcxlYv93KZerRBNMsd7RMG/zjqmg3qBksNUfbif5NpVgCF9U
 KlkRuVCMqr7G73W2oTipLGNqWJXQ+8TYXDvokgYAdh79H4KfWI2vYoy8WtywkUODUgps
 6AJK2/NQNoOF+706Zv3cRyohYkW5TvZSU7GKZ78cguoscjWOcAdL3J077NAleReu/JT0
 fFrmL09czQAWrXBfEzEvFzBfd7rixnAyOGWIV99Vr6MQZv/0bnSPcKJSEDqer22a6it6
 eA8Q==
X-Gm-Message-State: AOAM533UFxriunrsekquffYSBYNBtrOmMS0KK/ahL2hqikSpZgFvB1m+
 RkgNW2rJZu7o/KjxJdpoSghAaFkmEM6IcbVBKNJrDLnhoRHe3j8JgR/cdv1+6vBR7M4WvXiDNVV
 YunGBa7OQspf1Y1Q=
X-Received: by 2002:a5d:6a89:: with SMTP id s9mr13922850wru.123.1635716846402; 
 Sun, 31 Oct 2021 14:47:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0dbmHtMSwWcu7I6pnOKumjRhY0x+u4BY/4kPc5LD0KGQsODw6Kt5zQbpQh9vRWnvP7D3xzA==
X-Received: by 2002:a5d:6a89:: with SMTP id s9mr13922837wru.123.1635716846230; 
 Sun, 31 Oct 2021 14:47:26 -0700 (PDT)
Received: from redhat.com ([2.55.132.220])
 by smtp.gmail.com with ESMTPSA id h13sm7846685wrx.82.2021.10.31.14.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Oct 2021 14:47:25 -0700 (PDT)
Date: Sun, 31 Oct 2021 17:47:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH] vhost: Fix last queue index of devices with no cvq
Message-ID: <20211031174635-mutt-send-email-mst@kernel.org>
References: <20211029141608.1728855-1-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211029141608.1728855-1-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 29, 2021 at 04:16:08PM +0200, Eugenio Pérez wrote:
> The -1 assumes that all devices with no cvq have an spare vq allocated
> for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This may not be the
> case, and the device may have a pair number of queues.
> 
> To fix this, just resort to the lower even number of queues.
> 
> Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the virtio device")
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  hw/net/vhost_net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 0d888f29a6..edf56a597f 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -330,7 +330,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>      NetClientState *peer;
>  
>      if (!cvq) {
> -        last_index -= 1;
> +        last_index &= ~1ULL;
>      }
>  
>      if (!k->set_guest_notifiers) {

could this code be made clearer?

> -- 
> 2.27.0


