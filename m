Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A305F3DE889
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:39:06 +0200 (CEST)
Received: from localhost ([::1]:55390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mApx3-0001vB-Ob
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mApvx-0000tV-NU
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:37:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mApvv-0005uV-8p
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627979874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gEvu1GqHtEldUOX9mfFciEWk2MOpb5x14yhBtZQcCHM=;
 b=gaxre9QRvK/hW32s9g3qzXR5al7Ov0NsMLF7KnuWcZZcBRAlB+O8xkjNoRIdiBqYx4wARa
 X5GLxfmIkFVWa6EYbZApGFNyO3AVVa/CgaXkPsquP0ApJXhZ4gcdcQYHKHkCXisyMX4IZD
 UyvgLwJOXwcmVpCG1jZ3Uudmp+DtppI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-duBreoZDPRq9_MDa3xyp-g-1; Tue, 03 Aug 2021 04:37:52 -0400
X-MC-Unique: duBreoZDPRq9_MDa3xyp-g-1
Received: by mail-ej1-f72.google.com with SMTP id
 gg1-20020a170906e281b029053d0856c4cdso5709959ejb.15
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 01:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gEvu1GqHtEldUOX9mfFciEWk2MOpb5x14yhBtZQcCHM=;
 b=QkaK2DDAz0MJmK/azKgSARe5XOdNSMOzOCHhFHIa4l89iCffd6c8PeXTfuSG+qo3h5
 1J98nnD5J3BMlcfeRb2t/S57ysghrbo2HwXr6M6H/1arcanMZzR4LJwLxS5d32j6c+2y
 oUnOaxxD850lbONh8b4U8yuPNIpMD4qa+ZXRtDjTYZ3Rqya7HNICv46FXYgHc6UZcaXe
 ZLwTjM7An/2ItPRi8dmifoX3+B1chNvC04KDpBL0aczlbvKSoMtRicrU5jPcOj2HeXHI
 8NRJWso7hvlWdeii/ljUDY+fbI+m/EEIjTLRZulWLzuGYovIkm+LYq48/WceXq+WEkci
 9kAg==
X-Gm-Message-State: AOAM532pwfv1q7KXbAk/kjTamP1AK9uxLNpgehXDL9b46oBoe1j9qXJy
 CPnwceMyDJ7diNK3cfa9ZB3M9l6yWhQ90gP22Uc43zmhBIVAixP5FOSWQrAvTF7EmKcbyvucPBr
 u22dpNdKVgKYaWlI=
X-Received: by 2002:a17:906:f1c4:: with SMTP id
 gx4mr19615594ejb.410.1627979871650; 
 Tue, 03 Aug 2021 01:37:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqM15gwv7h9MPGtjQv+MvHzKCl/dxSzHo0jmy1SB+M4ie7QktMNzmeeIifSvmYH0eOZ69JYA==
X-Received: by 2002:a17:906:f1c4:: with SMTP id
 gx4mr19615566ejb.410.1627979871430; 
 Tue, 03 Aug 2021 01:37:51 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id cz3sm7706527edb.11.2021.08.03.01.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 01:37:51 -0700 (PDT)
Date: Tue, 3 Aug 2021 10:37:49 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v4 14/14] tests/unit: Add a unit test for smp
 parsing
Message-ID: <20210803083749.zobw6nw3566qdxeo@gator.home>
References: <20210803080527.156556-1-wangyanan55@huawei.com>
 <20210803080527.156556-15-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210803080527.156556-15-wangyanan55@huawei.com>
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

On Tue, Aug 03, 2021 at 04:05:27PM +0800, Yanan Wang wrote:
> Add a QEMU unit test for the parsing of given SMP configuration.
> Since all the parsing logic is in generic function smp_parse(),
> this test passes different SMP configurations to the function
> and compare the parsing result with what is expected.
> 
> In the test, all possible collections of the topology parameters
> and the corresponding expected results are listed, including the
> valid and invalid ones.
> 
> The preference of sockets over cores and the preference of cores
> over sockets, and the support of multi-dies are also considered.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  MAINTAINERS                 |   1 +
>  tests/unit/meson.build      |   1 +
>  tests/unit/test-smp-parse.c | 892 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 894 insertions(+)
>  create mode 100644 tests/unit/test-smp-parse.c
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


