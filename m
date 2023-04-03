Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B3D6D3EDE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 10:23:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjFRz-0008TS-4G; Mon, 03 Apr 2023 04:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pjFRw-0008TD-WD
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 04:22:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pjFRu-0005Pz-6q
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 04:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680510117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jQzDBAQKeqgfsxxyrlkQCm/LEl+p6ixMadQZXFxQxwQ=;
 b=auyQSzvhbUefgQ193ODr8OgWLQS23eFY3kxcjzMlnaSi22TPJrFTeq+xgjTomneaw+rEQ3
 1+IHCnD+QkPY9t96SXkMwX2sCraKSQqvbV/Glm92nWtd92Nyw+P/wV6oRojsW+IRLKKxnq
 f3X+KD+z9dlwG5bFuK6YFQ1hkM39MXg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-wsysqcpUNWm77fFbQqCXlQ-1; Mon, 03 Apr 2023 04:21:52 -0400
X-MC-Unique: wsysqcpUNWm77fFbQqCXlQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v7-20020a05600c470700b003ef6ebfa99fso11157698wmo.8
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 01:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680510112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jQzDBAQKeqgfsxxyrlkQCm/LEl+p6ixMadQZXFxQxwQ=;
 b=YbmishVLY7ywnmnFf7YYgkifLP503F+BxzHDezvzFR7rccWcBZ0GAvSuWF/UmGED+e
 TrnDSkZWGUqCQ3ShU7rWIVjNtAiZdlujt+xRrI7RIsvXb5hOaHhDr079IKHUI2UypGWF
 wvqLSvrFVmHb7t8RyxZdWE4ea9qGpymnz1IER9Dsu6uy/Xud2Uy1Pe1kgTBQGc672jEW
 3+3bRSJ2zqIbXSkSLZrV02ID6W7Nxmjxd2HGmYA6FHV22EWEwyS3/2y05tGsS80Wqe9b
 bTqttcqsDUiim+uipE+37XHrQd4maF66nwB4p6zx+FYDz3WGW8aFI51yYy8S1rqMmaei
 tmGg==
X-Gm-Message-State: AO0yUKXUZbZtRrYEo+5gRd39mMm6Vyjtbga1btXCMXbdMpE08/A70k41
 0v7ke8a4aQVesJRT8XgP4EtdlpOmF2mC7Mmtws7HQ4VJA49vGoUUwEN0UGXvDvtg3xaRctbeGdB
 HLtZBXehDUItdUoQ=
X-Received: by 2002:a05:600c:20d:b0:3ee:672d:caae with SMTP id
 13-20020a05600c020d00b003ee672dcaaemr26843814wmi.36.1680510111656; 
 Mon, 03 Apr 2023 01:21:51 -0700 (PDT)
X-Google-Smtp-Source: AK7set/AgkVl4NRObZrwop/hyYIrLuclF7oALAw2adBku9J1XTbgT5nDnZVWZTlkdOAVCBUc2F54wA==
X-Received: by 2002:a05:600c:20d:b0:3ee:672d:caae with SMTP id
 13-20020a05600c020d00b003ee672dcaaemr26843772wmi.36.1680510111270; 
 Mon, 03 Apr 2023 01:21:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:5e00:8e78:71f3:6243:77f0?
 (p200300cbc7025e008e7871f3624377f0.dip0.t-ipconnect.de.
 [2003:cb:c702:5e00:8e78:71f3:6243:77f0])
 by smtp.gmail.com with ESMTPSA id
 c2-20020adfe702000000b002d6f285c0a2sm9135348wrm.42.2023.04.03.01.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 01:21:50 -0700 (PDT)
Message-ID: <f0232380-4171-f4d3-f1a6-07993e551b46@redhat.com>
Date: Mon, 3 Apr 2023 10:21:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, qemu-devel@nongnu.org
Cc: aarcange@redhat.com, ak@linux.intel.com, akpm@linux-foundation.org,
 arnd@arndb.de, bfields@fieldses.org, bp@alien8.de,
 chao.p.peng@linux.intel.com, corbet@lwn.net, dave.hansen@intel.com,
 ddutile@redhat.com, dhildenb@redhat.com, hpa@zytor.com, hughd@google.com,
 jlayton@kernel.org, jmattson@google.com, joro@8bytes.org,
 jun.nakajima@intel.com, kirill.shutemov@linux.intel.com,
 linmiaohe@huawei.com, luto@kernel.org, mail@maciej.szmigiero.name,
 mhocko@suse.com, michael.roth@amd.com, mingo@redhat.com,
 naoya.horiguchi@nec.com, pbonzini@redhat.com, qperret@google.com,
 rppt@kernel.org, seanjc@google.com, shuah@kernel.org, steven.price@arm.com,
 tabba@google.com, tglx@linutronix.de, vannapurve@google.com, vbabka@suse.cz,
 vkuznets@redhat.com, wanpengli@tencent.com, wei.w.wang@intel.com,
 x86@kernel.org, yu.c.zhang@linux.intel.com
