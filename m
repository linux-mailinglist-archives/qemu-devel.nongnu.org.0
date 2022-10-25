Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3784360D217
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:56:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onNDC-0003M4-K1; Tue, 25 Oct 2022 12:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1onND6-0002uk-Rv
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:55:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1onND4-0004Ry-16
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666716923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hTVV7cqGOSH2W7qivbXEmAzDJLmCXy2KF3dE5KhBZY=;
 b=GIvWkrRHAYOO5KB2bdULyQn5r5VOy8uPA0lERH44qxa2w6nEOBIe6riEA4M8UUmHqZmOqu
 jEvjwx+6yHrVn5oWt5NIfsFl9bd8QfFJ+/pj4T6tZ5zrsE7ksFmpi7KtcDpvhHDWi+S/XC
 21ID4JcV3SxxBeDxf4MWW5JcdzEXHpU=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-duszTMjpOja9QlBlOUGLNA-1; Tue, 25 Oct 2022 12:55:22 -0400
X-MC-Unique: duszTMjpOja9QlBlOUGLNA-1
Received: by mail-il1-f197.google.com with SMTP id
 x6-20020a056e021bc600b002fc96f780e7so11464277ilv.10
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+hTVV7cqGOSH2W7qivbXEmAzDJLmCXy2KF3dE5KhBZY=;
 b=oFtzrS9D2ChWXn54LtKUqVKKDvPo/8P1THQYc4A8P3zjL9e1asJme3unLTK0/pK3Zx
 3YjbY+BzEWW5vnsFKtijshETZ0k5j4CF4mcajJXzLTAQu9rlSxSVnYzGb5QZ0bQrgFbk
 4PtNYtaDzNh9bcgbR9PmU5PgT6omTnYvKFlQL75iGkKArEMfnRmeunvBo8v6uG3ZhYkv
 1JGtUKrHgVFnsQc86SBC91uxkmTotOWKmPqS9fOJqO5O5DE/piVijSSPRNjS3wzTYqba
 Tzfa+yX0onSmGCPh5WjpLd9e6LGItHhcFAV2p4wkDdIGxBs88YSsuS4ue4RmZMqAiFLd
 ztDQ==
X-Gm-Message-State: ACrzQf3QWGbmrFYj1/GHaWsyCHbjje4wDxxfgJXoRp0cnMO3TxqB3JbJ
 czpysz94An8Ru31yksXvIzfLHG5gI/Af6o6v7MlG3j27qTKV5QHvJFHiyj3+ya5DJ5ZAqALUKK7
 vOEIonuyZoO7I7SI=
X-Received: by 2002:a92:d2cf:0:b0:2ff:d877:7675 with SMTP id
 w15-20020a92d2cf000000b002ffd8777675mr7827189ilg.201.1666716921562; 
 Tue, 25 Oct 2022 09:55:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7/E2JOu6OEs0o7xlQ9iK2XeNFp0aZZDkhU3CrrztuEHf+hg4aIoyDGAig6MW6/x95qPhbwNA==
X-Received: by 2002:a92:d2cf:0:b0:2ff:d877:7675 with SMTP id
 w15-20020a92d2cf000000b002ffd8777675mr7827177ilg.201.1666716921352; 
 Tue, 25 Oct 2022 09:55:21 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g33-20020a028524000000b003709af661b8sm1075343jai.51.2022.10.25.09.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:55:20 -0700 (PDT)
Date: Tue, 25 Oct 2022 10:55:18 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, sgarzare@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/2] vfio: move the function vfio_get_xlat_addr() to
 memory.c
Message-ID: <20221025105518.0a56c662.alex.williamson@redhat.com>
In-Reply-To: <20221025163734.965367-2-lulu@redhat.com>
References: <20221025163734.965367-1-lulu@redhat.com>
 <20221025163734.965367-2-lulu@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 26 Oct 2022 00:37:33 +0800
Cindy Lu <lulu@redhat.com> wrote:
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 7ba2048836..03940c551d 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
...
> +        /*
> +         * Malicious VMs might trigger discarding of IOMMU-mapped memory. The
> +         * pages will remain pinned inside vfio until unmapped, resulting in a
> +         * higher memory consumption than expected. If memory would get
> +         * populated again later, there would be an inconsistency between pages
> +         * pinned by vfio and pages seen by QEMU. This is the case until
> +         * unmapped from the IOMMU (e.g., during device reset).
> +         *
> +         * With malicious guests, we really only care about pinning more memory
> +         * than expected. RLIMIT_MEMLOCK set for the user/process can never be
> +         * exceeded and can be used to mitigate this problem.
> +         */
> +        warn_report_once("Using vfio with vIOMMUs and coordinated discarding of"
> +                         " RAM (e.g., virtio-mem) works, however, malicious"
> +                         " guests can trigger pinning of more memory than"
> +                         " intended via an IOMMU. It's possible to mitigate "
> +                         " by setting/adjusting RLIMIT_MEMLOCK.");

Looks like the comment and warning still need to be generalized for
shared use here.  Thanks,

Alex


