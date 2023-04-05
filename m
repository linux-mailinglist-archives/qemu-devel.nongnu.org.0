Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811CC6D8A99
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 00:30:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkBcp-0007A2-KX; Wed, 05 Apr 2023 18:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3LfYtZAsKCvgfhpjwqj3ysllttlqj.htrvjrz-ij0jqstslsz.twl@flex--ackerleytng.bounces.google.com>)
 id 1pkBco-00079t-FN
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 18:29:06 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3LfYtZAsKCvgfhpjwqj3ysllttlqj.htrvjrz-ij0jqstslsz.twl@flex--ackerleytng.bounces.google.com>)
 id 1pkBcm-0005XH-Jo
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 18:29:06 -0400
Received: by mail-pj1-x104a.google.com with SMTP id
 nu18-20020a17090b1b1200b0023fbe01dc06so17822162pjb.8
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 15:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680733742;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GWR9MlnovPb4azeMHr07bRFmjnPJymKEQvz5exk2wDc=;
 b=VmY8UlSKwzQO0K5HFS4LZyNPsx2yz03z8VFeH0jzD3xNKquWByhUadcUB64clw/ukK
 PS0lE7ms2N4zjfi8yBjDa838Jv9P/Ebe1rmQaDpZapGQHrRUF7T36fqfDV4nrOsV5AMd
 SGz0kry10Itl5RDl9lqCNIJymFOfJXu3eyUU9TTKRLkH+oIyMJ/lPP7ew2v5fMpzLKgu
 h2uPt2YYNrcvek8x7z9xu1hq0h+WSNdpNf1iKUK96UPq7N13/VzzDBzL4pGp1LrBOcqG
 9eHu/EI4kCb1GuSPO4OgPgpAKgvx41nOj6p+bBeCRlZUmYgF2jGC97zqN3Q2IAWdiWYG
 FlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680733742;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GWR9MlnovPb4azeMHr07bRFmjnPJymKEQvz5exk2wDc=;
 b=biFSdhDCPGm3sXb78tD/qDT06+byDN2sfonjpBLwL+M72Vyrrk5VUmAvhFS9UOzwND
 p9Bkb9TDHDvqwfODzEGHMyN0kO+5Ar59pJPslGYHO/EGZDuNVWeLtAheT9Y3efjsChl9
 eEgkHuf2eJ9r8tDtKvNA8O8d5AqiE1jNDKsCcAKfqgDV6Y0eaLrerN58C3arekUPT1jH
 PHTCmPay6D7r7oCNFyVfIP6DExPQtpN8wOf1c41TvgEE1R4Wk3e3ZPQs564lqwhS3I0U
 vew7xWzMc01DzQEk17I0LXDqUuI4yOggFSMPaDtgycSH9uy3/i6dSEdjGVKzKK3iNbXX
 p3xw==
X-Gm-Message-State: AAQBX9dhEYgHlhWTzXQ6C/tR0lRpDvFYGsXs1p6yUhcH3ZjkFvzVxuXV
 WOSEzUt1X1SYtSiTqnesFjjWe5lHZSEDPzPhWA==
X-Google-Smtp-Source: AKy350YZoCywDUVBhRVt0H67teuAx9CW+FCj9ARmbfK2XibL5Z5UEPVhVCnv/dIxeX7eINO95mUrqIM2r7ufZiriPQ==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a17:90a:7308:b0:23f:1caa:233a with
 SMTP id m8-20020a17090a730800b0023f1caa233amr1734038pjk.1.1680733741709; Wed,
 05 Apr 2023 15:29:01 -0700 (PDT)
Date: Wed, 05 Apr 2023 22:29:00 +0000
In-Reply-To: <f0232380-4171-f4d3-f1a6-07993e551b46@redhat.com> (message from
 David Hildenbrand on Mon, 3 Apr 2023 10:21:48 +0200)
