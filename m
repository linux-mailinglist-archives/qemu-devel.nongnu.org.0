Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1954EEA16
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:04:08 +0200 (CEST)
Received: from localhost ([::1]:44796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDCQ-0008Up-Co
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:04:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1naD36-0000SN-FW
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:54:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1naD34-0003Ha-IA
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648803266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NV6KtIv2fqA1fjnpMWXXntxFnSW7M82XQaR9rbUvR9s=;
 b=cVKioDXTv1/bAbEv5MUZV4eJTlwN3K5VA5Np7J4t+1HjxzZc3RsOZZwtg43rPq/n9KwXZr
 EHhotA/in1Dy+OkNHMDjNF9UzADE3V83pIi0HzOGNORfwVe5W8FdjGFws4aFq00zUc2hHc
 nAIuUbzWA/FYR9Cxw7kx6gtHcXgf/9A=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-23CpYSknN8OENcnTV2-twg-1; Fri, 01 Apr 2022 04:54:23 -0400
X-MC-Unique: 23CpYSknN8OENcnTV2-twg-1
Received: by mail-ej1-f71.google.com with SMTP id
 ml20-20020a170906cc1400b006df8c9357efso1205521ejb.21
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 01:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NV6KtIv2fqA1fjnpMWXXntxFnSW7M82XQaR9rbUvR9s=;
 b=SAG4Yfj6jMFdn9STvb6gJ3vejlOl38z2Ui+g3KhahRr1CyIVMeY81U9uTDMBtVyqS3
 GSyNlMvBMy4pn3Th2VhEhqveha/Q97MKyVZS7HWAVACzgUvkGWPd1uf0hL26wiy2fpG+
 mV3qJ7Vf544/ogKJ+l4HBlHbEDBtlR7bP2PNe4R9rYaLtRwxGwJE+xgwPrpMwhjENROI
 KdbxuhWNnLIo/XdTtF48OZ8w3VIHDunyLNBqUAGOmEgDDvQyFNe7GKEQjVqdlv8JPoNn
 NgRT65nSiNPdyQEzkPXpW4OFyk7sMP8f8iRypvMvwZ9m75ysgeXgzF9fIcP9s0pxHAOy
 SdAw==
X-Gm-Message-State: AOAM530k1xtrGUIeYfaRyVmeFzf9CQYcv95UnBo2E648LWXUv1xLNW54
 /4zxS6VcfCwAFlcoevzRqB2KgSYwMybLm7ZUzNl5ZvuS+ZJAXZPIkgWBqMbB9g1xDnLWjZdGmb5
 mFpdeT/1T7b06gzA=
X-Received: by 2002:a05:6402:b7a:b0:419:3046:3abb with SMTP id
 cb26-20020a0564020b7a00b0041930463abbmr19867954edb.257.1648803261764; 
 Fri, 01 Apr 2022 01:54:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxULc9zO2uAsOQsbOVtZSeFQjaJK8zYfVjhf/UakjdasJKU0Zl4xZKt7Qd/epo66+t62CrsYw==
X-Received: by 2002:a05:6402:b7a:b0:419:3046:3abb with SMTP id
 cb26-20020a0564020b7a00b0041930463abbmr19867935edb.257.1648803261493; 
 Fri, 01 Apr 2022 01:54:21 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 b17-20020aa7dc11000000b00412ae7fda95sm925301edu.44.2022.04.01.01.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 01:54:21 -0700 (PDT)
Date: Fri, 1 Apr 2022 10:54:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [PATCH 2/2] NVDIMM: Init vNVDIMM's LSA index block if it hasn't
 been
Message-ID: <20220401105419.69b2b794@redhat.com>
In-Reply-To: <54e71e28dd7f9e7b1727a9843f9fe96f7f8aaeb0.camel@linux.intel.com>
References: <1648537663-126032-1-git-send-email-robert.hu@linux.intel.com>
 <1648537663-126032-3-git-send-email-robert.hu@linux.intel.com>
 <20220331140938.6297e2b1@redhat.com>
 <913c9dfaa5818aaf70782b725086e4ab4b5c5f44.camel@linux.intel.com>
 <20220331164111.47483387@redhat.com>
 <54e71e28dd7f9e7b1727a9843f9fe96f7f8aaeb0.camel@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, jingqi.liu@intel.com,
 qemu-devel@nongnu.org, ani@anisinha.ca, robert.hu@intel.com,
 dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 01 Apr 2022 12:07:56 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> On Thu, 2022-03-31 at 16:41 +0200, Igor Mammedov wrote:
> > On Thu, 31 Mar 2022 21:08:12 +0800
> > Robert Hoo <robert.hu@linux.intel.com> wrote:
> >    
> > > > 
> > > > Can user initialize/format LSA from guest using ndctl/some other
> > > > tool?
> > > >     
> > > 
> > > Yes, he can. But when guest Kernel already told him this is a dimm
> > > without label capability, dare/should he take this dangerous
> > > action?;-)  
> > 
> > I don't think this feature belongs to QEMU (i.e. hw emulation).
> > It's task that is usually accomplished by firmware or OS
> > (in context of QEMU its guest's responsibility).
> >   
> 
> Thanks Igor.
> Actually before I compose this patch, I was pondering on this as well:
> whose obligation to fulfill this function, i.e. initialize the LSA.
> 
> So I asked around (and still asking), knowing these about native usage,
> (correct me if I'm wrong), which we virtualization should mimic in
> principle:
> 
> a) before user start to use NVDIMM, he's supposed to ipmctl[0] create
> goal firstly, to determine 2LM mode or app direct mode, which usually
> initializes the LSA. So user doesn't necessarily to explicit 'ndctl
> init-label' although he can do this to init LSA again.
> 
> b) I heard that, perhaps, even when DIMMs are sent out from factory, it
> has LSA initialized (not quite certain about this, I'm still
> confirming).
if you find a NVDIMM that implements initialization in hardware,
then it could be considered. But QEMU isn't a factory, it's rather
a component within factory that perform specific task while other
components manage it (including storage it consumes, see libguestfs
project which is similar to what you are trying to do, but deals
with conventional storage).

