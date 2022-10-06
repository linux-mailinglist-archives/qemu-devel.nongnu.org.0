Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43F85F6A5A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:13:45 +0200 (CEST)
Received: from localhost ([::1]:54106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSZE-0005TO-UN
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom.leiming@gmail.com>)
 id 1ogSVf-0000nD-76
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:10:03 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tom.leiming@gmail.com>)
 id 1ogSVd-00042j-IP
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:10:02 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 p3-20020a17090a284300b0020a85fa3ffcso4611167pjf.2
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=TDjphh1QdcaQ9ECGpDAMca94QNs69RGi+PB3mg6hmDA=;
 b=Md88KWJT/EWX1VvDMAXJccXtQoPCFfF8/m40LJ9uU0boab9RANFM6c2e0Bff6pg0Rb
 DUv+aZCuqc1czFRezxz7HARKch62TdoWedlMIY6kY6lI8+w3e3MjapciWzT9FhinAkiN
 5umP0vstYS17YClKveHiDtGcLMW0VY8YoWG6qfMMM9K0+OByKmO12Z69S+mLDBIrJ2JD
 Qwd5+PQthIuSVWSfnYd1+Sta8DWPX1/XYXzPPul1VOicH3JXWEFz7T9SUIK+kmp4TLBN
 /fl5PenIslLO68/VWOXJanL23/dgNCNUwn4rlisUcAVq1Syz470i4Cwkp4iUV94ktjsu
 b64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=TDjphh1QdcaQ9ECGpDAMca94QNs69RGi+PB3mg6hmDA=;
 b=wfx69fjO4Zq5god0RnWlBmuOOVDYPHETFdEguycXqwBXlJPNoa3Uz2g5w81iFZV4hX
 GbNgCNQszZ3TEig+QGFwgWkWSNBeq04kXFVjoEA3LM0RNu2oJOacAk72cKrBGQuwqEpO
 DH09yy6IZGCmFCeh7msOz3gZkMhvlpPNpnKJhKZLbi2xIXyLrsVtTOI1k+yyaALUSOSH
 zCmykb61N7MWm5bqGGyABGcDwZmGmCeM3A95DvzFmY+m0nnpXdINBlRQm0HKjkEkBN/o
 7uIi+L34338HTfLHyigb5OISINJ6UA47WBJ7myOsE64Dfc+fCekwal4CiDQ7Gid/5B4j
 eM9Q==
X-Gm-Message-State: ACrzQf2FdDrj1VyDJSuEJ92D4X+d7U5LhPs8+Ze5XiLAduCdc5xhT8iH
 F2D72Ixe2Ct2AjmIyyOXGWg=
X-Google-Smtp-Source: AMsMyM5e+oKrl4FKRNapq/rzhRs5YOwwV2H/HtcCSmY4AVIRvz7EQI+AGHZ3ItSqQBgv/4yvd2z6IQ==
X-Received: by 2002:a17:902:bcc3:b0:178:639a:1a10 with SMTP id
 o3-20020a170902bcc300b00178639a1a10mr326763pls.159.1665068998112; 
 Thu, 06 Oct 2022 08:09:58 -0700 (PDT)
Received: from T590 ([209.132.188.80]) by smtp.gmail.com with ESMTPSA id
 n10-20020a170903404a00b00172a670607asm12335746pla.300.2022.10.06.08.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:09:57 -0700 (PDT)
Date: Thu, 6 Oct 2022 23:09:48 +0800
From: Ming Lei <tom.leiming@gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "Denis V. Lunev" <den@virtuozzo.com>, io-uring@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kirill Tkhai <kirill.tkhai@openvz.org>,
 Manuel Bentele <development@manuel-bentele.de>,
 qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 rjones@redhat.com, Xie Yongji <xieyongji@bytedance.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Josef Bacik <josef@toxicpanda.com>
