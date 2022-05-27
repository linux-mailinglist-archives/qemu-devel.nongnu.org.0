Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8556E535F2E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 13:21:42 +0200 (CEST)
Received: from localhost ([::1]:44930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuY2H-0006ZV-57
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 07:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nuXYk-00040S-SV
 for qemu-devel@nongnu.org; Fri, 27 May 2022 06:51:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nuXYi-0002Pd-Sf
 for qemu-devel@nongnu.org; Fri, 27 May 2022 06:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653648667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0V7oWLFV9Bd44QFQilDNS/vpADQqC97ZrFLyYkjwfco=;
 b=SLxO3lKKm4jqZOjjXS+p++aDQhvfqNh9fjVwCJRsbsW8V0aIYqCQEPMtJi8rx/WmN+/lWS
 Scg13BbkMdkuuNOX4QosINSWZCsWLWNchcIo9Y8SxVKethwPfT+I73+xydY0HEfi+6CzIL
 TSnbBgoigD2RiL5hhEALKcnkXx6uC1g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-l_dDSioqNX2eplh2r5j8xQ-1; Fri, 27 May 2022 06:51:06 -0400
X-MC-Unique: l_dDSioqNX2eplh2r5j8xQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m19-20020a05600c4f5300b003974eba88c0so2503486wmq.9
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 03:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0V7oWLFV9Bd44QFQilDNS/vpADQqC97ZrFLyYkjwfco=;
 b=qW/CNdyOgZOEEFGCdA3kaPsF1xbIP4JKq12v152YyaQiRWQQAH/SQtz/he8PbwAMZw
 A5vSU2uxQZcVvX374K9ZNxBtjW1+VMGYNX6LD5tNGMhlW8TgmjEK+m5pIjYWkFt4WXRC
 KsWfDwIRJwxTChWC5wGrHT8TJhQASYZm7P5A1WpKYGf9XhQR5WavDbkPV48Jb7FbPUVg
 zno3hVXm1L3MYILerrap3LTouv45+DMR4NFVSNRRNC3oOXRJb2U8GfI3wUoC0YGN7qaK
 Ytp1PFwGm3ixS5GkGlcOHgGQbOx75QEqJvqjmwCHqUltjRiz+Ha3eYjheJpuOOcSnOir
 HCww==
X-Gm-Message-State: AOAM531/v3I+G6n1PGcqHuf+alzbj5MVwyjGuBXgQikjPs9aG0vmJXck
 Mn6KsqNs4eRMC3IyKmHqQyuR4yMTEKFsPhotfrhPya+6C3ThnKYMBPPXVMXJ843tnYI3q4O5Mm/
 gS09Vf6Gr6DYc60M=
X-Received: by 2002:a5d:6987:0:b0:210:131a:9080 with SMTP id
 g7-20020a5d6987000000b00210131a9080mr3727647wru.14.1653648665324; 
 Fri, 27 May 2022 03:51:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwnRfu9yIeHxwspRezCaw0XA6uN/OOvV4yuCNqxVyZyJ95ewjT0MgyGo/K1BTpC6lLBmDfkQ==
X-Received: by 2002:a5d:6987:0:b0:210:131a:9080 with SMTP id
 g7-20020a5d6987000000b00210131a9080mr3727619wru.14.1653648664983; 
 Fri, 27 May 2022 03:51:04 -0700 (PDT)
Received: from redhat.com ([2.55.130.213]) by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c4f8500b003942a244f2bsm2025756wmq.4.2022.05.27.03.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 03:51:04 -0700 (PDT)
Date: Fri, 27 May 2022 06:51:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH] ppc: fix boot with sam460ex
Message-ID: <20220527065049-mutt-send-email-mst@kernel.org>
References: <20220526224229.95183-1-mst@redhat.com>
 <352916f8-efb1-c192-5fc-6df69b559a8@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <352916f8-efb1-c192-5fc-6df69b559a8@eik.bme.hu>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, May 27, 2022 at 12:46:57PM +0200, BALATON Zoltan wrote:
> Hello,
> 
> Some changes to commit message (patch is OK).

Want to write the commit message for me then?


> On Thu, 26 May 2022, Michael S. Tsirkin wrote:
> > Recent changes to pcie_host corrected size of its internal region to
> > match what it expects - only the low 28 bits are ever decoded. Previous
> > code just ignored bit 29 (if size was 1 << 29) in the address which does
> > not make much sense.  We are now asserting on size > 1 << 28 instead,
> > but it so happened that ppc actually allows guest to configure as large
> > a size as it wants to, and current firmware set it to 1 << 29.
> > 
> > With just qemu-system-ppc -M sam460ex this triggers an assert which
> > seems to happen when the guest (board firmware?) writes a value to
> > CFGMSK reg:
> > 
> > (gdb) bt
> 
> Backtrace is missing but you could just drop this line and replace : with .
> at end of previous line as we probably don't need the full backtrace, the
> commit message is already too long in my opinion.
> 
> > This is done in the board firmware here:
> > 
> > https://git.qemu.org/?p=u-boot-sam460ex.git;a=blob;f=arch/powerpc/cpu/ppc4xx/4xx_pcie.c;h=13348be93dccc74c13ea043d6635a7f8ece4b5f0;hb=HEAD
> > 
> > when trying to map config space.
> > 
> > Note that what firmware does matches
> > https://www.hardware.com.br/comunidade/switch-cisco/1128380/
> 
> That's not it. It's a different hardware and firmware, just quoted it as an
> example that this value seems to be common to that SoC even on different
> hardware/OS/firmware (probably comes from reference hardware/devel board?).
> The sam460ex is here
> 
> https://www.acube-systems.biz/index.php?page=hardware&pid=5
> 
> the U-Boot in above repo is matching the firmware from the acube page but I
> had to fix some bugs in it to make it compile and work.
> 
> Otherwise this should be OK.
> 
> Regards,
> BALATON Zoltan
> 
> > So it's not clear what the proper fix should be.
> > 
> > However, allowing guest to trigger an assert in qemu is not good practice anyway.
> > 
> > For now let's just force the mask to 256MB on guest write, this way
> > anything outside the expected address range is ignored.
> > 
> > Fixes: commit 1f1a7b2269 ("include/hw/pci/pcie_host: Correct PCIE_MMCFG_SIZE_MAX")
> > Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> > Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> > 
> > Affected system is orphan so I guess I will merge the patch unless
> > someone objects.
> > 
> > hw/ppc/ppc440_uc.c | 8 ++++++++
> > 1 file changed, 8 insertions(+)
> > 
> > diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> > index 993e3ba955..a1ecf6dd1c 100644
> > --- a/hw/ppc/ppc440_uc.c
> > +++ b/hw/ppc/ppc440_uc.c
> > @@ -1180,6 +1180,14 @@ static void dcr_write_pcie(void *opaque, int dcrn, uint32_t val)
> >     case PEGPL_CFGMSK:
> >         s->cfg_mask = val;
> >         size = ~(val & 0xfffffffe) + 1;
> > +        /*
> > +         * Firmware sets this register to E0000001. Why we are not sure,
> > +         * but the current guess is anything above PCIE_MMCFG_SIZE_MAX is
> > +         * ignored.
> > +         */
> > +        if (size > PCIE_MMCFG_SIZE_MAX) {
> > +            size = PCIE_MMCFG_SIZE_MAX;
> > +        }
> >         pcie_host_mmcfg_update(PCIE_HOST_BRIDGE(s), val & 1, s->cfg_base, size);
> >         break;
> >     case PEGPL_MSGBAH:
> > 


