Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8126A2FB37E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 08:52:39 +0100 (CET)
Received: from localhost ([::1]:57934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1loc-00030R-5H
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 02:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1lnl-0002WI-CG; Tue, 19 Jan 2021 02:51:45 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1lnj-0006lI-Dm; Tue, 19 Jan 2021 02:51:45 -0500
Received: by mail-pl1-x630.google.com with SMTP id e9so5864120plh.3;
 Mon, 18 Jan 2021 23:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=v3GL1EFG5mi9v+ngTRYYO3jsL5PGrda9sMBvl7gwSxs=;
 b=GHNXZFIZ2pjTHYg11onrJ++6pBw5K2hKS3UihtzKoFAXlrs1SVmvE7kHwjTbGEP1ZN
 qjykQwI1IJJJ31zU0FsMb3yaVaFTOr2e1al74TqYgeUEcCl33Dua/VYk3qD+IZk/1FY9
 8lAOt+dhDss6FIXgl4idxvz8mI9wee5Qxi99H3pZ+LPJxS4FSNt1cj35ZOepX2BwiEw/
 60FlXfWl/M0OtSGKPvk+H5giTLUBp8VffLTUIlGgpYQzU0U99ss6YRfoQgXUA3T8DvRO
 EKTRo4quAWXYIq3UMAuuFMwLEKZEd4/yvRKP2Nq6JpGr9loQ39ep3y0oX3Zz5k+zbRXi
 kCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=v3GL1EFG5mi9v+ngTRYYO3jsL5PGrda9sMBvl7gwSxs=;
 b=iujVutAvhBqZ/ZA0ZP9wYLNaPtqHCVAonkNO9OzyzMSjyi3n30/2JORNS2inHXwupM
 E+mpiCTnPfScMBEQt19lFbwesYXS4EUYS+PPV/se85w85RYFcf9TXBmzFhiGL9w/NfgA
 ceGsu/zl8aDzpvBLFu3QyqEx5F5/oP1tmRqPoYVlXIYHVMcnGDwZ9rB8wSC0M7NzP2VI
 Tu0g+LpLStOnhzjvjwmjexaNFZr+SfS57m+frgoDOYCevfW45sltF5TIA890pvNBQFNQ
 DYeM/1wCtihpL35OI+yTglkEpJTzj3A2h8rvZeQSvBRiqiO+mZxa3meaFlwaZCioFEZh
 Onrw==
X-Gm-Message-State: AOAM533O3nkCNpJl7Iz4dPu6rz9PzfqfCs2m1plfBcC+XRVgW+xz4fI4
 7CpRrcnd18ZdWzf8W31vUqk=
X-Google-Smtp-Source: ABdhPJye4apcqJzsdgIONc4usJHPjzUFn4gOQT1EqSUuG+Mqj4p9TYcGnfElxpUJjje3styhUzvBNA==
X-Received: by 2002:a17:90a:8508:: with SMTP id
 l8mr3754797pjn.131.1611042701467; 
 Mon, 18 Jan 2021 23:51:41 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id h11sm1891156pjg.46.2021.01.18.23.51.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 23:51:40 -0800 (PST)
Date: Tue, 19 Jan 2021 16:51:38 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH V2 00/11] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <20210119075138.GG5939@localhost.localdomain>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
 <YAX6RcpFiX9xthQI@apples.localdomain>
 <20210119032126.GD5939@localhost.localdomain>
 <YAZ2VOn3Dn26YE6R@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YAZ2VOn3Dn26YE6R@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-19 07:04:04, Klaus Jensen wrote:
