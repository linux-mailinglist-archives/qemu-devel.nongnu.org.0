Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D742760E692
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 19:34:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onkG8-00026o-II; Wed, 26 Oct 2022 13:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1onkG1-0001bi-Qm
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:32:05 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1onkFr-0001k7-C4
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:31:54 -0400
Received: by mail-pl1-x62a.google.com with SMTP id j12so14827692plj.5
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 10:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0KEX8H9AH+VpJzTG5dP3lIPlij9N0zbSJwy+i7UPqHg=;
 b=cGCfgC4hjmQQkF1Pxvr7cLXhW9PwDG011Q1yYpkKlGkU1OdLX/EXJIuLnwqbTCMenA
 qQcxLWZcGJwon4OZ/EY7D/3JZcT+CmJYRc+SMzVP+aoV5fpH0LlOcHeQ5Rvu5/TVKZfu
 7zs0vqSrqvQhdjoUVr9e4w8kyQepA7Bh73nOUhsTf8dbXvD5yNraTKvL9vXLLNDXcIk3
 PFw+FqKwfN6Qkd1BQoOhVO/0zCAaQKI7rU5r6TuvH7WyVvQZUdOUIhL0305Fdfo6F+7N
 bwu2wgky+pRe17X5czHVGnuD+R53XZYyqR79oq0bSJ8jTMTnfmqG7ITY+PjsZzrUcEcH
 Fu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0KEX8H9AH+VpJzTG5dP3lIPlij9N0zbSJwy+i7UPqHg=;
 b=UAovIQJN4kHyN4JqNhvL9aaYYxQjwjTvWJiy5DvtXqk/Q8S6Xpq3PbvORAnlSfBXqm
 zxcyISfotqWII46KlW6Qf4Tam3jYiJ0vAZ5Jxhh4fMRs+VhqKGnSVmtxnpKWZ55825Mh
 qVcMiNbXcYfe6gjy+vO9Gp9Zb6k/Cj+MonrIwsN2Apt1ra8/iPtS5s0G6OiuXQqUa0ZE
 HhkdMove8bsSIcvf2Nj8EEKPVzv1f1qhFhYLDJFQKXEYrsV1/gbGSxa4H0XnSAYdGGT6
 U4iJHUin2SIamk/1oWKg2AsD8b3DzrtYP8pzMLZkN+zb7W+HNuJCnC7NhakTQ3+1jQ0W
 B+yg==
X-Gm-Message-State: ACrzQf0VEgglQTvHoFcr2CTL99EVRsDOFDIvsRjuNQObUyjuZdtk54/w
 iUzLf8QA8vOt66oAghDInkU=
X-Google-Smtp-Source: AMsMyM5iyIsTFBeWCWiI/ZizQ3W6VbjiybP1poF7CjbEgG2VkVSvkP2kgtm+tVjWT4X2rpwsf2fFIQ==
X-Received: by 2002:a17:902:6542:b0:172:95d8:a777 with SMTP id
 d2-20020a170902654200b0017295d8a777mr45124260pln.61.1666805507753; 
 Wed, 26 Oct 2022 10:31:47 -0700 (PDT)
Received: from localhost ([192.55.54.55]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b0056c814a501dsm436498pfr.10.2022.10.26.10.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 10:31:47 -0700 (PDT)
Date: Wed, 26 Oct 2022 10:31:45 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com,
 isaku.yamahata@gmail.com
Subject: Re: [PATCH v9 1/8] mm: Introduce memfd_restricted system call to
 create restricted user memory
Message-ID: <20221026173145.GA3819453@ls.amr.corp.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-2-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221025151344.3784230-2-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 25, 2022 at 11:13:37PM +0800,
Chao Peng <chao.p.peng@linux.intel.com> wrote:

> +int restrictedmem_get_page(struct file *file, pgoff_t offset,
> +			   struct page **pagep, int *order)
> +{
> +	struct restrictedmem_data *data = file->f_mapping->private_data;
> +	struct file *memfd = data->memfd;
> +	struct page *page;
> +	int ret;
> +
> +	ret = shmem_getpage(file_inode(memfd), offset, &page, SGP_WRITE);

shmem_getpage() was removed.
https://lkml.kernel.org/r/20220902194653.1739778-34-willy@infradead.org

I needed the following fix to compile.

thanks,

diff --git a/mm/restrictedmem.c b/mm/restrictedmem.c
index e5bf8907e0f8..4694dd5609d6 100644
--- a/mm/restrictedmem.c
+++ b/mm/restrictedmem.c
@@ -231,13 +231,15 @@ int restrictedmem_get_page(struct file *file, pgoff_t offset,
 {
        struct restrictedmem_data *data = file->f_mapping->private_data;
        struct file *memfd = data->memfd;
+       struct folio *folio = NULL;
        struct page *page;
        int ret;
 
-       ret = shmem_getpage(file_inode(memfd), offset, &page, SGP_WRITE);
+       ret = shmem_get_folio(file_inode(memfd), offset, &folio, SGP_WRITE);
        if (ret)
                return ret;
 
+       page = folio_file_page(folio, offset);
        *pagep = page;
        if (order)
                *order = thp_order(compound_head(page));
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

