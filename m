Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E684036FB53
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:16:29 +0200 (CEST)
Received: from localhost ([::1]:57174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcT0O-0007nV-RK
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mzamazal@redhat.com>)
 id 1lcS7Z-0007US-GJ
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 08:19:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mzamazal@redhat.com>)
 id 1lcS7U-0008AI-Q2
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 08:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619785180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=GcYyRPm9zusewZWUFQ65dlsKl6vW3wxLHMCnPMFGscQ=;
 b=G/k64QPKWyScFXu+zfFBnh/tsO1iWiuz7Uipyj6TeukxE9PziLHPA4h8MeB62z374UUxEl
 7sznxiPE06ZJc0JJ09JxPQlREKjEIHqvcRzKCaQ+SicvBxvR/qq0fmi1LW37BiqDVAtR1R
 B5ERws8FkvFlBvSNErRNaSz9OKljw44=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-ht2_B5UONL2JmXe5CGF4vg-1; Fri, 30 Apr 2021 08:18:34 -0400
X-MC-Unique: ht2_B5UONL2JmXe5CGF4vg-1
Received: by mail-wr1-f72.google.com with SMTP id
 88-20020adf95610000b029010758d8d7e2so13668000wrs.19
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 05:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:message-id:date:user-agent
 :mime-version;
 bh=GcYyRPm9zusewZWUFQ65dlsKl6vW3wxLHMCnPMFGscQ=;
 b=uh7Hfzrxg0EMOXQg7bm1SGU7RqK9AXeW1UNFSes2H9ColuQMIYAtN8maicXZuB0Azs
 KHTMflvK7uE/Ux5Raj6WupSvWYGSL+ddThwvycM8omTl/WXuKpnvid48mAPgjtdjy2lz
 7TlnIU6QFM9G398Uc++1qqeg8ZDYupk/FBZ36uEjR7vjqcFQLVYosP22y2AO1POsop+E
 KU0yz74X5YpZbSIy0rByce+HQ0Reh+q6Rm5P365ZYClRUGxOzL3qW4hor7+C1XUA/Rf7
 NiUVqxJCG6g3m4yp8GvFGKIytd2t6ApnJq3yl11AQK7N2O7e9niQLqnzXTUgB1JkFsq5
 vymg==
X-Gm-Message-State: AOAM532AT7acPduIi2meMS/t/IcZzUAZ5Dl6It56Vo0F+FwC1uf47AyM
 Tx0tlWEYKEm3mGncp9P1sHqguB8a3w4vWsm9FlTTvdAvO+KIv5kAH4GASzMS4KHPPoceCp2veh9
 xmwJdV9McCveX+5A=
X-Received: by 2002:a1c:750b:: with SMTP id o11mr16552474wmc.188.1619785112920; 
 Fri, 30 Apr 2021 05:18:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmCup0IIF5aRH3rfgFCyhWYgvnhJafN4CTAKzFTx2hFJCQ0FTDBnDYNUGPU1Zt/RLxYC354Q==
X-Received: by 2002:a1c:750b:: with SMTP id o11mr16552449wmc.188.1619785112675; 
 Fri, 30 Apr 2021 05:18:32 -0700 (PDT)
Received: from finch (cst-prg-105-69.cust.vodafone.cz. [46.135.105.69])
 by smtp.gmail.com with ESMTPSA id n7sm2078138wri.14.2021.04.30.05.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 05:18:32 -0700 (PDT)
From: Milan Zamazal <mzamazal@redhat.com>
To: qemu-devel@nongnu.org
Subject: Adjustments of NVDIMM devices and future data safety
Message-ID: <87y2d0gjw6.fsf@redhat.com>
Date: Fri, 30 Apr 2021 14:18:30 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mzamazal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mzamazal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Liu, Jingqi" <jingqi.liu@intel.com>,
 "Lai, Paul C" <paul.c.lai@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Amnon Ilan <ailan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I work on NVDIMM support in oVirt/RHV, I think other virtualization
management software built on top of QEMU may have similar concerns.

When a virtual NVDIMM device size is specified, it's not necessarily the
eventual NVDIMM device size visible to the guest OS.  As seen in
https://github.com/qemu/qemu/blob/v6.0.0/hw/mem/nvdimm.c#L117, QEMU
makes some adjustments (other adjustments are performed by libvirt but
that's a topic for a different forum):

- NVDIMM label size is subtracted from the NVDIMM size.

- NVDIMM label is pointed to a certain memory region.

- The remaining NVDIMM size is aligned down.

There are some related potential problems:

- If the alignment rules change in a future QEMU version, it may result
  in a different device size visible to the guest (even if the requested
  size remains the same) and cause trouble there up to data loss.

- If the layout on the backing device changes, e.g. a label placement,
  then the stored data may become corrupt or inaccessible.

- I'm not sure about the current QEMU version, but at least in previous
  QEMU versions, the resulting size is important for memory hot plug.
  The NVDIMM alignment size is smaller than the required regular memory
  DIMM placement alignment.  If a VM contains an NVDIMM with the
  resulting size not matching the DIMM placement requirements and a
  memory hot plug is attempted then the hot plug fails because the DIMM
  is mapped next to the end of the NVDIMM region, which is not
  DIMM-aligned.

All this means:

- The requested NVDIMM size must be computed and specified carefully,
  with attention to QEMU internal implementation.

- And because it depends on QEMU internal implementation, there is a
  risk of malfunction or data loss when the same backing device with the
  same parameters is used with a future QEMU version.

As for labels, I was told NVDIMM labels might be put to regular files in
future to avoid some problems.  Since label placement is not visible to
the guest, such a change could be made transparently without disrupting
access to the data.  (As long as the label data is transferred to the
new location properly and undesirable resulting NVDIMM size changes are
not induced by such a change.)

The primary point is still how to ensure that data kept on a backing
device will remain accessible and safe in future QEMU versions and how
to possibly avoid reliance on QEMU implementation details.  A big
warning in the NVDIMM handling source code to keep backward
compatibility (incl. memory hot plugs) and data safety on mind before
making any changes there might be a reasonable minimum measure.
Any additional ideas?  What do you think about it all?

Thank you,
Milan


