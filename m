Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EE14322DA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 17:30:02 +0200 (CEST)
Received: from localhost ([::1]:60638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcUaP-0002r5-7s
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 11:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcUVq-0000vh-CN
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 11:25:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcUVo-0004U8-MA
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 11:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634570714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xIWL4gw75z/31Kco/UibJtQJEwYlQTPu1W9xvV6aXhU=;
 b=AHdupECiyPozmleielbCJiCbY8K9azwLslGAQqhGcXzzV3NyNS/vq/vTXCKrecV01r8G6m
 EoXlChXxA/QqbN6DJGrDgeIR2RrsOkIvCVEydlg45Y4bJwJSSNfJv4Fve61ogwaxk0RvAb
 f0M15h5HIvJ8RrRLj00dj5fEeWqmeUU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-5wOaD56oOh6MW--Kc5aToQ-1; Mon, 18 Oct 2021 11:25:11 -0400
X-MC-Unique: 5wOaD56oOh6MW--Kc5aToQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 j12-20020adf910c000000b0015e4260febdso1974228wrj.20
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 08:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xIWL4gw75z/31Kco/UibJtQJEwYlQTPu1W9xvV6aXhU=;
 b=zvQZq3Hw66/lHYwhQEwRc5Xbcxp2lbBklBfOPwTBepDFZWpGBxMT6MHtdZdMvL7Edr
 dMZys7Y8xAaqSlKz/6UYhyTsNok+LpqltdBt436tvG7Gfa0Z9obsJvZ4dthzn0dLMhfK
 bOf+fgtlepifbahrPBzF1cE+5mmPZWpEXwIL1zylb6PvL8WPLxWYeOvMiAu824D9df9t
 knxln6waBL3Rf/+pjLz5BSb6d4hOV9n181/WUAtX4rX5LvXPeWPjMzFfW6GZ6yBCGB5t
 Nz3TsIEcbgoA7Ci02N6JWB+fqIqdZxNq/5xwPyOTheBQNeCSyqXa48a7QaN0SrMJCsD2
 8lcQ==
X-Gm-Message-State: AOAM530IF9IO8BINblN+FXU9hNJFJmJuKJHsvhUDEOSPOeN9qyr4KQCd
 PAIztiDgapTFN7tj061TlmWrji/v26wh7iC2P0Ltl0zXzQkC0NnQ9N0n1y6wMfP7zdwiZTtmZ2v
 Ostsoc0Wavmjogu4=
X-Received: by 2002:a1c:f008:: with SMTP id a8mr45076817wmb.140.1634570710610; 
 Mon, 18 Oct 2021 08:25:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw30Qwsu1XPG6TMvQWhLPkNne6tfNcV4X00bTih+wYyKlDECZz9gXNiMVZMKYnkDpGvKqKyOA==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr45076785wmb.140.1634570710397; 
 Mon, 18 Oct 2021 08:25:10 -0700 (PDT)
Received: from redhat.com ([2.55.19.190])
 by smtp.gmail.com with ESMTPSA id f20sm2033566wmq.38.2021.10.18.08.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 08:25:09 -0700 (PDT)
Date: Mon, 18 Oct 2021 11:25:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 00/11] virtio-iommu: Add ACPI support
Message-ID: <20211018112402-mutt-send-email-mst@kernel.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211005113719-mutt-send-email-mst@kernel.org>
 <YWBhEQxM4wRyZWzs@myrica>
MIME-Version: 1.0
In-Reply-To: <YWBhEQxM4wRyZWzs@myrica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, imammedo@redhat.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 08, 2021 at 04:17:37PM +0100, Jean-Philippe Brucker wrote:
> On Tue, Oct 05, 2021 at 11:45:42AM -0400, Michael S. Tsirkin wrote:
> > Looks like this can not be applied yet because the bypass bit
> > isn't in yet. what's up with that?
> 
> The boot-bypass bit isn't a hard dependency for this series, but it will
> be needed for full support eventually. It will be delayed by spec and
> Linux header changes
> 
> In the meantime we can work around the problem by having the boot disks
> bypass the IOMMU (virtio without iommu-platform, or iommu-bypass bus).
> 
> Thanks,
> Jean

OK... how do we want to apply all this?
If my tree I either need ack from an ARM maintainers, or
post a partial patchset with just x86 bits.

-- 
MST


