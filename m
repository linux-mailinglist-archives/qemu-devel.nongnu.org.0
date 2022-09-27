Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E625EC968
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 18:25:06 +0200 (CEST)
Received: from localhost ([::1]:51212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odDOK-0002kd-OU
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 12:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1odCqd-00063P-LP; Tue, 27 Sep 2022 11:50:21 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:46697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1odCqb-0008TB-Po; Tue, 27 Sep 2022 11:50:15 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id e81so12677436ybb.13;
 Tue, 27 Sep 2022 08:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=MOXnyf1YwlbSeeWuLBeh11X+2FufbZlo7w2wB12V7kg=;
 b=VsUq4ENYKFkBKvmnOAv4cRmTbI434LO8lpPu9KvnwMm2iyPYJKCScuanX6eUpyOA8k
 MKNnBWW5gouxbhjvVHZh6K2ro+xg1amhF95FIfItTPhhkipToeGnRahbZoiA6IKbW2x1
 tOyu7vD/WnJUW3ldtags90xtJDT1Z3cuzobvxObH97Q+2KAihUVoW6M991u/fiB62EIH
 kPGAPOGRozxEfnicSQK2kqWE+K9ppo60EZ3SFi0mF9aTvnjIGbtd9fA8HDSyHkD2mkit
 m87lCIGABlGQbJh6i+4+xPdbxszoocgnK0oM1m1FDhXPoko06z/ClD8bsOKmPH661CTD
 Z16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=MOXnyf1YwlbSeeWuLBeh11X+2FufbZlo7w2wB12V7kg=;
 b=nSilrLhsFTiUBxKvON2xc0L4HBN+jDHkfSt3SONtusVytHXpFsFecQnW18V1/MDtir
 VcVA1V8uaw4M3Z+u5G4jD6YLYVKzUEBEcDGj5CS9AnGfCjIs/w+sCpRNi4mOMG3giCuL
 DC61WgWDOJMdpp8ouTJnYRdp347p/Xjqc/5qbsBSbuv9Kv5UeVT61xyOEqJ6PZrMtdxk
 Zt3SWDNumAGNMT22TJstgJdbsA29MVZVdFRGWbbp93aTdaZLFIv2Nk9stp490he4Jey0
 j+WnmyICR8fmBFlUHaLMBsQeuIgC24K6V0WWCtIkAx2yda+WGeN3Q5tjLfpvlig5GCuI
 0k3w==
X-Gm-Message-State: ACrzQf3t7C9qJuXnSIVBlRyjlFRWwWIw7e3HfOUC53/SXIlcVanEMWn+
 aE9VW+d4vTcYEMaP97f16JMFmOZNvvDZBUsuYek=
X-Google-Smtp-Source: AMsMyM4HEDzy8Bb0w/UXXxvhavWHuCQ0z8zQ5WOQCWTL9HdAsMJ5ePBYie/UaB1bX9bgjQan+IZELaELrh4Ubr7f9xc=
X-Received: by 2002:a25:ed09:0:b0:6bb:99fb:f9c8 with SMTP id
 k9-20020a25ed09000000b006bb99fbf9c8mr10257912ybh.207.1664293812355; Tue, 27
 Sep 2022 08:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220818184618.2205172-1-yokada.996@gmail.com>
 <YwZiyXqPTlSadOOR@fedora> <Yyn/UUVAHwV+bMP7@redhat.com>
In-Reply-To: <Yyn/UUVAHwV+bMP7@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 27 Sep 2022 11:50:00 -0400
Message-ID: <CAJSP0QXUWia+U1uLVVDxputRxEeYJqNapORts4R0UTUiXaL17w@mail.gmail.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: use g_date_time_get_microsecond to
 get subsecond
To: Vivek Goyal <vgoyal@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Yusuke Okada <yokada.996@gmail.com>,
 "open list:virtiofs" <virtio-fs@redhat.com>,
 Yusuke Okada <okada.yusuke@jp.fujitsu.com>, 
 qemu-devel@nongnu.org, qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2c.google.com
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

On Tue, 20 Sept 2022 at 19:08, Vivek Goyal <vgoyal@redhat.com> wrote:
>
> On Wed, Aug 24, 2022 at 01:41:29PM -0400, Stefan Hajnoczi wrote:
> > On Thu, Aug 18, 2022 at 02:46:19PM -0400, Yusuke Okada wrote:
> > > From: Yusuke Okada <okada.yusuke@jp.fujitsu.com>
> > >
> > > The "%f" specifier in g_date_time_format() is only available in glib
> > > 2.65.2 or later. If combined with older glib, the function returns null
> > > and the timestamp displayed as "(null)".
> > >
> > > For backward compatibility, g_date_time_get_microsecond should be used
> > > to retrieve subsecond.
> > >
> > > In this patch the g_date_time_format() leaves subsecond field as "%06d"
> > > and let next snprintf to format with g_date_time_get_microsecond.
> > >
> > > Signed-off-by: Yusuke Okada <okada.yusuke@jp.fujitsu.com>
> > > ---
> > >  tools/virtiofsd/passthrough_ll.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > Thanks, applied to my block tree for QEMU 7.2:
> > https://gitlab.com/stefanha/qemu/commits/block
>
> Hi Stefan,
>
> Wondering when do you plan to send it for merge. This seems like
> a simple fix. Not sure why it does not qualify as a fix for
> 7.1 instead.

The pull request with this patch was merged into qemu.git/master today.

Regarding 7.1, it needs to go through the -stable tree. I have CCed
qemu-stable so this patch can be picked up.

Thanks,
Stefan

