Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6A542B780
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 08:38:00 +0200 (CEST)
Received: from localhost ([::1]:32838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maXtn-0007MH-C5
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 02:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maXrd-0005xr-Om
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:35:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maXrb-0003bv-GU
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634106942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UgMauiCWc93gKkc/yTaU1cN+rGYZ7DSvz8XKNFum4Ls=;
 b=GoLGi7MVypau6nhCvQE76RJr0lBwBkqMXBR94YU5HZt/imMiiXACGFhKM7AAB7ZSZAaGlF
 MmN8af7AcluhTp3rFgal0mv6Kf7cGJePTzfXQK1RHU2p1Po9riXjGC7Jh9rlXLCPlpvE/I
 I4J4QvUvbXZD0eCRnh7u8fcs55Znt9A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-mZoRGcVGPRa1CxNJwo_gkQ-1; Wed, 13 Oct 2021 02:35:41 -0400
X-MC-Unique: mZoRGcVGPRa1CxNJwo_gkQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 u23-20020a50a417000000b003db23c7e5e2so1322383edb.8
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 23:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UgMauiCWc93gKkc/yTaU1cN+rGYZ7DSvz8XKNFum4Ls=;
 b=DD493YmU18Er5I/NI0elU7V8ayqVw1n40C18UVzdrzZYNokW3ItMbUg4k5XuyfvwfI
 ekfX+WLQ8+vkx+KqC5KDXlpjz76+JpVjZLkLpFrUUk9lZALRki0End0jIsLWXQaOo7/q
 ojYS+Y2safYfT+IEvvS1raF+DUA47RN3sWNw+98Zwxt7wa+cJzYQWmkPabYj9fUd8vD4
 EMwmxBT54ymR7JBTFHsol2gmsmyeRJa/eCb7OAyRY8uSZoNA6TJe3mnoxnU7xKYCVeJa
 ywXUOAdcyttxdleh//DBYMzb+4kD9D90Xln/2Rugtyr32zCccdX9aDs1qW87PPBTcudP
 5Ahw==
X-Gm-Message-State: AOAM532Ugm1TdAF8keAOWtDEhdAc1mCs4d52/nJndCWx1mF3JStFU7le
 B1tIrSOVyDf4+mKZ7yDRCFz6wbKetT+dJ4B4l0mMeEpzd5M6F0DDowCLUyya1pgoyY0loWJhsS1
 UbLngKeN7EvkZhWk=
X-Received: by 2002:a17:906:5282:: with SMTP id
 c2mr38835390ejm.162.1634106940432; 
 Tue, 12 Oct 2021 23:35:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+6+GB3GLC26kaHoDA+wMYcHPmooqWpgCkLYY1kjYf204++4Ey0CSNAXFI5JmtxfWf3PWIqA==
X-Received: by 2002:a17:906:5282:: with SMTP id
 c2mr38835362ejm.162.1634106940130; 
 Tue, 12 Oct 2021 23:35:40 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id d14sm6057733ejd.92.2021.10.12.23.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:35:39 -0700 (PDT)
Date: Wed, 13 Oct 2021 08:35:38 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 1/2] numa: Require distance map when empty node exists
Message-ID: <20211013063538.rhshuqb7vhurs2k6@gator.home>
References: <20211013045805.192165-1-gshan@redhat.com>
 <20211013045805.192165-2-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211013045805.192165-2-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: robh@kernel.org, ehabkost@redhat.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 12:58:04PM +0800, Gavin Shan wrote:
> The following option is used to specify the distance map. It's
> possible the option isn't provided by user. In this case, the
> distance map isn't populated and exposed to platform. On the
> other hand, the empty NUMA node, where no memory resides, is
> allowed on platforms like ARM64 virt. For these empty NUMA
> nodes, their corresponding device-tree nodes aren't populated,
> but their NUMA IDs should be included in the "/distance-map"
> device-tree node, so that kernel can probe them properly if
> device-tree is used.
> 
>   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> 
> This adds extra check after the machine is initialized, to
> ask for the distance map from user when empty nodes exist in
> device-tree.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/core/machine.c     |  4 ++++
>  hw/core/numa.c        | 24 ++++++++++++++++++++++++
>  include/sysemu/numa.h |  1 +
>  3 files changed, 29 insertions(+)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


