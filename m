Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCAA3C5F54
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:33:43 +0200 (CEST)
Received: from localhost ([::1]:49286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xwE-00050i-Bg
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m2xsj-0000cI-2B
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:30:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m2xsh-0001mm-Fq
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:30:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626103802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GrVdranTFkIsXeFoBwx5VCOgIHEKFqPi3/geBLZcFy4=;
 b=FLu0OewSbrxOHBr9jDNQSlBVJnjXpqYUlneHr0NLnju31/FubRg5JK3Wadx6GilqOOp/Ra
 4keC2TG0z90xOloOP2Ou1O2CMhBKTi/OVv/45BvnTU2UoOILGatvwrFPGD7WLgffU5TYYZ
 GvfGmQjTywPK/b6Ug3Ncba52Pw0qzYg=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-LCSykLL3M1SAtW3LbDhOgw-1; Mon, 12 Jul 2021 11:30:01 -0400
X-MC-Unique: LCSykLL3M1SAtW3LbDhOgw-1
Received: by mail-il1-f197.google.com with SMTP id
 e16-20020a056e0204b0b029020c886c9370so2482013ils.10
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GrVdranTFkIsXeFoBwx5VCOgIHEKFqPi3/geBLZcFy4=;
 b=p3lLAYxvZ24smlueZdbttyoOZZt7hTVaojplf8y40i5OmhNMNOSOhgJSGpNCdjPhRl
 vp0b2sB3CLmi1Le9uO91c9AzNftgZ3dDOv/z0+XkFA0Dt3UHzp950fBrGdT1InQJ9gnR
 E+7vIPv6JXclV2mjDAWxKoYV/qSkD6V8sFx1J8lqXGf9Rlqw2rV7Cdx+A3lfQuv6rEYO
 Z73lpOO557BG0Xyz5hW15DvcE+WUKKl2oqFti+uIErkw+X4EfA6FJxFK3+7eFkr13SXJ
 NoDEvI0ebPdYYRKbIYcMDW7LWAd5y7iOrzP+pcBr8qHwwbkLbWBdpjiQXyensaIPr3oD
 m/1A==
X-Gm-Message-State: AOAM532CxTYCxwo0cMssVClU0LgxZNposEBul6DzmwCwWcnVkT46q0jd
 Sd4a0rHiTBoYB/V9/xy/aCZjJWJ0KUwULX+UjCdHiCcn/y0m7VgT0dLL7wNWGRyNJ6BrOT1Ndgm
 P6GhD2Gcyom9rBCk=
X-Received: by 2002:a05:6e02:1d9a:: with SMTP id
 h26mr26869492ila.308.1626103801400; 
 Mon, 12 Jul 2021 08:30:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWYZtmJ8ZRcRGYBMDkAK+MBdPHUYqk1sKN6Yxmxj9O8XDKOrcBZhSyeDtKsbCqf1GO1ode2w==
X-Received: by 2002:a05:6e02:1d9a:: with SMTP id
 h26mr26869481ila.308.1626103801292; 
 Mon, 12 Jul 2021 08:30:01 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id a10sm8541176ioo.9.2021.07.12.08.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:30:00 -0700 (PDT)
Date: Mon, 12 Jul 2021 17:29:58 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH 6/6] machine: Tweak the order of topology members in
 struct CpuTopology
Message-ID: <20210712152958.uzube4ykuycvfgtj@gator>
References: <20210702100739.13672-1-wangyanan55@huawei.com>
 <20210702100739.13672-7-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210702100739.13672-7-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 02, 2021 at 06:07:39PM +0800, Yanan Wang wrote:
> Now that all the possible topology parameters are integrated in struct
> CpuTopology, tweak the order of topology members to be "cpus/sockets/
> dies/cores/threads/maxcpus" for readability and consistency. We also
> tweak the comment by adding explanation of dies parameter.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c   | 4 ++--
>  include/hw/boards.h | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Andrew Jones <drjones@redhat.com>


