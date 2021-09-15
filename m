Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83E540C56A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 14:40:28 +0200 (CEST)
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQUDD-00027P-Qi
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 08:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mQUBj-0000nH-UU
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:38:56 -0400
Received: from mga11.intel.com ([192.55.52.93]:58330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mQUBg-00080I-JT
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:38:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="219120829"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="219120829"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 05:38:47 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="544908164"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 15 Sep 2021 05:38:45 -0700
Date: Wed, 15 Sep 2021 20:24:47 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 00/33] Qemu SGX virtualization
Message-ID: <20210915122447.GC30272@yangzhon-Virtual>
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <4f1d0102-7ec1-fc38-aac0-8f38839df32f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f1d0102-7ec1-fc38-aac0-8f38839df32f@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.93; envelope-from=yang.zhong@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 qemu-devel@nongnu.org, jarkko@kernel.org, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 08:51:47AM +0200, Philippe Mathieu-Daudé wrote:
> On 7/19/21 1:21 PM, Yang Zhong wrote:
> 
> > This series is Qemu SGX virtualization implementation rebased on latest
> > Qemu release. The numa support for SGX will be sent in another patchset
> > once this basic SGX patchset are merged.
> 
> >  backends/hostmem-epc.c                   | 118 ++++++++++
> >  backends/meson.build                     |   1 +
> >  configs/devices/i386-softmmu/default.mak |   1 +
> >  docs/intel-sgx.txt                       | 167 ++++++++++++++
> >  hmp-commands-info.hx                     |  15 ++
> >  hw/i386/Kconfig                          |   5 +
> >  hw/i386/acpi-build.c                     |  22 ++
> >  hw/i386/fw_cfg.c                         |  10 +-
> >  hw/i386/meson.build                      |   2 +
> >  hw/i386/pc.c                             |  15 +-
> >  hw/i386/pc_piix.c                        |   4 +
> >  hw/i386/pc_q35.c                         |   3 +
> >  hw/i386/sgx-epc.c                        | 265 +++++++++++++++++++++++
> >  hw/i386/sgx-stub.c                       |  13 ++
> >  hw/i386/sgx.c                            | 170 +++++++++++++++
> >  hw/i386/x86.c                            |  29 +++
> >  hw/vfio/common.c                         |   1 +
> >  include/exec/memory.h                    |  15 +-
> >  include/hw/i386/pc.h                     |  10 +
> >  include/hw/i386/sgx-epc.h                |  68 ++++++
> >  include/hw/i386/x86.h                    |   1 +
> >  include/monitor/hmp.h                    |   1 +
> >  include/qemu/bitops.h                    |   7 +
> 
> Consider using scripts/git.orderfile to ease reviewers workflow.

  Thanks! I never noticed this issue before, thanks!

  My ref command:
  git format-patch -32 --no-signature --cover-letter -O scripts/git.orderfile --subject-prefix="PATCH"

  Yang

