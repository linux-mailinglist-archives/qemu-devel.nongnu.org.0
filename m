Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8B033C9B5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:10:00 +0100 (CET)
Received: from localhost ([::1]:43178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwLW-0002F1-Jf
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1lLwK9-0000y1-8z
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:08:33 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:44252 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1lLwK1-0001n8-DI
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:08:31 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C72E8412DB;
 Mon, 15 Mar 2021 23:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1615849700;
 x=1617664101; bh=3Rxjahu5tqSiRCN/m2MBcKvOdpsQ9++18L/3roG8ZqM=; b=
 wIKGjIzPI8+BfbEwm9d01X5cOdQnInboEoaOVlk82+YY7ice+SuhYnfU5boOfaMu
 Oarm9eHTDuH0dff7Cc9Sk/zwar4u0eviMBe1brxC9iI4uDAR6+0Cjh8GFVaT5Yho
 555iJirVBUDYGswSFlKseGofvYca1Tq31ZLUC4Pzyww=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kC2xD0K0zBTz; Tue, 16 Mar 2021 02:08:20 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1A01A412D8;
 Tue, 16 Mar 2021 02:08:19 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 16
 Mar 2021 02:08:19 +0300
Date: Tue, 16 Mar 2021 02:08:18 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 00/29] tcg: Workaround macOS 11.2 mprotect bug
Message-ID: <YE/o4sKAfN+5DiN1@SPB-NB-133.local>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 14, 2021 at 03:26:55PM -0600, Richard Henderson wrote:
> Changes for v2:
>   * Move tcg_init_ctx someplace more private (patch 29)
>   * Round result of tb_size based on qemu_get_host_physmem (patch 26)
> 
> Blurb for v1:
>   It took a few more patches than imagined to unify the two
>   places in which we manipulate the tcg code_gen buffer, but
>   the result is surely cleaner.
> 
>   There's a lot more that could be done to clean up this part
>   of tcg too.  I tried to not get too side-tracked, but didn't
>   wholly succeed.
> 
> 

Hi Richard,

Thanks for doing the changes!
I'm not sure if I'll find enough time for thorough review but the series
helps qemu on Big Sur 11.2.3, so:

Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>

Regards,
Roman

> r~
> 
> 
> Richard Henderson (29):
>   meson: Split out tcg/meson.build
>   meson: Split out fpu/meson.build
>   tcg: Re-order tcg_region_init vs tcg_prologue_init
>   tcg: Remove error return from tcg_region_initial_alloc__locked
>   tcg: Split out tcg_region_initial_alloc
>   tcg: Split out tcg_region_prologue_set
>   tcg: Split out region.c
>   accel/tcg: Inline cpu_gen_init
>   accel/tcg: Move alloc_code_gen_buffer to tcg/region.c
>   accel/tcg: Rename tcg_init to tcg_init_machine
>   tcg: Create tcg_init
>   accel/tcg: Merge tcg_exec_init into tcg_init_machine
>   accel/tcg: Pass down max_cpus to tcg_init
>   tcg: Introduce tcg_max_ctxs
>   tcg: Move MAX_CODE_GEN_BUFFER_SIZE to tcg-target.h
>   tcg: Replace region.end with region.total_size
>   tcg: Rename region.start to region.after_prologue
>   tcg: Tidy tcg_n_regions
>   tcg: Tidy split_cross_256mb
>   tcg: Move in_code_gen_buffer and tests to region.c
>   tcg: Allocate code_gen_buffer into struct tcg_region_state
>   tcg: Return the map protection from alloc_code_gen_buffer
>   tcg: Sink qemu_madvise call to common code
>   tcg: Do not set guard pages in the rx buffer
>   util/osdep: Add qemu_mprotect_rw
>   tcg: Round the tb_size default from qemu_get_host_physmem
>   tcg: Merge buffer protection and guard page protection
>   tcg: When allocating for !splitwx, begin with PROT_NONE
>   tcg: Move tcg_init_ctx and tcg_ctx from accel/tcg/
> 
>  meson.build               |  13 +-
>  accel/tcg/internal.h      |   2 +
>  include/qemu/osdep.h      |   1 +
>  include/sysemu/tcg.h      |   2 -
>  include/tcg/tcg.h         |  15 +-
>  tcg/aarch64/tcg-target.h  |   1 +
>  tcg/arm/tcg-target.h      |   1 +
>  tcg/i386/tcg-target.h     |   2 +
>  tcg/internal.h            |  40 ++
>  tcg/mips/tcg-target.h     |   6 +
>  tcg/ppc/tcg-target.h      |   2 +
>  tcg/riscv/tcg-target.h    |   1 +
>  tcg/s390/tcg-target.h     |   3 +
>  tcg/sparc/tcg-target.h    |   1 +
>  tcg/tci/tcg-target.h      |   1 +
>  accel/tcg/tcg-all.c       |  33 +-
>  accel/tcg/translate-all.c | 439 +----------------
>  bsd-user/main.c           |   1 -
>  linux-user/main.c         |   1 -
>  tcg/region.c              | 991 ++++++++++++++++++++++++++++++++++++++
>  tcg/tcg.c                 | 634 ++----------------------
>  util/osdep.c              |   9 +
>  fpu/meson.build           |   1 +
>  tcg/meson.build           |  14 +
>  24 files changed, 1139 insertions(+), 1075 deletions(-)
>  create mode 100644 tcg/internal.h
>  create mode 100644 tcg/region.c
>  create mode 100644 fpu/meson.build
>  create mode 100644 tcg/meson.build
> 
> -- 
> 2.25.1
> 

