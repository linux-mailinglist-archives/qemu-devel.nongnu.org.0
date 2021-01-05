Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE7D2EADF4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 16:12:07 +0100 (CET)
Received: from localhost ([::1]:33580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwo0E-0001Cr-BW
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 10:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1kwnx8-0007oW-8a
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 10:08:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1kwnx5-00089G-7A
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 10:08:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609859328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YLZxPcu7diNCSxv4RYit4woOy7HsPjZz45lBBc8AWEU=;
 b=bguottVj+mSFobA9lkGo+WimrmwU2VXOsR7DJJ8fn2Q3gV0XV14xO4YLR1VPG4ocC2m+Tu
 bHqO7QSx+iGJZzXRX3IWn/t8b5lydGBl9BRIoEzZCCBS40A/85MbAVZVhxoBY+6aUiPD7Y
 89FKH4XGOV6q/SuE/+QwE7MgqsgKRD8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-sxDm3GeMMOOzJkVZ9U8Qxw-1; Tue, 05 Jan 2021 10:08:46 -0500
X-MC-Unique: sxDm3GeMMOOzJkVZ9U8Qxw-1
Received: by mail-qv1-f72.google.com with SMTP id m1so27965588qvp.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 07:08:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YLZxPcu7diNCSxv4RYit4woOy7HsPjZz45lBBc8AWEU=;
 b=M9XqFVtiggZZtkKKAasCVpcT8gfLfVFr92+2ucvz1UhsaY97EGAH7U+sIHyZJcgc+w
 TMIah++NBqikltuNlYy26VZBO7TeC0HkPr2lLBpJI9iTVDMyxmV6PFWRiyNOs1AMbVqW
 HqDyzCP2IJYNTwXvJCqG3b4wyEdTexMZOxi6cHmlhGbpCwqtn62onAiMMz2TxjRv8rJy
 Fsi3cWJXR5IC2jKlqprG+V+E6mjToys47VEzUpG4ndLTdGe6PBd2nv5S2XqFPpC8Re3/
 /Qr45UtYxU3ief0IDQDL4RWZtNoyJSaCPWxPaODTOJRccpFfjyPYvJlZJkiQdeXscIdx
 rzcw==
X-Gm-Message-State: AOAM533gcXEr5fotrdF8nQUEqvfp9G0p8hpLan9tvwcK/AzXk7HxByIs
 HhntvHfxfaBNMf2C7+K3gfYi+V0u8jR2yi86QOm6hySIMaIdAtYQOaxnUeFQrb+JJPMcDic/EzF
 lIbtcFGwB+TP+7rG1HAKfStb+iRmbcQw=
X-Received: by 2002:a05:6214:28f:: with SMTP id
 l15mr81049349qvv.38.1609859326042; 
 Tue, 05 Jan 2021 07:08:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaafuCyiqLHCtvs/8dWeVcwoFMI6DsNONgdl/yCaqtjKtIVLrzBtit66tcEZlNhfWU9om7ASon42zRaedP6kY=
X-Received: by 2002:a05:6214:28f:: with SMTP id
 l15mr81049331qvv.38.1609859325857; 
 Tue, 05 Jan 2021 07:08:45 -0800 (PST)
MIME-Version: 1.0
References: <20201210161126.GA125438@redhat.com>
 <CAOssrKcKaosJo1W+sek0AOA3CdyE+ZUWzx8KPsn=Gz3Nor+_iQ@mail.gmail.com>
 <20201211160603.GD3285@redhat.com> <20201211182956.GF3380@work-vm>
 <20201211192517.GF3285@redhat.com>
In-Reply-To: <20201211192517.GF3285@redhat.com>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Tue, 5 Jan 2021 16:08:34 +0100
Message-ID: <CAOssrKejTsvg6jZtOFVZ-5iGRmh=RdgfiAre+cbYDQLrrosvJA@mail.gmail.com>
Subject: Re: Some performance numbers for virtiofs, DAX and virtio-9p
To: Vivek Goyal <vgoyal@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mszeredi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mszeredi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Venegas Munoz, Jose Carlos" <jose.carlos.venegas.munoz@intel.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, virtio-fs-list <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 11, 2020 at 8:25 PM Vivek Goyal <vgoyal@redhat.com> wrote:
>
> On Fri, Dec 11, 2020 at 06:29:56PM +0000, Dr. David Alan Gilbert wrote:
>
> [..]
> > > >
> > > > Could we measure at what point does a large window size actually make
> > > > performance worse?
> > >
> > > Will do. Will run tests with varying window sizes (small to large)
> > > and see how does it impact performance for same workload with
> > > same guest memory.
> >
> > I wonder how realistic it is though;  it makes some sense if you have a
> > scenario like a fairly small root filesystem - something tractable;  but
> > if you have a large FS you're not realistically going to be able to set
> > the cache size to match it - that's why it's a cache!
>
> I think its more about active dataset size and not necessarily total
> FS size. FS might be big but if application is not accessing all of
> the in reasonabl small time window, then it does not matter.
>
> What worries me most is that cost of reclaim of a dax range seems
> too high (or keeps the process blocked for long enogh), that it
> kills the performance. I will need to revisit the reclaim path
> and see if I can optimize something.

Can we dynamically increase the dax window size?  Or hot plug
additional dax ranges on demand?

That would solve the problem of trying to find the active set size in advance.

We'd still need reclaim in order to prevent the window from growing
indefinitely, but that would always be background reclaim and be done
after some time of inactivity.

Thanks,
Miklos


