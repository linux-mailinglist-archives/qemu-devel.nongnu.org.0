Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C27B6D6E2A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 22:38:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjnQO-0000H9-8g; Tue, 04 Apr 2023 16:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjnQK-0000Ek-Iq
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 16:38:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjnQI-00074O-Q5
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 16:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680640713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AeyQAq7wsPRzLeXhGnd4ywXxSC9iCfcsORgqKeKAGaU=;
 b=fkKY6uxF9qCcxv8PJ0rmK+6L+UXKUaICJzWj+9ypoY1vzkC9GQ2K4aggwLrul8F/ga8/gK
 XrCSyNTE7K1Z34CuJTI3AFxTh4MQjXj0QFrBoK+Y6YucNiI3aeOcjxtPNDstLfK2+2yXs5
 Wuqr3iX3E6f8O6XnGLSdK8danaq87Kk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-JXq7O7P9NNeAPDTer4cfAw-1; Tue, 04 Apr 2023 16:38:32 -0400
X-MC-Unique: JXq7O7P9NNeAPDTer4cfAw-1
Received: by mail-ed1-f71.google.com with SMTP id
 k14-20020a508ace000000b005024a8cef5cso36909990edk.22
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 13:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680640710;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AeyQAq7wsPRzLeXhGnd4ywXxSC9iCfcsORgqKeKAGaU=;
 b=gKYf0Y6czNyCr90e4LRE8WOq4FrTTJDcfazD+AUo4qpt53Alqb8oyKdZxqHkq5RDmb
 PeXUMMq7K699hYipwMUJHCVbNoBYfSQYzDGhA8UGw+gt/DlMhGabjZmmxZfo9U4kd6Z2
 BTotwp3LP2B8zg5Q+s1uQmEgklpE7o1F9kSiBhC/3xfRIM97z+U2/yC54J48yOU1GReQ
 l/NIc9Nk678xEYhyeOkBGgWFRofUko2Xr+Utqmcrsvq2nwVyA0+0EkzRYHcdSBJVyeqD
 PmMj5oKgrqaWYnYOHUQIKSB19p8Z7c7j9Gy6/CRx9JZrF5sVWlX6DGIjobXh4hxzG75Q
 ElrQ==
X-Gm-Message-State: AAQBX9c5SF8bnZiaZotyk6F+/4W/LhRl+Q391tUDgUvE8cShXaJ4pVbX
 vHbATFIqax/YL3AZhgsKq6JrpWPuobJTyCAhQzOKOFz4JxhGBTlARmg2jgUfNIPHjSBKrmhYpc8
 L0i1qVS49BlZhYmo=
X-Received: by 2002:a17:907:1611:b0:947:46e0:9e4f with SMTP id
 hb17-20020a170907161100b0094746e09e4fmr978530ejc.3.1680640710345; 
 Tue, 04 Apr 2023 13:38:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350bGoZwuwddCfAENTVSibhST8cbtg+fq6/T/sKRiiXDv5gK3HdfTVmTosAKYSrMdFZFec2nfGg==
X-Received: by 2002:a17:907:1611:b0:947:46e0:9e4f with SMTP id
 hb17-20020a170907161100b0094746e09e4fmr978510ejc.3.1680640710093; 
 Tue, 04 Apr 2023 13:38:30 -0700 (PDT)
Received: from redhat.com ([2.52.139.22]) by smtp.gmail.com with ESMTPSA id
 os3-20020a170906af6300b0093f3d41b9ebsm6368973ejb.220.2023.04.04.13.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 13:38:29 -0700 (PDT)
Date: Tue, 4 Apr 2023 16:38:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PULL 36/53] memory: Optimize replay of guest mapping
Message-ID: <20230404163733-mutt-send-email-mst@kernel.org>
References: <20230302082343.560446-1-mst@redhat.com>
 <20230302082343.560446-37-mst@redhat.com>
 <CAFEAcA8D+Yy-G1WUY-aPLvk2b1Bh46sheF8msUMQa2Cgt+mfdQ@mail.gmail.com>
 <20230404150929-mutt-send-email-mst@kernel.org>
 <CAFEAcA_SN91x3W+QG-_wFAK4GgQkEW1CPYktK_JoELTG8uvo1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_SN91x3W+QG-_wFAK4GgQkEW1CPYktK_JoELTG8uvo1g@mail.gmail.com>
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

On Tue, Apr 04, 2023 at 09:23:21PM +0100, Peter Maydell wrote:
> On Tue, 4 Apr 2023 at 20:13, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Apr 04, 2023 at 07:00:04PM +0100, Peter Maydell wrote:
> > > On Thu, 2 Mar 2023 at 08:26, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > From: Zhenzhong Duan <zhenzhong.duan@intel.com>
> > > >
> > > > On x86, there are two notifiers registered due to vtd-ir memory region
> > > > splitting the whole address space. During replay of the address space
> > > > for each notifier, the whole address space is scanned which is
> > > > unnecessory.
> > > >
> > > > We only need to scan the space belong to notifier montiored space.
> > > >
> > > > Assert when notifier is used to monitor beyond iommu memory region's
> > > > address space.
> > >
> > > Hi. This patch seems to have regressed the mps3-an547 board,
> > > which now asserts on startup:
> > >
> > > $ ./build/x86/qemu-system-arm --machine mps3-an547 -serial stdio
> > > -kernel /tmp/an547-mwe/build/test.elf
> > > qemu-system-arm: ../../softmmu/memory.c:1903:
> > > memory_region_register_iommu_notifier: Assertion `n->end <=
> > > memory_region_size(mr)' failed.
> > > Aborted (core dumped)
> > >
> > > (reported under https://gitlab.com/qemu-project/qemu/-/issues/1488)
> > >
> > > Since this commit says it's just an optimization, for the 8.0
> > > release can we simply revert it without breaking anything?
> 
> > Fine to revert by me.  Zhenzhong Duan  can you pls fix up
> > this regression and repost? Maybe fix typos in commit log
> > when reposting. Thanks!
> 
> Would somebody also like to send the 'revert' patch, please?

Assuming it's just the technicality of sending it I sent it but it's
night here, didn't test at all. Just check it's same as yours and we
are good to go ;)

> I had that all ready to go, but my git send-email setup
> seems to have mysteriously broken and I don't have time to
> fix it this evening :-(
> 
> This is the commit message I wrote:
> 
> 
> Revert "memory: Optimize replay of guest mapping"
> 
> This reverts commit 6da24341866fa940fd7d575788a2319514941c77
> ("memory: Optimize replay of guest mapping").
> 
> This change breaks the mps3-an547 board under TCG (and
> probably other TCG boards using an IOMMU), which now
> assert:
> 
> $ ./build/x86/qemu-system-arm --machine mps3-an547 -serial stdio
> -kernel /tmp/an547-mwe/build/test.elf
> qemu-system-arm: ../../softmmu/memory.c:1903:
> memory_region_register_iommu_notifier: Assertion `n->end <=
> memory_region_size(mr)' failed.
> 
> This is because tcg_register_iommu_notifier() registers
> an IOMMU notifier which covers the entire address space,
> so the assertion added in this commit is not correct.
> 
> For the 8.0 release, just revert this commit as it is
> only an optimization.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> 
> thanks
> -- PMM


