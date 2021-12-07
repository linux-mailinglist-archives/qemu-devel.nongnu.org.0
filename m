Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7694E46B378
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 08:13:26 +0100 (CET)
Received: from localhost ([::1]:57358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muUfE-0008Up-V6
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 02:13:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muUdF-0007lE-Tl
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:11:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muUdB-0001Ib-9h
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638861075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eSAhAl+PTPQaqlESCQwU64lqQsAy+17P1Z59RmD/dGI=;
 b=YnI0t8J5Z+pcoxVMAomK6+0aZVw4CDt/GJkco6VC9tYecXeCQ0nF/202ywzJ3croo8dzZB
 18sArlU9yU6dPr7Jn9LrRcVPXGagHyv9CNouJb41lBelvSwb/OeuwNaejLuPHsjAvsGm6H
 cBv2cmQNhPe1rVr1M/npY0w1033Z6CQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-0BIaByjEPHGRTiEQMjSPiA-1; Tue, 07 Dec 2021 02:11:14 -0500
X-MC-Unique: 0BIaByjEPHGRTiEQMjSPiA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j71-20020a1c234a000000b00342f418ae7cso804955wmj.1
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 23:11:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eSAhAl+PTPQaqlESCQwU64lqQsAy+17P1Z59RmD/dGI=;
 b=bdIpcaCwZEhsgijeUjsrvaEaN973tycVxvIZFoCO+ILSontoR3REPx7xz54U2TGWGX
 T7sebZI5wZyMi2sGXXnNjez03oD+PZavt7UZ+UNrwMEKbbtOQ0lY9M6OGUNES/yXjtGi
 +Cu0GtFNcJlmI0zYHAMTMbvKqvXRTGAzEy37guoY1q0KiMEsp1uSs6YR19y+F7dl6lDn
 miEt0IJJ9TPOcjxpOj5/LNgaeKvjFrYzWQJzX41tlZLpAn7WmxlqyocJL8RHcBrhsuyX
 3I+ZX2R2FYO2ov1/oXSvT1IJEC/f1Rz7nuZ/5oauvJGQUg2GJgl1D7utT4kN3r9VKC3v
 cXqw==
X-Gm-Message-State: AOAM532DBnk2ZOrxZjYRtOFq9OZ4FsmOiTiy3hV34+jmMx28V07h2kcy
 dj7Zam73IWnEqab08Kg/qVgcJRdtm98IDhV4gmyjy007ZshGLFtAjw4flWfZmYl0Oh3RWF+thnD
 klAOLBCIbvrtjkts=
X-Received: by 2002:a1c:ed18:: with SMTP id l24mr4843974wmh.99.1638861072825; 
 Mon, 06 Dec 2021 23:11:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2DlYmDzmEZntyx0WDeGycn8x/nr33zRJ6OsA6tVxr1uAUB890fFu7BD2Gj4ruKjSGui/zKQ==
X-Received: by 2002:a1c:ed18:: with SMTP id l24mr4843938wmh.99.1638861072498; 
 Mon, 06 Dec 2021 23:11:12 -0800 (PST)
Received: from xz-m1.local ([85.203.46.174])
 by smtp.gmail.com with ESMTPSA id l4sm13167426wrv.94.2021.12.06.23.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 23:11:11 -0800 (PST)
Date: Tue, 7 Dec 2021 15:11:06 +0800
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 18/23] multifd: Use normal pages array on the recv side
Message-ID: <Ya8JCq/cRmcL9Kp7@xz-m1.local>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-19-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-19-quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 11:06:12AM +0100, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.h      |  8 +++++--
>  migration/multifd-zlib.c |  8 +++----
>  migration/multifd-zstd.c |  6 +++---
>  migration/multifd.c      | 45 ++++++++++++++++++----------------------
>  4 files changed, 33 insertions(+), 34 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 78e73df3ec..9fbcb7bb9a 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -151,12 +151,16 @@ typedef struct {
>      uint32_t next_packet_size;
>      /* packets sent through this channel */
>      uint64_t num_packets;
> -    /* pages sent through this channel */
> -    uint64_t num_pages;
> +    /* non zero pages sent through this channel */

s/send/recv/

> +    uint64_t num_normal_pages;

How about renaming it to "total_normal_pages"?  It's merely impossible to
identify this from normal_num below from their names..

I'd have the same comment to previous patch.

Thanks,

>      /* syncs main thread and channels */
>      QemuSemaphore sem_sync;
>      /* buffers to recv */
>      struct iovec *iov;
> +    /* Pages that are not zero */
> +    ram_addr_t *normal;
> +    /* num of non zero pages */
> +    uint32_t normal_num;
>      /* used for de-compression methods */
>      void *data;
>  } MultiFDRecvParams;

-- 
Peter Xu


