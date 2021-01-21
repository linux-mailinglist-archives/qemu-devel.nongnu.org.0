Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A71B2FEF09
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 16:38:47 +0100 (CET)
Received: from localhost ([::1]:57894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2c2o-0008D7-Ni
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 10:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l2c1b-0007mH-2h
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 10:37:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l2c1Z-0002jo-Dl
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 10:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611243448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QlOGhzT7vLVOv0NxGEx33EcMBa92emlBKzzcghHMv0Y=;
 b=TZa7tnlS+LrPvlZpkXF/bPV+ZOHNQ3KeAgzOwmCsh2S/kjcF+PtQntl3safxsR6o+hUFcm
 XF4GcOsZv6Q5PjL5lqbsI0L3rMtn0JEJ4f5FH0WpN3MZ0cG2ktIIkUWUBUoRfpATGCUwtL
 eDOoAIqMEmGG5noz9C7USH/TfkZgdzM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-PyFj0bYPPrWheJ1WVvn1FQ-1; Thu, 21 Jan 2021 10:37:25 -0500
X-MC-Unique: PyFj0bYPPrWheJ1WVvn1FQ-1
Received: by mail-qv1-f70.google.com with SMTP id bz15so1681478qvb.21
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 07:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QlOGhzT7vLVOv0NxGEx33EcMBa92emlBKzzcghHMv0Y=;
 b=MJcuKTCrf8kHLtjN6Aw3IIOUIzgC5HHBbX3cvAs8UueOaJs/F8gLLRChluaxLOYXna
 9IW5M0H8MxUnQNdcWc+jRHCnSHZSjaWYN8pB6wsiMednyQ9z5/34zsk2Vyz6tx58zwrR
 3vDL2w/sTeeSp6nIIJ5ctjp0YCOX+y/iuLSN0zy87zF9d2/IlLleKNCF7bfxKqtXjWO/
 gBueex3J++dcQWFD1MMCP8g12k/CjHqwTSoMayrVd9gK/oe3MZByl+uyrOOeqd3rq4xp
 j0BhuIwPTRuDnOZxU0XL474oFACiFhSm94HTNOyD0AmiBgRafS5VZwnmlGpaJbl1e6w9
 mOYw==
X-Gm-Message-State: AOAM531LfDZBfNAtdMF5roPowjuriJQxX2uplDBbf0V8jRMPkJazoG+4
 NYBc9hDEQDNTPt9aBySaU4k2mDluOuqlKEJzn8aRdL/at642CPOmEVyaCenl++N0ILCYwsAcVxj
 dDno99A8UZiOcBJ4=
X-Received: by 2002:ae9:e883:: with SMTP id a125mr264010qkg.431.1611243444749; 
 Thu, 21 Jan 2021 07:37:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynfQf0lLpYtkhDTUTBuC1bZzfsorXz+dqajGjWzpxM2v07RPUNuxu+szlNfPOLXehHZrgLlg==
X-Received: by 2002:ae9:e883:: with SMTP id a125mr263991qkg.431.1611243444500; 
 Thu, 21 Jan 2021 07:37:24 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id x49sm3786583qtx.6.2021.01.21.07.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 07:37:23 -0800 (PST)
Date: Thu, 21 Jan 2021 10:37:22 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v11 5/5] migration: introduce 'userfaultfd-wrlat.py' script
Message-ID: <20210121153722.GC260413@xz-x1>
References: <20210106152120.31279-1-andrey.gruzdev@virtuozzo.com>
 <20210106152120.31279-6-andrey.gruzdev@virtuozzo.com>
 <20210119210122.GA215736@xz-x1>
 <b51af344-856a-cb27-5aa8-c25e6aaf536e@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <b51af344-856a-cb27-5aa8-c25e6aaf536e@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu, Jan 21, 2021 at 04:12:23PM +0300, Andrey Gruzdev wrote:
> > > +/* KRETPROBE for handle_userfault(). */
> > > +int retprobe_handle_userfault(struct pt_regs *ctx)
> > > +{
> > > +    u64 pid = (u32) bpf_get_current_pid_tgid();
> > > +    u64 *addr_p;
> > > +
> > > +    /*
> > > +     * Here we just ignore the return value. In case of spurious wakeup
> > > +     * or pending signal we'll still get (at least for v5.8.0 kernel)
> > > +     * VM_FAULT_RETRY or (VM_FAULT_RETRY | VM_FAULT_MAJOR) here.
> > > +     * Anyhow, handle_userfault() would be re-entered if such case happens,
> > > +     * keeping initial timestamp unchanged for the faulting thread.
> > AFAIU this comment is not matching what the code does.  But I agree it's not a
> > big problem because we won't miss any long delays (because the one long delayed
> > sample will just be split into two or multiple delays, which will still be
> > reflected in the histogram at last).  Or am I wrong?
> 
> Mm, not really sure about comment.. I need to read kernel code again.

Not relevant to kernel; I was only talking about the last sentence where we
won't "keeping initial timestamp unchanged" but we'll do the statistic anyways.
Because exactly as you said we'll get VM_FAULT_RETRY unconditionally while we
won't be able to identify whether the page fault request is resolved or not.

-- 
Peter Xu


