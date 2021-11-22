Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14855458F90
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 14:38:49 +0100 (CET)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp9Wy-0006kE-4x
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 08:38:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1mp9QH-0003i9-3Y
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:31:53 -0500
Received: from [2607:f8b0:4864:20::72f] (port=34653
 helo=mail-qk1-x72f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1mp9QC-0000yd-C6
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:31:49 -0500
Received: by mail-qk1-x72f.google.com with SMTP id t6so18080634qkg.1
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 05:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=u7JEhlzeqWEWi1WfdsbI31hG4XTiKs7YjTVY93B2ee4=;
 b=CRLeFVlaDHYADj0c4pdgyA6WVjM0CriKWH34VQ3Zgnf0WtTraYkd/cgjTCbMDOczww
 NdXiD8njOfcPQpNHpYRgBzhYd2yhCkVtjUBQDrAQcLu+SgaPJ18JLMcHZiSnAkVeknnd
 0r6V6MGiqUoTitEC42jbkgtqGFrBYYzJPumsEkVo7XS5sE6Xgi92bWwMj7cA04T9KZgG
 KBEMYlzIWnHu0BDIdQb3DAJr0IAt/qNWxoYSuFBMXOWkuMB4UlcMl9O5g8H1aCzjXOTg
 YIexlAtl5QrrWHsZHnXp+oDhqqchuEu2x1mCbFWEHmpRnxygBJW2KKryq/0Wb2YGQp6B
 zPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u7JEhlzeqWEWi1WfdsbI31hG4XTiKs7YjTVY93B2ee4=;
 b=2Yvv4MFmVrTiw6AdRu2IckumOh/8qKwyKs+NgLDJYnV+fvtNMCb8lACuY0Gyi0iNPW
 7+Lt8IkdMEDe0Vv65SmAnv+a8aKjGN4YPnXxbER9laWCniddMAPiYhax7sBvLxlrPiYQ
 58dG59a+5mgdcPat/eWjFCWtQKMC3TQFAsv47ICZIcp36Xm4qP/sxdXHE+gMiHFitgeZ
 mf1E7yJviVPnl25k88B2tTrnbVvxLTrS+JT3E06PvEagNSE/Eok9o9JDfM06ZUDxDgiZ
 aYQr4p8j8DFPYuW57fmSYp0gidIAUkBo5IiJ35MotywPRvd9YvKdafOTLXXVnZzWJfST
 t13g==
X-Gm-Message-State: AOAM530hm4LDWpdfzuH7L38Y5BZH5V+Myql1yZULp1bBCN6zj7xzHsst
 3i3qw9nHNFSvfJz3ZyUFPzuEyg==
X-Google-Smtp-Source: ABdhPJyVecFgN4ENVdXtmS+AeA6UBpyD+QSrsm4bekxw4Uozjfi2oAytM0ALDEqjOc3nqbmPpEzZDw==
X-Received: by 2002:a05:620a:c84:: with SMTP id
 q4mr47040794qki.176.1637587906879; 
 Mon, 22 Nov 2021 05:31:46 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id n19sm4455570qta.78.2021.11.22.05.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 05:31:46 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mp9Q9-00DrvP-FD; Mon, 22 Nov 2021 09:31:45 -0400
Date: Mon, 22 Nov 2021 09:31:45 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
Message-ID: <20211122133145.GQ876299@ziepe.ca>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
 <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
 <20211119160023.GI876299@ziepe.ca>
 <4efdccac-245f-eb1f-5b7f-c1044ff0103d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4efdccac-245f-eb1f-5b7f-c1044ff0103d@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f; envelope-from=jgg@ziepe.ca;
 helo=mail-qk1-x72f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 kvm@vger.kernel.org, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 ak@linux.intel.com, Jonathan Corbet <corbet@lwn.net>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jim Mattson <jmattson@google.com>, dave.hansen@intel.com,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 john.ji@intel.com, Yu Zhang <yu.c.zhang@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 22, 2021 at 10:26:12AM +0100, David Hildenbrand wrote:

> I do wonder if we want to support sharing such memfds between processes
> in all cases ... we most certainly don't want to be able to share
> encrypted memory between VMs (I heard that the kernel has to forbid
> that). It would make sense in the use case you describe, though.

If there is a F_SEAL_XX that blocks every kind of new access, who
cares if userspace passes the FD around or not?

Jason

