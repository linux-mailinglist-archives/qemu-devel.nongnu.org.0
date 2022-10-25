Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B02560D729
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 00:32:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onSRY-0006aN-T8; Tue, 25 Oct 2022 18:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onSRO-0006FX-Aw
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 18:30:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onSRL-0000Y2-4i
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 18:30:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666737029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=03WiWi24jZjT8M33f/iFpmzMcN+oScfZ3blTCs6cqtQ=;
 b=NlmopP8kGkASU/rHlLSzq9FBHNk6jAOrb8HsnmCO5gYzBOYzZRfI1+m53z7bLbj9OGdBth
 Ege6MXKMulLXMVlzz53nkwEDznz2AS4iEP+Qk+8pXt3YkHcO9x7rKn3HvOtrUgfaHiqPy+
 LFGkSnZm46jPJNdbZNllnUhQ7zlAALA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-297-PMyaTLkKMSGdRgr-yxocsQ-1; Tue, 25 Oct 2022 18:30:27 -0400
X-MC-Unique: PMyaTLkKMSGdRgr-yxocsQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 j16-20020a05600c1c1000b003cf48853b7dso153693wms.8
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 15:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=03WiWi24jZjT8M33f/iFpmzMcN+oScfZ3blTCs6cqtQ=;
 b=yJlK64rD+62GSrsC4EzrniiURvuajls4ddoszMEWJQglihnOl8BnsQKBG4bRF+o3Qp
 X2CTQ8ct6yvkXeJ/Hor+PXt1KoBerIgq0C+jY7VAPivAMezjcPSHiCfshJ/CHSHs5xcQ
 Y23VIHIi96RtB42kZ3b+K9XmiRJJj2CgtQHIBqKUvyndAExW3ebB61GY4sLZ76ocABgw
 dXdLGkhBrXk78fOm9JP4oOeEHTFjkIjvbX+HiPOpwFbXliXIOjZ3XyhfE8wN15tjbGYh
 F+AMf0oJS3yd1rIlBC9WSb1ME1ZoORlAaRoB7CjlB5HZFJ2pxpR0kBwocvZNbHVYmgbt
 nzzg==
X-Gm-Message-State: ACrzQf1x4hdCpxAG5H0t00xrWPbewjNJCxRYNq50/WF9vVEsXtQeqWN8
 LFsTR9iCgKdPLIZCuvu7HHnvz+ujs5Y+0wZUX/5fwqtih9KdVQ+yDho9/PQcZ7OopeDXMIlMoyF
 ewal7JGB1fyTBMQY=
X-Received: by 2002:a5d:4409:0:b0:236:6dac:c644 with SMTP id
 z9-20020a5d4409000000b002366dacc644mr10189778wrq.390.1666737026730; 
 Tue, 25 Oct 2022 15:30:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5f/LlmHrsG84VTDtWqe2/yMz82K80LURMGSlYxhL7teS6xi6yPrtyUo0QfI5n60mzaPcKgHQ==
X-Received: by 2002:a5d:4409:0:b0:236:6dac:c644 with SMTP id
 z9-20020a5d4409000000b002366dacc644mr10189767wrq.390.1666737026450; 
 Tue, 25 Oct 2022 15:30:26 -0700 (PDT)
Received: from redhat.com ([2.55.3.42]) by smtp.gmail.com with ESMTPSA id
 m12-20020a05600c3b0c00b003b47ff307e1sm173185wms.31.2022.10.25.15.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 15:30:25 -0700 (PDT)
Date: Tue, 25 Oct 2022 18:30:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Ben Widawsky <bwidawsk@kernel.org>,
 linux-cxl@vger.kernel.org, Huai-Cheng Kuo <hchkuo@avery-design.com.tw>,
 Chris Browy <cbrowy@avery-design.com>,
 Gregory Price <gregory.price@memverge.com>, ira.weiny@intel.com
Subject: Re: [PATCH v9 0/5] QEMU PCIe DOE for PCIe 4.0/5.0 and CXL 2.
Message-ID: <20221025183007-mutt-send-email-mst@kernel.org>
References: <20221014151045.24781-1-Jonathan.Cameron@huawei.com>
 <20221025230621.00006ccb@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025230621.00006ccb@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Queued for next pull, thanks!

