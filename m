Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A26595250A1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 16:52:12 +0200 (CEST)
Received: from localhost ([::1]:56418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npAAk-00060j-J4
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 10:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1npA7z-0004Oy-Cf
 for qemu-devel@nongnu.org; Thu, 12 May 2022 10:49:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1npA7w-0004V4-Bz
 for qemu-devel@nongnu.org; Thu, 12 May 2022 10:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652366954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u5BVg7vGNdzBX++l3mdiW4RA5vg07rGIniZUQyJTeuQ=;
 b=WEfd38AvxCNmXaqZDdMmIC++l7LlWwC9mP3EZOQ60MgmBueJSVtFrjY9GANPTSpmW3GhCG
 lZGzhxmS9V1nA/THDVeP/2amM/j+EOHfvUo2OAsSv8g8bHqSDGpRgIJGKeAoU7il2JfM4u
 EOpDZpjGEqOItZNPUEvg/O6RBotvbrI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-D5xTgLTHM8mq27fTY9ZahA-1; Thu, 12 May 2022 10:49:13 -0400
X-MC-Unique: D5xTgLTHM8mq27fTY9ZahA-1
Received: by mail-qv1-f70.google.com with SMTP id
 m6-20020a0562141bc600b0045a8357224aso4656681qvc.12
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 07:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u5BVg7vGNdzBX++l3mdiW4RA5vg07rGIniZUQyJTeuQ=;
 b=0WnYmpbrbAjOSn/FJtsvIcaNRJGrsms8BZsGoRGdqum08WiMe7HiTT9tB8erHsZrU/
 Hjbi1kaiXV812HkQnjGxy01TSHUt3vjNDxCC+UBxIKvJrSdz7kAfkJs0i5ZmSMnxBT+G
 fgQ0d6k+B75TtiED4Un/4qqsGeW2YSQ6FMu2HiQARbPdhvwxgjuqwSsWOs+Y7tat5Tj5
 RQX1KOXSnbX+iNfvxS8ORvC0tkQPPhlAD1VLV1sow7ay6aCL+tvDyTFh8R/0DUCismWL
 YCwKjdgjODHsH6cKJG1iPafaKAZ/85cvCCHFo3WF9jDAMu46t5U9t2j6HMpVhh+Mc75V
 u38g==
X-Gm-Message-State: AOAM532VD8Z5D6hLXWjvUUtH+eIlKxj0sS95rSwI37YCqoMZWYJe8nHT
 uo2oRZsQ4YO0q1+6zwmBBdB32XUkC+ba9E235q2Zpe0UnW/tCzVl8hzJh+gq6A7cIsDtvFq4dDg
 7nPSyu6II7+fczPg=
X-Received: by 2002:ac8:7c49:0:b0:2f3:db67:25d4 with SMTP id
 o9-20020ac87c49000000b002f3db6725d4mr110560qtv.336.1652366952290; 
 Thu, 12 May 2022 07:49:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFWxpT27t9DsDgW5QQF6yIR1FMwiW7ETDeDdY1TAHuNCE1uRXktUUnlFHzOPXLJkR65topQg==
X-Received: by 2002:ac8:7c49:0:b0:2f3:db67:25d4 with SMTP id
 o9-20020ac87c49000000b002f3db6725d4mr110536qtv.336.1652366952052; 
 Thu, 12 May 2022 07:49:12 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-106.retail.telecomitalia.it.
 [87.11.6.106]) by smtp.gmail.com with ESMTPSA id
 d22-20020a05620a241600b006a054356d60sm3314714qkn.43.2022.05.12.07.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 07:49:11 -0700 (PDT)
Date: Thu, 12 May 2022 16:49:06 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, mst@redhat.com, jasowang@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 4/4] vdpa: add vdpa-dev-pci support
Message-ID: <20220512144906.hxtmuws46id34u4v@sgarzare-redhat>
References: <20220512062103.1875-1-longpeng2@huawei.com>
 <20220512062103.1875-5-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220512062103.1875-5-longpeng2@huawei.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 12, 2022 at 02:21:03PM +0800, Longpeng(Mike) wrote:
>From: Longpeng <longpeng2@huawei.com>
>
>Supports vdpa-dev-pci, we can use the device as follow:
>
>-device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-X
>
>Signed-off-by: Longpeng <longpeng2@huawei.com>
>---
> hw/virtio/meson.build    |   1 +
> hw/virtio/vdpa-dev-pci.c | 101 +++++++++++++++++++++++++++++++++++++++
> 2 files changed, 102 insertions(+)
> create mode 100644 hw/virtio/vdpa-dev-pci.c

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


