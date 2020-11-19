Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1A92B9C1A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 21:34:22 +0100 (CET)
Received: from localhost ([::1]:40750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfqdJ-0002LZ-U5
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 15:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfq9g-00029s-SY
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:03:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfq9W-0002x7-81
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:03:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605816175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u8mDCgkESM8bT9A0icfuuAjUuXv27LB9x4QbScDEJOM=;
 b=CWW+8AATo0ENyUTYPgorNVObhcGtzSorDlgrmV9//L+d/RsJIiirD9hRrjhx+gioijdLpj
 VESxGlHBGR3nya97SkPxsdkNSvJLoetruiAT5RZ798iLiE0NrhLu1Ha1Q3eNiGCopcSwlq
 5Hvs3FBo9p3X4Gibj0C9DG6kFeolAPE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-yVNYkHlgO9irxqntzWOXCQ-1; Thu, 19 Nov 2020 15:02:54 -0500
X-MC-Unique: yVNYkHlgO9irxqntzWOXCQ-1
Received: by mail-qk1-f200.google.com with SMTP id f9so5967529qkg.13
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 12:02:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u8mDCgkESM8bT9A0icfuuAjUuXv27LB9x4QbScDEJOM=;
 b=FA1JpCLrCkLnFvLFJW9FzTGe51GFkZ687mjlpai1tv9tkBti9BpUFHBPVP9vsVipAQ
 U++qlNxjfOO2f3QBQ/5VVfPmsNBf7/S0IQKCox4yeKKE6kMMA/XgijX51pZPz3cu2y6U
 d6OIpAhiWoUspD1W5dE75cXGvm5uAjtcLnuG+mekpM9MxdKQdBE9372ykTYuLbVbhD6h
 YzfThgdo4FjHlZOvvfjyrrudyKypX6IMoQriFHmLg3obSt6FW8Uq0iquVNu8VNkRpEBO
 pL2ftK0GJXJ5Y13kqwOaN+yhePZFi+4ot8Ht/z7i28XSpC2zc8wxgD25N16sLulGFRZF
 nJDA==
X-Gm-Message-State: AOAM533UaOWC9aD7cNZq2r5qVQ1EtXa6cxjTrqXegFoCo0V9G5o8oJcg
 TEv4ggtfYsyPBHT2Ar8MtTzVU63tQhNlbNgkgHpdJminxWQE+bafKMiwU01IdseWOg/k5MDf+Up
 kZvZwzOtI9Tkot8U=
X-Received: by 2002:ac8:71d5:: with SMTP id i21mr12675948qtp.4.1605816173623; 
 Thu, 19 Nov 2020 12:02:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWeRnqC++S6GNl/TIC+Ik6oRPZv7HoGmfGgUPZlUq2sp6fI8AB+Zj8+rHh6LOUeEvVdjzt2A==
X-Received: by 2002:ac8:71d5:: with SMTP id i21mr12675924qtp.4.1605816173366; 
 Thu, 19 Nov 2020 12:02:53 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-196.dsl.bell.ca. [174.93.89.196])
 by smtp.gmail.com with ESMTPSA id x72sm611434qkb.90.2020.11.19.12.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 12:02:52 -0800 (PST)
Date: Thu, 19 Nov 2020 15:02:50 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v3 7/7] introduce simple linear scan rate limiting
 mechanism
Message-ID: <20201119200250.GH6538@xz-x1>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-8-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201119125940.20017-8-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 03:59:40PM +0300, Andrey Gruzdev wrote:
> Since reading UFFD events and saving paged data are performed
> from the same thread, write fault latencies are sensitive to
> migration stream stalls. Limiting total page saving rate is a
> method to reduce amount of noticiable fault resolution latencies.
> 
> Migration bandwidth limiting is achieved via noticing cases of
> out-of-threshold write fault latencies and temporarily disabling
> (strictly speaking, severely throttling) saving non-faulting pages.

Just curious: have you measured aver/max latency of wr-protected page requests,
or better, even its distribution?

I believe it should also be relevant to where the snapshot is stored, say, the
backend disk of your tests.  Is that a file on some fs?

I would expect the latency should be still good if e.g. the throughput of the
backend file system is decent even without a patch like this, but I might have
missed something..

In all cases, it would be very nice if this patch can have the histogram or
aver or max latency measured and compared before/after this patch applied.

Thanks,

-- 
Peter Xu


