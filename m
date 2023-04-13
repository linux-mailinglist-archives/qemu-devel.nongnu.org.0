Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E076E136B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 19:23:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn0eW-0003J7-PT; Thu, 13 Apr 2023 13:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3RTo4ZAsKCsIiksmztm61voowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--ackerleytng.bounces.google.com>)
 id 1pn0eT-0003Iv-Gh
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 13:22:29 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3RTo4ZAsKCsIiksmztm61voowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--ackerleytng.bounces.google.com>)
 id 1pn0eH-0001rU-In
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 13:22:29 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 w184-20020a6382c1000000b0050bed8b0b61so6614502pgd.11
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 10:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681406534; x=1683998534;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MUWO1kZAYR92KIzOOxoAG6fgcpTDrbsTBnBgIaXB7SI=;
 b=k9K7/cx14r1rZ44+YUmMJA/zyDFSnSwd4M/yoOo6MK1lBZbqEHHMPLqbgmJy4VHzWr
 BHtqD7duSRrul042d0Suw2viax09pK0xMVdFhDXpoxoBfhFfIuBKNDsrnzf3PtlFwTe0
 xZs14NrJu4rjfC+GuieNJRVga4Qv8eQWhGsY7num3+DbmUoQdqIvovvw7B75AYwZTkKG
 iKlZHnMH6l41XSupS5sXqcJVcqX0LpFcpp/+2ct//bBU6UJaLCpcjq4ly/wd092FSy5B
 RAM7fGGTnnv8Bkbvo6qpHrJ0vab0jDHA6Sxzq0hjEQ4MKc/Y3j5NGUn0fKFRnXbWoeyn
 RO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681406534; x=1683998534;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MUWO1kZAYR92KIzOOxoAG6fgcpTDrbsTBnBgIaXB7SI=;
 b=JBr2sP/wC6pLuhgL1qxcy42+QOvC/9hcf+nQ+HjorG8i4rDPt1zVpQu3ozUunWWf1L
 5HwhHVjGTsebZvAU2FjgOivG8FMvWIllaCtiaKg4ejIZuIPAlH5yX+t6PWFnexAKwLmB
 ymLHEG7ys/tTPfYureX2BmkzV5oRQGviIHsqrKDD5hZQVRwE/qSbgXc6Q97NolWMPX4O
 Al6A0WPouX6mvClC4tONOk6Pdejce9nIfEhsjmfXbvpys+I0xSfUc3vS7DolucLaGUdF
 gdiS8RzRv6a9dv8RIkeo/iPVpwIWX5bSm6WfbURfbjF1p6osvuNRNYIHko68pqmhraGH
 msqw==
X-Gm-Message-State: AAQBX9fHDISJ+Kg0rr9Xx0KLgVbqUHobuJyPBgazpMqEHdM4qkn0BuCd
 7edunfQno7rcv/iMv/uNFpFNMhEkAxJ4p3IbZA==
X-Google-Smtp-Source: AKy350buit0TKoFObhZndLsv+Oe7SecvOYrJwebJQwpxXJ4Pb+22Ci4SNV5J0w0/4fgc4zy9sZpOZtI2T9SDAix8Kg==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a17:90b:815:b0:246:a1b2:77fe with SMTP
 id bk21-20020a17090b081500b00246a1b277femr2564960pjb.3.1681406533842; Thu, 13
 Apr 2023 10:22:13 -0700 (PDT)
Date: Thu, 13 Apr 2023 17:22:12 +0000
In-Reply-To: <20221202061347.1070246-2-chao.p.peng@linux.intel.com> (message
 from Chao Peng on Fri,  2 Dec 2022 14:13:39 +0800)
Mime-Version: 1.0
Message-ID: <diqzh6tjofy3.fsf@ackerleytng-cloudtop.c.googlers.com>
Subject: Re: [PATCH v10 1/9] mm: Introduce memfd_restricted system call to
 create restricted user memory
From: Ackerley Tng <ackerleytng@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 pbonzini@redhat.com, corbet@lwn.net, seanjc@google.com, vkuznets@redhat.com, 
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org, 
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, arnd@arndb.de, 
 naoya.horiguchi@nec.com, linmiaohe@huawei.com, x86@kernel.org, hpa@zytor.com, 
 hughd@google.com, jlayton@kernel.org, bfields@fieldses.org, 
 akpm@linux-foundation.org, shuah@kernel.org, rppt@kernel.org, 
 steven.price@arm.com, mail@maciej.szmigiero.name, vbabka@suse.cz, 
 vannapurve@google.com, yu.c.zhang@linux.intel.com, 
 chao.p.peng@linux.intel.com, kirill.shutemov@linux.intel.com, luto@kernel.org, 
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com, 
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com, 
 dhildenb@redhat.com, qperret@google.com, tabba@google.com, 
 michael.roth@amd.com, mhocko@suse.com, wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3RTo4ZAsKCsIiksmztm61voowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--ackerleytng.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Chao Peng <chao.p.peng@linux.intel.com> writes:

> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

> Introduce 'memfd_restricted' system call with the ability to create
> memory areas that are restricted from userspace access through ordinary
> MMU operations (e.g. read/write/mmap). The memory content is expected to
> be used through the new in-kernel interface by a third kernel module.

> ...

> diff --git a/mm/restrictedmem.c b/mm/restrictedmem.c
> new file mode 100644
> index 000000000000..56953c204e5c
> --- /dev/null
> +++ b/mm/restrictedmem.c
> @@ -0,0 +1,318 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include "linux/sbitmap.h"
> +#include <linux/pagemap.h>
> +#include <linux/pseudo_fs.h>
> +#include <linux/shmem_fs.h>
> +#include <linux/syscalls.h>
> +#include <uapi/linux/falloc.h>
> +#include <uapi/linux/magic.h>
> +#include <linux/restrictedmem.h>
> +
> +struct restrictedmem_data {
> +	struct mutex lock;
> +	struct file *memfd;

Can this be renamed to file, or lower_file (as in stacking filesystems)?

It's a little confusing because this pointer doesn't actually refer to
an fd.

'memfd' is already used by udmabuf to refer to an actual fd [1], which
makes this a little misleading.

[1]  
https://elixir.bootlin.com/linux/v6.2.10/source/tools/testing/selftests/drivers/dma-buf/udmabuf.c#L63

> +	struct list_head notifiers;
> +};
> +
> ...


