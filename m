Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A81F27B146
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 17:57:33 +0200 (CEST)
Received: from localhost ([::1]:55894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMvWt-0006Pg-58
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 11:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kMvQo-0003W4-IG
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 11:51:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kMvQm-0001xU-GF
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 11:51:14 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601308270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gdCBf3vIjgHAa8AaiCt7MkZ25IjTuGIAq0JKL51L/nY=;
 b=FShafot53XC1PhmwCMaywzpvitQWrA7Z9jFYbE6QgV2hbSCeXakun5zvH7JjHq57ck4FZm
 1kUEsN0dIQRkElBZmc8xEj3xX1FzhqzGypKAPRGLGsPkEtnL917HYYV2937b5B66+cJxcL
 Sh0KNeb+QXoMk1jgn5jnuYTwNJhwoq0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-AF32lWnCNKKumJL0t6Acdg-1; Mon, 28 Sep 2020 11:51:09 -0400
X-MC-Unique: AF32lWnCNKKumJL0t6Acdg-1
Received: by mail-qv1-f72.google.com with SMTP id r16so835741qvn.18
 for <qemu-devel@nongnu.org>; Mon, 28 Sep 2020 08:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gdCBf3vIjgHAa8AaiCt7MkZ25IjTuGIAq0JKL51L/nY=;
 b=ngzp2JtIDyXRlISX+sEPFMfzKJRmd9bThh1EO4THwM9SgYKjRW8OcCKVVU/zo7cZpG
 akFSHpoTrYPgxSWZVUvuOG5HXXOX6kFERlwDi9v1dLJ2XHQNjTasHApiMl3waggL2IVF
 FEeARn+gM8DmRsdchm5ZEHdIhLKAggfGsyiSVooS0JuhF+64x3HRm3GSnqNWWqsjnQ6K
 RPWC4fKeBBCpL1Lng1KLRCunYVpquUBB1goeGrfNFw1ubUwef1wEXt4EZokWNxM+Hp+C
 juqKpNmkNM7omPB+8vyUbvMS89pqIj15FcD5IkVeKA22+DD57pCLu96i6GFLvIZ6RSI5
 pozg==
X-Gm-Message-State: AOAM531KDmRYfZnPuHXGmBAxDy1Ocwb5H0oQ7jhG8buUqPjgDOPih7Af
 3mbq2TjjZ1VzuA3hBR9/NeZngvq0awBx/OEWe2TRJvzZGeVkMs5D+1aAKlwnyCwcr/PcQ83sorr
 i5EsUJEhpXp839dg=
X-Received: by 2002:a37:7fc3:: with SMTP id a186mr41401qkd.381.1601308268898; 
 Mon, 28 Sep 2020 08:51:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhFUvIkxyNLly5Uvxkt/MZZEQxqHIo0D4NFe6xcgNj0yVEL+JwMBPJcAxgFuVOIqrq74mTfg==
X-Received: by 2002:a37:7fc3:: with SMTP id a186mr41371qkd.381.1601308268635; 
 Mon, 28 Sep 2020 08:51:08 -0700 (PDT)
Received: from xz-x1 (bras-vprn-toroon474qw-lp130-11-70-53-122-15.dsl.bell.ca.
 [70.53.122.15])
 by smtp.gmail.com with ESMTPSA id 134sm1498899qkj.53.2020.09.28.08.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 08:51:08 -0700 (PDT)
Date: Mon, 28 Sep 2020 11:51:06 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PULL 1/1] Revert "migration: Properly destroy variables on
 incoming side"
Message-ID: <20200928155106.GC5904@xz-x1>
References: <20200928152024.209894-1-dgilbert@redhat.com>
 <20200928152024.209894-2-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200928152024.209894-2-dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:47:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 28, 2020 at 04:20:24PM +0100, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> This reverts commit c02039a6f3730ddcf683a0ba9a175688c6db71a0.
> 
> This is breaking test 068 that does a loadvm twice.

This is exactly something I'm afraid of happening... :-(

Though for the long term in the future, ideally maybe we should just forbid
loadvm for more than once (restarting a QEMU instance won't hurt, afaict, or we
really need to be careful on the whole loadvm path, I'm not sure whether
there's any other spots that we didn't notice that won't allow reentrance), or
we should provide some reset helper, so that we won't only destroy partially in
the destroy helper.

-- 
Peter Xu


