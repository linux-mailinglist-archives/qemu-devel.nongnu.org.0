Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE564BA40D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 16:13:38 +0100 (CET)
Received: from localhost ([::1]:59714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKiTP-00051p-Bb
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 10:13:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nKhmc-00014i-UM
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:29:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nKhmb-0000dt-5d
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645108160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hm7lZ6FLivGjeKMOcEp95JiBlQadkD1hbjwFFpmRED0=;
 b=UAwt6JglW1hBhRDc5ZoCKkaM8HvW/oWtXaV5I9BXaLd2xkwdQrh94P9/QJEHHKTRtuni1N
 gVCFEjL6D7NWfYSXK8TvTlrefB7byDoJBhRadJy+yOuhEGe6uy+X7HoMnP7FVyyrts9PvC
 +k9MWeXbSy7x/YOHY9+dsnj/RgNatpg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-rn9vQD80Nx2OpWQaStbQBQ-1; Thu, 17 Feb 2022 09:29:17 -0500
X-MC-Unique: rn9vQD80Nx2OpWQaStbQBQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 c8-20020a0ce7c8000000b0042c12357076so5470700qvo.6
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 06:29:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hm7lZ6FLivGjeKMOcEp95JiBlQadkD1hbjwFFpmRED0=;
 b=5PpE1n/HFXFNXvSAei+bpoqw25W4ITfWpXofvnm4rwgW1dFfM9Al9sgUnaeMbqe5P6
 rb4oFkiv0lmOeYE0M/ZHt3lSPXob2n/fK+54AlsTXAnnerruVdrVjabuozj3sDikpcCF
 2SpNpDxHqk+XH0SQe0GHXpWIK5k80mVm37zBvxHHRrkp2R/NsLTOfVOx709JAgSKOBI6
 d+NG16QXNU5lSFk09cElqvEc45cWr42nHMlikXQdMO5w2S0ZvolayYqssd0q54u6W9r8
 V/2Q+ytQn7+1EUuJsPecFJH7Ydp/2SomzckudHq5T0W3KIqUIflXWTypwn09iy1E86WS
 dMiw==
X-Gm-Message-State: AOAM531HKINF//irCFDLK11fDSQmen9OiEpblpFPKaj5csqEEtMteY08
 7Uq5UzlZT1gOnZRWJQBeQyjiiyunQpudIcb5vR4HO1TgqILFWk/yUnMu6RnyPQDE9StX3kqVtOJ
 3OYovrpY0kbtqOVg=
X-Received: by 2002:ac8:5a03:0:b0:2d7:f146:1599 with SMTP id
 n3-20020ac85a03000000b002d7f1461599mr2592317qta.71.1645108157082; 
 Thu, 17 Feb 2022 06:29:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxG10TNziVcGEMjLf5cYVSbo5ExYHGQXuLWCbSe/eYHoJrGOqQdxd7LQ+H5CaRgeea4QvKSEw==
X-Received: by 2002:ac8:5a03:0:b0:2d7:f146:1599 with SMTP id
 n3-20020ac85a03000000b002d7f1461599mr2592300qta.71.1645108156860; 
 Thu, 17 Feb 2022 06:29:16 -0800 (PST)
Received: from sgarzare-redhat (host-95-248-229-156.retail.telecomitalia.it.
 [95.248.229.156])
 by smtp.gmail.com with ESMTPSA id 5sm23670112qtp.81.2022.02.17.06.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 06:29:16 -0800 (PST)
Date: Thu, 17 Feb 2022 15:29:10 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gautam.dawar@xilinx.com>, eperezma@redhat.com
Subject: Re: [PATCH 2/2] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa
 devices
Message-ID: <20220217142910.eovyddvvpxkvzchf@sgarzare-redhat>
References: <20220215072231.2498-1-gdawar@xilinx.com>
 <20220215072231.2498-3-gdawar@xilinx.com>
 <20220217023150-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220217023150-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, gdawar@xilinx.com,
 martinh@xilinx.com, hanand@xilinx.com, tanujk@xilinx.com, pabloc@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 02:32:48AM -0500, Michael S. Tsirkin wrote:
>On Tue, Feb 15, 2022 at 12:52:31PM +0530, Gautam Dawar wrote:
>> This patch adds the ability to negotiate VIRTIO_F_IN_ORDER bit
>> for vhost-vdpa backend when the underlying device supports this
>> feature.
>> This would aid in reaping performance benefits with HW devices
>> that implement this feature. At the same time, it shouldn't have
>> any negative impact as vhost-vdpa backend doesn't involve any
>> userspace virtqueue operations.
>>
>> Signed-off-by: Gautam Dawar <gdawar@xilinx.com>
>
>Having features that hardware implements but qemu does not
>means we can't migrate between them.
>So I'd rather see a userspace implementation.

FYI Jason proposed to support VIRTIO_F_IN_ORDER in QEMU/Linux as an idea 
for the next GSoC/Outreachy. I offered to mentor and prepared a project 
description [1], if anyone else is interested, it would be great to have 
a co-mentor :-)

Thanks,
Stefano

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg04032.html


