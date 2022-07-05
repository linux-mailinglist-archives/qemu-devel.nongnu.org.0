Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71A2567A6D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 00:54:59 +0200 (CEST)
Received: from localhost ([::1]:38170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8rRa-00088m-7J
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 18:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominique.martinet@atmark-techno.com>)
 id 1o8rPt-00076n-FW
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 18:53:13 -0400
Received: from gw2.atmark-techno.com ([35.74.137.57]:52926)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dominique.martinet@atmark-techno.com>)
 id 1o8rPr-0008DO-4d
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 18:53:13 -0400
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by gw2.atmark-techno.com (Postfix) with ESMTPS id 4E1A920D08
 for <qemu-devel@nongnu.org>; Wed,  6 Jul 2022 07:53:08 +0900 (JST)
Received: by mail-pj1-f69.google.com with SMTP id
 q4-20020a17090aa00400b001ef76cb4749so6161275pjp.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 15:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tFRngjx0G+BZ60t1jmhrF4wtc8rPFWnQu2MVKcY0EpQ=;
 b=LuWwQCb9Kcyn4HI11kLyu4vPQlU07Aj50ky8C6aJ+3x3Zi6pV8L8OopEBazKK1e+FC
 C0hpkjhDFYbDqFnNom4kNG+X5JxwzHvZZxBkk+OnySxIz3WpigcrpsH49UJYtNkiajjo
 dV6gL97szxacxgGKM4ZbKimK8ztHYpE+98zPM1mgNdYHUWCCPUoti8as9hW0RafvEpe5
 X21oSfR2VxlkrPuUm2noPnV9+6MyOxUwctSZ9nOoMdV131S51c2RjzkCQqdQiLS5nZUg
 XdI+ZSNMWKyKV7m5ADiTFxJDY8kUNz6TAIrQzyRj5YbXjk7rPc7UEjAmjM/M3gczQoet
 VzlQ==
X-Gm-Message-State: AJIora/ZDgnAmwOL1CWCOv7xUhjmh3OZJB8cxQaMxYXlcxpSQm6pG4qG
 idbEcmtd1mmwfS1RtIpD4oBdREDzcjqkLPBi7zoSSO5BUd0ZeCSxG6pmtrFC2qDukv3j20hnHJ+
 Em/Xv6+yrsZAWXNkr
X-Received: by 2002:a17:902:d48a:b0:16b:f0be:4e15 with SMTP id
 c10-20020a170902d48a00b0016bf0be4e15mr6319009plg.155.1657061587216; 
 Tue, 05 Jul 2022 15:53:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v2HoMVKLOO/ikgjMgiFEEWpkCT3RdVr6ejaBU1aeirFrwWCEHisk1J+5k1+ZgwhoPkseEeKA==
X-Received: by 2002:a17:902:d48a:b0:16b:f0be:4e15 with SMTP id
 c10-20020a170902d48a00b0016bf0be4e15mr6318970plg.155.1657061586839; 
 Tue, 05 Jul 2022 15:53:06 -0700 (PDT)
Received: from pc-zest.atmarktech (145.82.198.104.bc.googleusercontent.com.
 [104.198.82.145]) by smtp.gmail.com with ESMTPSA id
 x2-20020a170902b40200b001675d843332sm23797882plr.63.2022.07.05.15.53.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Jul 2022 15:53:06 -0700 (PDT)
Received: from martinet by pc-zest.atmarktech with local (Exim 4.95)
 (envelope-from <martinet@pc-zest>) id 1o8rPk-004lid-U7;
 Wed, 06 Jul 2022 07:53:04 +0900
Date: Wed, 6 Jul 2022 07:52:54 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Stefano Garzarella <sgarzare@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Julia Suvorova <jusual@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Filipe Manana <fdmanana@kernel.org>,
 io-uring@vger.kernel.org
Subject: Re: [PATCH v2] io_uring: fix short read slow path
Message-ID: <YsTAxtvpvIIi8q7M@atmark-techno.com>
References: <20220629044957.1998430-1-dominique.martinet@atmark-techno.com>
 <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
 <20220630154921.ekl45dzer6x4mkvi@sgarzare-redhat>
 <Yr4pLwz5vQJhmvki@atmark-techno.com>
 <YsQ8aM3/ZT+Bs7nC@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YsQ8aM3/ZT+Bs7nC@stefanha-x1.localdomain>
Received-SPF: pass client-ip=35.74.137.57;
 envelope-from=dominique.martinet@atmark-techno.com; helo=gw2.atmark-techno.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Stefan Hajnoczi wrote on Tue, Jul 05, 2022 at 02:28:08PM +0100:
> > The older kernel I have installed right now is 5.16 and that can
> > reproduce it --  I'll give my laptop some work over the weekend to test
> > still maintained stable branches if that's useful.
> 
> Linux 5.16 contains commit 9d93a3f5a0c ("io_uring: punt short reads to
> async context"). The comment above QEMU's luring_resubmit_short_read()
> claims that short reads are a bug that was fixed by Linux commit
> 9d93a3f5a0c.
> 
> If the comment is inaccurate it needs to be fixed. Maybe short writes
> need to be handled too.
> 
> I have CCed Jens and the io_uring mailing list to clarify:
> 1. Are short IORING_OP_READV reads possible on files/block devices?
> 2. Are short IORING_OP_WRITEV writes possible on files/block devices?

Jens replied before me, so I won't be adding much (I agree with his
reply -- linux tries hard to avoid short reads but we should assume they
can happen)

In this particular case it was another btrfs bug with O_DIRECT and mixed
compression in a file, that's been fixed by this patch:
https://lore.kernel.org/all/20220630151038.GA459423@falcondesktop/

queued here:
https://git.kernel.org/pub/scm/linux/kernel/git/fdmanana/linux.git/commit/?h=dio_fixes&id=b3864441547e49a69d45c7771aa8cc5e595d18fc

It should be backported to 5.10, but the problem will likely persist in
5.4 kernels if anyone runs on that as the code changed enough to make
backporting non-trivial.


So, WRT that comment, we probably should remove the reference to that
commit and leave in that they should be very rare but we need to handle
them anyway.


For writes in particular, I haven't seen any and looking at the code
qemu would blow up that storage (IO treated as ENOSPC would likely mark
disk read-only?)
It might make sense to add some warning message that it's what happened
so it'll be obvious what needs doing in case anyone falls on that but I
think the status-quo is good enough here.

-- 
Dominique

