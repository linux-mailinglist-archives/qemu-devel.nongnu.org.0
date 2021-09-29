Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC2D41CCE3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 21:50:03 +0200 (CEST)
Received: from localhost ([::1]:53542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVfab-0004fb-IC
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 15:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mVfVI-0006MZ-8L
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:44:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mVfVG-0005eR-AF
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632944669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yc/PHmd/0y/vAYjbLss2A4FUsZapDsZj9da5SrX5YQ8=;
 b=TDq88flHVwwKWcJmaQUKdruhpW4mx2k7A6efeozwawWSOLSH8AOOP/VtUHYwnDCzesS82T
 5baS0TpiUBmXirAASuOoSy20U4zG1mnxQMeTrDIiwtZ6qY383DNJnHPtpvqR98XffpqEeP
 f/iN4z0THZWGUlcTmzBPyngPWl4CVZ0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-_ZYHuL2aPWW_BAlMKFmBkQ-1; Wed, 29 Sep 2021 15:44:26 -0400
X-MC-Unique: _ZYHuL2aPWW_BAlMKFmBkQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so3596591edi.12
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 12:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yc/PHmd/0y/vAYjbLss2A4FUsZapDsZj9da5SrX5YQ8=;
 b=XDQ6keEAZs+j6dko95A11EDEiAMLjv2WopHYHsdo8nUy9z+r+rzqOJCKYD2AiMVMzl
 OA4AZuThFRKtclcCt2IG4zneIUcs8G1+EUnYO9utKVqO6Zv4JSnhirIMOFc5OOLywg4o
 s7lKFch8ZA/nFlfwJqdNAZwmfut8l41ayTy5cxaRj80RHr1APTBDhJdaDE3SiamSSgXf
 05kUMQKtOTeNclQTgzhGYLHHrUbdoqJzPE2qVedf7qZ3xbRryFcucXhh0GPHoUOB78JA
 sdHxWiQ81Wfueq99Y9uviLiPbVbbJXNQOUQcjwxOxJs/CBLQlmFs8vcP9v+uLkXva3zF
 T9fQ==
X-Gm-Message-State: AOAM533au0tJ0hDB+MVao8uARx8YfPeA5NhF0tWRY3UkmpRHp+hTIhz+
 Ki/E1LfIUuN7Tvpz0YddzBmRJ331j9cEvBawEjsyizI+3smBZwHwqAmUjQDy1M7+h9G7AcnCTGp
 hCL0ZjI4rNOct78c=
X-Received: by 2002:a17:906:8396:: with SMTP id
 p22mr1888518ejx.140.1632944665131; 
 Wed, 29 Sep 2021 12:44:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyS29APfWabDK5nps7XWyO49sm3CbJPjR+rT6kWmndlEO92YtVXuUZILhhDXg+fUm27yePQvQ==
X-Received: by 2002:a17:906:8396:: with SMTP id
 p22mr1888500ejx.140.1632944664876; 
 Wed, 29 Sep 2021 12:44:24 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id y3sm597799eda.9.2021.09.29.12.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 12:44:23 -0700 (PDT)
Date: Wed, 29 Sep 2021 21:44:16 +0200
From: Andrew Jones <drjones@redhat.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
Message-ID: <20210929194416.wwtw4qnkjgz2f7ge@gator.home>
References: <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
 <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
 <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com>
 <CAPnjgZ2S7SXxHYd_bkcf+GcmmgEew3vpJkw+DRPqrpb44eLgcA@mail.gmail.com>
 <CAFEAcA-bk6PF_P3JOxQSCXo7Fh2K5AVygB9WwDUiK2fV9Fx5jw@mail.gmail.com>
 <CAPnjgZ26gQVpzL6fYsGzDf=c+z4aG5SPkBf7yoDC9+ynxQi_9Q@mail.gmail.com>
 <CAFEAcA_QNcAHtdxUPLpmyzMYgb9YzhcE0-zyh=N8rqm4vOcGZA@mail.gmail.com>
 <CAPnjgZ0xMH+SSjQWGjynTLDDbg6tO=z+-eDbpDKV1gqo=bhqaQ@mail.gmail.com>
 <CAFEAcA9y+sBpL-ncYwdqNkMx_oXkQ-pdhNcHOdgTxJmWBArzhA@mail.gmail.com>
 <CAPnjgZ1L=UCh9cDaeNTu3i9FtOvARcDKtpuG=YLynjhBi9wn=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ1L=UCh9cDaeNTu3i9FtOvARcDKtpuG=YLynjhBi9wn=A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 09:09:59AM -0600, Simon Glass wrote:
> Hi Peter,
> 
> On Wed, 29 Sept 2021 at 03:10, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Wed, 29 Sept 2021 at 04:01, Simon Glass <sjg@chromium.org> wrote:
> > > On Tue, 28 Sept 2021 at 03:21, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > So what *is* this patch doing? The subject says "Allow additions to
> > > > the generated device tree", and the patch adds an option to
> > > > "Merge a device tree binary (dtb) file into the generated device tree".
> > > > That sounds exactly like "combine two bits of dtb" -- the one the
> > > > user provides to the -dtbi option and the one QEMU generates
> > > > internally.
> > >
> > > Yes that's right, but as you say one of them is generated by QEMU. It
> > > is fixing a problem caused by QEMU's generation of the device tree,
> > > since it provides no wat to augment the device tree without my patch.
> >
> > You can augment it in the guest if you need to add guest-specific stuff.
> 
> This was also discussed, see below.
> 
> >
> > > > > The only current working option is to just pass the U-Boot dtb through
> > > > > and not use QEMU's on-the-fly-generated dtb at all. But I am assuming
> > > > > there is a reason why QEMU generates that dtb, so that would not be
> > > > > desirable?
> > > >
> > > > QEMU generates the dtb to tell the guest what hardware is
> > > > present and where it is. We don't guarantee that that hardware
> > > > arrangement is necessarily stable between QEMU versions (in
> > > > practice there are generally additions and not deletions or
> > > > moves, but in theory there might be). All the guest is supposed
> > > > to assume is the location of RAM and flash; everything else it
> > > > must look in the dtb to determine.
> > >
> > > Yes, so that is going to severely limit the usefulness of the virtio
> > > support, for example. But we can just ignore it for CI, I suppose,
> > > since we can use fixed parameters to QEMU, if you don't want to allow
> > > more control of the device tree.
> >
> > virtio-mmio devices should already be correctly indicated in the
> > device tree. virtio-pci devices can be found by probing the PCI
> > bus in the usual way (and you can find out where the PCI controller
> > is by looking in the dtb).
> 
> Which device tree? The one generated by QEMU or the one we would
> actually use, in U-Boot?
> 
> >
> > > This patch is really just augmenting what QEMU is already doing and
> > > solving a problem that it has. I don't see it as creating a new boot
> > > mechanism or being a weird tweak. If anything, it puts the tweaking in
> > > the hands of the user. It seems like something you would be keen on,
> > > from that POV.
> >
> > I absolutely see it as a weird tweak. It's something that
> > only u-boot seems to care about, and it's adding an extra
> > user-facing command line option that is basically
> > "if you need to boot u-boot you need this". The user should
> > not need to "control" the dtb, because QEMU should already
> > be creating a dtb which describes the hardware it is exposing
> > to the guest.
> 
> I don't even know how to respond to that. Anything that uses
> devicetree for control will need to have its bindings respected. It is
> QEMU that is confused here, with its idea that if it just creates
> whatever it feels like, it will be suitable for the payload. It may be
> suitable for linux because it was coded up that way, but it is not
> suitable in general. Each project can have its own device tree
> bindings, yes?
> 
> See for example barebox which has the same problem:
> https://www.barebox.org/doc/latest/devicetree/bindings/barebox/barebox,environment.html
> 
> >
> > > > Guest software running on the "virt" board needs to know it is
> > > > running on the "virt" board and deal with the interface and
> > > > information that QEMU provides. (For instance, Arm Trusted
> > > > Firmware and UEFI both have done this.)
> > >
> > > Well unfortunately this is in conflict, based on what you have said in
> > > this thread. We can either have virtio support (use QEMU-generated
> > > device tree) or have U-Boot work correctly (use -dtb). Do you have any
> > > other ideas?
> >
> > I've already suggested what I think you should do: have u-boot
> > combine the dtb it gets from QEMU with the dtb-extras stuff
> > it wants for its own purposes, with the latter supplied in
> > any of a bunch of workable ways (extra file loaded in memory,
> > concatenate the dtb blob with the u-boot binary at compile
> > time, whatever; rough analogy with however u-boot gets the
> > full dtb on hardware platforms where there is none).
> 
> Unfortunately this is not practical for reasons I explained
> previously. To recap:
> 
> - this is not how real boards work (they expect their dtb to be provided)
> - It adds code to the early stage of U-Boot which would not be there
> in a real system
> - this code takes a long time to run, particularly with the cache off or in SPL
> - we don't have access to a second dtb anyway
> 
> Another option is to run QEMU twice, like:
> 
> arm/qemu-system-arm -M virt -nographic  -M dumpdtb=out.dtb
> (run a tool to merge them)
> arm/qemu-system-arm -M virt -nographic -bios
> /tmp/b/qemu_arm/u-boot-nodtb.bin -dtb merged.dtb
> 
> If we really need the virtio devices then that could be one option.
>

FWIW, this approach was the first thing that popped into my mind when I
saw the posting of this patch. I'm not sure why doing the merging in
QEMU is much better, considering the complexity of the QEMU command line
more or less requires scripting or running through libvirt anyway.

Thanks,
drew


