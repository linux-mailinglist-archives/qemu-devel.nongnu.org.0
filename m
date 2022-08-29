Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57A85A51B2
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 18:28:16 +0200 (CEST)
Received: from localhost ([::1]:50886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oShcQ-0002aU-IX
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 12:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oShat-0000gt-Iz
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:26:35 -0400
Received: from mga04.intel.com ([192.55.52.120]:59655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oShar-0003bd-Of
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661790393; x=1693326393;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=xYdvX1PhD3Iug/xG1oZ0ioxeY0YVxwImFkNf9/6SStg=;
 b=SnDGCmRYN79jvclptNGAmvg47vxhdT/nX+GtaqILfVrMUrO6ya2J3j7i
 idiWJ3SBdCXebCkqyjnaNzAftKV9KweHQvs3BYzPnY0+cKAUJOkWdRmao
 KcgLl2crIMpb2XTRz9zMjSx8rJDQr/ZXr2eBqigrAbG/caapjx87YYPlB
 a/gjva698qRXrYY6cOxKAfbgEshZmGG5aJEq/fdMJ3PYG/HjXpgz39y63
 dz24pMHYE4YB8VLsuj2HxBgW2uixBhXXSX8I2j7+Zz3couNflv9T6bbUn
 8OnyED6NVA4MvdJ3l3bDbgG+VY8kUdIvQQLVfJA2gSQbmaFkEgjSxeAvO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="293665202"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="293665202"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 08:25:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="640973244"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga008.jf.intel.com with ESMTP; 29 Aug 2022 08:25:49 -0700
Date: Mon, 29 Aug 2022 23:21:07 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
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
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 11/14] KVM: Register/unregister the guest private
 memory regions
Message-ID: <20220829152107.GD1586678@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-12-chao.p.peng@linux.intel.com>
 <CA+EHjTzpb2PcGBbN61YqMWdQ5f-55Lt12ALHQ0pdwtGvV8nS8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzpb2PcGBbN61YqMWdQ5f-55Lt12ALHQ0pdwtGvV8nS8g@mail.gmail.com>
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga04.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 26, 2022 at 04:19:43PM +0100, Fuad Tabba wrote:
> > +bool __weak kvm_arch_private_mem_supported(struct kvm *kvm)
> > +{
> > +       return false;
> > +}
> > +
> >  static int check_memory_region_flags(const struct kvm_user_mem_region *mem)
> >  {
> >         u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
> > @@ -4689,6 +4729,22 @@ static long kvm_vm_ioctl(struct file *filp,
> >                 r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
> >                 break;
> >         }
> > +#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
> > +       case KVM_MEMORY_ENCRYPT_REG_REGION:
> > +       case KVM_MEMORY_ENCRYPT_UNREG_REGION: {
> > +               struct kvm_enc_region region;
> > +
> > +               if (!kvm_arch_private_mem_supported(kvm))
> > +                       goto arch_vm_ioctl;
> > +
> > +               r = -EFAULT;
> > +               if (copy_from_user(&region, argp, sizeof(region)))
> > +                       goto out;
> > +
> > +               r = kvm_vm_ioctl_set_encrypted_region(kvm, ioctl, &region);
> > +               break;
> > +       }
> > +#endif
> >         case KVM_GET_DIRTY_LOG: {
> >                 struct kvm_dirty_log log;
> >
> > @@ -4842,6 +4898,7 @@ static long kvm_vm_ioctl(struct file *filp,
> >                 r = kvm_vm_ioctl_get_stats_fd(kvm);
> >                 break;
> >         default:
> > +arch_vm_ioctl:
> 
> It might be good to make this label conditional on
> CONFIG_HAVE_KVM_PRIVATE_MEM, otherwise you get a warning if
> CONFIG_HAVE_KVM_PRIVATE_MEM isn't defined.
> 
> +#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
>  arch_vm_ioctl:
> +#endif

Right, as the bot already complains.

Chao
> 
> Cheers,
> /fuad
> 
> 
> 
> 
> 
> >                 r = kvm_arch_vm_ioctl(filp, ioctl, arg);
> >         }
> >  out:
> > --
> > 2.25.1
> >

