Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8564316C07
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:04:40 +0100 (CET)
Received: from localhost ([::1]:34348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9sut-00066S-SN
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:04:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <msys.mizuma@gmail.com>)
 id 1l9saP-0001Lm-7y; Wed, 10 Feb 2021 11:43:29 -0500
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:47050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <msys.mizuma@gmail.com>)
 id 1l9saJ-0000aT-En; Wed, 10 Feb 2021 11:43:28 -0500
Received: by mail-qv1-xf2e.google.com with SMTP id a1so1114027qvd.13;
 Wed, 10 Feb 2021 08:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CQTHclXXT2MdT0EtLh2oWz4NzLm/Rq1unz169pZoWwQ=;
 b=eE5NziAVu9A6G1iCxp/y+ZDAHhB8Onyf9v3YB3il64uLSLmLnQSKGF0dp38eHedwLS
 5eaS4bh4tbEnSf1neQq8CWLfpoWVQpSM8v8DsrVbuwH2CPL8SjfSgeKMXeE26k3QbcS+
 EjzD1U5lxlR0hjygIsu8vF+FIEh8RYKJ0XHqPtrFa0BPE5/SIygzy+gsgR4+l3Q49TQo
 xec2HxqPqQhDjsZAC3Ezbl08Ese/xPJLYo22OgvX9/DI73KutuFXqHeJARiJqDVq0ZMI
 QRj2zumLbtglI1GLrkrOmPfrg8M8ZF7M7cR3W/fFBDYE35fDgoYigBvNG/0K5BM52Ju6
 Qopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CQTHclXXT2MdT0EtLh2oWz4NzLm/Rq1unz169pZoWwQ=;
 b=BaSwfdXNZf1cbHzgXUu68GruNRZtraBWPzb5y3XFWYhXwBM/4G3enZos/2Tc6pxYA+
 l5qhBS4sQgsQtZXiNNNyg8Ye5obFfCDwJH4ljQPyOECxd1GX6X4vpl0LpRdcYGJfVXjR
 AnehFP1E+6wX69QmCohXigl1PpuTfThIpfqTBXGnzRegpR4ma7GqYvtVmm6sHJC1QUvE
 KOI3yW4PtaiEJlJ8l3g5l2DnMdDesJH/xbDM1CSNooVKBLc6KIkEuyEkelyia2QMEygP
 Z8zICmLy4D/hoKpUEQSUfeesXNzO4roaiemJMXVW3N6rLObrUPIOX7ZrB1VYpqtOnAAX
 4KDg==
X-Gm-Message-State: AOAM530yXyvWvyIAKZ1KNklxDkePrRfyC7w0dab6osyJHBoivLehSpNg
 sugRo2EkPhek6t76u9brZA==
X-Google-Smtp-Source: ABdhPJzl1zIilLuA73RXiZAFOLqKPmK4O31i5qepEJFixcwZGRfAJVYgWQ9eVJS70VBaGXQO0pqxrw==
X-Received: by 2002:a0c:d403:: with SMTP id t3mr3660718qvh.4.1612975398325;
 Wed, 10 Feb 2021 08:43:18 -0800 (PST)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id m5sm1769150qkk.120.2021.02.10.08.43.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Feb 2021 08:43:16 -0800 (PST)
Date: Wed, 10 Feb 2021 11:43:14 -0500
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/2] file-posix: Use OFD lock only if the filesystem
 supports the lock
Message-ID: <20210210164314.4lgw6ovozchsrk6i@gabell>
References: <20201106040102.13892-1-msys.mizuma@gmail.com>
 <20201118154247.GB11988@merkur.fritz.box>
 <20201118191036.yk4rju2hk4vpkhfl@gabell>
 <20201118194837.b54rp2qpbvuelosx@gabell>
 <20201119104442.GB4530@merkur.fritz.box>
 <20201119235650.62vcbycc5fc4oxec@gabell>
 <20201120154228.GC5599@merkur.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120154228.GC5599@merkur.fritz.box>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=msys.mizuma@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 04:42:28PM +0100, Kevin Wolf wrote:
> Am 20.11.2020 um 00:56 hat Masayoshi Mizuma geschrieben:
> > On Thu, Nov 19, 2020 at 11:44:42AM +0100, Kevin Wolf wrote:
> > > Am 18.11.2020 um 20:48 hat Masayoshi Mizuma geschrieben:
> > > > On Wed, Nov 18, 2020 at 02:10:36PM -0500, Masayoshi Mizuma wrote:
> > > > > On Wed, Nov 18, 2020 at 04:42:47PM +0100, Kevin Wolf wrote:
> > > > > > The logic looks fine to me, at least assuming that EINVAL is really what
> > > > > > we will consistently get from the kernel if OFD locks are not supported.
> > > > > > Is this documented anywhere? The fcntl manpage doesn't seem to mention
> > > > > > this case.
> > > > 
> > > > The man page of fcntl(2) says:
> > > > 
> > > >        EINVAL The value specified in cmd is not recognized by this kernel.
> > > > 
> > > > So I think EINVAL is good enough to check whether the filesystem supports
> > > > OFD locks or not...
> > > 
> > > A kernel not knowing the cmd at all is a somewhat different case (and
> > > certainly a different code path) than a filesystem not supporting it.
> > > 
> > > I just had a look at the kernel code, and to me it seems that the
> > > difference between POSIX locks and OFD locks is handled entirely in
> > > filesystem independent code. A filesystem driver would in theory have
> > > ways to distinguish both, but I don't see any driver in the kernel tree
> > > that actually does this (and there is probably little reason for a
> > > driver to do so).
> > > 
> > > So now I wonder what filesystem you are using? I'm curious what I
> > > missed.
> > 
> > I'm using a proprietary filesystem, which isn't in the linux kernel.
> > The filesystem supports posix lock only, doesn't support OFD lock...
> 
> Do you know why that proprietary filesystem driver makes a difference
> between POSIX locks and OFD locks? The main difference between both
> types is when they are released automatically, and this is handled by
> generic kernel code and not the filesystem driver.
> 
> From a filesystem perspective, I don't see any reason to even
> distuingish. So unless there are good reasons for making the
> distinction, I'm currently inclined to view this as a filesystem
> driver bug.
> 
> It makes handling this case hard because when the case isn't even
> supposed to exist, of course there won't be a defined error code.

Hi Kevin,

The filesystem team found a locking issue in the filesystem.
Your comments were very helpful! I really appriciate it.

Thanks,
Masa