Mime-Version: 1.0
Message-ID: <diqzilea0xqr.fsf@ackerleytng-cloudtop.c.googlers.com>
Subject: Re: [RFC PATCH v3 1/2] mm: restrictedmem: Allow userspace to specify
 mount for memfd_restricted
From: Ackerley Tng <ackerleytng@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, qemu-devel@nongnu.org, 
 aarcange@redhat.com, ak@linux.intel.com, akpm@linux-foundation.org, 
 arnd@arndb.de, bfields@fieldses.org, bp@alien8.de, 
 chao.p.peng@linux.intel.com, corbet@lwn.net, dave.hansen@intel.com, 
 ddutile@redhat.com, dhildenb@redhat.com, hpa@zytor.com, hughd@google.com, 
 jlayton@kernel.org, jmattson@google.com, joro@8bytes.org, 
 jun.nakajima@intel.com, kirill.shutemov@linux.intel.com, linmiaohe@huawei.com, 
 luto@kernel.org, mail@maciej.szmigiero.name, mhocko@suse.com, 
 michael.roth@amd.com, mingo@redhat.com, naoya.horiguchi@nec.com, 
 pbonzini@redhat.com, qperret@google.com, rppt@kernel.org, seanjc@google.com, 
 shuah@kernel.org, steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
 vannapurve@google.com, vbabka@suse.cz, vkuznets@redhat.com, 
 wanpengli@tencent.com, wei.w.wang@intel.com, x86@kernel.org, 
 yu.c.zhang@linux.intel.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3LfYtZAsKCvgfhpjwqj3ysllttlqj.htrvjrz-ij0jqstslsz.twl@flex--ackerleytng.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


Thanks for your review!

David Hildenbrand <david@redhat.com> writes:

> On 01.04.23 01:50, Ackerley Tng wrote:

>> ...

>> diff --git a/include/uapi/linux/restrictedmem.h  
>> b/include/uapi/linux/restrictedmem.h
>> new file mode 100644
>> index 000000000000..22d6f2285f6d
>> --- /dev/null
>> +++ b/include/uapi/linux/restrictedmem.h
>> @@ -0,0 +1,8 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +#ifndef _UAPI_LINUX_RESTRICTEDMEM_H
>> +#define _UAPI_LINUX_RESTRICTEDMEM_H
>> +
>> +/* flags for memfd_restricted */
>> +#define RMFD_USERMNT		0x0001U

> I wonder if we can come up with a more expressive prefix than RMFD.
> Sounds more like "rm fd" ;) Maybe it should better match the
> "memfd_restricted" syscall name, like "MEMFD_RSTD_USERMNT".


RMFD did actually sound vulgar, I'm good with MEMFD_RSTD_USERMNT!

>> +
>> +#endif /* _UAPI_LINUX_RESTRICTEDMEM_H */
>> diff --git a/mm/restrictedmem.c b/mm/restrictedmem.c
>> index c5d869d8c2d8..f7b62364a31a 100644
>> --- a/mm/restrictedmem.c
>> +++ b/mm/restrictedmem.c
>> @@ -1,11 +1,12 @@
>>    // SPDX-License-Identifier: GPL-2.0
>> -#include "linux/sbitmap.h"

> Looks like an unrelated change?


Will remove this in the next revision.

>> +#include <linux/namei.h>
>>    #include <linux/pagemap.h>
>>    #include <linux/pseudo_fs.h>
>>    #include <linux/shmem_fs.h>
>>    #include <linux/syscalls.h>
>>    #include <uapi/linux/falloc.h>
>>    #include <uapi/linux/magic.h>
>> +#include <uapi/linux/restrictedmem.h>
>>    #include <linux/restrictedmem.h>

>>    struct restrictedmem {
>> @@ -189,19 +190,20 @@ static struct file  
>> *restrictedmem_file_create(struct file *memfd)
>>    	return file;
>>    }

