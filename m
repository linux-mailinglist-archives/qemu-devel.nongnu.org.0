Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C182753490D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 04:53:43 +0200 (CEST)
Received: from localhost ([::1]:40034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu3d8-00024n-Dr
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 22:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nu3bl-0001NK-A8
 for qemu-devel@nongnu.org; Wed, 25 May 2022 22:52:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nu3bh-00036s-Uw
 for qemu-devel@nongnu.org; Wed, 25 May 2022 22:52:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653533531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N5EaBoKSlYx2PiWkBNk7Fx3mjZ9MwRJ45dqcCEqJ5Rw=;
 b=hokEX2/1ujsrsqENPI416QYfpN3/kpnJJHaTbQR89phbveLGm7PRonVPAMci4LJDXlL80c
 yATjryu533gJlXFa5z7CM+YK4xtdB1pXAZ4qxUE1a1xvWaNNr64TTu7GT5DJf4KY+ml9SM
 1pxEzgJYiVqgwiNwjDzh4DWc1553/0c=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-DtM_ycuHO9yv6PxAkpJt0A-1; Wed, 25 May 2022 22:52:08 -0400
X-MC-Unique: DtM_ycuHO9yv6PxAkpJt0A-1
Received: by mail-lf1-f70.google.com with SMTP id
 bi27-20020a0565120e9b00b004786caccc7dso179955lfb.11
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 19:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N5EaBoKSlYx2PiWkBNk7Fx3mjZ9MwRJ45dqcCEqJ5Rw=;
 b=q9WNzYpSsg1Fufdk6UrswEypQMAiHOEJPb2Pe85KcNS76ISGWzAgfu8sW0uf6zjBPg
 bqIF5XavQAwijtdo9sk62ks81IrHArx6OVHwi82KuB5yBjBSOa4ddbcY0H87vyp7Wu+9
 u6v29ouHpJdYIXqXd+do9joKQZcX+wsuHnOujMpkayr8ImMe7MdFiHB/kSWo7Mm7BzFj
 VAEnS8fiSCZeu5JE3PVyJvXpDcS2DcidlFvO2HnA1iUw5k978vrt+oLmKbWUvmNvCbCU
 T7wFZugpvb5BofaN2cmpkFdreOBLislPBB4yOkkGhIwA8Cz3gFgch/VeGTy31lcLAgQR
 C+xg==
X-Gm-Message-State: AOAM532movDTtdxy7dkRnaMfuC5IP/EtUv//UuO1vpGR1WsWJetwveK3
 AjmgaTRX2pp6Jn81pDMDLJwziHcCKJYBch5D/klplIhyXuKNFMOpcclWbtcX8bp3sjxYBM9xPWH
 KRgoK4MWuplIL4DYZ8nF38jaOFUuRtAE=
X-Received: by 2002:a05:6512:c0e:b0:478:5a91:20bb with SMTP id
 z14-20020a0565120c0e00b004785a9120bbmr18691411lfu.587.1653533526709; 
 Wed, 25 May 2022 19:52:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRRlLPnicWxMLKOFyh3QcOEVCzeJFvj2D+ju+Wrb0NhfmvgJMhMvwGOTRpo0I0jZSUu/8QDr1ON1Og/zNhRVQ=
X-Received: by 2002:a05:6512:c0e:b0:478:5a91:20bb with SMTP id
 z14-20020a0565120c0e00b004785a9120bbmr18691387lfu.587.1653533526431; Wed, 25
 May 2022 19:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646243252.git.huangy81@chinatelecom.cn>
 <a650dbf80c9415a9d4054b6e1f936170cbfce9ea.1646243447.git.huangy81@chinatelecom.cn>
 <1e117589-1719-0d11-099f-9f3392e0ba6f@nutanix.com>
 <f98ae9a1-8d47-7995-ae0d-101c626c3be4@chinatelecom.cn>
 <f0e09ec4-7d16-b022-0949-4599a5378356@nutanix.com>
 <fb42912b-e3f4-f0cb-fb16-671ba75bd7ef@chinatelecom.cn>
 <Yo5RiqKWuwZPY6Iv@xz-m1.local>
In-Reply-To: <Yo5RiqKWuwZPY6Iv@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 26 May 2022 10:51:55 +0800
Message-ID: <CACGkMEsiLUxEKD=o23aaHzo5AVy-vTRPKhxtT6-cTT+ETtdpaA@mail.gmail.com>
Subject: Re: [PATCH v17 6/8] softmmu/dirtylimit: Implement virtual CPU throttle
To: Peter Xu <peterx@redhat.com>
Cc: Hyman Huang <huangy81@chinatelecom.cn>,
 "manish.mishra" <manish.mishra@nutanix.com>, 
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <eduardo@habkost.net>, 
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 25, 2022 at 11:56 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, May 25, 2022 at 11:38:26PM +0800, Hyman Huang wrote:
> > > 2. Also this algorithm only control or limits dirty rate by guest
> > > writes. There can be some memory dirtying done by virtio based devices
> > > which is accounted only at qemu level so may not be accounted through
> > > dirty rings so do we have plan for that in future? Those are not issue
> > > for auto-converge as it slows full VM but dirty rate limit only slows
> > > guest writes.
> > >
> > From the migration point of view, time spent on migrating memory is far
> > greater than migrating devices emulated by qemu. I think we can do that when
> > migrating device costs the same magnitude time as migrating memory.
> >
> > As to auto-converge, it throttle vcpu by kicking it and force it to sleep
> > periodically. The two seems has no much difference from the perspective of
> > internal method but the auto-converge is kind of "offensive" when doing
> > restraint. I'll read the auto-converge implementation code and figure out
> > the problem you point out.
>
> This seems to be not virtio-specific, but can be applied to any device DMA
> writting to guest mem (if not including vfio).  But indeed virtio can be
> normally faster.
>
> I'm also curious how fast a device DMA could dirty memories.  This could be
> a question to answer to all vcpu-based throttling approaches (including the
> quota based approach that was proposed on KVM list).  Maybe for kernel
> virtio drivers we can have some easier estimation?

As you said below, it really depends on the speed of the backend.

>  My guess is it'll be
> much harder for DPDK-in-guest (aka userspace drivers) because IIUC that
> could use a large chunk of guest mem.

Probably, for vhost-user backend, it could be ~20Mpps or even higher.

Thanks

>
> [copy Jason too]
>
> --
> Peter Xu
>


