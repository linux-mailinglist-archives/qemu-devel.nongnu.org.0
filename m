Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ABD42ED2F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:08:46 +0200 (CEST)
Received: from localhost ([::1]:45212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJCo-0004u3-1Z
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mbIaF-0006kc-Qa
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:28:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mbIaD-0000E4-OU
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634286529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JSYsRYhfmzYA5ZwbCxdcAkPnsb+mzLsmoxaDZymhk3Y=;
 b=SMnQ6slTQ+LWEqYBzuQeswAB5cM1K8ZZPvSg8NgbRn0ij4f6dzVFebfMpMVgLG9zKvu1DT
 EOK2gMRrfKpF8KIlwuNvdPKMmq+TQHF68ch4Nw1L7UAoY9FnL7zl/zFLS0hOB7gpXI1jVU
 ERoTbCzodTEgYF3UGnlX1CSMLm52Qtw=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-QRGbCoKhNeCvjNfeDmlrcQ-1; Fri, 15 Oct 2021 04:28:46 -0400
X-MC-Unique: QRGbCoKhNeCvjNfeDmlrcQ-1
Received: by mail-pl1-f197.google.com with SMTP id
 m5-20020a170902bb8500b0013a2b785187so3606421pls.11
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 01:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JSYsRYhfmzYA5ZwbCxdcAkPnsb+mzLsmoxaDZymhk3Y=;
 b=M80oQ44Byu7JmldeuKl/DrYx7xGJ+aZlKN76xaZWjvykAcdgfzx4UCbbyUyo6PNSve
 /EeWWlEhhFGJU6hlYMyEDnJKrlRUKPGCBPA9kBStS1wIVww2LbiwCouxfw0cLPj+5C52
 xUkyfHPYNMHKGMKdt9cN+NsXP/Ri6SerMu2etgOggR0+ySHSi7bedFlBR8K/V+udMegv
 ex01qigslraUbkMSvWyotuh1DNTZnvZqNAHqcpoL472FV/By1ZU7aob+PUwMv4lVSsxe
 mgYAjBj0Z921vzR7ZptQpQ09jDU5ZC9NtXCNtu60OzY7N02idpb12gnQ34m8E5w7lhbD
 8QiQ==
X-Gm-Message-State: AOAM530osxfhpauL/rmZMGSK/cHtjfUv5rpdKhSeWndyDK7nk4IqmXen
 r2L9uYz9Lw7B8rKAnOtuO4Ke4hZ+gjL06cjapH2buuEfHnh6QVrkukBEFWVZsgGeWJ6kbxdRdpE
 gWTocHralno/Mnks=
X-Received: by 2002:a63:734c:: with SMTP id d12mr8164165pgn.358.1634286525515; 
 Fri, 15 Oct 2021 01:28:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrDXrUmLnnYI29YpaAARiqCm5/f46LXrGR6mC4+5p32Yk8+w/h0Ujjk1sqTCV8Puq4zP9/JA==
X-Received: by 2002:a63:734c:: with SMTP id d12mr8164140pgn.358.1634286525154; 
 Fri, 15 Oct 2021 01:28:45 -0700 (PDT)
Received: from t490s ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id u74sm4283225pfc.87.2021.10.15.01.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 01:28:44 -0700 (PDT)
Date: Fri, 15 Oct 2021 16:28:39 +0800
From: Peter Xu <peterx@redhat.com>
To: lma <lma@suse.de>
Subject: Re: [PATCH 0/3] Postcopy migration: Add userfaultfd- user-mode-only
 capability
Message-ID: <YWk7t8Za3l4bhGIB@t490s>
References: <20211014091551.15201-1-lma@suse.com> <YWjAqX13PYhBgbVh@t490s>
 <7c0161fab24b06fa249061780a7f30d4@suse.de> <YWkb2rrrkMLC8BwM@t490s>
 <b17650b7db7bece420f8f1ad2aaa651a@suse.de>
MIME-Version: 1.0
In-Reply-To: <b17650b7db7bece420f8f1ad2aaa651a@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: quintela@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 15, 2021 at 04:16:15PM +0800, lma wrote:
> 在 2021-10-15 14:12，Peter Xu 写道：
> > On Fri, Oct 15, 2021 at 01:38:06PM +0800, lma wrote:
> > > 在 2021-10-15 07:43，Peter Xu 写道：
> > > > On Thu, Oct 14, 2021 at 05:15:48PM +0800, Lin Ma wrote:
> > > > > Since kernel v5.11, Unprivileged user (without SYS_CAP_PTRACE
> > > > > capability)
> > > > > must pass UFFD_USER_MODE_ONLY to userfaultd in case
> > > > > unprivileged_userfaultfd
> > > > > sysctl knob is 0.
> > > > > Please refer to https://lwn.net/Articles/819834/ and the kernel
> > > > > commits:
> > > > > 37cd0575 userfaultfd: add UFFD_USER_MODE_ONLY
> > > > > d0d4730a userfaultfd: add user-mode only option to
> > > > > unprivileged_userfaultfd sysctl knob
> > > > >
> > > > > This patch set adds a migration capability to pass UFFD_USER_MODE_ONLY
> > > > > for postcopy migration.
> > > >
> > > > Then it's at least no KVM, no vhost, am I right?  Could I ask is there a
> > > > real
> > > > user behind this?  Thanks,
> > > 
> > > Well, The "user-mode-only" has nothing to do with qemu's user-mode
> > > emulation.
> > 
> > I didn't follow why you thought my question was about "user-mode
> > emulation"..
> Sorry about the misunderstanding.

No worry. :)

> 
> > To ask in another way: after this new cap set, qemu will get a SIGBUS
> > and VM
> > will crash during postcopy migrating as long as either KVM or
> > vhost-kernel
> > faulted on any of the missing pages, am I right?
> 
> Oops...Yes, you're right. It indeed casues qemu crash on destination due to
> fault on missing pages.
> This patch set and my thought about introducing this cap to qemu are wrong.

I can't say it's wrong, it's just that it may need some more thoughts on how to
make it applicable.

We'll need to make sure no kernel module will access guest pages, however I
think it'll be so hard to guarantee.  For example, there can be some read()
syscall from qemu initiated with guest pages passed in as the buffer (so the
kernel will fill up the buffer when syscall returns), then if that page is
missing on dst then that'll also trigger a kernel page fault and it'll crash
qemu too even if no kvm/vhost-kernel is used.  We'll need to dig out everything
like that.

The other thing is about my original question on whether it'll be useful in any
way, and I just worry it won't help anyone, because afaiu any real user of
migration (I believe it's majorly public/private cloud) will definitely at
least be kvm based as tcg could be too slow.  Then they'll simply enable the
unprivileged uffd on the hosts, since even if it's unsafe it'll be at least as
unsafe as before unprivileged_userfaultfd is introduced.

Thanks,

-- 
Peter Xu