> On Jan 19 12:21, Minwoo Im wrote:
> > On 21-01-18 22:14:45, Klaus Jensen wrote:
> > > On Jan 17 23:53, Minwoo Im wrote:
> > > > Hello,
> > > > 
> > > > This patch series introduces NVMe subsystem device to support multi-path
> > > > I/O in NVMe device model.  Two use-cases are supported along with this
> > > > patch: Multi-controller, Namespace Sharing.
> > > > 
> > > > V1 RFC has been discussed with Klaus and Keith, I really appreciate them
> > > > for this patch series to have proper direction [1].
> > > > 
> > > > This patch series contains few start-up refactoring pathces from the
> > > > first to fifth patches to make nvme-ns device not to rely on the nvme
> > > > controller always.  Because nvme-ns shall be able to be mapped to the
> > > > subsystem level, not a single controller level so that it should provide
> > > > generic initialization code: nvme_ns_setup() with NvmeCtrl.  To do that,
> > > > the first five patches are to remove the NvmeCtrl * instance argument
> > > > from the nvme_ns_setup().  I'd be happy if they are picked!
> > > > 
> > > > For controller and namespace devices, 'subsys' property has been
> > > > introduced to map them to a subsystem.  If multi-controller needed, we
> > > > can specify 'subsys' to controllers the same.
> > > > 
> > > > For namespace deivice, if 'subsys' is not given just like it was, it
> > > > will have to be provided with 'bus' parameter to specify a nvme
> > > > controller device to attach, it means, they are mutual-exlusive.  To
> > > > share a namespace between or among controllers, then nvme-ns should have
> > > > 'subsys' property to a single nvme subsystem instance.  To make a
> > > > namespace private one, then we need to specify 'bus' property rather
> > > > than the 'subsys'.
> > > > 
> > > > Of course, this series does not require any updates for the run command
> > > > for the previos users.
> > > > 
> > > > Plase refer the following example with nvme-cli output:
> > > > 
> > > > QEMU Run:
> > > >   -device nvme-subsys,id=subsys0 \
> > > >   -device nvme,serial=foo,id=nvme0,subsys=subsys0 \
> > > >   -device nvme,serial=bar,id=nvme1,subsys=subsys0 \
> > > >   -device nvme,serial=baz,id=nvme2,subsys=subsys0 \
> > > >   -device nvme-ns,id=ns1,drive=drv10,nsid=1,subsys=subsys0 \
> > > >   -device nvme-ns,id=ns2,drive=drv11,nsid=2,bus=nvme2 \
> > > >   \
> > > >   -device nvme,serial=qux,id=nvme3 \
> > > >   -device nvme-ns,id=ns3,drive=drv12,nsid=3,bus=nvme3
> > > > 
> > > > nvme-cli:
> > > >   root@vm:~/work# nvme list -v
> > > >   NVM Express Subsystems
> > > > 
> > > >   Subsystem        Subsystem-NQN                                                                                    Controllers
> > > >   ---------------- ------------------------------------------------------------------------------------------------ ----------------
> > > >   nvme-subsys1     nqn.2019-08.org.qemu:subsys0                                                                     nvme0, nvme1, nvme2
> > > >   nvme-subsys3     nqn.2019-08.org.qemu:qux                                                                         nvme3
> > > > 
> > > >   NVM Express Controllers
> > > > 
> > > >   Device   SN                   MN                                       FR       TxPort Address        Subsystem    Namespaces
> > > >   -------- -------------------- ---------------------------------------- -------- ------ -------------- ------------ ----------------
> > > >   nvme0    foo                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:06.0   nvme-subsys1 nvme1n1
> > > >   nvme1    bar                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:07.0   nvme-subsys1 nvme1n1
> > > >   nvme2    baz                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:08.0   nvme-subsys1 nvme1n1, nvme1n2
> > > >   nvme3    qux                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:09.0   nvme-subsys3
> > > > 
> > > >   NVM Express Namespaces
> > > > 
> > > >   Device       NSID     Usage                      Format           Controllers
> > > >   ------------ -------- -------------------------- ---------------- ----------------
> > > >   nvme1n1      1        134.22  MB / 134.22  MB    512   B +  0 B   nvme0, nvme1, nvme2
> > > >   nvme1n2      2        268.44  MB / 268.44  MB    512   B +  0 B   nvme2
> > > >   nvme3n1      3        268.44  MB / 268.44  MB    512   B +  0 B   nvme3
> > > > 
> > > > Summary:
> > > >   - Refactored nvme-ns device not to rely on controller during the
> > > >     setup.  [1/11 - 5/11]
> > > >   - Introduced a nvme-subsys device model. [6/11]
> > > >   - Create subsystem NQN based on subsystem. [7/11]
> > > >   - Introduced multi-controller model. [8/11 - 9/11]
> > > >   - Updated namespace sharing scheme to be based on nvme-subsys
> > > >     hierarchy. [10/11 - 11/11]
> > > > 
> > > > Since RFC V1:
> > > >   - Updated namespace sharing scheme to be based on nvme-subsys
> > > >     hierarchy.
> > > > 
> > > 
> > > Great stuff Minwoo. Thanks!
> > > 
> > > I'll pick up [01-05/11] directly since they are pretty trivial.
> > 
> > Thanks! will prepare the next series based on there.
> > 
> > > The subsystem model looks pretty much like it should, I don't have a lot
> > > of comments.
> > > 
> > > One thing that I considered, is if we should reverse the "registration"
> > > and think about it as namespace attachment. The spec is about
> > > controllers attaching to namespaces, not the other way around.
> > > Basically, let the namespaces be configured first and register on the
> > > subsystem (accumulating in a "namespaces" array), then have the
> > > controllers register with the subsystem and attach to all "non-detached"
> > > namespaces. This allows detached namespaces to "linger" in the subsystem
> > > to be attached later on. If there are any private namespaces (like ns2
> > > in your example above), it will be defined after the controller with the
> > > bus=ctrlX parameter like normal.
> > 
> > Revisited spec. again.  5.19 says "The Namespace Attachment command is
> > used to attach and detach controllers from a namespace.".  and 5.20 says
> > "Host software uses the Namespace Attachment command to attach or detach
> > a namespace to or from a controller. The create operation does not attach
> > the namespace to a controller."
> > 
> 
> Yeah ok, that is pretty inconsistent.
> 
> > 	-device nvme-subsys,id=subsys0
> > 	-device nvme-ns,id=ns1,drive=<drv>,nsid=1,subsys=subsys0
> > 	-device nvme,id=nvme0,serial=foo,subsys=subsys0
> > 
> > In this case, the 'nvme0' controller will have no namespace at the
> > initial time of the boot-up.  'nvme0' can be attached to the namespace
> > 'ns1' with namespace attach command.  'nvme-ns' device is same as the
> > 'create-ns' operation in a NVMe subsystem.  This makes sense as spec
> > 5.19 says "from a namespace".
> > 
> > 	-device nvme,id=nvme1,serial=bar,subsys=subsys0b
> > 	-device nvme-ns,id=ns2,drive=<drv>,nsid=1,bus=nvme1
> > 
> > This case if for private namespace directly attached to controller.
> > This makes sense as spec 5.20 says "to or from a controller".
> > 
> > All looks fine to me, but one thing I an wondering is that how can we
> > attach a controller to shared namespace(s) at the initial time?
> > 
> 
> Ok, nevermind. I think we can get 'detached' functionality in either
> case, so no need to increase complexity by requiring a change of define
> order.
> 
> Supporting CNS 0x12 and 0x13 (Identify, Controller List), we need the
> controllers registered and stored in the subsystem anyway.
> 
> So, can we add a 'namespaces' array on the subsystem to keep a list of
> namespaces and add a 'detached' parameter on the nvme-ns device? If that
> parameter is given, the device is not registered with the controllers.

Sure, will do that.  Plese let me have V3 series.  Thanks!

