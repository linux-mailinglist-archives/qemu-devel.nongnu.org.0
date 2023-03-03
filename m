Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2986A9362
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:09:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1PQ-00077Y-RB; Fri, 03 Mar 2023 04:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY1PP-00077H-J8
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:08:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY1PO-0003kL-3w
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:08:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677834537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OtIWHMuPgxiprNdCQZ8aoXEgDaqF6QL4xORS0NhSsWg=;
 b=Z2iF0zb/xGDdKbGe9KJMJY3hh9zhpWLYFXpt3G56vgnJc0mHmmD0ykmTppWrjSejUQVCNg
 YtGabpQkLn59dIZsBE/LGUdzI+J4tADmVpgD76ZffNXNTX+KX9R1cu7ldLmzHjGKXWA7IO
 S4vneXy9eFwncw4O5HxnFQzaPptE2zw=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-390-PB0VGzVzN2GlJHpwUez3yQ-1; Fri, 03 Mar 2023 04:08:54 -0500
X-MC-Unique: PB0VGzVzN2GlJHpwUez3yQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 i11-20020a256d0b000000b0086349255277so1780959ybc.8
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 01:08:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677834533;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OtIWHMuPgxiprNdCQZ8aoXEgDaqF6QL4xORS0NhSsWg=;
 b=oVVqmDuU3HyLSAs5loceJaMt3168JdgD13kkF51VCO/AKE7o/ln8DZf2XCN5cADfPC
 oJp8gSWMJ0pyvtUFuTaCzdD184Msxq/L3jU5j7duKiu5hC8VaM6R9/ooRbMr2w2jDBWT
 Lm2JiHXVZBtqVASNaBF2CDsU4fEQLq6b/CtdZ3irXe9iZIUQRonJIpsf3semj1SIelq+
 HrtkZirtwfqqifWCy1cE/4fjQ6IXz2BftVaZe9nB1yUnWer8palNdl+qinOItQA/4IWV
 ePx5ROMoqK/WKes3qwLlQSTwtJ07Pp+bHegLwwzNsIXd7lIZD6d3mczd2zeUu7c4+ht7
 +Ozw==
X-Gm-Message-State: AO0yUKWZ6JP4Zriiqq22yqqiVGMJimF3n7HOGEDOZMnTAP1SLhTYc3vO
 ZfVITEl3FYBKIMggPPCqAfMtcD8IA9pBLMh2OTynLp0Nflpvm5mqE4GCwwO77B0/Ot9ji0eU/B0
 7M1ugLAnSg0wqMN/4exlj9XiQ9/X8PHI=
X-Received: by 2002:a05:6902:4d1:b0:8dd:4f2c:ede4 with SMTP id
 v17-20020a05690204d100b008dd4f2cede4mr559828ybs.2.1677834533736; 
 Fri, 03 Mar 2023 01:08:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+TnEgmoKBsET6+CARQBFygEe/1m6WAK9UjDHMSM+f/qpLas8XR1rixhdMOpQ9JIfbSuExJ3WtGujdpTn4DTi0=
X-Received: by 2002:a05:6902:4d1:b0:8dd:4f2c:ede4 with SMTP id
 v17-20020a05690204d100b008dd4f2cede4mr559814ybs.2.1677834533509; Fri, 03 Mar
 2023 01:08:53 -0800 (PST)
MIME-Version: 1.0
References: <20230213191929.1547497-1-eperezma@redhat.com>
 <CACGkMEsQe=zcfmK=rMH=u6RgHkkBFs+tJO7gT0v_bWwJ_N+z6Q@mail.gmail.com>
 <CAJaqyWfsBLvsJNF=RvhbirwNypzjfaO7thyK22s-nCjdaNs4yQ@mail.gmail.com>
 <20230214024736-mutt-send-email-mst@kernel.org>
 <CAJaqyWc8JON+QhJbqQCFx+q+qxb5LqjgsHS2wZ7R3v37uVU_sw@mail.gmail.com>
 <20230301163325-mutt-send-email-mst@kernel.org>
 <CAJaqyWfpbeoLfe1-GcoR=rtJMg1DGezMe8pjSNPQjBG4BzqMrA@mail.gmail.com>
 <20230302064234-mutt-send-email-mst@kernel.org>
 <CAJaqyWe0=R8OKXec1xvCWPrQOdum-Jp4V1_MCevi8nB4J7+kgA@mail.gmail.com>
 <20230302182928-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230302182928-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 3 Mar 2023 10:08:17 +0100
Message-ID: <CAJaqyWdcGUYMgB4qs4be5XMDsh+GaSQeoFj6K4xgbnKPbm1TbA@mail.gmail.com>
Subject: Re: [PATCH] vhost: accept VIRTIO_F_ORDER_PLATFORM as a valid SVQ
 feature
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, 
 Gautam Dawar <gdawar@xilinx.com>, Parav Pandit <parav@mellanox.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, 
 Eli Cohen <eli@mellanox.com>, alvaro.karsz@solid-run.com, 
 Lei Yang <leiyang@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Fri, Mar 3, 2023 at 12:31 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Mar 02, 2023 at 03:47:48PM +0100, Eugenio Perez Martin wrote:
> > On Thu, Mar 2, 2023 at 12:43 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Thu, Mar 02, 2023 at 12:30:52PM +0100, Eugenio Perez Martin wrote:
> > > > > You need to pass this to guest. My point is that there is no reason to
> > > > > get it from the kernel driver. QEMU can figure out whether the flag is
> > > > > needed itself.
> > > > >
> > > >
> > > > Ok, I can see now how the HW device does not have all the knowledge to
> > > > offer this flag or not. But I'm not sure how qemu can know either.
> > > >
> > > > If qemu opens /dev/vhost-vdpa-N, how can it know it? It has no way to
> > > > tell if the device is sw or hw as far as I know. Am I missing
> > > > something?
> > > >
> > > > Thanks!
> > >
> > > This is what I said earlier.  You can safely assume vdpa needs this
> > > flag. Only exception is vduse and we don't care about performance there.
> > >
> >
> > Ok now I get your point, thanks for explaining.
> >
> > But I'm missing why it is wrong to start using it properly from the
> > kernel.
> >
> > I didn't test vDPA in non x86 / PCI, but if it does not work
> > because of the lack of this feature flag the right fix would be to
> > offer it, not to start assuming it in qemu, isn't it?
> >
> > I can see how "assume VIRTIO_F_ORDER_PLATFORM from qemu" may need code
> > comments and extra explanations, but to start offering it properly
> > from the device is expected somehow.
> >
> > Thanks!
>
> Does kernel always expose it?
>

As far as I know the only vdpa device exposing it is alibaba/eni_vdpa


