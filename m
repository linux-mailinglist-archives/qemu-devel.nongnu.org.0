Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED284FC0B9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:31:51 +0200 (CEST)
Received: from localhost ([::1]:44652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndw18-0000Bg-6w
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1ndvup-0002Jo-QF
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:25:19 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:46859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1ndvun-0005R0-Uj
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:25:19 -0400
Received: by mail-lj1-x22b.google.com with SMTP id q189so3994530ljb.13
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 08:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rFr6s0nrZU/l/rYSbRMVpOLqR853sTAxGnl/eB7rqRM=;
 b=vqJYdIQWv8WkNNNn9dPXtN92UFDTRrKywzC32jqHUXQPd0+vkYBmnq9rZ4NZXVIxFT
 qFZtKKzAXyLtgRUtZW0cMECXBtK3dk3Wyx0Mmsh8UZ/OzlNIFCM15Boa0s9MFTZnFSN3
 8zObizgXQHcCLVp6LDk/Jzo1jR2NDPvFFPY4ogEXWUB70897ie3SGoK0vWAAx5unyy9n
 6j5A9PCMQnyGGwVeSCqGXUcxMULTqx2b4wpel2RMEuBXrpI2Je1yyPDmgKNutqRQhKPF
 E3eAJ4YsBCcURT61ntTfs2vYmJhK1nZzXt1rqLkINEtuod8EjW60nrtXooL3LRDyK+/7
 0TjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rFr6s0nrZU/l/rYSbRMVpOLqR853sTAxGnl/eB7rqRM=;
 b=U0x6IGUpo1quvroiy04k9j9RbM+6TTu32IvXksv2+vYrSFuprG/UEZmAG+aEatSuZN
 sGxpj71wtv1ycH/wtRGjbDhWognmEWX+2INhENiL3+dEiuLo13XChJbd4bNs8svQE/46
 vte14SPSrR2KiUGilyPrfMpEYe7fZKHknIkPb2f3JioX5kfqBrl9jQ0kJSh/XzQnMRFo
 JF2c5Ig94StOU5msq+ty7uKjZLCjPcQgrOtXLetKXSKi+qf2pieaUGkHQ5HirpQ6MNfR
 BF0wKxJ9m4wqjyjJv9v9Q2RHKlSoIK32B2P7fJ9LS1ZqFXTCUl1b3Hg2HDTfJ+HOS3eb
 V1rg==
X-Gm-Message-State: AOAM5317mlGKza0FrhDBT/W/InYHrxX6BB6lVLp8XXRSHLYb2lgzcLRJ
 i7ZbhDf5HHiN/AZFy1cKnP3VYg==
X-Google-Smtp-Source: ABdhPJxUo+KOo46oZZC8/G3tHjCARN4FX+eDd1+/GBegGd9jDdlQ537rMvPHZViYY23J0dOhGwiqZg==
X-Received: by 2002:a2e:80d7:0:b0:24b:bd8:b89e with SMTP id
 r23-20020a2e80d7000000b0024b0bd8b89emr20019551ljg.174.1649690715205; 
 Mon, 11 Apr 2022 08:25:15 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a056512308600b0044af5ea2be1sm2837295lfd.274.2022.04.11.08.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 08:25:14 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 189A9103CE0; Mon, 11 Apr 2022 18:26:47 +0300 (+03)
Date: Mon, 11 Apr 2022 18:26:47 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Chao Peng <chao.p.peng@linux.intel.com>
Subject: Re: [PATCH v5 03/13] mm/shmem: Support memfile_notifier
Message-ID: <20220411152647.uvl2ukuwishsckys@box.shutemov.name>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-4-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310140911.50924-4-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=2a00:1450:4864:20::22b;
 envelope-from=kirill@shutemov.name; helo=mail-lj1-x22b.google.com
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
 "J . Bruce Fields" <bfields@fieldses.org>, dave.hansen@intel.com,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jim Mattson <jmattson@google.com>, linux-mm@kvack.org,
 linux-api@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Yu Zhang <yu.c.zhang@linux.intel.com>,
 Mike Rapoport <rppt@kernel.org>, Sean Christopherson <seanjc@google.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vishal Annapurve <vannapurve@google.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 10, 2022 at 10:09:01PM +0800, Chao Peng wrote:
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 9b31a7056009..7b43e274c9a2 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -903,6 +903,28 @@ static struct folio *shmem_get_partial_folio(struct inode *inode, pgoff_t index)
>  	return page ? page_folio(page) : NULL;
>  }
>  
> +static void notify_fallocate(struct inode *inode, pgoff_t start, pgoff_t end)
> +{
> +#ifdef CONFIG_MEMFILE_NOTIFIER
> +	struct shmem_inode_info *info = SHMEM_I(inode);
> +
> +	memfile_notifier_fallocate(&info->memfile_notifiers, start, end);
> +#endif

All these #ifdefs look ugly. Could you provide dummy memfile_* for
!MEMFILE_NOTIFIER case?

-- 
 Kirill A. Shutemov

