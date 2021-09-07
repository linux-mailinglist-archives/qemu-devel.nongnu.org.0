Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D179D402A64
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:06:46 +0200 (CEST)
Received: from localhost ([::1]:52786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbkL-0003FD-IF
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mNbU7-0000Mf-Ji
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:49:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mNbTv-0007Z2-Ax
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631022586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+TT60mU1UHBWUHTjsoW1slZoRRUdhEmWsJvB3c4ln9U=;
 b=apUwhwrpaktQ4x1YYTpi1IrOYn7QXAmE6eZBvj8bRxvzlwzqKI32TJL7nPywttXvgXzEFn
 uv1/Qxko5ajaPpgFS6zrokx7Z91P5TkQcZNByG4tmX9L87TLsCrmYG7+UOQ5dm9lcZcipE
 Haj1acLitSA8DbVn9jl79ysCIhf1lbI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-JhsEvELVP0G5LPP9tlAh2Q-1; Tue, 07 Sep 2021 09:49:45 -0400
X-MC-Unique: JhsEvELVP0G5LPP9tlAh2Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 y19-20020a056402441300b003cd8ce2b987so5321332eda.6
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 06:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+TT60mU1UHBWUHTjsoW1slZoRRUdhEmWsJvB3c4ln9U=;
 b=jW8XJ7Djy29w/PYw7cYpJK7QHi0aWDZhaSdBxxrd6bRpSZrv8kn14h/utc7io5S4+Y
 qZhMCHhd/A9mVocSEeqCjS30DybGPBQznuek9EsVB1Iqi8Y9D0IUmX+f1DXe9Pre5Mgd
 oU4cex4liJWE5abUeyt+SclPbCU4ysiQNku6yPLWQSHVBGpCeuSJq6zfZEDY4+H/14em
 O/+AtxyGa4AO/LVaNzdxQJLIQ783eVLw2BzqvYB/UIX3QGN6rx8xT91ddvtVuDCC9ze1
 FDKzMuaPrA8bge+o8yGe8ZyboqIIcyTNGQhBXKfS4mTpbgK5VrQqYCz/EhqDOdUJTIO3
 EbHw==
X-Gm-Message-State: AOAM530wbAX8u69Jl6INbjw7yLO85grMrPLem2hLDjGxHoOcmP3wZlEL
 TXZXx65mgIO58hpyKrVs5Zy2y/g4qg3EyFy6FDn/mG+buj2A8imZRJCjh11ZkeSPBfv0P6jXg63
 g/e2148SZBfSBG+g=
X-Received: by 2002:aa7:d710:: with SMTP id t16mr18248264edq.42.1631022584388; 
 Tue, 07 Sep 2021 06:49:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJorB7/pfvErUPV6LPMs2sCUGsbrA3iTaCrdh1bkb6ko1/UkJV4AS4YUUvUR9UaUIufCSlcg==
X-Received: by 2002:aa7:d710:: with SMTP id t16mr18248241edq.42.1631022584213; 
 Tue, 07 Sep 2021 06:49:44 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id bm14sm6610774edb.71.2021.09.07.06.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 06:49:43 -0700 (PDT)
Date: Tue, 7 Sep 2021 15:49:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 0/3] hw/virtio: Minor housekeeping patches
Message-ID: <20210907134941.aqd7jmbk242xhnq5@steredhat>
References: <20210906104318.1569967-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210906104318.1569967-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 06, 2021 at 12:43:15PM +0200, Philippe Mathieu-Daudé wrote:
>Hi,
>
>This series contains few patches I gathered while tooking notes
>trying to understand issues #300-#302.
>
>Since v2:
>- Rebased on top of 88afdc92b64 ("Merge 'remotes/mst/tags/for_upstream' into staging")
>
>Since v1:
>- Added virtqueue_flush comment (Stefano)
>- Call RCU_READ_LOCK_GUARD in virtqueue_packed_drop_all (Stefano)
>
>Philippe Mathieu-Daudé (3):
>  hw/virtio: Comment virtqueue_flush() must be called with RCU read lock
>  hw/virtio: Acquire RCU read lock in virtqueue_packed_drop_all()
>  hw/virtio: Have virtqueue_get_avail_bytes() pass caches arg to callees
>
> include/hw/virtio/virtio.h |  7 +++++++
> hw/virtio/virtio.c         | 32 +++++++++++++++-----------------
> 2 files changed, 22 insertions(+), 17 deletions(-)
>
>-- 
>2.31.1
>
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


