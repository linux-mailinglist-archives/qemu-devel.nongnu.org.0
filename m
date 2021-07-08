Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255963C19FF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:42:25 +0200 (CEST)
Received: from localhost ([::1]:55774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Zui-0005yu-4d
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m1ZQV-0005h0-0m
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:11:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m1ZQS-0005L6-Uv
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625771468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rbuj/vzzr6LItLMzw3GCLlHAoV8ZIi9r+YYdVI1LtQE=;
 b=CzucVY3tOtH0o3jugxE58Ity2shON4JWYcPUXSDdwv4UZgR5DwraN1V1hTcpHx7hFxU1/Z
 ni9/XbtdP4Y54aP/OTgRc8HWlI2QMZ/2k1zWSN6aJfLwy+phZFeSpf++8TiyH/AFRgX75B
 bidj3c3eYdDkSqz1RrULpjMXz4M99LA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-GauAH9KzME6WIpZ3XMw0Gg-1; Thu, 08 Jul 2021 15:11:07 -0400
X-MC-Unique: GauAH9KzME6WIpZ3XMw0Gg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n37-20020a05600c3ba5b02901fe49ba3bd0so2809946wms.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Rbuj/vzzr6LItLMzw3GCLlHAoV8ZIi9r+YYdVI1LtQE=;
 b=YrohLd/4/BJor8c4VpITe0Iwn7Z+kKF5rYLzHBwSR+1Z/imX0xjRKSNkBKRKvf6+46
 DOHgR/8LTN6n6ihHly2pAXFPyZlpY5aXBaG2sHCPyvbWff5Lh7vIpnSCAXNMBoSd/rzU
 24QHxTQQEp7MLdnm84tIIUjcN91F0951B/1iOIwkA/9sxCd6qjrbbfjRNgURfF3H4QZ4
 wgg7tL4y8bQ1I1Hi+qU4ALoMGfwHJYppoG4ANVM5bsOgRz3MejGzvqhvwyxJsgaGUcjX
 TkjIv8mPLY4Os/9WML3p0iw/9gANQJxf3VDIXmb11XDZQkTbGxpuDyYNxkq8fKo51ZXP
 kKLg==
X-Gm-Message-State: AOAM5327Uq5Bphr1iadrdsOt/Hg3A7al8eZf56vngk7yxT+5xIkd1eXn
 tE/GUbO2HEgBpsDs3mSSKgT12v4ILkRnFqX5Zkn6VtXMXjYzppt0BX8jaBLPyGDtwZnkPVX0Hse
 d1+g2DR3u5UnbteQ=
X-Received: by 2002:a5d:5701:: with SMTP id a1mr36258836wrv.216.1625771465416; 
 Thu, 08 Jul 2021 12:11:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY0ZVN92gPkr/dyOckTeRN/wSwOrxZcwXzkbvwVgcPHgTid8HaKnJcvuzFhRDbCxt+hfT1Gg==
X-Received: by 2002:a5d:5701:: with SMTP id a1mr36258822wrv.216.1625771465267; 
 Thu, 08 Jul 2021 12:11:05 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id x1sm2843676wmc.31.2021.07.08.12.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:11:04 -0700 (PDT)
Date: Thu, 8 Jul 2021 20:11:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH] migration/rdma: prevent from double free the same mr
Message-ID: <YOdNxqhcWi6sHoRn@work-vm>
References: <20210708144521.1959614-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210708144521.1959614-1-lizhijian@cn.fujitsu.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Li Zhijian (lizhijian@cn.fujitsu.com) wrote:
> backtrace:
> '0x00007ffff5f44ec2 in __ibv_dereg_mr_1_1 (mr=0x7fff1007d390) at /home/lizhijian/rdma-core/libibverbs/verbs.c:478
> 478             void *addr              = mr->addr;

ANy idea why it deletes the same mr twice?
What was your commandline?

Dave

> (gdb) bt
>  #0  0x00007ffff5f44ec2 in __ibv_dereg_mr_1_1 (mr=0x7fff1007d390) at /home/lizhijian/rdma-core/libibverbs/verbs.c:478
>  #1  0x0000555555891fcc in rdma_delete_block (block=<optimized out>, rdma=0x7fff38176010) at ../migration/rdma.c:691
>  #2  qemu_rdma_cleanup (rdma=0x7fff38176010) at ../migration/rdma.c:2365
>  #3  0x00005555558925b0 in qio_channel_rdma_close_rcu (rcu=0x555556b8b6c0) at ../migration/rdma.c:3073
>  #4  0x0000555555d652a3 in call_rcu_thread (opaque=opaque@entry=0x0) at ../util/rcu.c:281
>  #5  0x0000555555d5edf9 in qemu_thread_start (args=0x7fffe88bb4d0) at ../util/qemu-thread-posix.c:541
>  #6  0x00007ffff54c73f9 in start_thread () at /lib64/libpthread.so.0
>  #7  0x00007ffff53f3b03 in clone () at /lib64/libc.so.6 '
> 
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> ---
>  migration/rdma.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index b6cc4bef4a8..0f22b8227c0 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -1143,6 +1143,7 @@ static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
>  
>      for (i--; i >= 0; i--) {
>          ibv_dereg_mr(local->block[i].mr);
> +        local->block[i].mr = NULL;
>          rdma->total_registrations--;
>      }
>  
> -- 
> 2.30.2
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


