Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254E6308782
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:42:08 +0100 (CET)
Received: from localhost ([::1]:47312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5QI3-00068B-7N
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5QEz-0004WH-K7
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:38:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5QEw-0005NS-4v
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611913131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Za3NK70jZUhzOMYafMqssCd2N4L1K/qOReYiXStKNeo=;
 b=DuA/BD6kBPFupylEncLxIGSp3dAD0/y/iUimHse62T0WjS+wx+IoavhwosOBCo+hl2b2qe
 qnT0gGq/xGeLv5NTjchCE/bFnggglqQc0vegGibmAS/HfXsZWL2jQYq8fTtViy5Qgxlcoz
 leryU0/qzJXfH/qyjd/3fadNExGU5N0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-sH0UsYNtPQiC-9iPS8JuFw-1; Fri, 29 Jan 2021 04:38:49 -0500
X-MC-Unique: sH0UsYNtPQiC-9iPS8JuFw-1
Received: by mail-wr1-f72.google.com with SMTP id d7so4717504wri.23
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 01:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Za3NK70jZUhzOMYafMqssCd2N4L1K/qOReYiXStKNeo=;
 b=V8xTPvUqnRxyaZFzKJGZc5LeWQIagifvwEKsMV4gWJVVtQHwoz7Dx06QW3ya0LHOwP
 NfEjt7iETXFbTZ72qSbi/EALk3rkPIbg/y5LyldoK+zXcyDVPrhjJ6ScrhqNxEjCfD89
 6wTZ/oIU8KXazH9iFS7V7z4bzpwzQEbi7S3AZlD5AL53YtSiqTq90/p2y834hzET12Ve
 zxRJZFJRwJuF10YR6tELMsKlcArJOZY8nuQ4t4pU4vA6HKmGBJkQVLNMvqySb1Y6Dl34
 C7Dbqvd7KZIS7WF/fBZgnseDzx5yXb5OS38G4jyhotQNngpykxTS1HZLeWq1XSIPlefj
 LwRQ==
X-Gm-Message-State: AOAM531XjCS5R4oL7BUF4RDztW6l76S+JDrhDyUFgKB1mE/eduUn5PpK
 KbWBoGYDtCffBzD907Yq1Je+JDI6+ZfQb9BM2cUuzr4ZtP6FqtgPTvXg4+rt3sECWG/MeDWx+lx
 E/0CZpD5CFkza2+A=
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr3535528wri.77.1611913127774; 
 Fri, 29 Jan 2021 01:38:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywBwSxr10KkTNbREhFCnp85O4vf5O9J5datrNsxXv5Kxxpm52c90nSPAKH8ayf/ICgF/WePA==
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr3535502wri.77.1611913127537; 
 Fri, 29 Jan 2021 01:38:47 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e4sm11508170wrw.96.2021.01.29.01.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 01:38:46 -0800 (PST)
Subject: Re: [PATCH] accel/kvm/kvm-all: Fix wrong return code handling in
 dirty log code
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210129084354.42928-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e78e013e-d2f3-4019-2644-4717cbc62507@redhat.com>
Date: Fri, 29 Jan 2021 10:38:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129084354.42928-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Serge Hallyn <serge.hallyn@ubuntu.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/01/21 09:43, Thomas Huth wrote:
> The kvm_vm_ioctl() wrapper already returns -errno if the ioctl itself
> returned -1, so the callers of kvm_vm_ioctl() should not check for -1
> but for a value < 0 instead.
> 
> This problem has been fixed once already in commit b533f658a98325d0e4
> but that commit missed that the ENOENT error code is not fatal for
> this ioctl, so the commit has been reverted in commit 50212d6346f33d6e
> since the problem occurred close to a pending release at that point
> in time. The plan was to fix it properly after the release, but it
> seems like this has been forgotten. So let's do it now finally instead.
> 
> Resolves: https://bugs.launchpad.net/qemu/+bug/1294227
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   accel/kvm/kvm-all.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 3feb17d965..7224596932 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -668,16 +668,19 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
>   
>           d.dirty_bitmap = mem->dirty_bmap;
>           d.slot = mem->slot | (kml->as_id << 16);
> -        if (kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) == -1) {
> -            DPRINTF("ioctl failed %d\n", errno);
> -            ret = -1;
> +        ret = kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d);
> +        if (ret == -ENOENT) {
> +            /* kernel does not have dirty bitmap in this slot */
> +            ret = 0;
> +        } else if (ret < 0) {
> +            error_report("ioctl KVM_GET_DIRTY_LOG failed: %d", errno);
>               goto out;
> +        } else {
> +            subsection.offset_within_region += slot_offset;
> +            subsection.size = int128_make64(slot_size);
> +            kvm_get_dirty_pages_log_range(&subsection, d.dirty_bitmap);
>           }
>   
> -        subsection.offset_within_region += slot_offset;
> -        subsection.size = int128_make64(slot_size);
> -        kvm_get_dirty_pages_log_range(&subsection, d.dirty_bitmap);
> -
>           slot_offset += slot_size;
>           start_addr += slot_size;
>           size -= slot_size;
> @@ -774,8 +777,8 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>       d.num_pages = bmap_npages;
>       d.slot = mem->slot | (as_id << 16);
>   
> -    if (kvm_vm_ioctl(s, KVM_CLEAR_DIRTY_LOG, &d) == -1) {
> -        ret = -errno;
> +    ret = kvm_vm_ioctl(s, KVM_CLEAR_DIRTY_LOG, &d);
> +    if (ret < 0 && ret != -ENOENT) {
>           error_report("%s: KVM_CLEAR_DIRTY_LOG failed, slot=%d, "
>                        "start=0x%"PRIx64", size=0x%"PRIx32", errno=%d",
>                        __func__, d.slot, (uint64_t)d.first_page,
> 

Queued, thanks.

Paolo


