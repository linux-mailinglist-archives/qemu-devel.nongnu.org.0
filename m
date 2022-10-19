Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5746048D5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 16:10:37 +0200 (CEST)
Received: from localhost ([::1]:54158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol9mF-0004T4-9e
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 10:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ol9dg-00068Y-Vx
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 10:01:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ol9db-0006Wj-H9
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 10:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666188098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7nyB+i8+CdIM36W3q0ymYcXuxWwB/xhwVNWwmjZ4qD8=;
 b=hqqbf6j2eQMzA2e3UOhm3OuFekEPqv/TdwXDnQ/euJTDFP9ePXvY3ZGu2U4jUywq4Wju/K
 ydKgtr4ENsHH9DK0VLWMfbixp8rvwjJY6r/oDjmRgNy8xxZKqGCemaxHPhEWEVf1urOQQJ
 gUh5xonKCRZAG2yZA0VFrksgIecP7CE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-83-0URkmVZAOlWEH4TqZI_7wA-1; Wed, 19 Oct 2022 10:01:37 -0400
X-MC-Unique: 0URkmVZAOlWEH4TqZI_7wA-1
Received: by mail-qk1-f198.google.com with SMTP id
 de21-20020a05620a371500b006eed31abb72so2889416qkb.6
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 07:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7nyB+i8+CdIM36W3q0ymYcXuxWwB/xhwVNWwmjZ4qD8=;
 b=1sqVP78VV/Lj9uotNDuYIlY92q1qzDYRMNaleEZuNcDxyRrtXJbqenTc5bvzyyf9nM
 Omgti7yHSR/iKdai2EIOy5/vsVJVsU93qbCsakjmFmUbJN6o6va3zA6YIAKXG8C4CeO9
 eLcCWjntjiKmKHrydJ9+xYa6ZLArzbTQkstc6iQUa1mzA7sjZgyB7+0M+7qzkQAmQWaE
 BElc4+awtYjHNKoipbxu+fTDfTqtUUF+TUM2ql/b0sWMmimLxrECk6UfBuypW3dHx+Yc
 fxCiTCQmVFEXmwv15NYliGH9qunbxsLn3muL2kWXoetDPHX9MBoie3jlmKe8ibYg3SPy
 xjPA==
X-Gm-Message-State: ACrzQf301dAUgBYRGiuIDU6SeVzthvIzYzCszrKaFn6tpubydBwkLtqv
 Y0a18d36fCJf5V7A4zDAUoykuu26lU9g3i0Ememsiym2ovyoa//m+sJXacB1hgD2aJXuaOgDiIM
 /TnXdhm4p+UJnu/E=
X-Received: by 2002:a05:620a:4250:b0:6cf:a822:7c7e with SMTP id
 w16-20020a05620a425000b006cfa8227c7emr5768958qko.503.1666188092505; 
 Wed, 19 Oct 2022 07:01:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5HIxrqpL0BWH3+7Gm3J0qmbRlft5udvF0chzImLgNSJsyhLoWn5CEi/qFLwv/RIdSNPqN2YQ==
X-Received: by 2002:a05:620a:4250:b0:6cf:a822:7c7e with SMTP id
 w16-20020a05620a425000b006cfa8227c7emr5768914qko.503.1666188092119; 
 Wed, 19 Oct 2022 07:01:32 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 u10-20020ac8750a000000b0039764587192sm4038272qtq.57.2022.10.19.07.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 07:01:31 -0700 (PDT)
Date: Wed, 19 Oct 2022 10:01:30 -0400
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [PATCH] x86-iommu: Fail flag registration of DEVIOTLB if DT not
 supported
Message-ID: <Y1ADOivPsgWzOjF6@x1n>
References: <20221018215407.363986-1-peterx@redhat.com>
 <98df60ec-be6d-84aa-d2bd-3bb2ebf0d1a5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <98df60ec-be6d-84aa-d2bd-3bb2ebf0d1a5@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Eric,

On Wed, Oct 19, 2022 at 01:24:15PM +0200, Eric Auger wrote:
> > @@ -1484,6 +1485,13 @@ static int amdvi_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
> >                     PCI_FUNC(as->devfn));
> >          return -EINVAL;
> >      }
> > +
> > +    if ((new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) && !x86_iommu->dt_supported) {
> > +        error_setg_errno(errp, ENOTSUP,
> > +                         "Device-iotlb not declared support for vIOMMU");
> with current vhost code, vhost will then silently fallbac to UNMAP
> notifier registration and this will succeed. It would be nice to clarify
> whether the vIOMMU works with vhost in this downgraded mode (at least
> ats=off and device-ioltb=off)?

I'm slightly confused, why do we need to clarify that?

As we have discussed, if a device with ATS capability got attached into a
vIOMMU context that does not support ATS, then it should just work like
without ATS without any warning.  Isn't this the case here?

Thanks,

-- 
Peter Xu


