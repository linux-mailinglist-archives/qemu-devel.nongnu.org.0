Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC974672DA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 08:44:40 +0100 (CET)
Received: from localhost ([::1]:47874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt3FH-00059y-VX
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 02:44:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mt3DM-0004Rt-91
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 02:42:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mt3D7-0000BE-LY
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 02:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638517344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=czjVVWmeMP6Ef1cm79MYOyB2zq2wrN8kpoZwwYe5q3c=;
 b=dm+nE4otZEs1fT+zgHrNavR0qqVmbPo2NnxOa0B5B/0IisJPwk81YXUIFSu++uMagaAYuZ
 iuCBayKfYIITR2Mh9BnGuZY0o677JU239HT/9qAq89mzgSb1aFzzoC1xB3ADNx8PQ4yjMC
 rA1ZKBZEnAGfBPh3hdj+RR91WYxcdiY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-wXyZPxMOOFGkBnCmywMFnA-1; Fri, 03 Dec 2021 02:42:21 -0500
X-MC-Unique: wXyZPxMOOFGkBnCmywMFnA-1
Received: by mail-wr1-f71.google.com with SMTP id
 q7-20020adff507000000b0017d160d35a8so399662wro.4
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 23:42:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=czjVVWmeMP6Ef1cm79MYOyB2zq2wrN8kpoZwwYe5q3c=;
 b=0Hbt1m22XC7s75DTrc/9xhcn++DLVFerfCOfySSv1IzK0DL9AF0aXQBtIUN5REItdu
 5Qoom4EXuNbokW0X0Mx2UViikOmizl3Ubaf3I/F4ewGwBLeUHtg359SKtHe5jE0Z9o6s
 pl17hhrwG9NA2Ibcr3yaRB9qcC3z3mYCKrm9HBpoT/6fcnnZjlXznF1u0lncCEfxgqWL
 KI076O0bNM8GI0RMWjxNha+HDlNV2gsvUIrYEOlrslbzAVVgxqbG6PEEAtvxOEQzOILH
 rGqGU+Q8TXD93f92mlhVVRI3XnQpDMoaanecKozNdA92B5N3sX4fL3quKai5rKB3fboM
 54nQ==
X-Gm-Message-State: AOAM531S8HgP8AJxaQ5BlEbNGkMkTWZvd/YghbYKUOxCoUazMXzyMq1A
 DD18A1eu+UeoxsBbKd3WuQWGyrm1dLvb86+mqiCsUlnmjLttMiZDO3MTE51Db1EIWuq5FBM4KyR
 +5S+etICvnZa6wHw=
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr12879858wmc.137.1638517340397; 
 Thu, 02 Dec 2021 23:42:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFUBxZ9NvEvZTrDHO3e0J9qzGxHutyGsmHTXqN4JEIRETEAO47Art0r6h0hZ0oZHINaNlu2A==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr12879834wmc.137.1638517340196; 
 Thu, 02 Dec 2021 23:42:20 -0800 (PST)
Received: from xz-m1.local ([64.64.123.26])
 by smtp.gmail.com with ESMTPSA id p27sm1763533wmi.28.2021.12.02.23.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 23:42:19 -0800 (PST)
Date: Fri, 3 Dec 2021 15:42:14 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/2] intel_iommu: Only allow interrupt remapping to be
 enabled if it's supported
Message-ID: <YanKVrNFRq/BO5Ew@xz-m1.local>
References: <20211201205113.57299-1-dwmw2@infradead.org>
 <20211201205113.57299-2-dwmw2@infradead.org>
 <CACGkMEvtrVX8uWciiVfYpBNsaAwRAfP_P4Ja3T4Axvn47WdzNw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvtrVX8uWciiVfYpBNsaAwRAfP_P4Ja3T4Axvn47WdzNw@mail.gmail.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 02, 2021 at 11:53:25AM +0800, Jason Wang wrote:
> On Thu, Dec 2, 2021 at 4:58 AM David Woodhouse <dwmw2@infradead.org> wrote:
> >
> > From: David Woodhouse <dwmw@amazon.co.uk>
> >
> > We should probably check if we were meant to be exposing IR, before
> > letting the guest turn the IRE bit on.
> 
> This looks correct, but it's a change of guest noticeable behaviour.
> It's probably fine since we don't expect a guest that enable IR
> without checking ecap.

Agreed.

> 
> So
> 
> Acked-by: Jason Wang <jasowang@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


