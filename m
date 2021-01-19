Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C642FC245
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 22:29:00 +0100 (CET)
Received: from localhost ([::1]:47740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1yYd-0004JF-JX
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 16:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l1y86-0003D4-B2
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 16:01:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l1y81-0004e2-Gg
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 16:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611090087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=etSysW3ceOoZFkQYKrHyYO21VkyKDgwb+Lo91NtWW/c=;
 b=Hb3lR5M/ARe/D7yN5nu0Z3/jDogK6vgy0alnS3YixaF6SzP1AvGO6krozNQXVbTyomAHka
 ZEPm9bKFA/aazxL842yEXgrT3PZO7JmSvGv5BVBQNloyNwZUigsSgrTQZlLLa05szoaKfc
 1C7+jAjS1rYw3l0jZp+i1nAIbk63ryk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-wsY80dzPPUGNQeB27yvY8g-1; Tue, 19 Jan 2021 16:01:26 -0500
X-MC-Unique: wsY80dzPPUGNQeB27yvY8g-1
Received: by mail-qt1-f198.google.com with SMTP id m21so19307731qtp.6
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 13:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=etSysW3ceOoZFkQYKrHyYO21VkyKDgwb+Lo91NtWW/c=;
 b=jrVQ27TiVJ5kp8KhP8LzHYsE2vs6rec21zYs/U4iLABJ79uuIFuJozYYwJMLNl5Dox
 uBo6tzhPZcKXB3JMRl/2g2YJPRHgYVLx4FqJS3m+Ffupx0CYTZzn41FBoUvecODC1ePE
 7P/1bJfmnqcjdJ5wL1f1AmiOffKWLPJkGL4HGTtOVvdY0AH+YS4zEpCMe0zCf+mjBtAL
 p6P3/19Z2b73Yn22tP25LCraWO2f2qlY2cDev8YmSpeBwoL0U8IVqYa1FSgJjykEJ06W
 pER74u7wcKTSzB21+Xol8nUSYENl/2rBwvA/Pe9B4NNP3R1SOzUohySQwLtYV53TViIl
 7KUw==
X-Gm-Message-State: AOAM533TbwxeHOWlYpQYp83ynA4KD2EnZ+r6SF+/1J/AOm8Q3rdJJP16
 aKmZgdFNeChdjmz4/TLQzbH5pLZZ62dKwyQS2P/e9zi0orfqiaAJS2KOJbJmk3rkEV/CdGGVHJy
 lSraKb+NSGuTDl4A=
X-Received: by 2002:ac8:5385:: with SMTP id x5mr6101708qtp.321.1611090085869; 
 Tue, 19 Jan 2021 13:01:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjKjBejzM7Q0MaYRFUjMlgQS1FB0cBYigKslrvdlVhMnSrZ1Qgb57MVplhVyhECO2PiMan/w==
X-Received: by 2002:ac8:5385:: with SMTP id x5mr6101568qtp.321.1611090084384; 
 Tue, 19 Jan 2021 13:01:24 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id y15sm13014130qto.51.2021.01.19.13.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 13:01:23 -0800 (PST)
Date: Tue, 19 Jan 2021 16:01:22 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v11 5/5] migration: introduce 'userfaultfd-wrlat.py' script
Message-ID: <20210119210122.GA215736@xz-x1>
References: <20210106152120.31279-1-andrey.gruzdev@virtuozzo.com>
 <20210106152120.31279-6-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210106152120.31279-6-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 06, 2021 at 06:21:20PM +0300, Andrey Gruzdev wrote:
> Add BCC/eBPF script to analyze userfaultfd write fault latency distribution.
> 
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> Acked-by: Peter Xu <peterx@redhat.com>

(This seems to be the last patch that lacks a r-b ... Let's see whether I could
 convert my a-b into an r-b... :)

> +BPF_HASH(ev_start, struct ev_desc, u64);
> +BPF_HASH(ctx_handle_userfault, u64, u64);

IMHO we only need one hash here instead of two:

  BPF_HASH(ev_start, u32, u64);

Where we use the tid as the key (u32), and timestamp as the value (u64).  The
thing is we don't really need the address for current statistics, IMHO.

> +/* KPROBE for handle_userfault(). */
> +int probe_handle_userfault(struct pt_regs *ctx, struct vm_fault *vmf,
> +        unsigned long reason)
> +{
> +    /* Trace only UFFD write faults. */
> +    if (reason & VM_UFFD_WP) {

Better with comment:

           /* Using "(u32)" to drop group ID which is upper 32 bits */

If even better, we'd want a get_current_tid() helper and call it here and below
(bpf_get_current_pid_tgid() will return tid|gid<<32 I think, so I'm a bit
confused why bcc people called it pid at the first place...).

> +        u64 pid = (u32) bpf_get_current_pid_tgid();
> +        u64 addr = vmf->address;
> +
> +        do_event_start(pid, addr);
> +        ctx_handle_userfault.update(&pid, &addr);
> +    }
> +    return 0;
> +}
> +
> +/* KRETPROBE for handle_userfault(). */
> +int retprobe_handle_userfault(struct pt_regs *ctx)
> +{
> +    u64 pid = (u32) bpf_get_current_pid_tgid();
> +    u64 *addr_p;
> +
> +    /*
> +     * Here we just ignore the return value. In case of spurious wakeup
> +     * or pending signal we'll still get (at least for v5.8.0 kernel)
> +     * VM_FAULT_RETRY or (VM_FAULT_RETRY | VM_FAULT_MAJOR) here.
> +     * Anyhow, handle_userfault() would be re-entered if such case happens,
> +     * keeping initial timestamp unchanged for the faulting thread.

AFAIU this comment is not matching what the code does.  But I agree it's not a
big problem because we won't miss any long delays (because the one long delayed
sample will just be split into two or multiple delays, which will still be
reflected in the histogram at last).  Or am I wrong?

> +     */
> +    addr_p = ctx_handle_userfault.lookup(&pid);
> +    if (addr_p) {
> +        do_event_end(pid, *addr_p);
> +        ctx_handle_userfault.delete(&pid);
> +    }
> +    return 0;
> +}
> +"""

Other than that, the rest looks good to me.

I'd think it's fine to even merge the current version since it actually works
nicely.  Andrey, if you agree with any of my above comments, feel free to
repost this patch (since I see Dave provided the rest r-bs).  Then I think I
can r-b this one too.  Thanks!

-- 
Peter Xu


