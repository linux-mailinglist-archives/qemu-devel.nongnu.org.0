Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A7966D518
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 04:40:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHcot-0006JJ-Bb; Mon, 16 Jan 2023 22:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHcor-0006JB-PC
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 22:39:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHcop-0003Mx-Bj
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 22:39:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673926755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ha6bgTY6EffxBd/xv83SKmMYSsnuWyTQ5eCvpnP+Xx0=;
 b=KyMSC2/AzkN8U2T4lyKj1UXBPmox+5todiC44/gsxtPyW3myjtmIDc5V0Zzzmf+SZEXhus
 CoL2SLiJasMTxI1Ex0Sfzo68SWNSzRP7Z3k9XNT1qI6Y7cFBV9RL8mxgpapbOKAwBa+Xp0
 2JwB+zRyYtNekmrmxqdPbZWE68XwI7M=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-TSUrhTbMNUKvkceIf_r0Nw-1; Mon, 16 Jan 2023 22:39:06 -0500
X-MC-Unique: TSUrhTbMNUKvkceIf_r0Nw-1
Received: by mail-oo1-f71.google.com with SMTP id
 c19-20020a4a9c53000000b004f53208440fso409493ook.18
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 19:39:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ha6bgTY6EffxBd/xv83SKmMYSsnuWyTQ5eCvpnP+Xx0=;
 b=jCSPuKl8eHJvt2nLbOwkaLxY7OZ4W/BQ0PQHVsClPa3n57GU6KBmDx6PsqAWRRJGoB
 2OzJfbCpi3f3VxHZVhZCF+kVY9a0tjwhnyyz22UmA/7nytaE17fJ+Jv5xwwYk63C4nwi
 /6fG/XlUSZqq1czK6ZSgCG04zB11A8sUTEaQK2xjjBeQchMTN2QlAUgFde9AN8QK58cc
 FcqtEnhOfsDan2bgNp91toBn0JPitu9Ux1N+CHDOTFnhUKBqfGe+WevoMGpH3pqX0fzX
 Y356Gs47pQKFKzhO27m3fP9TDUifVbrdo44Y2M6xfZZGvt5ftDchf4bIN9/eQ0WGGtq3
 R3Mw==
X-Gm-Message-State: AFqh2ko0M9zh0DUjdORORQcNbKccFmfThQOVXg3/yOgNlKJO0D39dTQK
 E4lS2iTCFXHMYJqLDfykepN7FVQ4Um9kss+JJ0huRrZODb/RANitwh7MPNIeFIwLvDAnXwbCN2f
 EschZCSSWtOMAJ+rgq071Z8UJJaV0byc=
X-Received: by 2002:a05:6871:10e:b0:15b:96b5:9916 with SMTP id
 y14-20020a056871010e00b0015b96b59916mr149976oab.280.1673926745989; 
 Mon, 16 Jan 2023 19:39:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvqPYqkQVFnOxCRhF7kyawoT25AFENVX8d3XVJbThy7IZYctj2ehPN44I9vrTO1QVc8T4nwOQRkPxxry2YWrqM=
X-Received: by 2002:a05:6871:10e:b0:15b:96b5:9916 with SMTP id
 y14-20020a056871010e00b0015b96b59916mr149961oab.280.1673926745799; Mon, 16
 Jan 2023 19:39:05 -0800 (PST)
MIME-Version: 1.0
References: <20221205170436.2977336-1-eperezma@redhat.com>
 <20221205170436.2977336-11-eperezma@redhat.com>
 <CACGkMEtcQztTdRbX3xyFvNYSRsu58tRppoyTUh94vXwSGLPH=A@mail.gmail.com>
 <CAJaqyWf34J7g+3eQ498JS+VC07j+3rF+m-yeWhE5RcP1MDu2pw@mail.gmail.com>
 <20230116155949-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230116155949-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 17 Jan 2023 11:38:54 +0800
Message-ID: <CACGkMEuMGD9_RQEHMFgHFGxcrjLnOv7FbNxEzJVy+iWvEk_6Og@mail.gmail.com>
Subject: Re: [RFC PATCH for 8.0 10/13] virtio-net: Migrate vhost inflight
 descriptors
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>, qemu-devel@nongnu.org, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 17, 2023 at 5:02 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Dec 07, 2022 at 09:56:20AM +0100, Eugenio Perez Martin wrote:
> > > A dumb question, any reason we need bother with virtio-net? It looks
> > > to me it's not a must and would complicate migration compatibility.
> > >
> > > I guess virtio-blk is the better place.
> > >
> >
> > I'm fine to start with -blk, but if -net devices are processing
> > buffers out of order we have chances of losing descriptors too.
> >
> > We can wait for more feedback to prioritize correctly this though.
> >
> > Thanks!
>
> Traditionally vhost serialized everything when dropping the VQ.
> Would be interesting to hear from hardware vendors on whether
> it's hard or easy to do in hardware.

The feedback is some vendors will do the serialization while others are not.

> But I suspect all devices will want the capability eventually
> because why not, if we have the code let's just do it everywhere.

Yes, but it's more about priority/compatibility other than whether it
is needed. We want to let the migration work as earlier as possible
for vendor to test and try.

Thanks

>
> --
> MST
>


