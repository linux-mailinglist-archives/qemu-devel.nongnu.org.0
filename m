Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371A343DD25
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 10:47:31 +0200 (CEST)
Received: from localhost ([::1]:36302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg14M-0000Wp-0k
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 04:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mg12I-000833-6R
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 04:45:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mg12G-0005Ro-4i
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 04:45:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635410719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=locjZ8e+FY2xVf9RTD1OkviBQ4w06LFpg0x+QLsyIfA=;
 b=c5qAarvfvd4hzQ43ZYjd6DWapqh4GzVb4yNJn+qboYmbYOzUWYPfVNIC2PMTJkLbKYz5IT
 1XPrVl/cvtslIG+Q4Q36SVUEyOOi6RruvWzvHZbnDZECn9BRx10iIpJbjpH3oygeOr1/4B
 MGj4kmecHCs+jEd09MV0dExKF+9zxNQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-TYECs-_kNYWVHVtCCv8hAw-1; Thu, 28 Oct 2021 04:45:17 -0400
X-MC-Unique: TYECs-_kNYWVHVtCCv8hAw-1
Received: by mail-ed1-f72.google.com with SMTP id
 t1-20020a056402524100b003dd9a419eb5so4915598edd.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 01:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=locjZ8e+FY2xVf9RTD1OkviBQ4w06LFpg0x+QLsyIfA=;
 b=kZz6hublRPZRzAes6smxlWuySvZgz7giQr2N/bVYQEiAr7UhbP+xdbJ0JbHfXSRngh
 6yEuiyUWkQXzvyn4NctvUESDiVHYLngDmiGAD5/MdCHfJJCYgQQNnv5LbaDlD0+nJmft
 HkOmr+JdJ1sFJ4eMX817Fzxwk0EFOqO+HQDc2xVQAgmd6jboYkP+64KwOy7LN4YijHn5
 9znook51bWAeeDBFloD6ZeK3RV4XHlaISP889AOQnxO/dDracmOWTScLxuv4h0i6XmxD
 twpOkxY2sQdWTlyQHE3Kji/BBSOiYBRzhlg1ZTCo3l/JOPu/YCKBBg6MFz8VETqBzP1O
 S/sw==
X-Gm-Message-State: AOAM530k0DrN1C4JZm35m97dYRb8aLV+hUf/+ZIOpwQak6jisRVgJow4
 X3TD0vMq9XUHJUP8UM8F/geE90w/W3SEdjOB7u4Yx4MQXEe0EdwEp0Klwa1t93Zp0R6aGmBOJZc
 hf0j5//8hyEB2l0k=
X-Received: by 2002:a17:906:3acc:: with SMTP id
 z12mr3664644ejd.215.1635410716508; 
 Thu, 28 Oct 2021 01:45:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmXyjDGF+tIXjDeV5OqTjww7KsNxFEC1sjeeOK54KFS4eseAN0nZQREekmQahGLSjgyPih+g==
X-Received: by 2002:a17:906:3acc:: with SMTP id
 z12mr3664624ejd.215.1635410716340; 
 Thu, 28 Oct 2021 01:45:16 -0700 (PDT)
Received: from steredhat (host-79-30-88-77.retail.telecomitalia.it.
 [79.30.88.77])
 by smtp.gmail.com with ESMTPSA id y26sm1260673edv.88.2021.10.28.01.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 01:45:16 -0700 (PDT)
Date: Thu, 28 Oct 2021 10:45:14 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] vhost-vdpa: Set discarding of RAM broken when
 initializing the backend
Message-ID: <20211028084514.2rbedjsgd3flrfpa@steredhat>
References: <20211027130324.59791-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211027130324.59791-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Cindy Lu <lulu@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 03:03:24PM +0200, David Hildenbrand wrote:
>Similar to VFIO, vDPA will go ahead an map+pin all guest memory. Memory
>that used to be discarded will get re-populated and if we
>discard+re-access memory after mapping+pinning, the pages mapped into the
>vDPA IOMMU will go out of sync with the actual pages mapped into the user
>space page tables.
>
>Set discarding of RAM broken such that:
>- virtio-mem and vhost-vdpa run mutually exclusive
>- virtio-balloon is inhibited and no memory discards will get issued
>
>In the future, we might be able to support coordinated discarding of RAM
>as used by virtio-mem and already supported by vfio via the
>RamDiscardManager.
>
>Acked-by: Jason Wang <jasowang@redhat.com>
>Cc: Jason Wang <jasowang@redhat.com>
>Cc: Michael S. Tsirkin <mst@redhat.com>
>Cc: Cindy Lu <lulu@redhat.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>
>---
>
>Unfortuantely, v1 never got picked up no matter how "hard" I tried to
>ping :)
>
>v1 -> v2:
>- Add ack from Jason
>- Extend patch description now that RamDiscardManager is upstream.
>
>---
> hw/virtio/vhost-vdpa.c | 13 +++++++++++++
> 1 file changed, 13 insertions(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


