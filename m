Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9850D4EE70F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 06:10:22 +0200 (CEST)
Received: from localhost ([::1]:37120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na8c9-0003ZJ-FP
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 00:10:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1na8Zy-00029v-A4
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 00:08:06 -0400
Received: from mga11.intel.com ([192.55.52.93]:24479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1na8Zv-0004Uy-Sn
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 00:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648786083; x=1680322083;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pf+HTbh4I8RhvcMdZNbXjD3cPd8qGdS2Ev3uToaboU8=;
 b=FxVVd4gKr8/zP56EnR90GS+q1TgGL49qxedSH6/D8WkrL67BGzF+9u+y
 BdFsRTD973zrjVI3D1jQD7lIP7MSRoiEjT0iMYjgCPfY2hmxxW8NTegfG
 eJ/OByugltIfSmLlbGhCexiL33VJwfK2ZjDjDnRoI33W46AYolVDDk/Jf
 jivbUtWS5oP+d3W0i9oA9Md5LAtyiF4jP/UJ1u0s8k+gbyu5E/TSoakhI
 eR9RW2s5ZFstpkAVy1S0y8z4FoHl61L6O0C4NMuoeM1DMJQz45qZ0kNSp
 w5jRdNx/NXrHvWQ75nBfEiUuEm/DDkUpqJpb7+iGW9G84Eev6ifOUib+W Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="257616201"
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="257616201"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 21:07:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="695747165"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2022 21:07:56 -0700
Message-ID: <54e71e28dd7f9e7b1727a9843f9fe96f7f8aaeb0.camel@linux.intel.com>
Subject: Re: [PATCH 2/2] NVDIMM: Init vNVDIMM's LSA index block if it hasn't
 been
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Date: Fri, 01 Apr 2022 12:07:56 +0800
In-Reply-To: <20220331164111.47483387@redhat.com>
References: <1648537663-126032-1-git-send-email-robert.hu@linux.intel.com>
 <1648537663-126032-3-git-send-email-robert.hu@linux.intel.com>
 <20220331140938.6297e2b1@redhat.com>
 <913c9dfaa5818aaf70782b725086e4ab4b5c5f44.camel@linux.intel.com>
 <20220331164111.47483387@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=robert.hu@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

On Thu, 2022-03-31 at 16:41 +0200, Igor Mammedov wrote:
> On Thu, 31 Mar 2022 21:08:12 +0800
> Robert Hoo <robert.hu@linux.intel.com> wrote:
>  
> > > 
> > > Can user initialize/format LSA from guest using ndctl/some other
> > > tool?
> > >   
> > 
> > Yes, he can. But when guest Kernel already told him this is a dimm
> > without label capability, dare/should he take this dangerous
> > action?;-)
> 
> I don't think this feature belongs to QEMU (i.e. hw emulation).
> It's task that is usually accomplished by firmware or OS
> (in context of QEMU its guest's responsibility).
> 

Thanks Igor.
Actually before I compose this patch, I was pondering on this as well:
whose obligation to fulfill this function, i.e. initialize the LSA.

So I asked around (and still asking), knowing these about native usage,
(correct me if I'm wrong), which we virtualization should mimic in
principle:

a) before user start to use NVDIMM, he's supposed to ipmctl[0] create
goal firstly, to determine 2LM mode or app direct mode, which usually
initializes the LSA. So user doesn't necessarily to explicit 'ndctl
init-label' although he can do this to init LSA again.

b) I heard that, perhaps, even when DIMMs are sent out from factory, it
has LSA initialized (not quite certain about this, I'm still
confirming).

What specs say
---
In NVDIMM Namespace spec[1], Chap 2 "Namespaces": 
"NVDIMM vendors define the size of their label storage area and,
therefor, the number of labels it holds."

I think: In QEMU context, it's QEMU who's the vNVDIMM's vendor.

In UEFI spec [2], "13.19 NVDIMM Label Protocol", page 640:
"Before Index Blocks and labels can be utilized, the software managing
the Label Storage Area must determine the total number of labels that
will be supported and utilizing the description above, calculate the
size of the Index Blocks required."

I think: In QEMU context, it's QEMU who emulates LSA and therefore the
management software of it.

What's real limitation on QEMU vNVDIMM implementation
---
In VM:
ipmctl isn't supported.
Only app direct mode is supported. (i.e. no bother to ipmctl create
goal first).
vNVDIMM is actually presented to user in a ready-to-use initial state.
We never tell user you must 'ndctl init-label' then can use it.
Nor tell user that you should 'ipmctl create-goal' first, because in
fact ipmctl isn't available at all.


That's all the story and thoughts before I compose this patch:)

[0] https://docs.pmem.io/ipmctl-user-guide/ (and, ipmctl is for Intel
Optane PMEM only)
[1] https://pmem.io/documents/NVDIMM_Namespace_Spec.pdf
[2] 
https://uefi.org/sites/default/files/resources/UEFI_Spec_2_9_2021_03_18.pdf

> 
> PS:
> It's true that QEMU caries some 'firmware' code, like composing
> ACPI tables but we do it only to reduce QEMU<->firmware ABI
> necessary for hardware description and that's pretty much it.
> Unfortunately this series doesn't fit the bill.
> 
Yeah, I've seen this part of code, but a little difficult to comprehend
them, especially for me a stranger to ACPI. Where can I find related
design document?
I now only find a valuable doc: docs/specs/acpi_nvdimm.rst.
> 


