Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CDB4FC10B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:38:45 +0200 (CEST)
Received: from localhost ([::1]:34208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndw7o-0004XN-Sd
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1ndw0T-0001oD-C6
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:31:12 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:39919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1ndw0O-0006W8-5p
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:31:08 -0400
Received: by mail-lf1-x129.google.com with SMTP id y32so27323751lfa.6
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 08:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xjS2P4qPRuklgAWHvx4nddXDONB01ig+sjZdob2rUZw=;
 b=FV3bsbjWahU5dJ0sji7/IJLbsnx56//V4Rko+5Sg47dXy4c+ztKWDHA1RNVD7WvPgr
 yK/qGVOHKnh25F0KE05KBV9H1r9OI30310p5PG2PDV1Va+D7E+zBPyJQ3GLPd+ArztSz
 lrPNi8EiBdyRuWMQK80WfVgqDFmgS3k2Y9eK88CTC7O93hqJ35i8F5cEA6skMGujcbeA
 8BD+pN6zgnu4xfwTVNBKJBt2m4qBDjJnaxI/fb85Yf6i+HshEOjYKqNAq3V5w99m67cG
 eL4nyyZ+vUt0LJJW9FtrCg8OMzKVImZqDlCviEztwjVLYF/N6A1zGFbLaP9VZXnGa6f8
 0s/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xjS2P4qPRuklgAWHvx4nddXDONB01ig+sjZdob2rUZw=;
 b=Pfy7SBqlp0U1k7cKsr8+PlmW8+9kuWRPGyFviASyUoMoWjP2xo1D5c1C3OuXSZJNDt
 WplIviqYEcgA1Pqyj/sHbYe1OvVKER+kWJr3CXo+n/40qM4GIEhjwJI9lssGwHivUGd0
 SHT5s7/xBub3tqsm2Rp2rKO5pRs72mFMarCEzDwQKsBgJgicHmKH+AbdKGn3uTbyECtc
 TRmrbmYVt8v+8wbKwRpj4qwyrPlUErN0UTEoImb+ugur9jQ92UhtYYNyOUpn1eJOzsDH
 uQ1eJDwwXBrAiCooyw0jo/AhcnlnV69g0to5uFN+gldnxji0Yo/wVbzkt1qyucuj9NlM
 PP5w==
X-Gm-Message-State: AOAM532tHfgRUBjYOTQWZHGFgkc+8XjLZWZp5bohYzg3FEBLrRUV/OC3
 WAXpGUqp1o2dsVcQY3gwMcEEiA==
X-Google-Smtp-Source: ABdhPJyyKel4+BxKnE8zItkwufzaPuu1o/Qdf3y9wLaeW/pMks9H6z/sxphXdamwlvCAG9JGwj2NPg==
X-Received: by 2002:a19:674c:0:b0:448:3f49:e6d5 with SMTP id
 e12-20020a19674c000000b004483f49e6d5mr22543031lfj.518.1649691061797; 
 Mon, 11 Apr 2022 08:31:01 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a05651231c400b0044ac20061ecsm3351801lfe.128.2022.04.11.08.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 08:31:01 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id BF102103CE0; Mon, 11 Apr 2022 18:32:33 +0300 (+03)
Date: Mon, 11 Apr 2022 18:32:33 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v5 04/13] mm/shmem: Restrict MFD_INACCESSIBLE memory
 against RLIMIT_MEMLOCK
Message-ID: <20220411153233.54ljmi7zgqovhgsn@box.shutemov.name>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-5-chao.p.peng@linux.intel.com>
 <Yk8L0CwKpTrv3Rg3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yk8L0CwKpTrv3Rg3@google.com>
Received-SPF: none client-ip=2a00:1450:4864:20::129;
 envelope-from=kirill@shutemov.name; helo=mail-lf1-x129.google.com
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
 "H . Peter Anvin" <hpa@zytor.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 ak@linux.intel.com, Jonathan Corbet <corbet@lwn.net>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Steven Price <steven.price@arm.com>,
 Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, linux-api@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 07, 2022 at 04:05:36PM +0000, Sean Christopherson wrote:
> Hmm, shmem_writepage() already handles SHM_F_INACCESSIBLE by rejecting the swap, so
> maybe it's just the page migration path that needs to be updated?

My early version prevented migration with -ENOTSUPP for
address_space_operations::migratepage().

What's wrong with that approach?

-- 
 Kirill A. Shutemov