References: <cover.1680306489.git.ackerleytng@google.com>
 <592ebd9e33a906ba026d56dc68f42d691706f865.1680306489.git.ackerleytng@google.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC PATCH v3 1/2] mm: restrictedmem: Allow userspace to specify
 mount for memfd_restricted
In-Reply-To: <592ebd9e33a906ba026d56dc68f42d691706f865.1680306489.git.ackerleytng@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.37, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 01.04.23 01:50, Ackerley Tng wrote:
> By default, the backing shmem file for a restrictedmem fd is created
> on shmem's kernel space mount.
> 
> With this patch, an optional tmpfs mount can be specified via an fd,
> which will be used as the mountpoint for backing the shmem file
> associated with a restrictedmem fd.
> 
> This will help restrictedmem fds inherit the properties of the
> provided tmpfs mounts, for example, hugepage allocation hints, NUMA
> binding hints, etc.
> 
> Permissions for the fd passed to memfd_restricted() is modeled after
> the openat() syscall, since both of these allow creation of a file
> upon a mount/directory.
> 
> Permission to reference the mount the fd represents is checked upon fd
> creation by other syscalls (e.g. fsmount(), open(), or open_tree(),
> etc) and any process that can present memfd_restricted() with a valid
> fd is expected to have obtained permission to use the mount
> represented by the fd. This behavior is intended to parallel that of
> the openat() syscall.
> 
> memfd_restricted() will check that the tmpfs superblock is
> writable, and that the mount is also writable, before attempting to
> create a restrictedmem file on the mount.
> 
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>   include/linux/syscalls.h           |  2 +-
>   include/uapi/linux/restrictedmem.h |  8 ++++
>   mm/restrictedmem.c                 | 74 +++++++++++++++++++++++++++---
>   3 files changed, 77 insertions(+), 7 deletions(-)
>   create mode 100644 include/uapi/linux/restrictedmem.h
> 
> diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
> index f9e9e0c820c5..a23c4c385cd3 100644
> --- a/include/linux/syscalls.h
> +++ b/include/linux/syscalls.h
> @@ -1056,7 +1056,7 @@ asmlinkage long sys_memfd_secret(unsigned int flags);
>   asmlinkage long sys_set_mempolicy_home_node(unsigned long start, unsigned long len,
>   					    unsigned long home_node,
>   					    unsigned long flags);
> -asmlinkage long sys_memfd_restricted(unsigned int flags);
> +asmlinkage long sys_memfd_restricted(unsigned int flags, int mount_fd);
> 
>   /*
>    * Architecture-specific system calls
> diff --git a/include/uapi/linux/restrictedmem.h b/include/uapi/linux/restrictedmem.h
> new file mode 100644
> index 000000000000..22d6f2285f6d
> --- /dev/null
> +++ b/include/uapi/linux/restrictedmem.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef _UAPI_LINUX_RESTRICTEDMEM_H
> +#define _UAPI_LINUX_RESTRICTEDMEM_H
> +
> +/* flags for memfd_restricted */
> +#define RMFD_USERMNT		0x0001U

I wonder if we can come up with a more expressive prefix than RMFD. 
Sounds more like "rm fd" ;) Maybe it should better match the 
"memfd_restricted" syscall name, like "MEMFD_RSTD_USERMNT".


> +
> +#endif /* _UAPI_LINUX_RESTRICTEDMEM_H */
> diff --git a/mm/restrictedmem.c b/mm/restrictedmem.c
> index c5d869d8c2d8..f7b62364a31a 100644
> --- a/mm/restrictedmem.c
> +++ b/mm/restrictedmem.c
> @@ -1,11 +1,12 @@
>   // SPDX-License-Identifier: GPL-2.0
> -#include "linux/sbitmap.h"

