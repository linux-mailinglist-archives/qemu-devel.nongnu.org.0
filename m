Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB27E3DE86C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:29:05 +0200 (CEST)
Received: from localhost ([::1]:47406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mApnM-0004Zr-Rg
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mApmZ-0003tb-FM
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:28:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mApmX-0006DB-Un
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627979293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=efHIzSa6fBu61/uWk05JPcH03i7ObrGOg+itfXrbChY=;
 b=KDsK0AbSh6WEBWFJPemXr+0d76oklJ/YNRqNDAcA8IrWuLtxNhcGOyPJ/v4+8VdD9OXaKy
 f4ZEkHqwcIWb27f2oqGLVNNv3ueOMwoxoMMPslc0+SUZVycI1a15V7X7njSUclpFUKUm1A
 dTRZiFH//0zv+2BqT+/fPU5mq9Hgnlc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-7CwonPttNXSrcotKKKw_BA-1; Tue, 03 Aug 2021 04:28:12 -0400
X-MC-Unique: 7CwonPttNXSrcotKKKw_BA-1
Received: by mail-ej1-f70.google.com with SMTP id
 q19-20020a1709064cd3b02904c5f93c0124so5695429ejt.14
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 01:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=efHIzSa6fBu61/uWk05JPcH03i7ObrGOg+itfXrbChY=;
 b=KZiR3B6GM4I0wGsa+2DndvmUfFHHreTUm/M+Yhoi1PMH9Gk+GsaZnmiu7jGTjYDW3U
 j5n+94aoDjqveyZHxsXgx+jR26nYlyGxAVW4vsjOYIQuEQHmO7OJkrAbof4vrNlccf2h
 Rvb+fxuLooCxTlTDP8LNaWJa5mbUq2EGjq7bk5A8uaz+8SZGJ6XcI6TQC7NTXDyxE9GH
 lvMzFjXqclK7pv4T51HOcz3XkU3ydu/Hss+rzk41Cxb/j58diB6mjX69/NP2DPIwuGZv
 PmHoOBzBhHHz7AQ8SO0lNrv5GlWIeGiexZIrq+2nd1FBPeSJpvcS+VW+NDsc+GdSU4NI
 zqJA==
X-Gm-Message-State: AOAM530eEjTrpBLByHyvthOxu7iG7Jsu4MrwSw6vfxR/gbyY94dnjslo
 dqD1I0VK9sS5MJ2AYOTJnpMkViDVM46B8cFCv6P2+SaXfu7dBbY9zOeDh3B89ecZEZ7eB5J+QO/
 9Y6pIm0emYc2Iwi0=
X-Received: by 2002:a05:6402:26d1:: with SMTP id
 x17mr24944613edd.126.1627979290897; 
 Tue, 03 Aug 2021 01:28:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw82KYm/MhQ34zF65rbSI5Rq9xaUlpZdf0Pxa+xqYJ1iKF/bkn6unU6OhXvvzvzrcvO4I7Afw==
X-Received: by 2002:a05:6402:26d1:: with SMTP id
 x17mr24944584edd.126.1627979290668; 
 Tue, 03 Aug 2021 01:28:10 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id o22sm1129597edr.19.2021.08.03.01.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 01:28:10 -0700 (PDT)
Date: Tue, 3 Aug 2021 10:28:08 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v4 13/14] machine: Split out the smp parsing code
Message-ID: <20210803082808.ranb5mrdypquy6xa@gator.home>
References: <20210803080527.156556-1-wangyanan55@huawei.com>
 <20210803080527.156556-14-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210803080527.156556-14-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 03, 2021 at 04:05:26PM +0800, Yanan Wang wrote:
> We are going to introduce an unit test for the parser smp_parse()
> in hw/core/machine.c, but now machine.c is only built in softmmu.
> 
> In order to solve the build dependency on the smp parsing code and
> avoid building unrelated stuff for the unit tests, move the related
> code from machine.c into a new common file, i.e., machine-smp.c.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  MAINTAINERS           |   1 +
>  hw/core/machine-smp.c | 199 ++++++++++++++++++++++++++++++++++++++++++
>  hw/core/machine.c     | 177 -------------------------------------
>  hw/core/meson.build   |   1 +
>  include/hw/boards.h   |   1 +
>  5 files changed, 202 insertions(+), 177 deletions(-)
>  create mode 100644 hw/core/machine-smp.c
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


