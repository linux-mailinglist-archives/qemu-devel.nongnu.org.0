Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D9B3252F6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 17:03:33 +0100 (CET)
Received: from localhost ([::1]:47050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFJ6x-0004g5-Tv
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 11:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lFJ4t-0003F6-II
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 11:01:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lFJ4p-0003iE-IP
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 11:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614268878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/4FodVM/Y3dAOZ4eDDkC1LFCt7HfWWncqy+1IGq8oGg=;
 b=HTdyGU3jC60q5ON3CklNwXre7Yp5656EkPhT/E+M+N6Il1dNPBT+/OuZMkGscaXiK5UKPS
 m6Dn6d4jscMUAtiH8QbACVp8jLeuQES/lYjDcyEpsqnSZZH+/3Wji+tuPmYRDyKeQ713bI
 XYKevT+BqDHDFmAvRMKRWFNU/YdcmZo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-E19HCJ7fMOafIoyiVkXxLg-1; Thu, 25 Feb 2021 11:01:16 -0500
X-MC-Unique: E19HCJ7fMOafIoyiVkXxLg-1
Received: by mail-qk1-f200.google.com with SMTP id r15so4802043qke.5
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 08:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/4FodVM/Y3dAOZ4eDDkC1LFCt7HfWWncqy+1IGq8oGg=;
 b=t8ohGkxoeY6Wcvwb9gNO7e1fWiHpbejsPZPFYaEAFChx1LoQEZ+K53KONxe70cRBWf
 UK1mCtX7VDsRYyPBzFVdfXsvY0798fstn4O/1aWHrZQs+7YopXMed0MiwvdmwAqYAjZY
 VqKonh46e4eaVwllD6IXr73kIDaWZ9g29695k9sv+HPKHQbISdVHaHwLGKSEYkdeyLh3
 6IiaTheJ2NIxxGgIuDb1gnJA5dBgLvohHp4d+DOXLctgyh/n9T2MFVGTBL3O7ENH4+zT
 KBoIght8/3f5j8tZDrzVZmZYiL51rxICeO54WADQzxlA1r/YI2Jfj3duSzKen2urIxtI
 T7Gg==
X-Gm-Message-State: AOAM531Iw4YZWnoqXuROOpic9LSIv1abyzxQB1ODGANIKrTtbclzEWYr
 Gh1+D74u8+e/gUAJb4aWciWFT6XkV4CI2x8nctRUUdulXyXV+c2JGE34mf179LNtmBGywFsFsYv
 Ouys6P8obGem2Ssg=
X-Received: by 2002:a05:6214:4b2:: with SMTP id
 w18mr3180915qvz.5.1614268875991; 
 Thu, 25 Feb 2021 08:01:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJgulFjLLmAbQXkBClnytXdev4cgKc5PrOBtv2KuRp2rs41c/9vBD4kZGBCRko4avx/MEs/Q==
X-Received: by 2002:a05:6214:4b2:: with SMTP id
 w18mr3180799qvz.5.1614268874982; 
 Thu, 25 Feb 2021 08:01:14 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id f186sm4295605qkj.106.2021.02.25.08.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 08:01:14 -0800 (PST)
Date: Thu, 25 Feb 2021 11:01:13 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 3/7] virtio-iommu: Handle non power of 2 range
 invalidations
Message-ID: <20210225160113.GC250483@xz-x1>
References: <20210225091435.644762-1-eric.auger@redhat.com>
 <20210225091435.644762-4-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210225091435.644762-4-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

On Thu, Feb 25, 2021 at 10:14:31AM +0100, Eric Auger wrote:
> Unmap notifiers work with an address mask assuming an
> invalidation range of a power of 2. Nothing mandates this
> in the VIRTIO-IOMMU spec.
> 
> So in case the range is not a power of 2, split it into
> several invalidations.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


