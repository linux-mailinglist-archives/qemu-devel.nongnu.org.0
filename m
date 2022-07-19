Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAB45790FA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 04:43:36 +0200 (CEST)
Received: from localhost ([::1]:49674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDdCw-0007Ne-Rg
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 22:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oDdAk-0005F0-R6
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 22:41:18 -0400
Received: from mga11.intel.com ([192.55.52.93]:7683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oDdAi-0006sD-9j
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 22:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658198476; x=1689734476;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UJ/QUxS5yYPoQyR41YnA82LGwYgVrRlv0k8+ZmFW1A0=;
 b=L/MvzQzmrW7oFJ30ECf4Ss7FedK6VAt66S2rS66KjbOJySY8Rs2JAr4m
 uEfA5Ayh59RrzH9Ff4zS6xk4gkyu+7XJwPkZ/j+lNcOOKN/8LNl0jiMUp
 Vcgxn4csOjX1olzKIvuZBtGYui3cdYFyTP6uTymizkj5H4BhEq9W/g21+
 +AUL5MoqnBcqs36VYNzFIo1CEyDfa2qpQ5RdOUI2sMbqRQkks4OZFjREr
 HL4yVlZQTBVZqLCGxMNm9mlkc2P9flLKEz5GYqu+5A3mNlhiOQWyFGlgM
 GSvEopyPEnzopnxY9m1Z/iJi3GZ0l/66HnLleNpI8PelkF88NQwVctyNm g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="283933238"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="283933238"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 19:41:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="724087884"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga004.jf.intel.com with ESMTP; 18 Jul 2022 19:41:12 -0700
Message-ID: <190d5f4447769d04802b1d33ac4740eaee4acab0.camel@linux.intel.com>
Subject: Re: [PATCH] acpi/nvdimm: Define trace events for NVDIMM and
 substitute nvdimm_debug()
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, qemu-devel@nongnu.org, 
 robert.hu@intel.com, Jingqi Liu <jingqi.liu@intel.com>
Date: Tue, 19 Jul 2022 10:41:12 +0800
In-Reply-To: <20220718154111.175e92b6@redhat.com>
References: <20220704085852.330005-1-robert.hu@linux.intel.com>
 <20220707112101.259acc3a@redhat.com>
 <c1f857fab3b2dd1e58c0fe7ca087f8c742f2aff2.camel@linux.intel.com>
 <20220718154111.175e92b6@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2022-07-18 at 15:41 +0200, Igor Mammedov wrote:
> On Mon, 18 Jul 2022 15:12:03 +0800
> Robert Hoo <robert.hu@linux.intel.com> wrote:
> [...]
> > BTW, during the unit test, I met some bios-table test error, 
> > https://gitlab.com/qemu-project/qemu/-/issues/1098, perhaps related
> > to
> > your patches in June.
> > https://patchwork.kernel.org/project/qemu-devel/cover/20220608135340.3304695-1-imammedo@redhat.com/
> 
> current master works for me.
> can you try a clean build?

Right, a clean download and build works on my side as well.
I'm going to close the bug. Sorry for false alarm.
> 


