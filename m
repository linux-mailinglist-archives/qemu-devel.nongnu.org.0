Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD76231595F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 23:24:42 +0100 (CET)
Received: from localhost ([::1]:42052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9bR3-0006yZ-Fp
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 17:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l9bPs-0006Nn-6r
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 17:23:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l9bPp-0007cp-A1
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 17:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612909403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mc3esFUFQuQWiikTAkL1BBNbvE8z/qpXn/484dqVg3s=;
 b=hySkYGTaIXAzViAQcgA5jzI30u7d9W6lhmO5+5ofnBcMJWAXBb2RIpOM7weEJVULD7yOE+
 6W0DLodC9yWhjpSV5D4m0qyRBvLsGQXAG7wFkE4bGBjF7WrJdQmQeNeqRVshAU5kGKUrvO
 pSOH6j0QxlRPoFg59riCTNphcatcnIM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-e5X6YYaxNjmpmkPOX5R9uw-1; Tue, 09 Feb 2021 17:23:22 -0500
X-MC-Unique: e5X6YYaxNjmpmkPOX5R9uw-1
Received: by mail-qk1-f198.google.com with SMTP id p185so17079096qkc.9
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 14:23:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Mc3esFUFQuQWiikTAkL1BBNbvE8z/qpXn/484dqVg3s=;
 b=PJkHM05SNTXl7qThjssPh7LIpwt5NbsB7qrhZiJyTHOn4RvHgSwcN/B4B5t2Z1WAO8
 svJdXugMSr0oH5xlLDTmgn0TZ5hh0f7qALUbXWNyl9IFCo0GwqEVisjtgfXNZdOQ1pVS
 OPy+oINE5K35UqYm3lvOgbYQPSrJbR8CVYP9eyz+NN4DseZiMxkRri/oyI4Fu0UJ10eC
 1MQos907Pc/DxWdPnovJYlGWXqLftgXeqW+AHukQHGoOrcC1bM6AmiRf2/rkovBe1Id1
 5x0Vl+PkxC1RnVmf2NK9PKON8dECikx3kj6zuDI35chGYj9N0iWtHsSeu0L6OoG9YhKy
 aalw==
X-Gm-Message-State: AOAM530gLttJyjKahGH8x9q5tpyejlKE24dEuk/tFf+pEWhn17FSSDbS
 sXOeuGq4F6kzToM1uolGjkjN8pNSturGYXWuHu6vpWu9wIQfI5nhk7y93WK5JGKQ8tL8mnNPC0y
 iZerur+qC8zc9MHk=
X-Received: by 2002:ac8:1009:: with SMTP id z9mr179504qti.347.1612909401756;
 Tue, 09 Feb 2021 14:23:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNJ/O72Q7KVNSSv6m4L2hOudFx1TvpQbQhNhww5VrB0PNPWH8SheJ1tUoGgZGJpJlmf92u2w==
X-Received: by 2002:ac8:1009:: with SMTP id z9mr179485qti.347.1612909401527;
 Tue, 09 Feb 2021 14:23:21 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id r17sm123708qta.78.2021.02.09.14.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 14:23:21 -0800 (PST)
Date: Tue, 9 Feb 2021 17:23:19 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 0/2] Additional vIOMMU fixes related to UNMAP notifiers
Message-ID: <20210209222319.GE103365@xz-x1>
References: <20210209213233.40985-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209213233.40985-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: peter.maydell@linaro.org, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, groug@kaod.org, eperezma@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, jean-philippe@linaro.org,
 david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 10:32:31PM +0100, Eric Auger wrote:
> 958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb
> support") fixed part of the UNMAP related regressions introduced by
> b68ba1ca5767 ("memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP
> IOMMUTLBNotificationType").
> 
> However the case of the spapr_iommu was not addressed. It should be
> identical to the others. Also 958ec334bca3 introduced a regresion
> on the VIRTIO-IOMMU/VFIO integration.
> 
> spapr_iommu is not tested.

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks!

-- 
Peter Xu


