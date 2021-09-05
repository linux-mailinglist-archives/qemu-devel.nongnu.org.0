Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4723240107A
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 17:14:11 +0200 (CEST)
Received: from localhost ([::1]:50124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMtqT-000610-PL
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 11:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMtpN-0005Kx-PD
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 11:13:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMtpJ-0000Sd-Ms
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 11:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630854776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ReQvU9NvDkPM2xLIyZsUxSh30ulGJoWpjU+8wEYq9x0=;
 b=eKDj0pj2v+boik7SYQtsnjhnJi0IHXah1SPz9B/iz0ZG+xIaDEsjDQEqbjW6vztplFvS0J
 bSihZmjjQsLhHUnsAvcUxGQj3Wazfvs+lBjGEOizcdKbCPeWPUCA/Qd4Ksr2TXBweR+HOY
 QbvhlqIodlLI+488/KY4gWURVRECv0U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-JckuRCbjOvmJiyMiTkwngw-1; Sun, 05 Sep 2021 11:12:54 -0400
X-MC-Unique: JckuRCbjOvmJiyMiTkwngw-1
Received: by mail-ed1-f72.google.com with SMTP id
 y11-20020aa7d50b000000b003ca1ef38cf3so2413485edq.7
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 08:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ReQvU9NvDkPM2xLIyZsUxSh30ulGJoWpjU+8wEYq9x0=;
 b=TBPdHnV1CJEi1JrwEfCbExKP60aSHtpL66Zeazub2/N6fFJWoqfX/zEYppH2CauTnL
 iax5Y+KBoA2APofCmNcf/sOZnegmh3gQ6xRe2KC19+IlJGFCFx7ZwQyxwd6XsOL5z+/1
 QbT4VkFvWTVqeLEYTU0yqz3ZXywza+/ZPORIjChEn6e7+3/12c+LHlmjCgBQE9mPX16W
 ZeSEHmF4sQEUF4amsfXUDwpQXoVINgnZG82e0LiZXO5iz7ErdOhhrrYY/KUmEEj9Y7nY
 EmPNRK/WQlzV4KLqtEV8hmCbjAGUk2cY1lhtsgWoLeSll30r2UAAZdp94Q1/WGJd305B
 JosQ==
X-Gm-Message-State: AOAM532JZSazbIXWbg88swcaZLW5ekHlznuVobnaT8g9r5QVxZ2k3B6a
 BfWV3bqNvXkprg/iha2QI09yfKwLD8UqYgmrIKkx3yV8cGc4Jl/b3CoDwhRzqnFWmGSKjTHVFlG
 NRPgtljneyqMpzFA=
X-Received: by 2002:a05:6402:1c1e:: with SMTP id
 ck30mr8900623edb.103.1630854773811; 
 Sun, 05 Sep 2021 08:12:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKRvdfUwyTPlc2UPAOraiYLh0Q+G45YBix9KZmpZ7FjYAFnyoR9zAy6amWvpO0Ug+FuS3lCQ==
X-Received: by 2002:a05:6402:1c1e:: with SMTP id
 ck30mr8900614edb.103.1630854773651; 
 Sun, 05 Sep 2021 08:12:53 -0700 (PDT)
Received: from redhat.com ([2.55.131.183])
 by smtp.gmail.com with ESMTPSA id f10sm2463303ejc.51.2021.09.05.08.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 08:12:52 -0700 (PDT)
Date: Sun, 5 Sep 2021 11:12:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 0/5] hw/virtio: Minor housekeeping patches
Message-ID: <20210905111225-mutt-send-email-mst@kernel.org>
References: <20210902165039.432786-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210902165039.432786-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 06:50:34PM +0200, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series contains few patches I gathered while tooking notes
> trying to understand issues #300-#302.

v1 was includes in my pull request already, pls send
incremental patches on top. Thanks!

> Since v1:
> - Added virtqueue_flush comment (Stefano)
> - Call RCU_READ_LOCK_GUARD in virtqueue_packed_drop_all (Stefano)
> 
> Philippe Mathieu-Daudé (5):
>   hw/virtio: Document virtio_queue_packed_empty_rcu is called within RCU
>   hw/virtio: Comment virtqueue_flush() must be called with RCU read lock
>   hw/virtio: Remove NULL check in virtio_free_region_cache()
>   hw/virtio: Acquire RCU read lock in virtqueue_packed_drop_all()
>   hw/virtio: Have virtqueue_get_avail_bytes() pass caches arg to callees
> 
>  include/hw/virtio/virtio.h |  7 +++++++
>  hw/virtio/virtio.c         | 39 ++++++++++++++++++--------------------
>  2 files changed, 25 insertions(+), 21 deletions(-)
> 
> -- 
> 2.31.1
> 


