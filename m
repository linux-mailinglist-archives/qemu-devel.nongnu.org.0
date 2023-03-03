Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004DE6A9391
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:17:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1X4-0003zT-Hg; Fri, 03 Mar 2023 04:16:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pY1Wy-0003z9-Ek
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:16:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pY1Ww-0007BF-QD
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:16:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677835005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+9YuqYehjUc0AmBy0b1FAzpBRPPZoZuIG6Th6GQyGhU=;
 b=EXv3Icgz4VeOHzY0VLwdOnLqpumypQZ6KX0sv9Jn0qeZMfLJ7DGW+mOd+bwiTaduEczY35
 XIHdjSp1eB+bP9L2P1A0+eMeqx2P6yvAaamWIyaQwu24E7P3+pBzv+LoUbpIzQBW4K+z1Q
 AAgENtzzumeKW10wo18sUe+pcNwigAQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-602-JyVPYsxVNsycZdE8FEOS8A-1; Fri, 03 Mar 2023 04:16:43 -0500
X-MC-Unique: JyVPYsxVNsycZdE8FEOS8A-1
Received: by mail-wr1-f71.google.com with SMTP id
 ba28-20020a0560001c1c00b002cc6d1f0c06so275757wrb.17
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 01:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677835002;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+9YuqYehjUc0AmBy0b1FAzpBRPPZoZuIG6Th6GQyGhU=;
 b=lhw6OA61Lfz2q8hhbI41WroO0zTQtnTtda7B0LBIvbfKJ3oc0UnNQeKYdLHO3+NXeF
 cbVkXLJAbpVYwECRosXOLxRvLDey9Tt01XA9eoTwPNpvJel4YASm6zwRoIndoyVcRTfp
 pjOI47bT7rfmDHdHxV3uh++h6w+X0KuGiVZJ5DGHrw6yC9dQIVTOppG5ziPNm2NxIZIv
 nt1QoifJ79JXl2jbCKzgWdJn+KqcqZmBe3ddgR1/tS12KGRgIOOkyvLVmHk7Ue0JoysA
 cKBXio8jAhVIOJpIChQ7Hn3W+/ZIMWAMczsp7NBPzBi+UI6brXgboA2UEP+BXwph9UBm
 wKyw==
X-Gm-Message-State: AO0yUKUex97rbTArnUkII9qSUzLzYE9MdcW0a5VHNELrv9ZR5Ac0e+YB
 V/8cEhzt9P5jaM6CgRXv/ftSsgKUsHXapUFzLfIwpf6zgFDfIu6OLGMb8bzIeMuqMJRPi7MStFj
 rw9tSlCPP313ZleQ=
X-Received: by 2002:adf:ea8c:0:b0:2ca:5c9a:a548 with SMTP id
 s12-20020adfea8c000000b002ca5c9aa548mr950808wrm.60.1677835002224; 
 Fri, 03 Mar 2023 01:16:42 -0800 (PST)
X-Google-Smtp-Source: AK7set8vLfWFU0MwoeLam6HHc5VPMlNs0RodEOjiLx4E8tcDi587GsUa34clBGrpFPXbwqAyQ6pOEw==
X-Received: by 2002:adf:ea8c:0:b0:2ca:5c9a:a548 with SMTP id
 s12-20020adfea8c000000b002ca5c9aa548mr950789wrm.60.1677835001936; 
 Fri, 03 Mar 2023 01:16:41 -0800 (PST)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a056000011000b002c703d59fa7sm1610078wrx.12.2023.03.03.01.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 01:16:41 -0800 (PST)
Date: Fri, 3 Mar 2023 04:16:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Gautam Dawar <gdawar@xilinx.com>, Parav Pandit <parav@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, Eli Cohen <eli@mellanox.com>,
 alvaro.karsz@solid-run.com, Lei Yang <leiyang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] vhost: accept VIRTIO_F_ORDER_PLATFORM as a valid SVQ
 feature
Message-ID: <20230303041325-mutt-send-email-mst@kernel.org>
References: <CACGkMEsQe=zcfmK=rMH=u6RgHkkBFs+tJO7gT0v_bWwJ_N+z6Q@mail.gmail.com>
 <CAJaqyWfsBLvsJNF=RvhbirwNypzjfaO7thyK22s-nCjdaNs4yQ@mail.gmail.com>
 <20230214024736-mutt-send-email-mst@kernel.org>
 <CAJaqyWc8JON+QhJbqQCFx+q+qxb5LqjgsHS2wZ7R3v37uVU_sw@mail.gmail.com>
 <20230301163325-mutt-send-email-mst@kernel.org>
 <CAJaqyWfpbeoLfe1-GcoR=rtJMg1DGezMe8pjSNPQjBG4BzqMrA@mail.gmail.com>
 <20230302064234-mutt-send-email-mst@kernel.org>
 <CAJaqyWe0=R8OKXec1xvCWPrQOdum-Jp4V1_MCevi8nB4J7+kgA@mail.gmail.com>
 <20230302182928-mutt-send-email-mst@kernel.org>
 <CAJaqyWdcGUYMgB4qs4be5XMDsh+GaSQeoFj6K4xgbnKPbm1TbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJaqyWdcGUYMgB4qs4be5XMDsh+GaSQeoFj6K4xgbnKPbm1TbA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Fri, Mar 03, 2023 at 10:08:17AM +0100, Eugenio Perez Martin wrote:
> On Fri, Mar 3, 2023 at 12:31 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Mar 02, 2023 at 03:47:48PM +0100, Eugenio Perez Martin wrote:
> > > On Thu, Mar 2, 2023 at 12:43 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Thu, Mar 02, 2023 at 12:30:52PM +0100, Eugenio Perez Martin wrote:
> > > > > > You need to pass this to guest. My point is that there is no reason to
> > > > > > get it from the kernel driver. QEMU can figure out whether the flag is
> > > > > > needed itself.
> > > > > >
> > > > >
> > > > > Ok, I can see now how the HW device does not have all the knowledge to
> > > > > offer this flag or not. But I'm not sure how qemu can know either.
> > > > >
> > > > > If qemu opens /dev/vhost-vdpa-N, how can it know it? It has no way to
> > > > > tell if the device is sw or hw as far as I know. Am I missing
> > > > > something?
> > > > >
> > > > > Thanks!
> > > >
> > > > This is what I said earlier.  You can safely assume vdpa needs this
> > > > flag. Only exception is vduse and we don't care about performance there.
> > > >
> > >
> > > Ok now I get your point, thanks for explaining.
> > >
> > > But I'm missing why it is wrong to start using it properly from the
> > > kernel.
> > >
> > > I didn't test vDPA in non x86 / PCI, but if it does not work
> > > because of the lack of this feature flag the right fix would be to
> > > offer it, not to start assuming it in qemu, isn't it?
> > >
> > > I can see how "assume VIRTIO_F_ORDER_PLATFORM from qemu" may need code
> > > comments and extra explanations, but to start offering it properly
> > > from the device is expected somehow.
> > >
> > > Thanks!
> >
> > Does kernel always expose it?
> >
> 
> As far as I know the only vdpa device exposing it is alibaba/eni_vdpa

That is my point then. qemu should set it and ignore what kernel says.

-- 
MST


