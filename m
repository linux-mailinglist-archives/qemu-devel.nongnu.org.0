Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BA5494B1A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 10:51:50 +0100 (CET)
Received: from localhost ([::1]:58780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAU6e-0003xT-Gl
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 04:51:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nATHu-0000N2-Tq
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 03:59:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nATHk-0005e1-Ax
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 03:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642669065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5/nTKKCCgUP2HgQL5PtIs50LjZfDufqwSCAc7P6wVx8=;
 b=I/HX5DE0K5R3KUMdLFEgIB2bFiwCCHP1E2NsYT/FgunZfYiVeZLUByMM8GQp5EeVvSq1EA
 b3A2oMazNhF8gooTxtcYxlpfXxOkv5PrBTpixnl+aSK7iKl23pq2W6G74v3IKVoExMwRNE
 bGDUVJLwq2Km40NuI80tTQ/nRmPXlUs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-N96lIxKsMl2uGPXBtfD82Q-1; Thu, 20 Jan 2022 03:57:42 -0500
X-MC-Unique: N96lIxKsMl2uGPXBtfD82Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 bs4-20020a056402304400b004032af6b7ebso5263539edb.16
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 00:57:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5/nTKKCCgUP2HgQL5PtIs50LjZfDufqwSCAc7P6wVx8=;
 b=HSdAXc8EfcOhWqnFXa3Q5qtRnvMUMtjDztCgdnc7n0nVbdZzK/HVTfc8cBk98RVU89
 IgngmDaEQfKBzd05jBeRAoViOIzdmhgva8m1rgMwkKesolz9H0zcB0tlVorQeMpS8FVX
 EdqVRgAjlC9McNUv5/qLz4tX4mAoYGULByS27j36F27Sw5lCTTkRUZO/nb9OcFlLRwX/
 sUDhhNpXq+VcflEgeu3ZBmhlDmUR3KEe5iJPnnl1zd5NWMCHIN+bSe9IX2xCRkfjK/nM
 ZhTB+o/229xSR/wsuu4Lid2n1Xo2E7T4K9hS59ILKcvc7EOzYzsgzFQAJ+XPxB/EatPk
 8hBw==
X-Gm-Message-State: AOAM530twRbjbrXeGvsaUE5ug4ABNYRYFAfQmVNCWJiOPpRw6gzNWfwD
 RO1EDyC+9Z4jKMUsh7ZD6z/zMylxeAVv4IWPNtZi3gIp87vb34+oQo8iu+XNnvyQpaxMXe/Eans
 WyBIGG+sMZ7NWKBQ=
X-Received: by 2002:a17:906:4a4d:: with SMTP id
 a13mr5844212ejv.744.1642669061360; 
 Thu, 20 Jan 2022 00:57:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrPg/KdFRQ/2KXYB+qWd0/aDP5h90G9OSq2frGD7NlPMqmJFhRikc1EgJU3nIl5IMcs230pQ==
X-Received: by 2002:a17:906:4a4d:: with SMTP id
 a13mr5844193ejv.744.1642669061047; 
 Thu, 20 Jan 2022 00:57:41 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id p13sm707718ejo.6.2022.01.20.00.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 00:57:40 -0800 (PST)
Date: Thu, 20 Jan 2022 09:57:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: MP tables do not report multiple CPUs in Qemu 6.2.0 on x86 when
 given -smp cpus=n flag
Message-ID: <20220120095739.23930e8f@redhat.com>
In-Reply-To: <CAFEAcA9tGnEOOhSbCJv2=JoU5C3cFB08mdaLRERgzPdatKQB=g@mail.gmail.com>
References: <CAB4+JY+3N5qvC3p_e2DWWa=-QUtW+wH5ZdEJFPKTdSD5TVPXMA@mail.gmail.com>
 <CAFEAcA9tGnEOOhSbCJv2=JoU5C3cFB08mdaLRERgzPdatKQB=g@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Godmar Back <gback@cs.vt.edu>, "Michael S.
 Tsirkin" <mst@redhat.com>, "seabios @ seabios
 . org" <seabios@seabios.org>, qemu-devel@nongnu.org, qemu-discuss@nongnu.org,
 Ani Sinha <ani@anisinha.ca>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 Jan 2022 15:48:20 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 19 Jan 2022 at 14:44, Godmar Back <gback@cs.vt.edu> wrote:
> > after upgrading to 6.2.0, I observed that code such as MIT's xv6 (see
> > [1]) is no longer able to detect multiple CPUs.  Their code works in
> > 6.1.1, however.  
> 
> Hi; this isn't a great place for reporting QEMU bugs, because
> it's more of a user-to-user discussion list. Not all QEMU
> developers read it. I've cc'd the ACPI maintainers, who
> hopefully may have an idea about what's happening here.
> You could also file a bug at
> https://gitlab.com/qemu-project/qemu/-/issues
> 
> > I built 6.1.1 from source and 6.2.0 from source and I have also tested
> > with CentOS stream's 6.1.1 qemu-kvm and was able to pinpoint this
> > change to these 2 versions of qemu. I am using qemu-system-i386
> > specifically.
> >
> > I tried to go through the ChangeLog to see if the `-smp` option was
> > deprecated or changed.  I found this note [2] about invalid topologies
> > having been removed in 5.2. Here's what I found after long
> > experimentation:
> >
> > The legacy MP tables appear to work only if you specify the longform
> > `-smp cpus=4,cores=1,threads=1,sockets=4` in 6.2.0.  If you specify
> > `-smp 4` or `-smp cpus=4` it will not work in 6.2.0 (it worked in
> > 6.1.1). I am guessing that perhaps the MP tables add entries for each
> > socket, but that perhaps the behavior of the shortcuts `-smp n` and
> > `-smp cpus=n` was changed to influence the number of cores rather than
> > sockets.
> >
> > In other words, `-smp cpus=n` now means `-smp
> > cpus=n,cores=n,threads=1,sockets=1` whereas in 6.1.1 and before it
> > meant `-smp cpus=n,cores=1,threads=1,sockets=n`. I note that
> > specifying `-smp cpus=4,cores=4,threads=1,sockets=1` in 6.1.1 also
> > does not create 4 entries in the legacy MP tables.



