Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2870D4CD0FF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 10:25:39 +0100 (CET)
Received: from localhost ([::1]:49980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ4Bu-00083s-7c
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 04:25:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nQ487-00067s-SB
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 04:21:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nQ485-00047m-A0
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 04:21:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646385700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7aNFDu6SmQOcbtoHQRBJz7RAvrYTgqB9tmwLm24r/ts=;
 b=Hzz6Jp+AT2Nf86JSgnu/wpolHEgEpr+XziMNjJG+drc2ebf38JslmUIEXioX5daljJefDy
 BjtbMOvPCMLxuRQYpNoDz4nJik1w6fkeMckEmh7Yh9p40h1CqUZiIKPzluzFpUFR1gNl3g
 bx0rWxv5dXjvCAo6ljkgMmQUfPbtny0=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-d1F8v8u8P4qEmPA5AxHhrg-1; Fri, 04 Mar 2022 04:21:37 -0500
X-MC-Unique: d1F8v8u8P4qEmPA5AxHhrg-1
Received: by mail-lf1-f71.google.com with SMTP id
 cf41-20020a056512282900b00445c0a8069bso1711375lfb.8
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 01:21:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7aNFDu6SmQOcbtoHQRBJz7RAvrYTgqB9tmwLm24r/ts=;
 b=CK1QnEfDarlyw0CwRtnnWCpmles4FZLh47Q6Mfx0wg0R8zEOl5hDjY55Bwn+p1BGLc
 mCuqOu8fZ6Cdo3sPxy0ecMyyP/qSd3OC9NzNtbbFRJa2P0WjPTsWDby7Hye6VDbOt/zg
 yZOyeNrVp7l3L7TvqgectDalLo6x4J6j64AHd5aU/ZvdakfN83TTdd7MIlsPhqxBMxCD
 KMFH+mB6LReV9ULW/p00lgdQwqjadWO8lbExjrTLPMFTwF0mnQb0XM1nE0UxV/wopikC
 DA/zlAWXos/s3+g6+Z25yan57hx03m0iNU5CJSaSUQkLyprZ9KBhbSCtPPrbj9+8Cdj8
 7PYw==
X-Gm-Message-State: AOAM5333CZoVBk1UMO9jkU4UDlkc/bwSZtC81g22FSpG8ZnvipRz+KFD
 CYRJvNpIyPwBUSXeXbKVH9FjVDrSMD1CYV6b6AYXe9kNedKgRqZXRZDoDOFMwghRcsOp8YssXIZ
 /8nx8CT1U/vXkoT5gpCbmOKLpRrshgB8=
X-Received: by 2002:a2e:8496:0:b0:246:4e82:c7d3 with SMTP id
 b22-20020a2e8496000000b002464e82c7d3mr24867685ljh.460.1646385696111; 
 Fri, 04 Mar 2022 01:21:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+OSxuQ9kvIwUhG1p3FStcG68umYfqemfnjwT2fv6vAWwxGc+6wttraAXLryTFUNKDW0Hu4tqqhWNpyPLt4Oc=
X-Received: by 2002:a2e:8496:0:b0:246:4e82:c7d3 with SMTP id
 b22-20020a2e8496000000b002464e82c7d3mr24867656ljh.460.1646385695821; Fri, 04
 Mar 2022 01:21:35 -0800 (PST)
MIME-Version: 1.0
References: <20220303185147.3605350-1-eperezma@redhat.com>
 <20220303185147.3605350-15-eperezma@redhat.com>
 <8735jy8bty.fsf@pond.sub.org>
In-Reply-To: <8735jy8bty.fsf@pond.sub.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 4 Mar 2022 10:20:59 +0100
Message-ID: <CAJaqyWeYTyhJT1zN31msbkXx6JLNJtxK5bBFz3SLq4muDvWT1w@mail.gmail.com>
Subject: Re: [PATCH v4 14/14] vdpa: Add x-svq to NetdevVhostVDPAOptions
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 4, 2022 at 7:35 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
>
> > Finally offering the possibility to enable SVQ from the command line.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  qapi/net.json    |  8 +++++++-
> >  net/vhost-vdpa.c | 48 ++++++++++++++++++++++++++++++++++++++++--------
> >  2 files changed, 47 insertions(+), 9 deletions(-)
> >
> > diff --git a/qapi/net.json b/qapi/net.json
> > index 7fab2e7cd8..06a74d4224 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -445,12 +445,18 @@
> >  # @queues: number of queues to be created for multiqueue vhost-vdpa
> >  #          (default: 1)
> >  #
> > +# @x-svq: Start device with (experimental) shadow virtqueue. (Since 7.=
0)
> > +#
> > +# Features:
> > +# @unstable: Member @x-svq could change in future revisions.
>
> Elsewhere we document "Member @foo is experimental."  Does your
> different phrasing indicate a difference in intent?
>

Not really, I can use "Member @foo is experimental." too. I'll change
for the next revision.

> > +#
> >  # Since: 5.1
> >  ##
> >  { 'struct': 'NetdevVhostVDPAOptions',
> >    'data': {
> >      '*vhostdev':     'str',
> > -    '*queues':       'int' } }
> > +    '*queues':       'int',
> > +    '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
> >
> >  ##
> >  # @NetClientDriver:
>
> Do you hope to make @x-svq stable eventually?  If yes: you'll want to
> rename it to @svq then, which could be a bother.  Can be avoided by
> naming it @svq now.  Up to you.
>

Yes, I'll rename for the next revision.

Thanks!

> [...]
>


