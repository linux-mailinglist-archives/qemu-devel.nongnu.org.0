Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C405F0FED
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 18:27:33 +0200 (CEST)
Received: from localhost ([::1]:56610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeIrL-0003SU-Ad
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 12:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1oeInK-0007jq-VC
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:23:22 -0400
Received: from mga05.intel.com ([192.55.52.43]:3786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1oeInH-0000np-1d
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:23:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664554999; x=1696090999;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aPat+vyuzHmTIY+ssdYQgbZFBJqiO2JzUm9LnYYjyXo=;
 b=PlDrVIasedANt5n6xUrywnSnOfbgnubMyTbnhviIlUDzLSIXICuoknC7
 DqeTdrYm5CVt9foMrk2vt0ctXzWarlAc7e4qoGkfrwOVIXNu/gXilAcBs
 tkGiWOu64HM4tP4QO3pb0vwOwCnPLtNHf5eHqjAegHUbjWMCYrhWZJg+5
 k+mC5ebqshlqgXlhDZf8g/+J3tkbmEXbjn5TE7LPpBy2e+PjxeBERGH+v
 uhmLv7/N+XMPlzt6qfqOf3OpIoZCsQS97sycnO4zJvaIMl7BBX48rxuzk
 7eURk/TgJ+1/caivjOc37YEcAyho1esF1lmi/XQeCErV1UELa5+nIrldr g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="388511246"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="388511246"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 09:23:15 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="748280523"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="748280523"
Received: from herrerop-mobl1.ger.corp.intel.com (HELO box.shutemov.name)
 ([10.252.38.128])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 09:23:04 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
 id DF624104BD6; Fri, 30 Sep 2022 19:23:01 +0300 (+03)
Date: Fri, 30 Sep 2022 19:23:01 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
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
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
Message-ID: <20220930162301.i226o523teuikygq@box.shutemov.name>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <CA+EHjTyrexb_LX7Jm9-MGwm4DBvfjCrADH4oumFyAvs2_0oSYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyrexb_LX7Jm9-MGwm4DBvfjCrADH4oumFyAvs2_0oSYw@mail.gmail.com>
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=kirill.shutemov@linux.intel.com; helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Fri, Sep 30, 2022 at 05:14:00PM +0100, Fuad Tabba wrote:
> Hi,
> 
> <...>
> 
> > diff --git a/mm/memfd_inaccessible.c b/mm/memfd_inaccessible.c
> > new file mode 100644
> > index 000000000000..2d33cbdd9282
> > --- /dev/null
> > +++ b/mm/memfd_inaccessible.c
> > @@ -0,0 +1,219 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +#include "linux/sbitmap.h"
> > +#include <linux/memfd.h>
> > +#include <linux/pagemap.h>
> > +#include <linux/pseudo_fs.h>
> > +#include <linux/shmem_fs.h>
> > +#include <uapi/linux/falloc.h>
> > +#include <uapi/linux/magic.h>
> > +
> > +struct inaccessible_data {
> > +       struct mutex lock;
> > +       struct file *memfd;
> > +       struct list_head notifiers;
> > +};
> > +
> > +static void inaccessible_notifier_invalidate(struct inaccessible_data *data,
> > +                                pgoff_t start, pgoff_t end)
> > +{
> > +       struct inaccessible_notifier *notifier;
> > +
> > +       mutex_lock(&data->lock);
> > +       list_for_each_entry(notifier, &data->notifiers, list) {
> > +               notifier->ops->invalidate(notifier, start, end);
> > +       }
> > +       mutex_unlock(&data->lock);
> > +}
> > +
> > +static int inaccessible_release(struct inode *inode, struct file *file)
> > +{
> > +       struct inaccessible_data *data = inode->i_mapping->private_data;
> > +
> > +       fput(data->memfd);
> > +       kfree(data);
> > +       return 0;
> > +}
> > +
> > +static long inaccessible_fallocate(struct file *file, int mode,
> > +                                  loff_t offset, loff_t len)
> > +{
> > +       struct inaccessible_data *data = file->f_mapping->private_data;
> > +       struct file *memfd = data->memfd;
> > +       int ret;
> > +
> > +       if (mode & FALLOC_FL_PUNCH_HOLE) {
> > +               if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
> > +                       return -EINVAL;
> > +       }
> > +
> > +       ret = memfd->f_op->fallocate(memfd, mode, offset, len);
> 
> I think that shmem_file_operations.fallocate is only set if
> CONFIG_TMPFS is enabled (shmem.c). Should there be a check at
> initialization that fallocate is set, or maybe a config dependency, or
> can we count on it always being enabled?

It is already there:

	config MEMFD_CREATE
		def_bool TMPFS || HUGETLBFS

And we reject inaccessible memfd_create() for HUGETLBFS.

But if we go with a separate syscall, yes, we need the dependency.

> > +       inaccessible_notifier_invalidate(data, offset, offset + len);
> > +       return ret;
> > +}
> > +
> 
> <...>
> 
> > +void inaccessible_register_notifier(struct file *file,
> > +                                   struct inaccessible_notifier *notifier)
> > +{
> > +       struct inaccessible_data *data = file->f_mapping->private_data;
> > +
> > +       mutex_lock(&data->lock);
> > +       list_add(&notifier->list, &data->notifiers);
> > +       mutex_unlock(&data->lock);
> > +}
> > +EXPORT_SYMBOL_GPL(inaccessible_register_notifier);
> 
> If the memfd wasn't marked as inaccessible, or more generally
> speaking, if the file isn't a memfd_inaccessible file, this ends up
> accessing an uninitialized pointer for the notifier list. Should there
> be a check for that here, and have this function return an error if
> that's not the case?

I think it is "don't do that" category. inaccessible_register_notifier()
caller has to know what file it operates on, no?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

