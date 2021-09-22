Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D01F414746
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 13:06:35 +0200 (CEST)
Received: from localhost ([::1]:39776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT05B-0003dD-Kw
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 07:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mSzzO-0007iK-FP
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 07:00:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mSzzG-0004jK-AE
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 07:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632308424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zmVUCLukFP0RX/fcwuluzxxUOxqq4lbZ86ktkecuK08=;
 b=T5p5RIzq6RTEuAzvZz/nxn/I5BY4vTTQmh5J3wjtdvhMp2hhpJ/4umLxAoZpmudgaDDDfE
 Q4c31JA2c6OHCsURhg+m9Er78UZv9Fmes1XH6aC4hOezNu7wE0trZOSWKFWEZAZeSo0yc0
 wKmAw2FDfJkfA9/2NNQxOUcOrdbp3SA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-8jz08JDnNR-2zHLUSLekWw-1; Wed, 22 Sep 2021 07:00:23 -0400
X-MC-Unique: 8jz08JDnNR-2zHLUSLekWw-1
Received: by mail-wr1-f72.google.com with SMTP id
 j16-20020adfa550000000b0016012acc443so1779139wrb.14
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 04:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zmVUCLukFP0RX/fcwuluzxxUOxqq4lbZ86ktkecuK08=;
 b=QZhesqcXtODX0NpGh/17K7qDr0y/SE/qVHKSEo5E+CRcaLbypBl2hI9lYva12o7Shz
 531kw4FDsCwcxc0RILv1Z+mk4BsqDhCc9HaLzHJbo/ud5pu2YJtxV/EBeFv1YO3TiuD0
 3eDhzwuBegiw7FBpPSr5fN/ouX1f5mDSkV+bf7YRaCF8swW5EXssgsUwq8vO5s/JJoU8
 905gWsk4Hd6oyWdqbe+Ej279bSSG8O8tMEE+oCGKcA5Ch8rij2/zy9huXCk0P5jcnfRM
 cBPK2Z0wk8Wn71doRa4lk860wJR88myxKUBmY5FZ3B+3Wnwx6X6LYCaEuX5U5Ocupziu
 zt2g==
X-Gm-Message-State: AOAM5335whlkMejFCrlik5XztdvsmEjhV6RBT3J4HAWDct0FxLIF+VGo
 4MSztmLxNNp57terpbNSb1YLdo4z7Comhp3cBcr1URcYlaZ1N3RjokeaKpHJIC8fJIN3v1DKMFE
 RyDKsjo2D/SjAzd4=
X-Received: by 2002:a05:600c:b47:: with SMTP id
 k7mr9749762wmr.103.1632308421908; 
 Wed, 22 Sep 2021 04:00:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlpG44e9h/ZFYs/Nt2RCXcBoh71MOCwl/EivebKID85h5TArnNbgqfkJJAOe6BfnMoZbuPZA==
X-Received: by 2002:a05:600c:b47:: with SMTP id
 k7mr9749749wmr.103.1632308421745; 
 Wed, 22 Sep 2021 04:00:21 -0700 (PDT)
Received: from work-vm (cpc109011-salf6-2-0-cust1562.10-2.cable.virginm.net.
 [82.29.118.27])
 by smtp.gmail.com with ESMTPSA id d2sm1851575wrc.32.2021.09.22.04.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 04:00:19 -0700 (PDT)
Date: Wed, 22 Sep 2021 12:00:17 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 0/2] virtiofsd: Add capability to block xattrs
Message-ID: <YUsMwfZI3sQyT/Rj@work-vm>
References: <20210826211937.317558-1-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210826211937.317558-1-vgoyal@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> As of now we have a knob "-o xattr/no_xattr" which either enables
> all xattrs or disables all xattrs.

Hi Vivek,
  Thanks for this.

> We need something more fine grained where we can selectively disable
> only certain xattrs (and not all).
> 
> For example, in some cases we want to disable "security.selinux"
> xattr. This is equivalent to virtiofs not supporting security.selinux
> and guest kernel will fallback to a single label for whole fs
> (virtiofs_t).
> 
> So add an option "-o block_xattr=<list-of-xattrs>" which will allow
> specifying a list of xattrs to block.

This is quite interesting; I'd not noticed you had the exisitng blocking
mechanism, however, as discussed, I think my preference is if this could
be done as a modification of the xattrmap it would avoid another set of
options.

The mapping code already has 'type's of:

  prefix, ok, bad

I think you just need to add a 'reject' type
that produces the error code you need.

Dave

> Vivek Goyal (2):
>   virtiofsd: Add an array to keep track of blocked xattrs
>   virtiofsd: Add option "block_xattr=" to block certain xattrs
> 
>  docs/tools/virtiofsd.rst         |  17 ++++
>  tools/virtiofsd/helper.c         |   3 +
>  tools/virtiofsd/passthrough_ll.c | 166 ++++++++++++++++++++++++++++---
>  3 files changed, 171 insertions(+), 15 deletions(-)
> 
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


