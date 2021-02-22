Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EAC321DF1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:19:40 +0100 (CET)
Received: from localhost ([::1]:52842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEErz-0006ra-2X
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lEEjy-00061y-2G
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:11:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lEEjo-0003bC-IF
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614013866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9y4QTIVdXDD7L74IaFVW6Nv8HjpdXC13KlyXL3+nAk=;
 b=g9QLEWT0uGiidcZVtcUPSZMS27pMLZ+0Bvqv/j3pwG22lqag/oo7E5p8sz865EQm0+aGe9
 /sugjzqyTjIQlvchhDNQu7++CD1oySUpe22WO7+j0R3Dl8aeacrLaErmXzLbEXhjQRwog2
 t+2xlN4Gk4S7C4DUFoXoNZ9hGZcCy7I=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-k3VErYmQOtilwHA6FbqomA-1; Mon, 22 Feb 2021 12:11:04 -0500
X-MC-Unique: k3VErYmQOtilwHA6FbqomA-1
Received: by mail-qv1-f71.google.com with SMTP id k4so8145907qvf.8
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 09:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=g9y4QTIVdXDD7L74IaFVW6Nv8HjpdXC13KlyXL3+nAk=;
 b=YRw0PEnJHZq/ks15HK0f12HuS+LBlGcdmPPVPPGlwV8zlo9G9kYVNnuOAxJq0ngcFN
 Kq8TyU1OlxHocgk+TmMfrswnHSCEKk40LnzRK7WxEwDzB2GCt3DbObNGUSaSVI0S5MLa
 TIkH7UbdU3jdpQdrMl2KLUWMuhReQmcc2j60+snZe0K72Yo0br6dDRec13XbeCQsIbLy
 UFujxAbVvYW4x3oBBF1sJ3yGWxA4O+BIPbbEfGrR5r/whdRi7bzAua9R4816a3ThbnDh
 fWLxrbqN36Qmg9ciJ1xcHAWaZ0mRvIOB9zCompnSXy16RGwp+xckP5+7DhMo1xVLUwGY
 9y8g==
X-Gm-Message-State: AOAM532LfI7xrWvR0Y5zme2mPVLINBmXw4+sIzYNZoXBi8xmuF0TAGgl
 1GxVo34vq9fp9i0naHoLEcBkIkSl58pSLB1tXUnv22xlVdwe7q67OXCFyCzFu50CEuDhUEvNaIh
 sgJPfbPDqR97IX88=
X-Received: by 2002:a05:622a:248:: with SMTP id
 c8mr20489903qtx.122.1614013864059; 
 Mon, 22 Feb 2021 09:11:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+jThffqto17HSyG/F8/Mw1VK+yf00CLSR7Lpa+k7kvhJjDbtVynaVnsXPiu7sXz4Yrt7IIQ==
X-Received: by 2002:a05:622a:248:: with SMTP id
 c8mr20489884qtx.122.1614013863811; 
 Mon, 22 Feb 2021 09:11:03 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id q204sm12894921qka.84.2021.02.22.09.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 09:11:03 -0800 (PST)
Date: Mon, 22 Feb 2021 12:11:02 -0500
From: Peter Xu <peterx@redhat.com>
To: =?utf-8?B?5rKI5qKm5aej?= <shen.mengjiao3@icloud.com>
Subject: Re: Any reason we need memoryregionsection
Message-ID: <20210222171102.GP6669@xz-x1>
References: <6E9673F8-73FA-4AF9-9BDB-75143B4DD57C@icloud.com>
MIME-Version: 1.0
In-Reply-To: <6E9673F8-73FA-4AF9-9BDB-75143B4DD57C@icloud.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 10:55:15PM +0800, 沈梦姣 wrote:
> Usually when we add memory region in the platform init process, the corresponding address range in address space will not overlap with others, I’m not sure in which case we should use MemoryRegionSection? Thanks 
> 

Memory regions can overlap, see memory_region_add_subregion_overlap() and the
comment above its definition.  memory_region_add_subregion() is actually
similar to that, but just set the MR priority to zero as default.

IMHO MemoryRegion is the major abstraction layer of the address range in QEMU
along with the bigger AddressSpace idea, while MemoryRegionSection is mostly
used as a temporarly variable to describe part of a MemoryRegion in many
contexts, so that this partial range information can be further consumed by
callers of a lot of memory APIs.

Feel free to have a look at commit 2177955a89 ("memory: introduce
memory_region_find()", 2011-12-20) too - that should be the place where
MemoryRegionSection is firstly introduced.

Thanks,

-- 
Peter Xu


