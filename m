Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0760D3E0CB3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 05:09:52 +0200 (CEST)
Received: from localhost ([::1]:35294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBTlX-0002Ui-1I
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 23:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBTk7-0001nm-DT
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 23:08:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBTk3-0007TP-Ee
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 23:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628132898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EUSVwIzd5foSCdn/8xPoLzT5k5Sn6J97L6r6KXMtCT8=;
 b=aefkwi3Q6dTCCvaeCG+gL3ZFGpy646i7ZDE4HnD+oXug6RtNWt4zkqt8XoQIo2Vk1KY2Rx
 Z1nXdOv3SM2URkE0qI6f9Zi/MrGbMGjK8lZ6449i0ytmOt0lQkIRLgnvPD4zo84ZXVwxhf
 KxwRMtYMUw/7czpUGzsxV5NrY6PlXFk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-7u__lvyCNnKv95LoCcijtQ-1; Wed, 04 Aug 2021 23:08:17 -0400
X-MC-Unique: 7u__lvyCNnKv95LoCcijtQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 21-20020ac857150000b029024e8c2383c1so2062176qtw.5
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 20:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EUSVwIzd5foSCdn/8xPoLzT5k5Sn6J97L6r6KXMtCT8=;
 b=rqR+KSbsm25xchGRgfNqbFoojnyakOC9iR87bfaPyYeg3bQxQUdwm40/09i6jbsWpX
 zmlLcnWwli3SJq1pvzszDXb7X3DxUQQwVtCrCf0rCoMHuLNTku0XUPfbRNdyoYmYk85T
 GmEksyD3LpBwxaDgfQtScEKqFpgEQX74jETYwSn9yc6xcuYXG0Ez0TryUFxecwmICdv8
 eFp+0oPb9UQ228a3OmBfBnj0Ac33AyGzjCIb0cUABEk6ASDZnCaLTBiF72U5LFh9bCEV
 xsJHi7yf4RSvfZTWq7ZmngNlbI9OVIUB7pHTxiRLeOGm6DAOoCcds41w8gAH1yd6ZXat
 671w==
X-Gm-Message-State: AOAM533baKktfdIVzRZKiL7pstDEDMu7cumsaWx5OOuAdy8rTBlx3pL6
 92Cn4KjAq8WO/UmjlS04p/DliGMDwMv4R55pb6Eg6O0jh0amQYV9iSIvpt+e4rwBl2UUXXAvaDx
 2BUGjUGpYsoaBLVk=
X-Received: by 2002:ae9:f30e:: with SMTP id p14mr2718612qkg.412.1628132888006; 
 Wed, 04 Aug 2021 20:08:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyG7TVYATSjJ4ulTj4l4ClLUFkqhnDzaRsgbh/x0/1gq9qDa10JV4MEhuVuAlRmzhm9r8V2DA==
X-Received: by 2002:ae9:f30e:: with SMTP id p14mr2718587qkg.412.1628132887784; 
 Wed, 04 Aug 2021 20:08:07 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-toroon474qw-grc-92-76-70-75-133.dsl.bell.ca. [76.70.75.133])
 by smtp.gmail.com with ESMTPSA id q184sm2471324qkd.35.2021.08.04.20.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 20:08:07 -0700 (PDT)
Date: Wed, 4 Aug 2021 23:08:06 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 0/3] Disable vhost device IOTLB is IOMMU is not enabled
Message-ID: <YQtWFvHThLTILA1B@xz-m1.local>
References: <20210804034803.1644-1-jasowang@redhat.com>
 <YQq7h0OWlmQ+mX8z@t490s>
 <b401ebf7-9352-41a4-6cce-eada140d4d31@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b401ebf7-9352-41a4-6cce-eada140d4d31@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com, Wei.Huang2@amd.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, Sriyash.Caculo@amd.com, pbonzini@redhat.com,
 chao.gao@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 05, 2021 at 09:46:10AM +0800, Jason Wang wrote:
> > For the long term we may need to think about making device creation to be not
> > ordered by user cmdline input but still has a priority specified in the code
> > itself.
> 
> I fully agree.

I'll see whether I can work on that in the near future.  Before that, no
intention to block this series. :)

Acked-by: Peter Xu <peterx@redhat.com>

Will keep you in the loop if there will be something.  Thanks,

-- 
Peter Xu


