Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428264B09FD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 10:51:21 +0100 (CET)
Received: from localhost ([::1]:54194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI66h-0005R4-Sz
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 04:51:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nI62d-0004JZ-JK
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 04:47:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nI62Z-0007oZ-Eo
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 04:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644486422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ULaY+VXVMm6bANSo/hom9i6wtEhJUUl5QfBp3m4Svr0=;
 b=aO3Oh96zKIcMX2lr5VNyGZdJd4vuI+XkOZulk7Y2rWhtSk7vNgfu+8bn7veMU0PvM1P2NJ
 vsnnkuXe1jie7+HihL1jdCwG8GB59jSN4w2h5TF3l6355l/Zqn+hC8xbaxeAJlqSElkGqN
 pIfB7eo9b3nDLZokSEuk8iQexTQtvo8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-mn5iUUmjMRuIqa5Jff593g-1; Thu, 10 Feb 2022 04:47:01 -0500
X-MC-Unique: mn5iUUmjMRuIqa5Jff593g-1
Received: by mail-pj1-f70.google.com with SMTP id
 j23-20020a17090a7e9700b001b8626c9170so5848539pjl.1
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 01:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ULaY+VXVMm6bANSo/hom9i6wtEhJUUl5QfBp3m4Svr0=;
 b=e/zCiEPL45uF6XuHcYIzPIRwWWOY9Z9+/7wzj+FVmK9VeFn8wM1wvgJJEZmMZA+Glr
 FzU0vib+JFZcG50GLeLKsunLsUDnurEcznpGm4quLXR4LW9XQAT3goF6V8M8pyC617c0
 UESabCWJRGC1nsHA8wgvm3lyvbuztVMQjwVSxBoAbRbXhHEb8ECjt/vY+908tGqRj8a6
 WpG3hWcHhY6eP0eNINpHiY2RQZAcsRkLtAfiD/9Gh5+IkMHUOCgtOXn6UZXt4IUj0ivP
 bvcooubv24ns67pMqzs+uYtl/2KMzQPYtWbzdRz2sRNgNnPIlQPO/ptJiur/TbjEVQQ9
 RBbQ==
X-Gm-Message-State: AOAM533G+7JYKjzInqf96UPUk/0XRH/2PCjsW0KOcudsPGrKcHoq0XHZ
 rWOnrrHE1iMUpm6EfzwawfroFFM2ysXGgt27ss3i73kjss9aYa0ETwDGM8XH3SP3b7NoKOnF3Yz
 LDsDHkKTC6QjgJPY=
X-Received: by 2002:a62:80d3:: with SMTP id j202mr6618531pfd.20.1644486420256; 
 Thu, 10 Feb 2022 01:47:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFm7qVqhXeTk00hUjrV5AJ0Tsd4AVMxzatp5vZCCXQawynFxE/nqZ72XtZPW6OhS3azetohA==
X-Received: by 2002:a62:80d3:: with SMTP id j202mr6618519pfd.20.1644486419977; 
 Thu, 10 Feb 2022 01:46:59 -0800 (PST)
Received: from xz-m1.local ([94.177.118.72])
 by smtp.gmail.com with ESMTPSA id c8sm23630243pfv.57.2022.02.10.01.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 01:46:59 -0800 (PST)
Date: Thu, 10 Feb 2022 17:46:55 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 1/2] intel-iommu: remove VTD_FR_RESERVED_ERR
Message-ID: <YgTfD3Bo3GRy8gbH@xz-m1.local>
References: <20220210092815.45174-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220210092815.45174-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 10, 2022 at 05:28:14PM +0800, Jason Wang wrote:
> This fault reason is not used and is duplicated with SPT.2 condition
> code. So let's remove it.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


