Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616514FE8A0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 21:28:35 +0200 (CEST)
Received: from localhost ([::1]:50550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neMBm-0003Mc-3Y
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 15:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1neMAA-0002BK-DW
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:26:54 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:40450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1neMA8-0004Xp-Cr
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:26:54 -0400
Received: by mail-lj1-x230.google.com with SMTP id m8so7873518ljc.7
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 12:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uhp2gyxJXafqQhufiyepsQB0fVUjcBdyLXTovCl6zhk=;
 b=5r3BqAvHHqrB2sxGTnYHVAS69nI4KU7prcQCYLC+0giVYjXTuDzbhcWunmrmixMgiI
 l6KAoj+O6vndDV8nCt3/S5YfZKl20CFaNrJbcc41X99anlIpoxpW/y7x7Y1M8Moxl+/V
 1/swlz2HX63Q+NBEhUfmJQEpWAJDocdiEL2YUckMfpe3C8nZcla3i0xFsf7D/9DkQ9ru
 eAJG41WiqDv83Av6IuPIHFgdRnfdlNyaK+rskTFa67tR2m82ZCspiqGtd/RBP6s+qYm3
 8gfkf6bS7/JwsfLxy6EmCDw65cudX7DLbyf2e7vFavB5H90QMXcKGJMnj7FuirippGU7
 eNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uhp2gyxJXafqQhufiyepsQB0fVUjcBdyLXTovCl6zhk=;
 b=vv0eS/tSRkmoiexaOlKNpxkPNeanfKdQDvNfyj4gqB8eIqeCSfwgq/wPgiD9sZZQ0Q
 NkxqKY5IiJV48Z0eATYkp4tiYIAXZ7gc4p31iABV1k+tptBFWMotEFt7C4tA4KyFsGB2
 KDQa7jVrogeAMvR0PpiO86IOaHzy3cvDpFTdnwcXUYeRV488jEVy2fzobVLdTfzlVceV
 5yLb8NmkL9b3R+2dXf9+axUVwkXIObAJMMr7hxJIraWdeUqhJ6bnm0Aghf8HC5kEdnVT
 JhW/dUK2gh23cp0tc7WIW9LqfTu3RbiKkkPzmzCcC76ZhJXSPibU3FvPQF+98vLEgQtc
 wi6g==
X-Gm-Message-State: AOAM532ycGNotk2O4DpmXhOe7Oy1w3oB0trZi6qaQ/a4NugVRfopUbiC
 +UaafLp2sFDa6kLZtg4cRDpCsA==
X-Google-Smtp-Source: ABdhPJzNqQFsr22ki1Pj8rD15MClx6e4/Y9XgiO6Rr06pMklFiRq4YmMNE+KUcyBNh7zLIW+Z44IOA==
X-Received: by 2002:a05:651c:1a09:b0:24a:c7df:339c with SMTP id
 by9-20020a05651c1a0900b0024ac7df339cmr25219403ljb.298.1649791610046; 
 Tue, 12 Apr 2022 12:26:50 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a056512055300b0046bb9a59e13sm309392lfl.56.2022.04.12.12.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 12:26:49 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 72EEB1030D2; Tue, 12 Apr 2022 22:28:21 +0300 (+03)
Date: Tue, 12 Apr 2022 22:28:21 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Chao Peng <chao.p.peng@linux.intel.com>
Subject: Re: [PATCH v5 04/13] mm/shmem: Restrict MFD_INACCESSIBLE memory
 against RLIMIT_MEMLOCK
Message-ID: <20220412192821.xliop57sblvjx4t4@box.shutemov.name>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-5-chao.p.peng@linux.intel.com>
 <Yk8L0CwKpTrv3Rg3@google.com>
 <20220411153233.54ljmi7zgqovhgsn@box.shutemov.name>
 <20220412133925.GG8013@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412133925.GG8013@chaop.bj.intel.com>
Received-SPF: none client-ip=2a00:1450:4864:20::230;
 envelope-from=kirill@shutemov.name; helo=mail-lj1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 12, 2022 at 09:39:25PM +0800, Chao Peng wrote:
> On Mon, Apr 11, 2022 at 06:32:33PM +0300, Kirill A. Shutemov wrote:
> > On Thu, Apr 07, 2022 at 04:05:36PM +0000, Sean Christopherson wrote:
> > > Hmm, shmem_writepage() already handles SHM_F_INACCESSIBLE by rejecting the swap, so
> > > maybe it's just the page migration path that needs to be updated?
> > 
> > My early version prevented migration with -ENOTSUPP for
> > address_space_operations::migratepage().
> > 
> > What's wrong with that approach?
> 
> I previously thought migratepage will not be called since we already
> marked the pages as UNMOVABLE, sounds not correct?

Do you mean missing __GFP_MOVABLE? I can be wrong, but I don't see that it
direclty affects if the page is migratable. It is a hint to page allocator
to group unmovable pages to separate page block and impove availablity of
higher order pages this way. Page allocator tries to allocate unmovable
pages from pages blocks that already have unmovable pages.

-- 
 Kirill A. Shutemov

