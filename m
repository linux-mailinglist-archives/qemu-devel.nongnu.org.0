Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B1768B296
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 00:01:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOo03-0005DP-69; Sun, 05 Feb 2023 18:00:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pOnzv-00059b-K1
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 18:00:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pOnzt-00034p-L9
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 18:00:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675638032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0wv5Uzx9uGpiM7GTI4eFqGGy1WPmhUHM1Mq7FNWlct0=;
 b=IuAqm/T/CiMfQc+Mf2PlspOECEisvrSweIOhHSbdOkr1W2BWlnqiWE9V3KXry0N/A5Jra/
 VmzrSCWpmyyBDPlde4P+6Jh4Lfz1qyzvDP4kZ+/5vLRzKVD77CHUB13aGd8nmIx2MhWI9v
 canEMWX+0eViMG/FwBpN1KlOinKS5zI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-RlU9OxteOUi3HweDz2EKIQ-1; Sun, 05 Feb 2023 18:00:31 -0500
X-MC-Unique: RlU9OxteOUi3HweDz2EKIQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 j29-20020a05620a001d00b00724fd33cb3eso6876630qki.14
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 15:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0wv5Uzx9uGpiM7GTI4eFqGGy1WPmhUHM1Mq7FNWlct0=;
 b=LnQ2xIU0aN08IxQ4uuWrfyDeyozzj7BVYW7LUNZWFGNPj+05KwFLTuA957DAaZ+4pK
 XIP9T5ZChxGzlfdVh/0SDNwE5pNo2eY2W56PtjrobzFHGPpdyAw2uuM0Csg3hiwHVQ1Q
 Ceg9P6Z7LoennMCk0xusg6uvMtFSg21h6CAJdqKfTT1dyM2CoU9hmM89k6vaSCXM/suX
 HyPXTRZvt8beYnVX+UJYcWHJMBjOuRvP+h28eAoQztAwQ6XNb/FOMdegdgUGt7sFlu1s
 j7CzWpVB/1M+MEFwcF4Bw7iVLkAfKZtNNR3CFqKRe4irAdf1JprtISJVJWvtSGs6QJCP
 2Fbg==
X-Gm-Message-State: AO0yUKXskUnGll7b8X0xGJ3I3RfOWzMdknq5PpsMXDf49uLqgRUWm6QN
 d702JNhWAAccP33Wh2LwWa7dfqawBbWRPGssyBTrYtbjK4U3dYGO/93nSBLHIv3/ehW7ym0FIGD
 c3x9ZgTvwBOdxHKbXDDk+MdVukqUhRtbTnQkZJpXMXAblAWGrs1eFKldl4qwnXsQH
X-Received: by 2002:ac8:664c:0:b0:3b9:fc92:a6 with SMTP id
 j12-20020ac8664c000000b003b9fc9200a6mr15552344qtp.6.1675638030426; 
 Sun, 05 Feb 2023 15:00:30 -0800 (PST)
X-Google-Smtp-Source: AK7set8uwENAq8P9ZGtjiCUsgUjBCyG1K8Kqn7kVjXJrpcFnb9YmTLk1f+kqNFBoJKVVFpgTiM/gMA==
X-Received: by 2002:ac8:664c:0:b0:3b9:fc92:a6 with SMTP id
 j12-20020ac8664c000000b003b9fc9200a6mr15552286qtp.6.1675638030068; 
 Sun, 05 Feb 2023 15:00:30 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 z10-20020ac8430a000000b003b646a99aa6sm5973925qtm.77.2023.02.05.15.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 15:00:29 -0800 (PST)
Date: Sun, 5 Feb 2023 18:00:28 -0500
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Xiaohui Li <xiaohli@redhat.com>
Subject: Re: [PATCH] kvm: dirty-ring: Fix race with vcpu creation
Message-ID: <Y+A1DNtDVExAkCR1@x1n>
References: <20220927154653.77296-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220927154653.77296-1-peterx@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ping

On Tue, Sep 27, 2022 at 11:46:53AM -0400, Peter Xu wrote:
> It's possible that we want to reap a dirty ring on a vcpu that is during
> creation, because the vcpu is put onto list (CPU_FOREACH visible) before
> initialization of the structures.  In this case:
> 
> qemu_init_vcpu
>     x86_cpu_realizefn
>         cpu_exec_realizefn
>             cpu_list_add      <---- can be probed by CPU_FOREACH
>         qemu_init_vcpu
>             cpus_accel->create_vcpu_thread(cpu);
>                 kvm_init_vcpu
>                     map kvm_dirty_gfns  <--- kvm_dirty_gfns valid
> 
> Don't try to reap dirty ring on vcpus during creation or it'll crash.
> 
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2124756
> Reported-by: Xiaohui Li <xiaohli@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  accel/kvm/kvm-all.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 5acab1767f..df5fabd3a8 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -757,6 +757,15 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
>      uint32_t ring_size = s->kvm_dirty_ring_size;
>      uint32_t count = 0, fetch = cpu->kvm_fetch_index;
>  
> +    /*
> +     * It's possible that we race with vcpu creation code where the vcpu is
> +     * put onto the vcpus list but not yet initialized the dirty ring
> +     * structures.  If so, skip it.
> +     */
> +    if (!cpu->created) {
> +        return 0;
> +    }
> +
>      assert(dirty_gfns && ring_size);
>      trace_kvm_dirty_ring_reap_vcpu(cpu->cpu_index);
>  
> -- 
> 2.37.3
> 

-- 
Peter Xu