On Tue, Oct 25, 2022 at 11:06:39PM +0100, Jonathan Cameron wrote:
> 
> Hi Michael,
> 
> Any chance of this making 7.2?  Gregory has identified a bug
> in the Linux kernel support that we've reported (debug marking
> related). I don't think there are any other queries outstanding on this.
> 
> I've been holding off on sending other features to focus on
> getting this in, but given timing those will probably have to wait
> for next cycle now along with Gregory's series for volatile support
> (which we don't have OS support for yet anyway).
> 
> Thanks,
> 
> Jonathan
> 
> On Fri, 14 Oct 2022 16:10:40 +0100
> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> 
> > Changes since v8:
> >  - Take the entry enums out of the functions and prefix them
> >    appropriately.
> >  - Use the visibility of *_NUM_ENTRIES to allocate the cdat_table
> >  - Fix volatile_mr -> nonvolatile_mr
> > 
> > V7 Cover letter - lightly edited.
> > 
> > Whilst I have carried on Huai-Cheng Kuo's series version numbering and
> > naming, there have been very substantial changes since v6 so I would
> > suggest fresh review makes sense for anyone who has looked at this before.
> > In particularly if the Avery design folks could check I haven't broken
> > anything that would be great.
> > 
> > For reference v6: QEMU PCIe DOE for PCIe 4.0/5.0 and CXL 2.0
> > https://lore.kernel.org/qemu-devel/1623330943-18290-1-git-send-email-cbrowy@avery-design.com/
> > 
> > Summary of changes:
> > 1) Linux headers definitions for DOE are now upstream so drop that patch.
> > 2) Add CDAT for switch upstream port.
> > 3) Generate 'plausible' default CDAT tables when a file is not provided.
> > 4) General refactoring to calculate the correct table sizes and allocate
> >    based on that rather than copying from a local static array.
> > 5) Changes from earlier reviews such as matching QEMU type naming style.
> > 6) Moved compliance and SPDM usecases to future patch sets.
> > 
> > Sign-offs on these are complex because the patches were originally developed
> > by Huai-Cheng Kuo, but posted by Chris Browy and then picked up by Jonathan
> > Cameron who made substantial changes.
> > 
> > Huai-Cheng Kuo confirmed they are happy to maintain this updated code.
> > 
> > What's here?
> > 
> > This series brings generic PCI Express Data Object Exchange support (DOE)
> > DOE is defined in the PCIe Base Spec r6.0. It consists of a mailbox in PCI
> > config space via a PCIe Extended Capability Structure.
> > The PCIe spec defines several protocols (including one to discover what
> > protocols a given DOE instance supports) and other specification such as
> > CXL define additional protocols using their own vendor IDs.
> > 
> > In this series we make use of the DOE to support the CXL spec defined
> > Table Access Protocol, specifically to provide access to CDAT - a
> > table specified in a specification that is hosted by the UEFI forum
> > and is used to provide runtime discoverability of the sort of information
> > that would otherwise be available in firmware tables (memory types,
> > latency and bandwidth information etc).
> > 
> > The Linux kernel gained support for DOE / CDAT on CXL type 3 EPs in 6.0.
> > The version merged did not support interrupts (earlier versions did
> > so that support in the emulation was tested a while back).
> > 
> > This series provides CDAT emulation for CXL switch upstream ports
> > and CXL type 3 memory devices. Note that to exercise the switch support
> > additional Linux kernel patches are needed.
> > https://lore.kernel.org/linux-cxl/20220503153449.4088-1-Jonathan.Cameron@huawei.com/
> > (I'll post a new version of that support shortly)
> > 
> > Additional protocols will be supported by follow on patch sets:
> > * CXL compliance protocol.
> > * CMA / SPDM device attestation.
> > (Old version at https://gitlab.com/jic23/qemu/-/commits/cxl-next - will refresh
> > that tree next week)
> > Huai-Cheng Kuo (3):
> >   hw/pci: PCIe Data Object Exchange emulation
> >   hw/cxl/cdat: CXL CDAT Data Object Exchange implementation
> >   hw/mem/cxl-type3: Add CXL CDAT Data Object Exchange
> > 
> > Jonathan Cameron (2):
> >   hw/mem/cxl-type3: Add MSIX support
> >   hw/pci-bridge/cxl-upstream: Add a CDAT table access DOE
> > 
> >  MAINTAINERS                    |   7 +
> >  hw/cxl/cxl-cdat.c              | 224 ++++++++++++++++++++
> >  hw/cxl/meson.build             |   1 +
> >  hw/mem/cxl_type3.c             | 264 ++++++++++++++++++++++++
> >  hw/pci-bridge/cxl_upstream.c   | 195 +++++++++++++++++-
> >  hw/pci/meson.build             |   1 +
> >  hw/pci/pcie_doe.c              | 367 +++++++++++++++++++++++++++++++++
> >  include/hw/cxl/cxl_cdat.h      | 166 +++++++++++++++
> >  include/hw/cxl/cxl_component.h |   7 +
> >  include/hw/cxl/cxl_device.h    |   3 +
> >  include/hw/cxl/cxl_pci.h       |   1 +
> >  include/hw/pci/pci_ids.h       |   3 +
> >  include/hw/pci/pcie.h          |   1 +
> >  include/hw/pci/pcie_doe.h      | 123 +++++++++++
> >  include/hw/pci/pcie_regs.h     |   4 +
> >  15 files changed, 1366 insertions(+), 1 deletion(-)
> >  create mode 100644 hw/cxl/cxl-cdat.c
> >  create mode 100644 hw/pci/pcie_doe.c
> >  create mode 100644 include/hw/cxl/cxl_cdat.h
> >  create mode 100644 include/hw/pci/pcie_doe.h
> > 


