Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B1A44BE27
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 10:58:36 +0100 (CET)
Received: from localhost ([::1]:45162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkNH-0005D0-HZ
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 04:58:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkkLB-0003jf-7j
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:56:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkkL8-0000LY-L7
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636538182;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=jglwM+hnVOK+5hld4cE0/+ty/YardHgkGBp4m7SvVFY=;
 b=A0zr0lDe2qyyxd3ukxip1u6xhfC2uNJXTUrtwKUx71yCs24lECaoMUODwIz2yklQaMQlmo
 DE5jtaccWpwyzmkhER0xIxhyMIt/eSSKq5OtB5HsglWCWpKKwIL99a4+ZdXY/cXknG031i
 5Nao62fE3QX+SAaFzytvns0zVY5C/4g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-X6K45no2OcuwYydi6zbKvw-1; Wed, 10 Nov 2021 04:56:20 -0500
X-MC-Unique: X6K45no2OcuwYydi6zbKvw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so951818wmq.9
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 01:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=jglwM+hnVOK+5hld4cE0/+ty/YardHgkGBp4m7SvVFY=;
 b=l7CACZoi94UOKGyn00AOPe4nItLfz4eylhipVfizyuGvgztXAtOXOBNC97/FJQ5UpZ
 DxatDk1xzOsk+eHwrpZBPHgxOP9p54QGl75kQf62XNR5dLJmDZGIMPlQKQFVW0dtdjI8
 U7AuNzAytAKwgVrFphJbDHJaf+gfJ743xwUbumfkg8b6F/NL3fQuOktNsKWYX7DPrDVl
 DKh2CPR9Chd8jnv8CaJrBG1VTWm3vMQQloZ/0l1jwicFvAEkd9h0lGlaySnfzX2+bYtl
 bPRsxXWysRPRUDHPmFaeBZsbppK1rlYZsBxbDdvnIiuy/tEz0YFq8W90Rh1PuYCfRD25
 Vwjw==
X-Gm-Message-State: AOAM532a+0Jbw13IBIjFiM7yd9eHrcZQ815O2UaOIfoq9o/+PTFrgf98
 vUcW0NH5nqJ2GCCVKkPG6WtQciORcUBl+bPQBy4hs5MufiI0xfNdLVQ4ISPQf/dU6mVc29ZBA7K
 cgw1Ah1gDinVMlBk=
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr17424010wrn.318.1636538179684; 
 Wed, 10 Nov 2021 01:56:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyb/AUY/CWT7mxFA+YXj9cGsLpaO1yxonhFKAWGmGbqV9uC8xUHzF+43xlfxZjJRstI1BDGA==
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr17423994wrn.318.1636538179518; 
 Wed, 10 Nov 2021 01:56:19 -0800 (PST)
Received: from localhost ([178.139.230.94])
 by smtp.gmail.com with ESMTPSA id f6sm5168631wmj.40.2021.11.10.01.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 01:56:19 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH 2/2] migration/ram.c: Remove the qemu_mutex_lock in
 colo_flush_ram_cache.
In-Reply-To: <1636533456-5374-2-git-send-email-lei.rao@intel.com> (Lei Rao's
 message of "Wed, 10 Nov 2021 16:37:36 +0800")
References: <1636533456-5374-1-git-send-email-lei.rao@intel.com>
 <1636533456-5374-2-git-send-email-lei.rao@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 10 Nov 2021 10:56:17 +0100
Message-ID: <87a6ic2v26.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, chen.zhang@intel.com, zhang.zhanghailiang@huawei.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Rao, Lei" <lei.rao@intel.com> wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
>
> The code to acquire bitmap_mutex is added in the commit of
> "63268c4970a5f126cc9af75f3ccb8057abef5ec0". There is no
> need to acquire bitmap_mutex in colo_flush_ram_cache(). This
> is because the colo_flush_ram_cache only be called on the COLO
> secondary VM, which is the destination side.
> On the COLO secondary VM, only the COLO thread will touch
> the bitmap of ram cache.
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

As we are on the softfreeze, I am queuing this on my next-7.0 branch.

Later, Juan.


