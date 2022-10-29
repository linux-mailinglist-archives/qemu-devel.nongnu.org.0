Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4778B612201
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 11:53:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooiUv-0004Zx-3h; Sat, 29 Oct 2022 05:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ooiUs-0004WB-Bp
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 05:51:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ooiUq-0007dR-DZ
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 05:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667037078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ml6XHq0HN7ioKmSzeFMqQVempWdbktwv28Am2gOI/IA=;
 b=J2NnB5dzl1MThO8eBX+9qSiofEpulyTahEBi6XJzZvOg6mVlZovJ3sQ7uXgQb4+bgHHqDB
 fBZeijGdER8oCvH9jHhp+sNb2S+1ljYLqxf/hxUg7S2BzVzp544rAL8qE9lmtXzPHH0WCD
 Cz9Zmz4/rGI1wlVpxRRjwWh3TA+xj1Y=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-T1p5cCK7MGqrOsbJxlpCQw-1; Sat, 29 Oct 2022 05:51:16 -0400
X-MC-Unique: T1p5cCK7MGqrOsbJxlpCQw-1
Received: by mail-io1-f69.google.com with SMTP id
 x21-20020a5d9455000000b006bc1172e639so5671924ior.18
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 02:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ml6XHq0HN7ioKmSzeFMqQVempWdbktwv28Am2gOI/IA=;
 b=4VWFS7VW9zYJySv59yRTyIZVAolmx1mpGk7kvGZY2lx+EzAcmtFGsa1kxve8ndyNYE
 bB8bS861q+XSC8yz/qtqmPx6CnDAg+ZGHL56dcmR9GSSHPWxhSchkNo6uX98UUuI5FXR
 +vIXWBwcdYDtKLJmbj67LZMs9MVQIjLw1Dhyi3ikKkCvJSHL88WomKm9f7wWgyeBhiUL
 bhJ4Rbi+ToA7j//+iARk5nkYvU2UkaPKNUyMLIxtc/lqQJBgC5jsjD08L7s0eRvMzdfD
 v5MTk1z47z45T7vAMIUq4iSo8bkHaPJ6wkRd5f/BhLe4DXHGMEMxhD/ML+peNpIxNKFv
 IN7Q==
X-Gm-Message-State: ACrzQf01RWjC5/QdSMF8xz3Cmd1MBo8fs9HcblQrW2TAwk5pnT0+MKzU
 GO8ZnIYS5mbiEZgEd/Bi3m5lslemnDVg4/yehrLT6/DMFMrLcAIKvlP2ElMWQGQ0QENL7SUie3W
 aQT8ITMpnH+CWhM1/N9WmxbacR8olmXg=
X-Received: by 2002:a05:6e02:1889:b0:2fc:3e4:9c5e with SMTP id
 o9-20020a056e02188900b002fc03e49c5emr1680815ilu.228.1667037076049; 
 Sat, 29 Oct 2022 02:51:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4wYInrx2FjtD5Y61U0I51OzOIyxY2l88LbpLMI92RHF2v5k9DnNzYzCc/84tt+2RlqXWCCIU68msCkkZJFbng=
X-Received: by 2002:a05:6e02:1889:b0:2fc:3e4:9c5e with SMTP id
 o9-20020a056e02188900b002fc03e49c5emr1680810ilu.228.1667037075857; Sat, 29
 Oct 2022 02:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221028233854.839933-1-afaria@redhat.com>
 <87fsf7f9lo.fsf@pond.sub.org>
In-Reply-To: <87fsf7f9lo.fsf@pond.sub.org>
From: Alberto Faria <afaria@redhat.com>
Date: Sat, 29 Oct 2022 10:50:40 +0100
Message-ID: <CAELaAXxo=UznziCZSAUE2rrUcKUoa9J=geornEAuD2Buq1YKUA@mail.gmail.com>
Subject: Re: [PATCH] block/blkio: Make driver nvme-io_uring take a "path"
 instead of a "filename"
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Oct 29, 2022 at 7:05 AM Markus Armbruster <armbru@redhat.com> wrote:
> Alberto Faria <afaria@redhat.com> writes:
>
> > The nvme-io_uring driver expects a character special file such as
> > /dev/ng0n1. Follow the convention of having a "filename" option when a
> > regular file is expected, and a "path" option otherwise.
>
> I suspect this is by accident, not by design.  Is it desirable?

I'm not sure. Naturally I'd be happier if either "filename" or "path"
was used everywhere. Maybe we should settle on a single one for all
the libblkio drivers? Or maybe we should just leave things as is?

> > This makes io_uring the only libblkio-based driver with a "filename"
> > option, as it accepts a regular file (even though it can also take a
> > block special file).
> >
> > Signed-off-by: Alberto Faria <afaria@redhat.com>
>
> Patch does not apply to master (344744e148e).  What's your base?

I forgot to mention this is based on Stefan's block tree:
https://gitlab.com/stefanha/qemu/-/commits/block