Looks like an unrelated change?

> +#include <linux/namei.h>
>   #include <linux/pagemap.h>
>   #include <linux/pseudo_fs.h>
>   #include <linux/shmem_fs.h>
>   #include <linux/syscalls.h>
>   #include <uapi/linux/falloc.h>
>   #include <uapi/linux/magic.h>
> +#include <uapi/linux/restrictedmem.h>
>   #include <linux/restrictedmem.h>
> 
>   struct restrictedmem {
> @@ -189,19 +190,20 @@ static struct file *restrictedmem_file_create(struct file *memfd)
>   	return file;
>   }
> 
> -SYSCALL_DEFINE1(memfd_restricted, unsigned int, flags)
> +static int restrictedmem_create(struct vfsmount *mount)
>   {
>   	struct file *file, *restricted_file;
>   	int fd, err;
> 
> -	if (flags)
> -		return -EINVAL;
> -
>   	fd = get_unused_fd_flags(0);
>   	if (fd < 0)
>   		return fd;
> 
> -	file = shmem_file_setup("memfd:restrictedmem", 0, VM_NORESERVE);
> +	if (mount)
> +		file = shmem_file_setup_with_mnt(mount, "memfd:restrictedmem", 0, VM_NORESERVE);
> +	else
> +		file = shmem_file_setup("memfd:restrictedmem", 0, VM_NORESERVE);
> +
>   	if (IS_ERR(file)) {
>   		err = PTR_ERR(file);
>   		goto err_fd;
> @@ -223,6 +225,66 @@ SYSCALL_DEFINE1(memfd_restricted, unsigned int, flags)
>   	return err;
>   }
> 
> +static bool is_shmem_mount(struct vfsmount *mnt)
> +{
> +	return mnt && mnt->mnt_sb && mnt->mnt_sb->s_magic == TMPFS_MAGIC;
> +}
> +
> +static bool is_mount_root(struct file *file)
> +{
> +	return file->f_path.dentry == file->f_path.mnt->mnt_root;
> +}

I'd inline at least that function, pretty self-explaining.

> +
> +static int restrictedmem_create_on_user_mount(int mount_fd)
> +{
> +	int ret;
> +	struct fd f;
> +	struct vfsmount *mnt;
> +
> +	f = fdget_raw(mount_fd);
> +	if (!f.file)
> +		return -EBADF;
> +
> +	ret = -EINVAL;
> +	if (!is_mount_root(f.file))
> +		goto out;
> +
> +	mnt = f.file->f_path.mnt;
> +	if (!is_shmem_mount(mnt))
> +		goto out;
> +
> +	ret = file_permission(f.file, MAY_WRITE | MAY_EXEC);
> +	if (ret)
> +		goto out;
> +
> +	ret = mnt_want_write(mnt);
> +	if (unlikely(ret))
> +		goto out;
> +
> +	ret = restrictedmem_create(mnt);
> +
> +	mnt_drop_write(mnt);
> +out:
> +	fdput(f);
> +
> +	return ret;
> +}
> +
> +SYSCALL_DEFINE2(memfd_restricted, unsigned int, flags, int, mount_fd)
> +{
> +	if (flags & ~RMFD_USERMNT)
> +		return -EINVAL;
> +
> +	if (flags == RMFD_USERMNT) {
> +		if (mount_fd < 0)
> +			return -EINVAL;
> +
> +		return restrictedmem_create_on_user_mount(mount_fd);
> +	} else {
> +		return restrictedmem_create(NULL);
> +	}


You can drop the else case:

if (flags == RMFD_USERMNT) {
	...
	return restrictedmem_create_on_user_mount(mount_fd);
}
return restrictedmem_create(NULL);


I do wonder if you want to properly check for a flag instead of 
comparing values. Results in a more natural way to deal with flags:

if (flags & RMFD_USERMNT) {

}

> +}
> +
>   int restrictedmem_bind(struct file *file, pgoff_t start, pgoff_t end,
>   		       struct restrictedmem_notifier *notifier, bool exclusive)
>   {

The "memfd_restricted" vs. "restrictedmem" terminology is a bit 
unfortunate, but not your fault here.


I'm not a FS person, but it does look good to me.

-- 
Thanks,

David / dhildenb


