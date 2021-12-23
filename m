Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC0F47E775
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 19:09:39 +0100 (CET)
Received: from localhost ([::1]:33820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0SX3-0008I2-Pz
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 13:09:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n0SU8-0006QW-24
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 13:06:36 -0500
Received: from [2607:f8b0:4864:20::42c] (port=35655
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n0STw-0008Sr-Qm
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 13:06:27 -0500
Received: by mail-pf1-x42c.google.com with SMTP id v11so5918468pfu.2
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 10:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xAmKzIc+8wB6wpfnMshmg3i7fbLcnqAVF/wlNkzMihA=;
 b=tTF25W0YJCF52VxnCB1yX2ghBWLxGZJIFN7meLmiZtwzhBFTNeS4pdlakQJzZthEVV
 sLib2vBfvyhkW444CXX6MyhXs2FVrJSmeOjey8QRFwqmDwoI0MkwMyxaf45xTCz7swuh
 yaGi9nwJG/3GAVuVtArFcBEU9kicedJGmiVBsW7ZsGufu8H34zMzEZuJ5+H6/lkFUVog
 f40Y4Ji6HA1nAKyvbZErsgxVE2A//Nlu4SFhBhFcNJnt2EyxEDNQFqBtXLQT1MUqQX5+
 tlBhIpZNunp3NCHf4C/ZbsZkCUoAI3H1wY+Nke7l6nQDCrTpDid2y9cBURkBmzOpyS9T
 g8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xAmKzIc+8wB6wpfnMshmg3i7fbLcnqAVF/wlNkzMihA=;
 b=XAjofpF/mFAWILTFnsYv3+VJ+DQFt9gcCV6ll66VGzsDZz3JNT4kqzqZF9bZXHtgwt
 4rmr50PNRYERabhNYWI267fggT54COcEdLHpVG7l9G32xa+xakdilNnoLLPE4GEM/EPv
 66kxDpQbznIRpm1IkHwNTVRhzxgJgba3zFLIc2DVVnoOMS6VU7lSSBHI2JZXaGbJ6CTt
 UxCqjUrcnn9ocLLZY8ps146US8R6C9RNuTxgBXBzRibCXAp01pJI0ZCOow3L5+EIBHvW
 eEeaN2wDdTeksI6qqCNzKl/euziVYvsFnR+7HGZgff1oD7JYi6rSQsjwS8/9pPBCtcpA
 PnQw==
X-Gm-Message-State: AOAM532pe4LYvEviRnwocTEbzctLX0iS/zrAetXp6u/87Gm1NgEXw45c
 kGdnrePcyLD44i3t1810kCv4Aw==
X-Google-Smtp-Source: ABdhPJx8ZGtfl7eWpJl5BHdJwST1PNXKEmCce64dp3wTaCWQJvvaSUBLS2W1N1XEWNIx8vbJ5FtHxQ==
X-Received: by 2002:a63:787:: with SMTP id 129mr3065930pgh.289.1640282782830; 
 Thu, 23 Dec 2021 10:06:22 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id 22sm6830378pfv.173.2021.12.23.10.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 10:06:22 -0800 (PST)
Date: Thu, 23 Dec 2021 18:06:19 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, john.ji@intel.com, susie.li@intel.com,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com
Subject: Re: [PATCH v3 kvm/queue 11/16] KVM: Add kvm_map_gfn_range
Message-ID: <YcS6m9CieYaIGA3F@google.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-12-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211223123011.41044-12-chao.p.peng@linux.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=seanjc@google.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -138
X-Spam_score: -13.9
X-Spam_bar: -------------
X-Spam_report: (-13.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=2.899, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 23, 2021, Chao Peng wrote:
> This new function establishes the mapping in KVM page tables for a
> given gfn range. It can be used in the memory fallocate callback for
> memfd based memory to establish the mapping for KVM secondary MMU when
> the pages are allocated in the memory backend.

NAK, under no circumstance should KVM install SPTEs in response to allocating
memory in a file.   The correct thing to do is to invalidate the gfn range
associated with the newly mapped range, i.e. wipe out any shared SPTEs associated
with the memslot.

