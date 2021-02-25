Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6856A325293
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 16:43:14 +0100 (CET)
Received: from localhost ([::1]:43372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFInJ-0006Vb-El
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 10:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lFIlY-0005UN-1t
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:41:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lFIlW-0002vW-CN
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:41:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614267680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=smOyglRy7PtD+HnAoM06eJkZ48jIJO7fYdUfwiF0P70=;
 b=IkRVOk2aunAnDeixiblaatYLu6TWYHoBvc70LyMnm7oH27thHuT8bghEJVA7ad3ZJfuA3H
 3oJD3kXjYIpUG1YiDHWIQ1R7SSBxuid/WRo8gOpgeHdgQ5sTlZSZ/TXmDGVeO3qj57CLxl
 ljxq0MVNno9jfEFx98RGVPB3A+GEFsg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-pZSGWjUvNnqc3zJ7GOZkpw-1; Thu, 25 Feb 2021 10:41:18 -0500
X-MC-Unique: pZSGWjUvNnqc3zJ7GOZkpw-1
Received: by mail-qt1-f200.google.com with SMTP id i19so4295092qtx.6
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 07:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=smOyglRy7PtD+HnAoM06eJkZ48jIJO7fYdUfwiF0P70=;
 b=B0N0zDwxMh2G7bR6VXHJIblnnUGlFTteelRGZovSEUUd2+KQ9sgT0bq4x9Ttm1XUHi
 trw+zcndN09zuI62fhbA+K/cMn1kKJZJwWn7kFtnsy3KrtuCbe1I/7xoNeAK4VINLajp
 ZQ2FseK3XxmU/5gyB31GYc91T8B0JF6931ICWYCVkytpukgMsJvFGMzgynCaYUTpnhgH
 6Bd9TE658f1RgiId/lhRva9E4Ko+L/pgBb4bSUlDZ7T4l91zBoZ9ApoMGoX6Ef1OAqhG
 t1K+wlFV/PZY2gf40VWkSsXc9UE4zx+U2DhCadMXEkM+iYsncsXJp5gHaz91FZTuGfvR
 1OQw==
X-Gm-Message-State: AOAM530PWvUbniO7e9UOdcmyzDOBE+5z5f2qRVouQIllWnfqXvMMVJRW
 mBdma/UUBEAj1IDIe0X7KSoiP1H3Y/N1m73ZK1Osr8Cc4V2ezjd4KXLdYVaWO/cX1Kd7FMIBgqZ
 O9f6Dtdiu98tZmmI=
X-Received: by 2002:a37:9dd2:: with SMTP id g201mr3221221qke.138.1614267678440; 
 Thu, 25 Feb 2021 07:41:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycnSCyV41mpy3lqsfri5TzLtAmK5CfGtnAdwcJeQwEgMSZljWiENq1ZrZ6GF+lpyijqFVV6w==
X-Received: by 2002:a37:9dd2:: with SMTP id g201mr3221191qke.138.1614267678184; 
 Thu, 25 Feb 2021 07:41:18 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id n67sm4187377qkb.35.2021.02.25.07.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 07:41:17 -0800 (PST)
Date: Thu, 25 Feb 2021 10:41:16 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 1/7] intel_iommu: Fix mask may be uninitialized in
 vtd_context_device_invalidate
Message-ID: <20210225154116.GA250483@xz-x1>
References: <20210225091435.644762-1-eric.auger@redhat.com>
 <20210225091435.644762-2-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210225091435.644762-2-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, jasowang@redhat.com,
 qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
 vivek.gautam@arm.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 25, 2021 at 10:14:29AM +0100, Eric Auger wrote:
> With -Werror=maybe-uninitialized configuration we get
> ../hw/i386/intel_iommu.c: In function ‘vtd_context_device_invalidate’:
> ../hw/i386/intel_iommu.c:1888:10: error: ‘mask’ may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
>  1888 |     mask = ~mask;
>       |     ~~~~~^~~~~~~
> 
> Add a g_assert_not_reached() to avoid the error.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


