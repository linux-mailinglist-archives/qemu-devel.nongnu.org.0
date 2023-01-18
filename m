Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EA4672932
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 21:23:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIEwS-0002Tx-C8; Wed, 18 Jan 2023 15:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pIEwP-0002Tp-BV
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 15:21:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pIEwO-0005jh-1F
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 15:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674073306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZDeePEzOP9v3tWFfwD1fMjud/8zfpNnbwv600jutBWo=;
 b=H7ajiP6OZ8kf1XdizO7ghSNur3D+dOo0f82ZYX41pNJ6uWS9BzxOB1PhUqq0pFCSM8CCox
 iMayjP8FRqTReErChJd81KfTGvyWpZxflRDIeGGOjrmbfwWI3AObFtTPrbWEkpYmZty0Ac
 cda2P/NnAs0QzyfwQlPhbXxPZaBj0zo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-209-oSVZu1KXNeab3D9bwaeb_A-1; Wed, 18 Jan 2023 15:21:45 -0500
X-MC-Unique: oSVZu1KXNeab3D9bwaeb_A-1
Received: by mail-qk1-f200.google.com with SMTP id
 h13-20020a05620a244d00b006fb713618b8so153356qkn.0
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 12:21:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZDeePEzOP9v3tWFfwD1fMjud/8zfpNnbwv600jutBWo=;
 b=cGXBXaQp9/EHrLTkyHbiVCm8q6O5bomArVYTo+rAfH2gHLyHNcbE/h8FNL4UdPhNXU
 E61bYtWEQ3u/8LTvzFldhf/TtkIVqJDpRkIXjBYOxp+Lvln2NbrDYq2mVv1EUgofDs8o
 eUWswwIMI5CdW9oRCoypSV27REKCCagD8DJ698Bj3VwOTDUO9gbutTvmcAnqQ9kpQIJa
 YTaSekkExdbSoOGYMg2FoOhbySrg47a/LXmoYeGjwhR0KBk8xHMk7MRDsnCIyPmj8WTv
 HDpkv3BsNg1scVWjONy8m8VIfkZQ94/V6Uu/GnJXUxMybsQytO0A1yhkZAUXwMaX3S/h
 76hw==
X-Gm-Message-State: AFqh2krLbz86qaSkfVPD6lF7Mj+2eOJ+C6vCCbcRx1nlKTw5LHFi4UMz
 fvzJ6CdYTBqTZHBFnhjWHqG/oViCqjlE+wMOcQj8U74RkqAX3uj54ppviAM1W6A3SKz2V+tDp4F
 cAemodBxcla6hr3c=
X-Received: by 2002:ac8:70d1:0:b0:3b6:3577:2fe6 with SMTP id
 g17-20020ac870d1000000b003b635772fe6mr10776482qtp.31.1674073304341; 
 Wed, 18 Jan 2023 12:21:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsu91VjwxZjDbTuX6GgTf1n3CqKZc4lmh51Yx5dqNsbvTnL9khZQasb0SK5noX2xbtAffsRdQ==
X-Received: by 2002:ac8:70d1:0:b0:3b6:3577:2fe6 with SMTP id
 g17-20020ac870d1000000b003b635772fe6mr10776464qtp.31.1674073304077; 
 Wed, 18 Jan 2023 12:21:44 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 fb12-20020a05622a480c00b003b63c9c59easm2826911qtb.97.2023.01.18.12.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 12:21:42 -0800 (PST)
Date: Wed, 18 Jan 2023 15:21:41 -0500
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 06/21] madvise: Add QEMU_MADV_COLLAPSE
Message-ID: <Y8hU1SIkgQTx6OcA@x1n>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-7-peterx@redhat.com>
 <Y8g/myM8JfJHB4S7@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8g/myM8JfJHB4S7@work-vm>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Jan 18, 2023 at 06:51:07PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > MADV_COLLAPSE is a new madvise() on Linux.  Define it.
> 
> I'd probably have merged this with the MADV_SPLIT one since they go
> together; but also, it would be good in the commit message
> for Qemu to include either the definition or a pointer to the kernel
> definiton of them.

Will do.

I don't have good links for them yet because both of them are still not in
upstream man-page project.  Even THP version of MADV_COLLAPSE man page just
got added into the man-page repository in Nov 2022 so most of the websites
that host man pages won't even have MADV_COLLAPSE..

For now I'll add some more paragraphs trying to explain everything, and
I'll also link to madvise(2) where both of them will be discussed in the
future.

Thanks,

-- 
Peter Xu


