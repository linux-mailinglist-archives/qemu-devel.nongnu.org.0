Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C6D49B12D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:17:05 +0100 (CET)
Received: from localhost ([::1]:43356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCIsq-0000fB-4W
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:17:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nCIm0-0002ly-8D
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:10:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nCIlx-0002IO-3F
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:09:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643105395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=985VZGXzb4sT+QUr+/BQUS/xmGLqY/HEDJ0RF84MuGA=;
 b=YIJsGkjNDOakDAIthx31nqdMon7xxocgTAeHP/txI6X8XaBhH+6x1MQ2pYCyRrF2nVVWx4
 YXyHFwYFj7BMLnmNRltHgA367GV0WnPTCm6jwLkTgEF+YyzTq3MXnxjOGzf7ChiPRkbv5V
 422nAPB5ZZfiQuN4SDLFvKqpeykomHM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-HuFViVgeNUqxE8vy-K-OiA-1; Tue, 25 Jan 2022 05:09:54 -0500
X-MC-Unique: HuFViVgeNUqxE8vy-K-OiA-1
Received: by mail-wm1-f70.google.com with SMTP id
 l20-20020a05600c1d1400b0034c29cad547so1014489wms.2
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 02:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=985VZGXzb4sT+QUr+/BQUS/xmGLqY/HEDJ0RF84MuGA=;
 b=OF6YspsCfCXM7i370+uix79MAMWrejUMBiR+BhWaoD4HFdVF8+kldBwJ+htALv9noz
 6oHv9+IQvVp+n7M+4pkNiBQLqetUUNUJM4XBO0zz7wlqIX1HwbUkrENXn3OkKEEFYBvn
 +q84jaFlkTNIWOnJIdhO1qZuLQTWpZLo7o5QvFvtP84+Cn2wADxXyiFlN4V2EgokcUI3
 8obsjrjlhAaP9x3d8pnNn6P507pw5Sb8pXrydMNGxs9nXmU845T0VwbILQ02cAoBpYyD
 F+F67Ojq9MUsHVaicTlFX6t5xY8Q4k9yWnpY7oze2KsENR6FpeKLIeplgpDiBnu8tLIj
 QiAg==
X-Gm-Message-State: AOAM532Uu3xUToCcgRDx/IoNIqA9y68Hwcm+Sm7CqpzAwvyxGO60WgLi
 iyyaGtayY/lnJx9o78svhGElt8vQrKhbedN+d9qxW31V3sBRa491vYPsDw5rZ4DDiIjx45HJEh3
 DjEug7K7hYPtP2Ys=
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr17619623wrz.700.1643105393349; 
 Tue, 25 Jan 2022 02:09:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpFYPioNfbfTfLVU5++MsRZsq4sLDE6Ka7guYjYgR+4BQV2BUKbOgXZmhg0GVK6+wPL+wsng==
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr17619598wrz.700.1643105393096; 
 Tue, 25 Jan 2022 02:09:53 -0800 (PST)
Received: from steredhat ([62.19.185.119])
 by smtp.gmail.com with ESMTPSA id d4sm275863wri.39.2022.01.25.02.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 02:09:52 -0800 (PST)
Date: Tue, 25 Jan 2022 11:09:42 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH V2 for-6.2 0/2] fixes for bdrv_co_block_status
Message-ID: <20220125100942.caiweqllt53szoto@steredhat>
References: <20220113144426.4036493-1-pl@kamp.de>
 <CAOi1vP9r3_aWPdvxWxcivC57f74G418=7esi6xd5ydBeOENmQQ@mail.gmail.com>
 <20220119145735.qkuxqnnfqws7xbme@steredhat>
 <cc75ea76-fbc6-1f88-6d07-09cc65a06d60@kamp.de>
MIME-Version: 1.0
In-Reply-To: <cc75ea76-fbc6-1f88-6d07-09cc65a06d60@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu block <qemu-block@nongnu.org>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 10:19:27AM +0100, Peter Lieven wrote:
>Am 19.01.22 um 15:57 schrieb Stefano Garzarella:
>> On Fri, Jan 14, 2022 at 11:58:40AM +0100, Ilya Dryomov wrote:
>>> On Thu, Jan 13, 2022 at 3:44 PM Peter Lieven <pl@kamp.de> wrote:
>>>>
>>>> V1->V2:
>>>>  Patch 1: Treat a hole just like an unallocated area. [Ilya]
>>>>  Patch 2: Apply workaround only for pre-Quincy librbd versions and
>>>>           ensure default striping and non child images. [Ilya]
>>>>
>>>> Peter Lieven (2):
>>>>   block/rbd: fix handling of holes in .bdrv_co_block_status
>>>>   block/rbd: workaround for ceph issue #53784
>>>>
>>>>  block/rbd.c | 52 +++++++++++++++++++++++++++++++++++++++++++++-------
>>>>  1 file changed, 45 insertions(+), 7 deletions(-)
>>>>
>>>> --
>>>> 2.25.1
>>>>
>>>>
>>>
>>> These patches have both "for-6.2" in the subject and
>>> Cc: qemu-stable@nongnu.org in the description, which is a little
>>> confusing.  Just want to clarify that they should go into master
>>> and be backported to 6.2.
>>
>> Yeah, a bit confusing. These are for 7.0, so @Kevin can these patches go with your tree?
>
>
>Yes, sorry, my fault. It should be 7.0

Don't worry :-)

What about sending a v3 fixing the version tag (I think you can just 
remove for-6.2), the extra space in the comment, and the Fixes tag on 
patch 2?

If you will send v3, remember to report the R-b/T-b tags received in 
this version from me and Ilya.

Thanks,
Stefano


