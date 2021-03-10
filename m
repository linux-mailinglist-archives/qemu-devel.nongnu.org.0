Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7118333797
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:43:35 +0100 (CET)
Received: from localhost ([::1]:36506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJuRK-0002wJ-F2
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lJuPT-0002H0-S8
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:41:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lJuPQ-0003gP-K3
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615365692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fz+f9xCzdgrNQHKYQpPfOo00xD3uufzSBmcEzRJMZ7c=;
 b=J3LiUgbMWH0zRiHoPKeeOPdVO9Qsjf7en3dkc2DYwQs3oBTkzNVvG3ZC3fwqt4xM4PFTsH
 i1gArjsZWeeF/S1CPONlfqYfeoHES681HEI/3KEzWxbHDSRfiKebcvknGwJ6TP5Pe7JN8v
 oxYEODsSIMHhsY5rhcNzO2HQKKuNENU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-7LnBcapkP-6WvRfX8ZTn3g-1; Wed, 10 Mar 2021 03:41:30 -0500
X-MC-Unique: 7LnBcapkP-6WvRfX8ZTn3g-1
Received: by mail-wm1-f71.google.com with SMTP id n25so2358136wmk.1
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 00:41:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fz+f9xCzdgrNQHKYQpPfOo00xD3uufzSBmcEzRJMZ7c=;
 b=cMQRTRwGBV49S5MxrbyNT2CkITCmkXeMC1cUDubWCmPnZN9oWu1ne6smXv31X1yvNl
 0g2bHUj0HyEPnY2S4LN2TATs6gedt7ad9x9oUPqc35dTWuR9z2SDSbukPPZnUoxAdNX2
 nmwcNIbuoHzTsb7QdAapJ41LyL+BJapanaDn68aO049pIVxwJbg7zJe7win+BSZbn/0v
 dE78+TAxOO68Ed3eWEzkRh8lFtPFifZMLLRss7RpVu2SEp9snnBo7kZRxS3qMC5T58Vi
 daYNft+IZapWtjk9E3jip70aWs0m8zPTd9Oz1imffO33y4WP96KIcglROCSVcf5u4TqI
 ntZQ==
X-Gm-Message-State: AOAM531W7qKRFTlfhIjipueriXUhDxI/memM6zqNmYoVWfrZ7mJ55jQ0
 7NaXJ38+5bny9IV34V2WUTj0zvbnUvls5DK3jCapUiCYCtKRqgkl50jn/RGnXMnptpcrbEaHZr6
 OdRfGnAtZraWA/QY=
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr2197003wmc.168.1615365689280; 
 Wed, 10 Mar 2021 00:41:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEXlQdW75IJkk7AS1nO3Dp6r7sYdE940cyYuU5e61rsM8O2cXEm+Hnd8wYMJeeatchIjorUw==
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr2196983wmc.168.1615365689138; 
 Wed, 10 Mar 2021 00:41:29 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id t8sm29646494wrr.10.2021.03.10.00.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 00:41:28 -0800 (PST)
Date: Wed, 10 Mar 2021 09:41:26 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 2/6] net/eth: Better describe
 _eth_get_rss_ex_dst_addr's offset argument
Message-ID: <20210310084126.h6tiehk37osc5nuo@steredhat>
References: <20210309182709.810955-1-philmd@redhat.com>
 <20210309182709.810955-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210309182709.810955-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 07:27:05PM +0100, Philippe Mathieu-Daudé wrote:
>The 'offset' argument represents the offset to the ip6_ext_hdr
>header, rename it as 'ext_hdr_offset'.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> net/eth.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