> What specs say
> ---
> In NVDIMM Namespace spec[1], Chap 2 "Namespaces": 
> "NVDIMM vendors define the size of their label storage area and,
> therefor, the number of labels it holds."
one does define size and lsa size on QEMU command line,
how it will be consumed is the business of firmware/operating system
that runs within VM though.

> I think: In QEMU context, it's QEMU who's the vNVDIMM's vendor.
> 
> In UEFI spec [2], "13.19 NVDIMM Label Protocol", page 640:
> "Before Index Blocks and labels can be utilized, the software managing
> the Label Storage Area must determine the total number of labels that
> will be supported and utilizing the description above, calculate the
> size of the Index Blocks required."
> 
> I think: In QEMU context, it's QEMU who emulates LSA and therefore the
> management software of it.
> 
> What's real limitation on QEMU vNVDIMM implementation
> ---
> In VM:
> ipmctl isn't supported.
> Only app direct mode is supported. (i.e. no bother to ipmctl create
> goal first).
> vNVDIMM is actually presented to user in a ready-to-use initial state.
> We never tell user you must 'ndctl init-label' then can use it.
> Nor tell user that you should 'ipmctl create-goal' first, because in
> fact ipmctl isn't available at all.

ipmictl isn't hardware, it's tool to connect to firmware
running on BMC. In virt world it corresponds to guest code running
within VM or some mgmt app outside QEMU that can implement IPMI
interface. You can try to generalize this utility and extend EDKII
to support it, which would benefit not only QEMU but other
consumers of EDKII.
wrt IPMI, I'm not familiar with BMC support in QEMU, but looks
there are at least some (see hw/ipmi folder) implementations.

As for [b] point, QEMU is not software managing NVDIMM, it's
hardware emulator. Duplicating irrelevant features in QEMU
will just bloat it and make project unmanageable.
Point [b] to me looks more like a separate utility that could
initialize vNVDIMM for further consumption (I'd ask libguestfs
or ndctl folks if they would like to add support for 'out of band'
vNVDIMM management, but likely outcome to this would be what
libguestfs is doing currently with disks, start VM appliance
and run ndctl within it to initialize vNVDIMM).
 
> That's all the story and thoughts before I compose this patch:)
> 
> [0] https://docs.pmem.io/ipmctl-user-guide/ (and, ipmctl is for Intel
> Optane PMEM only)
> [1] https://pmem.io/documents/NVDIMM_Namespace_Spec.pdf
> [2] 
> https://uefi.org/sites/default/files/resources/UEFI_Spec_2_9_2021_03_18.pdf
> 
> > 
> > PS:
> > It's true that QEMU caries some 'firmware' code, like composing
> > ACPI tables but we do it only to reduce QEMU<->firmware ABI
> > necessary for hardware description and that's pretty much it.
> > Unfortunately this series doesn't fit the bill.
> >   
> Yeah, I've seen this part of code, but a little difficult to comprehend
> them, especially for me a stranger to ACPI. Where can I find related
> design document?
> I now only find a valuable doc: docs/specs/acpi_nvdimm.rst.
> >   
> 


