Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C32C15855C3
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 21:53:40 +0200 (CEST)
Received: from localhost ([::1]:37202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHW3A-0004LD-J8
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 15:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oHW1L-0001Sb-8D
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 15:51:39 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:38695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oHW1I-000578-DV
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 15:51:37 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 w17-20020a17090a8a1100b001f326c73df6so4591578pjn.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 12:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=Dstciygn1YsoqcejBVc0D+MFf2Th1tfQSWlbVTNdSdk=;
 b=OrhOLugCM8Cj6h/411/1G13LNCne89tLk5CN5RFMmNJSVoJNIumYmTLvlzznytVtNN
 +65DB/Lckye6fIPxvoZypOO8+mrNMPNNKas4vW7cgtVmxrweDNwCISCeiu0QCKuS2RZ6
 ttaT5y9tC05NWhrlcjtdCsb6bWH7km4UaVw4OedOk2ltG35dSvYrKBj7OmyLILdt3Upf
 Iy9drzJziV1Aq+PbxPImfRw3PlkeRVsHRBoYCrTRvuKjXPhLz/a00+HdWIEf7gUQxdPD
 LSVaC821KNqpxBCP0G4SRoMSzSCEBj/43FxcrRa86Ms3qiqAbpkt93nq+xufg884dyHM
 3E1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Dstciygn1YsoqcejBVc0D+MFf2Th1tfQSWlbVTNdSdk=;
 b=qCyt/0qCZeAUcxpmZe5MPv7M9UymZglADC9OFMo/E8zI/IaoDDP+K8s02CNncxaVzz
 R0T8gmXK+4WyAxu6uIZzC8F/EN8cyPHrXEMph+4Zr2krGg3iLnEUb11FQo/JMo/LgCUI
 LEo6U7kllLt2gYKJ1SEymWm5LCvnRbaX5/SWwCfIR33TYLYR1cWsxAwMfi6OHgw8vBxR
 COA3R1TAcAsRu4uP/T7YF0WAEjEMyRjHKqMVcsPUZR590sHi02fMLYk2otLzp2RRMUFx
 b+mwsCEar7VivD+IUgfNmtUIgQ2hbvS93SQJviazZkTIHYhENrl1KbEuQYGFvtI48vwx
 Jy2A==
X-Gm-Message-State: ACgBeo3cC1EmWb1VkmWQ+Dd8LcheV6uSUdz4b0E5RoerNWjsvJJfMXOd
 n0GxBg5t8k5hj5YRZmYu0UTdUA==
X-Google-Smtp-Source: AA6agR63sDQRf5W5vFXYY3BbXk7I5lysrOCYAyeVjEMh41/Jj9OO8QiEjQjnyE/PUlhIQQOKevQ85Q==
X-Received: by 2002:a17:902:7e47:b0:16c:7115:84d6 with SMTP id
 a7-20020a1709027e4700b0016c711584d6mr5524717pln.93.1659124294027; 
 Fri, 29 Jul 2022 12:51:34 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 u5-20020a170902714500b0016c574aa0fdsm4057346plm.76.2022.07.29.12.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 12:51:33 -0700 (PDT)
Date: Fri, 29 Jul 2022 19:51:29 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
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
Subject: Re: [PATCH v7 09/14] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <YuQ6QWcdZLdStkWl@google.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-10-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706082016.2603916-10-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=seanjc@google.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Wed, Jul 06, 2022, Chao Peng wrote:
> @@ -1332,9 +1332,18 @@ yet and must be cleared on entry.
>  	__u64 userspace_addr; /* start of the userspace allocated memory */
>    };
>  
> +  struct kvm_userspace_memory_region_ext {
> +	struct kvm_userspace_memory_region region;
> +	__u64 private_offset;
> +	__u32 private_fd;
> +	__u32 pad1;
> +	__u64 pad2[14];
> +};
> +
>    /* for kvm_memory_region::flags */
>    #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
>    #define KVM_MEM_READONLY	(1UL << 1)
> +  #define KVM_MEM_PRIVATE		(1UL << 2)

Very belatedly following up on prior feedback...

  | I think a flag is still needed, the problem is private_fd can be safely
  | accessed only when this flag is set, e.g. without this flag, we can't
  | copy_from_user these new fields since they don't exist for previous
  | kvm_userspace_memory_region callers.

I forgot about that aspect of things.  We don't technically need a dedicated
PRIVATE flag to handle that, but it does seem to be the least awful soltuion.
We could either add a generic KVM_MEM_EXTENDED_REGION or an entirely new
ioctl(), e.g. KVM_SET_USER_MEMORY_REGION2, but in both approaches there's a decent
chance that we'll end up needed individual "this field is valid" flags anways.

E.g. if KVM requires pad1 and pad2 to be zero to carve out future extensions,
then we're right back here if some future extension needs to treat '0' as a legal
input.

TL;DR: adding KVM_MEM_PRIVATE still seems like the best approach.

> @@ -4631,14 +4658,35 @@ static long kvm_vm_ioctl(struct file *filp,
>  		break;
>  	}
>  	case KVM_SET_USER_MEMORY_REGION: {
> -		struct kvm_userspace_memory_region kvm_userspace_mem;
> +		struct kvm_user_mem_region mem;
> +		unsigned long size;
> +		u32 flags;
> +
> +		kvm_sanity_check_user_mem_region_alias();
> +
> +		memset(&mem, 0, sizeof(mem));
>  
>  		r = -EFAULT;
> -		if (copy_from_user(&kvm_userspace_mem, argp,
> -						sizeof(kvm_userspace_mem)))
> +
> +		if (get_user(flags,
> +			(u32 __user *)(argp + offsetof(typeof(mem), flags))))
> +			goto out;


Indentation is funky.  It's hard to massage this into something short and
readable  What about capturing the offset separately?  E.g.

                struct kvm_user_mem_region mem;
                unsigned int flags_offset = offsetof(typeof(mem), flags));
                unsigned long size;
                u32 flags;

                kvm_sanity_check_user_mem_region_alias();

		memset(&mem, 0, sizeof(mem));

                r = -EFAULT;
                if (get_user(flags, (u32 __user *)(argp + flags_offset)))
                        goto out;

But this can actually be punted until KVM_MEM_PRIVATE is fully supported.  As of
this patch, KVM doesn't read the extended size, so I believe the diff for this
patch can simply be:

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index da263c370d00..5194beb7b52f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4640,6 +4640,10 @@ static long kvm_vm_ioctl(struct file *filp,
                                                sizeof(kvm_userspace_mem)))
                        goto out;

+               r = -EINVAL;
+               if (mem.flags & KVM_MEM_PRIVATE)
+                       goto out;
+
                r = kvm_vm_ioctl_set_memory_region(kvm, &kvm_userspace_mem);
                break;
        }


