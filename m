Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEBD57A287
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 16:59:01 +0200 (CEST)
Received: from localhost ([::1]:38366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDoge-0001xs-2k
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 10:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oDofD-0000Y8-8l
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:57:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oDoew-0005ya-GN
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658242633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=70ZcUJ1myXBL9cVjb36PmZOFKW6fFWF+Gt7R5Xv39zc=;
 b=dq8pZRhTQjkk+a55CrDTqOn5q5EB/y+3Uke2Sio8Mym1VAAIIO7WhBQxsRKuw4dKUbaBJM
 tbJLiT+IPRqCzVuX0Juq54w3PpqRvy9t9hcKj8qydUYaghBfg/EBZdmw0AgfqsaOx/hV+7
 qa3e8hJhT6Q/ywznR/7ihPHVc4DL+xQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-u0qZpjvEOKS5bw5OTixbxw-1; Tue, 19 Jul 2022 10:57:11 -0400
X-MC-Unique: u0qZpjvEOKS5bw5OTixbxw-1
Received: by mail-qt1-f200.google.com with SMTP id
 a18-20020a05622a02d200b0031ed7ae9abeso8872554qtx.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 07:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=70ZcUJ1myXBL9cVjb36PmZOFKW6fFWF+Gt7R5Xv39zc=;
 b=V+I3xrTZ0NvOY0sGp0eo2CNEe/WwRIJoDCB7fMEl26qVxPyqauZjH+VQyGKW8CsILj
 C53s5GzQN9NJhmAUb/KkHNDqc2fYMOvH2L0epwi4MxBzdtPdDnnyH97g/mNmvGxYzVGt
 2SohAbooKZl2X1dX4L337FRU3GdigSEIEdrykXzyCtlI8MMpMphfZywYLbpMbrmFhib5
 TE2D2OEVIB6yfspOByvE9bR38dhtf7uES8bV35HMegppHHFbx5sfwvpkg9v6spAGMdTd
 Ivtf4n1QO+M5CLCCixGcMCE2BcJGx2iqTu73E3FyAvNqBDS/vpYdrhNjKthGKpTYtVIL
 +sBg==
X-Gm-Message-State: AJIora8YJvxBtNdk95plq5dSOGG6D5qI6mwFgH3t1iTTdphKzOncLq4j
 s3Hp4HOh1uwvK5ImwJNeOv4kulxPxRydbtNWuZ/YwOM8dGcJVI9CPuePzLlQsCYxQYiJOtQ3vT6
 izg+2Ha2w5JqfGDkxvSkWLvlX2AYoN27lZ6b9QI9HKpgmcgVUSDxnemj76sSd8NOp
X-Received: by 2002:a05:620a:1aa0:b0:6b5:e5eb:fff3 with SMTP id
 bl32-20020a05620a1aa000b006b5e5ebfff3mr7350992qkb.431.1658242630482; 
 Tue, 19 Jul 2022 07:57:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vpA80dwJaMEIY/ArozsnYb4Gnx+p/KAC+If40TDV9Qava0MMp+1ey9udlR7U4UOAvjWAx1RQ==
X-Received: by 2002:a05:620a:1aa0:b0:6b5:e5eb:fff3 with SMTP id
 bl32-20020a05620a1aa000b006b5e5ebfff3mr7350974qkb.431.1658242630159; 
 Tue, 19 Jul 2022 07:57:10 -0700 (PDT)
Received: from xz-m1.local ([74.12.30.48]) by smtp.gmail.com with ESMTPSA id
 fb10-20020a05622a480a00b0031ecb762677sm6772947qtb.66.2022.07.19.07.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 07:57:09 -0700 (PDT)
Date: Tue, 19 Jul 2022 10:57:04 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: Re: [PATCH 0/5] CPU: Detect put cpu register errors for migrations
Message-ID: <YtbGQBnGlcAEDyFy@xz-m1.local>
References: <20220617144857.34189-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220617144857.34189-1-peterx@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Fri, Jun 17, 2022 at 10:48:52AM -0400, Peter Xu wrote:
> rfc->v1:
> - Rebase to master, drop RFC tag.
> 
> This series teaches QEMU to detect errors when e.g. putting registers from
> QEMU to KVM, and fail migrations properly.
> 
> For the rational of this series and why it was posted, please refer to the
> bug report here:
> 
> https://lore.kernel.org/all/YppVupW+IWsm7Osr@xz-m1.local/
> 
> But I'd rather not go into that if the reviewer doesn't have that context,
> because we don't really need that complexity..  It can be simple as we
> should fail migration early when we see issues happening already, so:
> 
>   1) We fail explicitly, rather than afterward with some weird guest
>      errors.  In my bug report, it was a guest double fault.  There's
>      another bug report that Sean mentioned in the thread from Mike Tancsa
>      that can have other sympotons rather than double fault, but anyway
>      they'll be hard to diagnose since the processor state can be corrupted
>      (please refer to kvm_arch_put_registers() where we stop putting more
>      registers to KVM when we see any error).
> 
>   2) For precopy, with this early failure the VM won't crash itself since
>      we still have a chance to keep running it on src host, while if
>      without this patch we will fail later, and it can crash the VM.
> 
> In this specific case, when KVM_SET_XSAVE ioctl failed on dest host before
> start running the VM there, we should fail the migration already.
> 
> After the patchset applied, the above "double fault" issue will become
> migration failures, and...
> 
> For precopy, we can see some error dumped for precopy on dest, then the VM
> will be kept running on src host:
> 
> 2022-06-07T22:48:48.804234Z qemu-system-x86_64: kvm_arch_put_registers() failed with retval=-22
> 2022-06-07T22:48:48.804588Z qemu-system-x86_64: load of migration failed: Invalid argument
> 
> For postcopy, currently we'll pause the VM immediately for admin to decide
> what to do:
> 
> 2022-06-07T22:47:49.448192Z qemu-system-x86_64: kvm_arch_put_registers() failed with retval=-22
> 13072@1654642069.518993:runstate_set current_run_state 1 (inmigrate) new_state 4 (paused)
> 
> If something like this series is welcomed, we could do better in the future
> by telling the src host about this issue and keep running, because
> put-register happens right at the switch-over, so we actually have this
> chance (no dirty page on dest host yet).
> 
> Comments welcomed.  Thanks,

Ping,

We seem to still hit FPU-put issues and it always takes time to debug on
unsynchronized cpu registers because it can cause all kinds of errors. The
real evil should be that not only we ignored errors on e.g. put xsave, but
also we will stop putting all the rest cpu regs after any of such failure,
then qemu continues to run with synced + fail-synced + unsynced registers.

It'll be great if something like this series could still be considered.

Thanks,

-- 
Peter Xu


