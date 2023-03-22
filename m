Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999A96C4A79
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 13:29:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pexaQ-0003AS-P7; Wed, 22 Mar 2023 08:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1pexaN-0003A4-CI
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:28:59 -0400
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1pexaL-0006UV-A1
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:28:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679488137; x=1711024137;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mwB/9yXNE44AVSshw98Vpk+clp5KdzJ4TYFz3KdaTIE=;
 b=dLDEajVpBcuwrIVVXYRig9DDrUiJ1DTjQt5skFx8F+PpWwwtggc1QpHa
 1fSn9/GT6kek8t58gt9tBeAufkUBM7nN2uH1c4/tVNnJa29nw45Botwag
 BrwddicLlxAdvkwdJ4AicrZ+/VbgrPlmu8T+/Waqzmw3NXmKZ5FMZ9YiN
 9sSDs1v6KH15azevegSLeEI7Vr6fs9anxzOWzhuC1HDazaNFaxfL54QTr
 Dp3mUzXlW0W9HV2GK7b1ROOL1lMitq+semuyovmQD9D0llgiN4VS4YgOp
 gXG9vKWV06Np+kBPlvz/JmwTSID3dUMS2AT+DdDpV5NvqKxnsUwe0tSCO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366934972"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="366934972"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 05:28:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="771021506"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="771021506"
Received: from yangzhon.bj.intel.com (HELO yangzhon) ([10.238.157.60])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 05:28:52 -0700
Date: Wed, 22 Mar 2023 08:28:38 -0400
From: Yang Zhong <yang.zhong@linux.intel.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: About the instance_finalize callback in VFIO PCI
Message-ID: <ZBr0dr7xPjZrn3e5@yangzhon>
References: <ZBgn90bjw9iRaTrw@yangzhon>
 <1d364b78-3dbb-87cb-daff-e92f40444ab7@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d364b78-3dbb-87cb-daff-e92f40444ab7@kaod.org>
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=yang.zhong@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Tue, Mar 21, 2023 at 06:30:14PM +0100, Cédric Le Goater wrote:
> On 3/20/23 10:31, Yang Zhong wrote:
> > Hello Alex and Paolo,
> > 
> > There is one instance_finalize callback definition in hw/vfio/pci.c, but
> > i find this callback(vfio_instance_finalize()) never be called during the
> > VM shutdown with close VM or "init 0" command in guest.
> > 
> > The Qemu related command:
> >     ......
> >     -device vfio-pci,host=d9:00.0
> >     ......
> 
> well, the finalize op is correctly called for hot unplugged devices, using
> device_add.
> 
   Thanks Cédric, i can use device_del command in the monitor to
   trigger this instance_finalize callback function in the VFIO PCI.
   thanks!

   Yang
> 

