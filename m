Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35626431327
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:18:41 +0200 (CEST)
Received: from localhost ([::1]:40748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcOn2-0002SC-Am
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mcOk8-0000sg-E4
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:15:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mcOk4-0001dj-6q
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634548532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xcdENWysQqYYvUn/ltLBtYWjzhYGiS7h1lmtIvy4W3o=;
 b=Z5ven1SD2Nrh7usKB/50HmVHpqPH6VBciMaLA8zj+CPbsCFhzV1jkx7CExj5u6X84wV0cE
 3TmDB2GoqTxgRVTXvP3LYa4gcGHETBbTzuQM+/uw++UqO8Gr0KydLFI8iXkMMKxukaHZkr
 Tx/Mk2XnbQILpgfR8QkmVvO8OjbpMIE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-qqj7GB8hOOadXKKHNBKxyA-1; Mon, 18 Oct 2021 05:15:31 -0400
X-MC-Unique: qqj7GB8hOOadXKKHNBKxyA-1
Received: by mail-ed1-f70.google.com with SMTP id
 p20-20020a50cd94000000b003db23619472so13793501edi.19
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 02:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xcdENWysQqYYvUn/ltLBtYWjzhYGiS7h1lmtIvy4W3o=;
 b=1S895rkjnWFVQKhOZHhzCm+GdKU5kLfhmoPgMNX6KBksilv8mOjV4gcxnOg48fCw8F
 muooH0bVBeUcJOqOOMa9hPxhhIb5rYl3kg571wI1P34Zi7A/GTjHMCRdT559+B4XsLVO
 seteYq1lMHekxK56QCZdaGBxP4UgTvANOVG/VrE78HR68zXcs2ulxpFlRASP/WppP7aB
 mQ4Nd1H4FjxLSYKhf0bV+K66JL06q2mUTHTHt3HA+FnNUN/NdpUU5wPMZf51BuYpvjnu
 h5RTu0R1HG2PLWfnDhYhLdS+eFYx8wo5H/84x6G8R/e27nHr2JI8ov/rCLBVYv5hx6lS
 j43w==
X-Gm-Message-State: AOAM531npPqC+rbBzfAsJaUGFhbkqa+ZbWJ3XtQ4lRNqfvTOOaq7BqRU
 2An+2gx0e0fRXCoyM9s3XSNhlRuM9TO0HzTYo1YFXfy354v8v7UFoYN/kNUfgkE533ETFW7+nK0
 KA+S83P9Qv5QN+ak=
X-Received: by 2002:a17:906:4ed9:: with SMTP id
 i25mr28743873ejv.228.1634548530500; 
 Mon, 18 Oct 2021 02:15:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPmR1oxG9vkjlbau/0XVz9OzNNHaFQkgFz5KaQWDoYJwt6PRiKPg0FuUx5TmYbApQq9XISug==
X-Received: by 2002:a17:906:4ed9:: with SMTP id
 i25mr28743847ejv.228.1634548530303; 
 Mon, 18 Oct 2021 02:15:30 -0700 (PDT)
Received: from steredhat (host-79-34-250-211.business.telecomitalia.it.
 [79.34.250.211])
 by smtp.gmail.com with ESMTPSA id dt4sm8496581ejb.27.2021.10.18.02.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 02:15:29 -0700 (PDT)
Date: Mon, 18 Oct 2021 11:15:27 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [PATCH v4 1/3] vdpa: Skip protected ram IOMMU mappings
Message-ID: <20211018091527.ppfrp5c7jl3kfur6@steredhat>
References: <20211014141236.923287-1-eperezma@redhat.com>
 <20211014141236.923287-2-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211014141236.923287-2-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 14, 2021 at 04:12:34PM +0200, Eugenio Pérez wrote:
>Following the logic of commit 56918a126ae ("memory: Add RAM_PROTECTED
>flag to skip IOMMU mappings") with VFIO, skip memory sections
>inaccessible via normal mechanisms, including DMA.
>
>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>Acked-by: Jason Wang <jasowang@redhat.com>
>---
> hw/virtio/vhost-vdpa.c | 1 +
> 1 file changed, 1 insertion(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


