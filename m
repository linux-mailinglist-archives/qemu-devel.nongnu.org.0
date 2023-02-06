Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1AD68C81C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 21:59:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP8Zi-0001r9-VN; Mon, 06 Feb 2023 15:58:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pP8Zb-0001qZ-JA
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 15:58:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pP8ZY-0004My-1C
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 15:58:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675717122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D4clvgZ5t60gOexThu8mgXN2iSFxZfOwZVdCoEeXpPE=;
 b=PPEM1hgCAy+rTLkouN4zkd+Dc1c53WbZeri1KPF3yfH/WswJGdFI5gV2+WIvJIZx4PZ3Gl
 eVt0KqapTgs31x+KrvNvDNRLRSL/4eRzN4rNB02P3yizpH/r/y/UGChDJedzkJppYzc8/q
 u/EQWx0Xfo8uROeFikNVRMTE+SJSRpo=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-450-PTEqt084MNyv2ZB8CiFoQA-1; Mon, 06 Feb 2023 15:58:39 -0500
X-MC-Unique: PTEqt084MNyv2ZB8CiFoQA-1
Received: by mail-io1-f69.google.com with SMTP id
 q12-20020a6b8e0c000000b0071d8eef7c67so7695184iod.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 12:58:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D4clvgZ5t60gOexThu8mgXN2iSFxZfOwZVdCoEeXpPE=;
 b=GFh6R/8xdzXMDsSl+WRxbtuCDHQ79zyO4Q09kCd2nZ1KOajA7SRJL+leCKuP1bfgHI
 +q85GkxXe7vOW/2Gz2j7l4+SWCErCCulnhuKHWIw0pXZlvBNjOerm2WV0TMri3zaipBB
 fnTVTk0aISPDqT2xazDZ43+QHMMkCwrnkTI9GsKAzwZ9MolvD8CDcX4+/PDWcuPCTaRS
 P/2lEFnc4OXf1BQfq/2IJm+tTd5h4nkJYrBy/Y2Dx1O/8nCLcMW/YhSUs2lMpW+QtNU9
 g3nF4rGM+OBCt+6B2mYmIarXKbGhKe7wRdCWhQF7cvGUNWqQIPchLvwGhsHM7Kws04/w
 2J0A==
X-Gm-Message-State: AO0yUKUI8eKKZqzolMFEWeI0oGZLxQLIPazB0vIjkll8ZW7cw9YaXOHj
 G1YNmIWyV/Q6delSICGQOaTNYC2NXUIKzZqwTOw0z6ypNtJ7lV4GeoQnwCI5tqwkmz9qo36646h
 GO9xNrOJzBSSSu2U=
X-Received: by 2002:a05:6e02:1e08:b0:313:bf44:b4a1 with SMTP id
 g8-20020a056e021e0800b00313bf44b4a1mr640871ila.6.1675717118340; 
 Mon, 06 Feb 2023 12:58:38 -0800 (PST)
X-Google-Smtp-Source: AK7set/d9ENoOPDGHg75PtGOT0HngLmwOozrS9lXScClShLURVoPRvNO3Ll15OHPfydHBa6zDyE6qQ==
X-Received: by 2002:a05:6e02:1e08:b0:313:bf44:b4a1 with SMTP id
 g8-20020a056e021e0800b00313bf44b4a1mr640860ila.6.1675717118096; 
 Mon, 06 Feb 2023 12:58:38 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 v5-20020a056638250500b00389cb050d1bsm3686242jat.33.2023.02.06.12.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 12:58:36 -0800 (PST)
Date: Mon, 6 Feb 2023 13:58:35 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Cc: qemu-devel@nongnu.org, clg@redhat.com, philmd@linaro.org
Subject: Re: [PATCH v2 17/23] vfio-user: dma map/unmap operations
Message-ID: <20230206135835.70de7641.alex.williamson@redhat.com>
In-Reply-To: <1ec25a5832299083fee3c90bd89561f5c1d42ba9.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
 <1ec25a5832299083fee3c90bd89561f5c1d42ba9.1675228037.git.john.g.johnson@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed,  1 Feb 2023 21:55:53 -0800
John Johnson <john.g.johnson@oracle.com> wrote:
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 6f99907..f04fd20 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c

> @@ -889,6 +894,29 @@ static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
>      return true;
>  }
>  
> +static void vfio_listener_begin(MemoryListener *listener)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +
> +    /*
> +     * When DMA space is the physical address space,
> +     * the region add/del listeners will fire during
> +     * memory update transactions.  These depend on BQL
> +     * being held, so do any resulting map/demap ops async
> +     * while keeping BQL.
> +     */
> +    container->async_ops = true;
> +}
> +
> +static void vfio_listener_commit(MemoryListener *listener)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +
> +    /* wait here for any async requests sent during the transaction */
> +    container->io->wait_commit(container);
> +    container->async_ops = false;
> +}

Since this ends up being entirely vfio-user related, what about
embedding a user struct in VFIOContainer and make optional
listener_begin and listener_commit callbacks in VFIOContainerIO, ie.

	if (container->io->listener_commit) {
	    container->io->listener_commit(container);
	}

Thanks,
Alex