Subject: Re: ublk-qcow2: ublk-qcow2 is available
Message-ID: <Yz7vvNKSNRyBVObo@T590>
References: <Yza1u1KfKa7ycQm0@T590> <Yzs9xQlVuW41TuNC@fedora>
 <6659a0d5-60ab-9ac7-d25d-b4ff1940c6ab@virtuozzo.com>
 <Yz2epPwoufj0mug/@fedora> <Yz6tR24T8HPHJ70D@T590>
 <Yz7fTANAxAQ8KT4v@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yz7fTANAxAQ8KT4v@fedora>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=tom.leiming@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 06, 2022 at 09:59:40AM -0400, Stefan Hajnoczi wrote:
> On Thu, Oct 06, 2022 at 06:26:15PM +0800, Ming Lei wrote:
> > On Wed, Oct 05, 2022 at 11:11:32AM -0400, Stefan Hajnoczi wrote:
> > > On Tue, Oct 04, 2022 at 01:57:50AM +0200, Denis V. Lunev wrote:
> > > > On 10/3/22 21:53, Stefan Hajnoczi wrote:
> > > > > On Fri, Sep 30, 2022 at 05:24:11PM +0800, Ming Lei wrote:
> > > > > > ublk-qcow2 is available now.
> > > > > Cool, thanks for sharing!
> > > > yep
> > > > 
> > > > > > So far it provides basic read/write function, and compression and snapshot
> > > > > > aren't supported yet. The target/backend implementation is completely
> > > > > > based on io_uring, and share the same io_uring with ublk IO command
> > > > > > handler, just like what ublk-loop does.
> > > > > > 
> > > > > > Follows the main motivations of ublk-qcow2:
> > > > > > 
> > > > > > - building one complicated target from scratch helps libublksrv APIs/functions
> > > > > >    become mature/stable more quickly, since qcow2 is complicated and needs more
> > > > > >    requirement from libublksrv compared with other simple ones(loop, null)
> > > > > > 
> > > > > > - there are several attempts of implementing qcow2 driver in kernel, such as
> > > > > >    ``qloop`` [2], ``dm-qcow2`` [3] and ``in kernel qcow2(ro)`` [4], so ublk-qcow2
> > > > > >    might useful be for covering requirement in this field
> > > > There is one important thing to keep in mind about all partly-userspace
> > > > implementations though:
> > > > * any single allocation happened in the context of the
> > > >    userspace daemon through try_to_free_pages() in
> > > >    kernel has a possibility to trigger the operation,
> > > >    which will require userspace daemon action, which
> > > >    is inside the kernel now.
> > > > * the probability of this is higher in the overcommitted
> > > >    environment
> > > > 
> > > > This was the main motivation of us in favor for the in-kernel
> > > > implementation.
> > > 
> > > CCed Josef Bacik because the Linux NBD driver has dealt with memory
> > > reclaim hangs in the past.
> > > 
> > > Josef: Any thoughts on userspace block drivers (whether NBD or ublk) and
> > > how to avoid hangs in memory reclaim?
> > 
> > If I remember correctly, there isn't new report after the last NBD(TCMU) deadlock
> > in memory reclaim was addressed by 8d19f1c8e193 ("prctl: PR_{G,S}ET_IO_FLUSHER
> > to support controlling memory reclaim").
> 
> Denis: I'm trying to understand the problem you described. Is this
> correct:
> 
> Due to memory pressure, the kernel reclaims pages and submits a write to
> a ublk block device. The userspace process attempts to allocate memory
> in order to service the write request, but it gets stuck because there
> is no memory available. As a result reclaim gets stuck, the system is
> unable to free more memory and therefore it hangs?

The process should be killed in this situation if PR_SET_IO_FLUSHER
is applied since the page allocation is done in VM fault handler.

Firstly in theory the userspace part should provide forward progress
guarantee in code path for handling IO, such as reserving/mlock pages
for such situation. However, this issue isn't unique for nbd or ublk,
all userspace block device should have such potential risk, and vduse
is no exception, IMO.

Secondly with proper/enough swap space, I think it is hard to trigger
such kind of issue.

Finally ublk driver has added user recovery commands for recovering from
crash, and ublksrv will support it soon.

Thanks,
Ming