>> -SYSCALL_DEFINE1(memfd_restricted, unsigned int, flags)
>> +static int restrictedmem_create(struct vfsmount *mount)
>>    {
>>    	struct file *file, *restricted_file;
>>    	int fd, err;

>> -	if (flags)
>> -		return -EINVAL;
>> -
>>    	fd = get_unused_fd_flags(0);
>>    	if (fd < 0)
>>    		return fd;

>> -	file = shmem_file_setup("memfd:restrictedmem", 0, VM_NORESERVE);
>> +	if (mount)
>> +		file = shmem_file_setup_with_mnt(mount, "memfd:restrictedmem", 0,  
>> VM_NORESERVE);
>> +	else
>> +		file = shmem_file_setup("memfd:restrictedmem", 0, VM_NORESERVE);
>> +
>>    	if (IS_ERR(file)) {
>>    		err = PTR_ERR(file);
>>    		goto err_fd;
>> @@ -223,6 +225,66 @@ SYSCALL_DEFINE1(memfd_restricted, unsigned int,  
>> flags)
>>    	return err;
>>    }

>> +static bool is_shmem_mount(struct vfsmount *mnt)
>> +{
>> +	return mnt && mnt->mnt_sb && mnt->mnt_sb->s_magic == TMPFS_MAGIC;
>> +}
>> +
>> +static bool is_mount_root(struct file *file)
>> +{
>> +	return file->f_path.dentry == file->f_path.mnt->mnt_root;
>> +}

> I'd inline at least that function, pretty self-explaining.


Will inline this in the next revision.

>> +
>> +static int restrictedmem_create_on_user_mount(int mount_fd)
>> +{
>> +	int ret;
>> +	struct fd f;
>> +	struct vfsmount *mnt;
>> +
>> +	f = fdget_raw(mount_fd);
>> +	if (!f.file)
>> +		return -EBADF;
>> +
>> +	ret = -EINVAL;
>> +	if (!is_mount_root(f.file))
>> +		goto out;
>> +
>> +	mnt = f.file->f_path.mnt;
>> +	if (!is_shmem_mount(mnt))
>> +		goto out;
>> +
>> +	ret = file_permission(f.file, MAY_WRITE | MAY_EXEC);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = mnt_want_write(mnt);
>> +	if (unlikely(ret))
>> +		goto out;
>> +
>> +	ret = restrictedmem_create(mnt);
>> +
>> +	mnt_drop_write(mnt);
>> +out:
>> +	fdput(f);
>> +
>> +	return ret;
>> +}
>> +
>> +SYSCALL_DEFINE2(memfd_restricted, unsigned int, flags, int, mount_fd)
>> +{
>> +	if (flags & ~RMFD_USERMNT)
>> +		return -EINVAL;
>> +
>> +	if (flags == RMFD_USERMNT) {
>> +		if (mount_fd < 0)
>> +			return -EINVAL;
>> +
>> +		return restrictedmem_create_on_user_mount(mount_fd);
>> +	} else {
>> +		return restrictedmem_create(NULL);
>> +	}


> You can drop the else case:

> if (flags == RMFD_USERMNT) {
> 	...
> 	return restrictedmem_create_on_user_mount(mount_fd);
> }
> return restrictedmem_create(NULL);


I'll be refactoring this to adopt Kirill's suggestion of using a single
restrictedmem_create(mnt) call.


> I do wonder if you want to properly check for a flag instead of
> comparing values. Results in a more natural way to deal with flags:

> if (flags & RMFD_USERMNT) {

> }


Will use this in the next revision.

>> +}
>> +
>>    int restrictedmem_bind(struct file *file, pgoff_t start, pgoff_t end,
>>    		       struct restrictedmem_notifier *notifier, bool exclusive)
>>    {

> The "memfd_restricted" vs. "restrictedmem" terminology is a bit
> unfortunate, but not your fault here.


> I'm not a FS person, but it does look good to me.