Thanks for reporting issue in such a detailed way.

QEMU doesn't generate legacy MP tables and as reported
the above issue is still present in earlier versions when
cores are used.
Well seabios has a comment:
         /* Only populate the MPS tables with the first logical CPU in            
           each package */
So I'd guess it has never worked for anything but sockets.
With QEMU starting to prefer cores over sockets by default
I'd suggest to either
  * explicitly provide desired topology (i.e. sockets)
  * use older machine type which still preffers sockets by default
    (ex: up to 6.1 machine types)

If anybody cares about legacy tables + cores/threads usecase,
I suggest to investigate what can be done on SeaBIOS side which
generates MP tables (assuming if anything could be done at all).
CCing SeaBIOS mail-list.

> > Can someone confirm/deny this?  If so, it's a breaking change that
> > perhaps could be mentioned in the Changelog to save others the time
> > when they upgrade. Affected educational OS include MIT's xv6 and
> > Stanford's pintos OS.

Legacy MP table is not actively maintained part of the code,
hence it's configuration which is not tested.
However if someone is interested in maintaining this, one
should contribute at least a testcase that will warn developers
early if usecase is broken. We can't promise not breaking it
ever but at least we would be able to document any breaking
changes in release notes.

> > Thanks for all the work you do on qemu!
> >
> >  - Godmar
> >
> > [1] https://github.com/mit-pdos/xv6-public/blob/eeb7b415dbcb12cc362d0783e41c3d1f44066b17/mp.c
> > [2] https://qemu-project.gitlab.io/qemu/about/removed-features.html#smp-invalid-topologies-removed-in-5-2
> >
> > (I'm typing this email in gmail using the plaintext setting, hopefully
> > it'll preserve line breaks.)  
> 
> thanks
> -- PMM
> 


